# Changelog

##
Versions that are not brought out here only contained Mistral Vibe version bumps.

## Changes

2.14.0
* Version bumps
...

2.10.1 
* Mostly just bumps of mistral version til here.
...

2.7.3
* Reordered Dockerfile so that we now preserve more of the previous layers from docker builds

2.6.2
* Started to use git checkout of precise version instead of latest install via pip

2.5.0
* Choose a new folder /project instead of the initial /src - too many models confused src with "src" of a project and starte creating directories like /src/src, duh.

2.4.1
* Updated to Mistral Vibe 2.4.1 
* Changed starting folder from /src to /project, as many llm models confused /src to be sources folder and started to look for /src/smth in /src/src/smth
* No more symlinking of vibe executables into /usr/local/bin
* Start loading mistral venv in entrypoint

2.3.0 
* Initial release. Getting the ligths turned on.
* Using /src as the overall starting point of the docker image


## Notes
I will do my best to stay in sync with Mistral Vibe version numbers here.
