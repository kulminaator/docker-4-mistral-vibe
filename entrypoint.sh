#!/bin/sh

DOCKER_RUNSAMPLE="docker run -e LOCAL_UID=\$(id -u) -e LOCAL_GID=\$(id -g) -v \$(pwd):/src .....other.docker.params...... "

# 1. Check that user is valid
if [ -z "$LOCAL_UID" ] || [ "$LOCAL_UID" -eq 0 ]; then
  echo "WARNING: You are running as root. Files created in /src would be owned by root on the host." 
  echo "You must run with: $DOCKER_RUNSAMPLE"
  exit 1 
fi

USER_ID=${LOCAL_UID}
GROUP_ID=${LOCAL_GID:-$LOCAL_UID}

# 2. Check that mountpoint of src is ok
if ! mountpoint -q /src; then
    echo "ERROR: /src is not mounted from host!"
    echo "Please run: $DOCKER_RUNSAMPLE"
    exit 1
fi

# 4. Create the devuser group and user
groupadd -g $GROUP_ID devgroup 2>/dev/null || true
useradd --shell /bin/bash -u $USER_ID -g $GROUP_ID -m devuser

# 5. Set the Home environment
export HOME=/home/devuser

# echo "Container started as devuser (UID: $USER_ID, GID: $GROUP_ID)"

exec gosu devuser "$@"
