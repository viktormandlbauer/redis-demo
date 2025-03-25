from datetime import datetime
from flask import Flask, request, jsonify, send_from_directory, session
import redis
import mysql.connector
import os
import json

app = Flask(__name__)

# Redis connection
redis_client = redis.Redis(
    host=os.getenv('REDIS_HOST', '127.0.0.1'),
    port=int(os.getenv('REDIS_PORT', 6379)),
    password=os.getenv('REDIS_PASSWORD', 'your_redis_password'),
    decode_responses=True
)

# MySQL connection config
mysql_config = {
    'host': os.getenv('MYSQL_HOST', '127.0.0.1'),
    'user': os.getenv('MYSQL_USER', 'user'),
    'password': os.getenv('MYSQL_PASSWORD', 'password'),
    'database': os.getenv('MYSQL_DB', 'airportbase')
}

flights_query = """
SELECT FLIGHT.FLIGHTNUMBER, dep.NAME as AIRPORTDEPARTURE , dest.NAME as AIRPORTDESTINATION, g.TERMINAL ,g.ACRONYM as GATE,
DATE_FORMAT(FLIGHT.DEPARTURETIME, '%Y-%m-%dT%TZ') AS DEPARTURETIME FROM FLIGHT
LEFT JOIN AIRPORT dep ON dep.AIRPORTID = FLIGHT.AIRPORTDEPARTURE
LEFT JOIN AIRPORT dest ON dest.AIRPORTID = FLIGHT.AIRPORTDESTINATION
LEFT JOIN GATE g  ON g.GATEID = FLIGHT.GATEID
"""

# Cache-Aside helper
def get_cached_or_query(key, query, ttl=60):
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

@app.route('/')
def serve_index():
    return send_from_directory('static', 'index.html')

@app.before_request
def before_request_func():
    """Rate limit the requests
    """
    cache_key = 'ip:' + request.remote_addr
    redis_client.incr(cache_key)
    redis_client.expire(cache_key, 60)
    if int(redis_client.get(cache_key)) > 100:
        return jsonify({'error': 'Rate limit exceeded'}), 429

@app.route('/flight', methods=['GET'])
def get_all_flights():
    cache_key = 'flight:all'
    items = get_cached_or_query(cache_key, flights_query)

    return jsonify(items)

@app.route('/flight/<flightnumber>', methods=['GET'])
def get_flight(flightnumber):
    cache_key = f'flight:{flightnumber}'
    query = f"{flights_query} WHERE FLIGHT.FLIGHTNUMBER = '{flightnumber}'"
    item = get_cached_or_query(cache_key, query)
    return jsonify(item)

# Redis Health Check Endpoint
@app.route('/health/redis', methods=['GET'])
def redis_health_check():
    try:
        # Test Redis connection with ping
        redis_client.ping()
        info = redis_client.info()  # Get Redis server info
        return jsonify({
            'status': 'healthy',
            'redis_connected': True,
            'uptime_in_seconds': info.get('uptime_in_seconds', 'N/A'),
            'used_memory_human': info.get('used_memory_human', 'N/A'),
            'connected_clients': info.get('connected_clients', 'N/A'),
            'timestamp': datetime.now().isoformat()
        })
    except redis.ConnectionError as e:
        return jsonify({
            'status': 'unhealthy',
            'redis_connected': False,
            'error': str(e),
            'timestamp': datetime.now().isoformat()
        }), 503  # Service Unavailable

# MySQL Health Check Endpoint
@app.route('/health/mysql', methods=['GET'])
def mysql_health_check():
    try:
        # Test MySQL connection
        conn = mysql.connector.connect(**mysql_config)
        cursor = conn.cursor()
        
        # Get some basic server info
        cursor.execute("SHOW VARIABLES LIKE 'version'")
        version = cursor.fetchone()[1]
        
        cursor.execute("SHOW STATUS LIKE 'Uptime'")
        uptime = cursor.fetchone()[1]
        
        cursor.execute("SELECT DATABASE()")
        current_db = cursor.fetchone()[0]
        
        conn.close()
        
        return jsonify({
            'status': 'healthy',
            'mysql_connected': True,
            'version': version,
            'uptime_in_seconds': uptime,
            'current_database': current_db,
            'timestamp': datetime.now().isoformat()
        })
    except mysql.connector.Error as e:
        return jsonify({
            'status': 'unhealthy',
            'mysql_connected': False,
            'error': str(e),
            'timestamp': datetime.now().isoformat()
        }), 503  # Service Unavailable

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True, port=5000)