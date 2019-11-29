# Day of Dragons dedicated server Docker container.
![dod logo](https://steamcdn-a.akamaihd.net/steamcommunity/public/images/apps/1088320/438449dd45a85b9285a9c2be55a7fcef5a3d3a4d.jpg)
- This dockerfile will allow you to create an encapsuled docker container that runs a DoD game server.
- This image can also be pulled from the [Docker-hub](https://hub.docker.com/repository/docker/xenium/dayofdragons/).

## Env vars:
- ```EULA```: (STRING) Env variable to accept the EULA of this software, to do so, just set it to "accept" . Default: unset.
- ```UPDATE```: (BOOLEAN) Env variable that triggers the update / initial install of the server. Default: true.
- ```GAMEPORT```: (NUMBER) Env variable to change the exposed port of your server. Default: 7777.
- ```SERVERPARAMS```: (STRING) Env variable to pass parameters to the DragonsServer script. Default: Empty.
- ```STEAMPARAMS```: (STRING) Env variable to pass parameters to the SteamCMD on update / install of the server. Default: Empty.

## Paths (to bind volumes):
- ```/home/steamsrv/```: Root folder.
- ```/home/steamsrv/steamcmd/```: Steam Console folder.
- ```/home/steamsrv/dayofdragons_server/```: DoD Server folder.

## How Build a local Image (In case you dont have internet to pull the image from Docker-hub):
- On a terminal with Docker, run: ```sudo docker build -t dod:latest ./```

## How to launch (From local Image or remote Docker-hub Image):
- On a terminal with Docker: ```sudo docker run  -it -p 7777:7777 -p 7777:7777/udp -e EULA=accept --name  DOD_SERVER xenium/dayofdragons```.
  - -it: Interactive mode, attached to the terminal.
  - -p port specification.
  - -e env variable assignation.
  - --name name of the container.

- On a web pannel, with Portainer: Just make sure to set the proper variables before creating the container.

## Other info:
- You can check the official server / client updates on the ```OFFICIALUPDATES.md``` file, or on the official discord.

### Links:
- Depots: https://steamdb.info/app/1088320/depots/
- Game: https://store.steampowered.com/app/1088090/Day_of_Dragons/
- Official webpage: https://dayofdragons.com/#order
