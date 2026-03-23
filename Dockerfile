FROM python:3.14-slim

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

RUN git clone https://github.com/mistralai/mistral-vibe.git /opt/mistral-source 
RUN python3 -m venv /opt/mistral-env && \
    /opt/mistral-env/bin/pip install --upgrade pip && \
    cd /opt/mistral-source && /opt/mistral-env/bin/pip install -e .

RUN echo "Vibe version check"
RUN /opt/mistral-env/bin/vibe --version

RUN mkdir /vibehome

# Set a working directory
WORKDIR /project

## build the script to make sure we are not root, nobody should run mistral vibe within the container as root
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/opt/mistral-env/bin/vibe"]
