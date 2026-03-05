docker  \
    run -e LOCAL_UID=$(id -u) -e LOCAL_GID=$(id -g) -e MISTRAL_API_KEY=$MISTRAL_API_KEY \
    -v $(pwd):/src -v ~/.vibe:/vibehome \
    --network host \
    -it --rm docker-4-mistral-vibe:latest vibe

