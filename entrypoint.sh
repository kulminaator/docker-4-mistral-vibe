#!/bin/sh

DOCKER_RUNSAMPLE="docker run -e LOCAL_UID=\$(id -u) -e LOCAL_GID=\$(id -g) -v \$(pwd):/project .....other.docker.params...... "

# 1. Check that user is valid
if [ -z "$LOCAL_UID" ] || [ "$LOCAL_UID" -eq 0 ]; then
  echo "WARNING: You are running as root. Files created in /project would be owned by root on the host." 
  echo "You must run with: $DOCKER_RUNSAMPLE"
  exit 1 
fi

USER_ID=${LOCAL_UID}
GROUP_ID=${LOCAL_GID:-$LOCAL_UID}

# 2. Check that mountpoint of project is ok
if ! mountpoint -q /project; then
    echo "ERROR: /project is not mounted from host!"
    echo "Please run: $DOCKER_RUNSAMPLE"
    exit 1
fi

# 4. Create the devuser group and user
groupadd -g $GROUP_ID devgroup 2>/dev/null || true
useradd --shell /bin/bash -u $USER_ID -g $GROUP_ID -m devuser

# 5. Create the vibe's home folder by symlinking it under the user and assign it to the correct user and group
# If the user didn't pass a vibehome via  -v to docker then nothing breaks here.
chown devuser:devgroup /vibehome
ln -s /vibehome /home/devuser/.vibe

# 6. Set the Home environment
export HOME=/home/devuser


exec gosu devuser "$@"
