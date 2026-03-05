# Intro

## What is this repo ?

# docker-4-mistral-vibe
Docker image for Mistral Vibe. This just helps you with a local dockered setup.
You can find Mistral Vibe itself here - https://github.com/mistralai/mistral-vibe


## How do i build it?
To build the image you can run build.sh

## How do i run it?
An example is in run.sh

You can also compose your own execution line in the way of
```bash
docker run -e LOCAL_UID=$(id -u) -e LOCAL_GID=$(id -g) -e MISTRAL_API_KEY=replace_this_with_your_key -v $(pwd):/src  -it --rm docker-4-mistra-vibe:latest vibe
```
Explaining quickly what happens in this line:
1. It uses your users' user id and group id for the files inside the container (container does not run vibe as root). These are mandatory.
2. It mounts the current folder into docker's /src folder, the folder where Mistral Vibe will start. This should be your source code folder. This is mandatory.
3. It passes your `MISTRAL_API_KEY` via the environment to Mistral Vibe, so it doesn't prompt you for it. This is not mandatory. Just comfy.


For troubleshooting you can replace `vibe` with `/bin/bash` and roam around in the docker image.


## Custom configs for Mistral Vibe
As mistral allows you to run your own models as well, you can follow it's configuration guide and place this into your source folder (and perhaps add to your gitignore or something?).

There is also the snag of having your vibe config in the correct place.

You have 2 choices here:
1. Have a .vibe folder in your project, and the config etc. in there (would be smart to add that .vibe folder to .gitignore on project root folder)
2. Or just to pass your ~/.vibe to docker via adding this to your docker line `-v ~/.vibe:/vibehome`. When the container comes up this folder is symlinked to the docker's devuser home folder .vibe and it works transparently.

This way your vibe config can be managed by you (if you want to add custom configurations, custom providers, run your own models etc.) and it doesn't leak to your project's git by accident.

PS. if you run your own llm model directly on host and you can't be bothered with doing a sophisticated network setup, you can use this (with reasonable caution) `--network host` as that will put the docker processes on the same local network as your linux host (so it can connect your llama.cpp that only listens on 127.0.0.1:8080).

A full example would looke like this (and since it uses local paths, you could probably make it an alias or local shellcommand for your account).
```bash
docker  \
    run -e LOCAL_UID=$(id -u) -e LOCAL_GID=$(id -g) -e MISTRAL_API_KEY=$MISTRAL_API_KEY \
    -v $(pwd):/src -v ~/.vibe:/vibehome \
    --network host \
    -it --rm docker-4-mistra-vibe:latest vibe

```

Happy vibing.

