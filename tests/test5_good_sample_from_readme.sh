mkdir /tmp/tempvibedir

docker  \
    run -e LOCAL_UID=$(id -u) -e LOCAL_GID=$(id -g) -e MISTRAL_API_KEY=$MISTRAL_API_KEY \
    -v $(pwd):/project -v /tmp/tempvibedir:/vibehome \
    --network host \
    -it --rm ghcr.io/kulminaator/docker-4-mistral-vibe:latest vibe

rm -rf /tmp/tempvibedir
