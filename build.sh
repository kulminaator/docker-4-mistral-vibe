CURRENT_MISTRAL_VERSION=2.3.0
echo "Building with mistral claiming to be $CURRENT_MISTRAL_VERSION"

docker build -t docker-4-mistral-vibe:latest -t ghcr.io/kulminaator/docker-4-mistral-vibe:latest -t ghcr.io/kulminaator/docker-4-mistral-vibe:$CURRENT_MISTRAL_VERSION .

