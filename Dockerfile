FROM debian:bookworm-slim

LABEL org.opencontainers.image.source=https://github.com/kulminaator/docker-4-mistral-vibe
LABEL org.opencontainers.image.description="Docker image for running Mistral Vibe in a container"
LABEL org.opencontainers.image.licenses=MIT

# Ensure noninteractive installs
ENV DEBIAN_FRONTEND=noninteractive

# Install essential dev tools
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       git \
       ca-certificates \
       curl \
       gosu \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Mistral Vibe
RUN curl -LsSf https://astral.sh/uv/install.sh | UV_INSTALL_DIR=/usr/local/bin sh
ENV UV_PYTHON_INSTALL_DIR=/opt/python3
RUN uv venv /opt/mistral-env
RUN uv pip install -p /opt/mistral-env/bin/python mistral-vibe

RUN mkdir /vibehome

# Set a working directory
WORKDIR /project

## build the script to make sure we are not root, nobody should run mistral vibe within the container as root
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/opt/mistral-env/bin/vibe"]
