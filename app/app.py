from flask import Flask, request, jsonify
import redis
import mysql.connector
import os
import json

app = Flask(__name__)

# Redis connection
redis_client = redis.Redis(
    host=os.getenv('REDIS_HOST', 'redis'),
    port=int(os.getenv('REDIS_PORT', 6379)),
    password=os.getenv('REDIS_PASSWORD', 'your_redis_password'),
    decode_responses=True
)

# MySQL connection config
mysql_config = {
    'host': os.getenv('MYSQL_HOST', 'mysql'),
    'user': os.getenv('MYSQL_USER', 'app_user'),
    'password': os.getenv('MYSQL_PASSWORD', 'app_password'),
    'database': os.getenv('MYSQL_DB', 'myapp_db')
}

# Initialize MySQL table
def init_db():
    conn = mysql.connector.connect(**mysql_config)
    cursor = conn.cursor()
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS items (
            id INT AUTO_INCREMENT PRIMARY KEY,
            name VARCHAR(255) NOT NULL,
            description TEXT
        )
    ''')
    conn.commit()
    conn.close()

# Cache-Aside helper
def get_cached_or_query(key, query, ttl=300):
    cached = redis_client.get(key)
    if cached:
        return json.loads(cached)
    conn = mysql.connector.connect(**mysql_config)
    cursor = conn.cursor(dictionary=True)
    cursor.execute(query)
    result = cursor.fetchall()
    redis_client.setex(key, ttl, json.dumps(result))
    conn.close()
    return result

@app.route('/items', methods=['GET'])
def get_items():
    cache_key = 'items:all'
    items = get_cached_or_query(cache_key, 'SELECT * FROM items')
    return jsonify(items)

@app.route('/items/<int:item_id>', methods=['GET'])
def get_item(item_id):
    cache_key = f'item:{item_id}'
    item = get_cached_or_query(cache_key, f'SELECT * FROM items WHERE id = {item_id}')
    return jsonify(item[0] if item else {'error': 'Item not found'}), 200 if item else 404

@app.route('/items', methods=['POST'])
def create_item():
    data = request.get_json()
    name = data.get('name')
    description = data.get('description')
    
    conn = mysql.connector.connect(**mysql_config)
    cursor = conn.cursor()
    cursor.execute('INSERT INTO items (name, description) VALUES (%s, %s)', (name, description))
    conn.commit()
    item_id = cursor.lastrowid
    conn.close()
    
    # Invalidate cache
    redis_client.delete('items:all')
    return jsonify({'id': item_id, 'name': name, 'description': description}), 201

@app.route('/items/<int:item_id>', methods=['PUT'])
def update_item(item_id):
    data = request.get_json()
    name = data.get('name')
    description = data.get('description')
    
    conn = mysql.connector.connect(**mysql_config)
    cursor = conn.cursor()
    cursor.execute('UPDATE items SET name = %s, description = %s WHERE id = %s', (name, description, item_id))
    conn.commit()
    affected = cursor.rowcount
    conn.close()
    
    # Invalidate cache
    redis_client.delete('items:all')
    redis_client.delete(f'item:{item_id}')
    return jsonify({'message': 'Updated' if affected else 'Item not found'}), 200 if affected else 404

@app.route('/items/<int:item_id>', methods=['DELETE'])
def delete_item(item_id):
    conn = mysql.connector.connect(**mysql_config)
    cursor = conn.cursor()
    cursor.execute('DELETE FROM items WHERE id = %s', (item_id,))
    conn.commit()
    affected = cursor.rowcount
    conn.close()
    
    # Invalidate cache
    redis_client.delete('items:all')
    redis_client.delete(f'item:{item_id}')
    return jsonify({'message': 'Deleted' if affected else 'Item not found'}), 200 if affected else 404

if __name__ == '__main__':
    init_db()  # Initialize DB on startup
    app.run(host='0.0.0.0', port=5000)