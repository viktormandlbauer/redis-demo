// script.js
document.addEventListener('DOMContentLoaded', function() {
    fetchStatuses();
    setInterval(fetchStatuses, 1000);
    
    fetchFlightData();
});

// Helper function to format date and time
function formatDateTime(dateTime) {
    if (!dateTime) return 'N/A';
    const date = new Date(dateTime);
    if (isNaN(date.getTime())) return dateTime;
    return date.toLocaleString('en-US', {
        dateStyle: 'medium',
        timeStyle: 'short'
    });
}

// Helper function to format seconds into a readable string
function formatSeconds(seconds) {
    if (!seconds || isNaN(seconds)) return 'N/A';
    const days = Math.floor(seconds / 86400);
    const hours = Math.floor((seconds % 86400) / 3600);
    const minutes = Math.floor((seconds % 3600) / 60);
    return `${days}d ${hours}h ${minutes}m`;
}

async function fetchFlightData() {
    const flightDataBody = document.getElementById('flightDataBody');
    const loadingDiv = document.getElementById('loading');
    const errorDiv = document.getElementById('error');

    try {
        // Show loading message
        loadingDiv.style.display = 'block';
        errorDiv.style.display = 'none';

        // Fetch data from the /flight endpoint
        const response = await fetch('/flight', {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            }
        });

        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }

        const flightData = await response.json();

        // Clear existing table content
        flightDataBody.innerHTML = '';

        // Populate table with flight data
        flightData.forEach(flight => {
            const row = document.createElement('tr');
            
            row.innerHTML = `
                <td>${flight.FLIGHTNUMBER || 'N/A'}</td>
                <td>${flight.AIRPORTDEPARTURE || 'N/A'}</td>
                <td>${flight.AIRPORTDESTINATION || 'N/A'}</td>
                <td>${formatDateTime(flight.DEPARTURETIME)}</td>
                <td>${flight.TERMINAL || 'N/A'}</td>
                <td>${flight.GATE || 'N/A'}</td>
            `;
            
            flightDataBody.appendChild(row);
        });

        // Hide loading message
        loadingDiv.style.display = 'none';

    } catch (error) {
        // Handle errors
        loadingDiv.style.display = 'none';
        errorDiv.style.display = 'block';
        errorDiv.textContent = `Error loading flight data: ${error.message}`;
        console.error('Error fetching flight data:', error);
    }
}

// Helper function to format date and time
function formatDateTime(dateTime) {
    if (!dateTime) return 'N/A';
    
    const date = new Date(dateTime);
    if (isNaN(date.getTime())) return dateTime; // Return original string if invalid date
    
    return date.toLocaleString('en-US', {
        dateStyle: 'medium',
        timeStyle: 'short'
    });
}