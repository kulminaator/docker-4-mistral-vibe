CURRENT_MISTRAL_VERSION=2.5.0
echo "Building with mistral claiming to be $CURRENT_MISTRAL_VERSION"

docker build --no-cache -t docker-4-mistral-vibe:latest -t ghcr.io/kulminaator/docker-4-mistral-vibe:latest -t ghcr.io/kulminaator/docker-4-mistral-vibe:$CURRENT_MISTRAL_VERSION .

