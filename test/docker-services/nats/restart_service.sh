rm -rf logs/*
docker network create nginx-proxy || echo 'reused created earlier nginx-proxy'
docker compose down
docker compose up -d