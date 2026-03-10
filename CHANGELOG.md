# Changelog

## Changes
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
