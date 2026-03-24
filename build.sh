CURRENT_MISTRAL_VERSION=2.6.2
echo "Building with mistral claiming to be $CURRENT_MISTRAL_VERSION"

docker build --no-cache --build-arg MISTRAL_VIBE_VERSION=$CURRENT_MISTRAL_VERSION \
       	-t docker-4-mistral-vibe:latest \
	-t ghcr.io/kulminaator/docker-4-mistral-vibe:latest \
	-t ghcr.io/kulminaator/docker-4-mistral-vibe:$CURRENT_MISTRAL_VERSION .

