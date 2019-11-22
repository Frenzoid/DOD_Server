# Day of Dragons Docker container.
- This dockerfile will allow you to create an encapsuled docker container that runs a DoD game server.
- This image can also be pulled from the [Docker-hub](https://hub.docker.com/repository/docker/xenium/dayofdragons/).

## Env vars:
- ```EULA```: (STRING) Env variable to accept the EULA of this software, to do so, just set it to "accept" . Default: unset.
- ```UPDATE```: (BOOLEAN) Env variable that triggers the update / initial install of the server. Default: true.
- ```GAMEPORT```: (NUMBER) Env variable to change the exposed port of your server. Default: 9000.
- ```SERVERPARAMS```: (STRING) Env variable to pass parameters to the DragonsServer script. Default: Empty.
- ```STEAMPARAMS```: (STRING) Env variable to pass parameters to the SteamCMD on update / install of the server. Default: Empty.

## Paths:
- ```/home/steamsrv/```: Root folder.
- ```/home/steamsrv/steamcmd/```: Steam Console folder.
- ```/home/steamsrv/dayofdragons_server/```: DoD Server folder.

## How to launch.
- On a terminal with Docker: ```docker run -d -p 9000:9000 -e EULA=accept --name  DOD_SERVER xenium/dayofdragons```
- On a web panne with Portainer: Just make sure to set the proper variables before creating the container.
