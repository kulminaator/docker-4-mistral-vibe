docker run -e LOCAL_UID=$(id -u) -e LOCAL_GID=$(id -g) -v $(pwd):/project  -it --rm ghcr.io/kulminaator/docker-4-mistral-vibe:latest vibe 
