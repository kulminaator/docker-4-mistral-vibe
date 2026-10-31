#!/bin/sh
# Default Hardcoded
CURRENT_MISTRAL_VERSION=3.0.4

# If --latest is passed, resolve the newest version from PyPI instead of using the hardcoded value above.
if [ "$1" = "--latest" ]; then
    CURRENT_MISTRAL_VERSION=$(curl -s https://pypi.org/pypi/mistral-vibe/json \
        | python3 -c "import sys, json; print(json.load(sys.stdin)['info']['version'])")
    if [ -z "$CURRENT_MISTRAL_VERSION" ]; then
        echo "ERROR: could not resolve latest version from PyPI"
        exit 1
    fi
fi

echo "Building with mistral claiming to be $CURRENT_MISTRAL_VERSION"

docker build --build-arg MISTRAL_VIBE_VERSION=$CURRENT_MISTRAL_VERSION \
       	-t docker-4-mistral-vibe:latest \
	-t ghcr.io/kulminaator/docker-4-mistral-vibe:latest \
	-t ghcr.io/kulminaator/docker-4-mistral-vibe:$CURRENT_MISTRAL_VERSION .

