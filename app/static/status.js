async function fetchStatuses() {
    const redisStatusDiv = document.getElementById('redisStatus');
    const mysqlStatusDiv = document.getElementById('mysqlStatus');

    // Fetch Redis status
    try {
        const redisResponse = await fetch('/health/redis');
        if (!redisResponse.ok) throw new Error('Redis health check failed');
        const redisData = await redisResponse.json();
        
        redisStatusDiv.textContent = `Redis: ${redisData.status} (Memory: ${redisData.used_memory_human}, Uptime: ${formatSeconds(redisData.uptime_in_seconds)})`;
        redisStatusDiv.className = redisData.status === 'healthy' ? 'healthy' : 'unhealthy';
    } catch (error) {
        redisStatusDiv.textContent = `Redis: Error - ${error.message}`;
        redisStatusDiv.className = 'unhealthy';
    }

    // Fetch MySQL status
    try {
        const mysqlResponse = await fetch('/health/mysql');
        if (!mysqlResponse.ok) throw new Error('MySQL health check failed');
        const mysqlData = await mysqlResponse.json();
        
        mysqlStatusDiv.textContent = `MySQL: ${mysqlData.status} (Version: ${mysqlData.version}, Uptime: ${formatSeconds(mysqlData.uptime_in_seconds)})`;
        mysqlStatusDiv.className = mysqlData.status === 'healthy' ? 'healthy' : 'unhealthy';
    } catch (error) {
        mysqlStatusDiv.textContent = `MySQL: Error - ${error.message}`;
        mysqlStatusDiv.className = 'unhealthy';
    }
}