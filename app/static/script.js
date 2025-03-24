document.addEventListener('DOMContentLoaded', () => {
    const itemsList = document.getElementById('items-list');
    const form = document.getElementById('add-item-form');

    // Fetch and display items
    function loadItems() {
        fetch('/items')
            .then(response => response.json())
            .then(items => {
                itemsList.innerHTML = '';
                items.forEach(item => {
                    const li = document.createElement('li');
                    li.textContent = `${item.id}: ${item.name} - ${item.description}`;
                    itemsList.appendChild(li);
                });
            })
            .catch(error => console.error('Error fetching items:', error));
    }

    // Add new item
    form.addEventListener('submit', (event) => {
        event.preventDefault();
        const name = document.getElementById('name').value;
        const description = document.getElementById('description').value;

        fetch('/items', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ name, description })
        })
            .then(response => response.json())
            .then(() => {
                form.reset();
                loadItems(); // Refresh the list
            })
            .catch(error => console.error('Error adding item:', error));
    });

    // Initial load
    loadItems();
});