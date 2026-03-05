docker run -e LOCAL_UID=$(id -u) -e LOCAL_GID=$(id -g) -v $(pwd):/src  -it --rm docker-4-mistral-vibe:latest vibe --version 
