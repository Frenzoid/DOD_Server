# Dragons over Docker! A Day of Dragons dedicated server Docker container.
![dod logo](https://steamcdn-a.akamaihd.net/steamcommunity/public/images/apps/1088320/438449dd45a85b9285a9c2be55a7fcef5a3d3a4d.jpg)
- This dockerfile will allow you to create an encapsuled docker container that runs a DoD game server.
- This image can also be pulled from the [Docker-hub](https://hub.docker.com/repository/docker/xenium/dayofdragons/).

## Env vars:
### Downloading, Installation and Configuration values.
- ```EULA```: (STRING) Env variable to accept the EULA of this software, to do so, just set it to "accept" . Default: unset.
- ```UPDATEGAME```: (BOOLEAN) Env variable that triggers the update / initial install of the server (done on container restart). Default: true.
- ```UPDATECONFIG```: (BOOLEAN) Env variable that syncs the config of the server with the config env vars values (done on container restart). Default: true.
- ```STEAMPORT```: (NUMBER) Env variable to change the exposed steam query port. Default: 27016 (Do NOT change).
- ```GAMEPORT```: (NUMBER) Env variable to change the exposed port of your server. Default: 7777 (Do NOT change).
- ```SERVERPARAMS```: (STRING) Env variable to pass parameters to the DragonsServer script. Default: Empty. example: ```-log```: Enables the log window.
### Configuration values.
- ```SERVERNAME```: (STRING) Env variable that sets the servername on launch.
- ```STEAMPARAMS```: (STRING) Env variable to pass parameters to the SteamCMD on update / install of the server. Default: Empty.
- ```ADMINSTEAMID```: (STRING) Env variable thats specifies who is the server admin via steamID, set this to get admin privileges. Default: My id :p.
- ```MAXPLAYERS```: (STRING) Env variable that specifies the Max player slots for the server.
- ```WHITELIST```: (BOOLEAN) Env variable that enables / disables whitelist mode. Default: false (disabled).
- ```AUTOSAVESECONDS```: (STRING) Env variable that sets the automatic server save in seconds. Default 300 (Save each 5 minutes).
- ```LAUNCHSERVER```: (executable command) command to start the server.

## Paths (to bind volumes):
- ```/home/steamsrv/```: Root folder.
- ```/home/steamsrv/steamcmd/```: Steam Console folder.
- ```/home/steamsrv/dayofdragons_server/```: DoD Server folder.
- ```/home/steamsrv/dayofdragons_server/Dragons/Saved/Config/LinuxServer/Game.ini```: DoD server config file, edit this to add more admins, enable whitelists, etc (see the Configuration" section).

## How Build a local Image (In case you dont have internet to pull the image from Docker-hub):
- On a terminal with Docker, run: ```sudo docker build -t dod:latest ./```
## How to launch (From local Image or remote Docker-hub Image):
- On a terminal with Docker: ```sudo docker run  -it -p 7777:7777 -p 7777:7777/udp -p 7778:7778 -p 7778:7778/udp -p 27016:27016 -p 27016:27016/udp -p 27015:27015/udp -p 27015:27015 -p 4380:4380/udp -p 80:80 -p 443:443 -e EULA=accept --name  DOD_SERVER xenium/dayofdragons```.
  - -it: Interactive mode, attached to the terminal.
  - -p port specification.
  - -e env variable assignation.
  - --name name of the container.
  
  Then, type `$LAUNCHSERVER`.

- On a web pannel, with Portainer: Just make sure to set the proper variables before creating the container, join via remote console and type `$LAUNCHSERVER`.

## Configuration.
By default, the game will generate an empty config file on `/home/steamsrv/dayofdragons_server/Dragons/Saved/Config/LinuxServer/Game.ini`, you can modify this file to change the server's config and restart it to apply them, if you are not fond with how Unreal servers work, you can find a template of this file, explainning each field on `/home/steamsrv/predodconfig/Game.ini`, or check this:

```
[/Game/Dev/Libraries/Classes/Runtime/DragonsGameInstance.DragonsGameInstance_C]

;This config variable allows users to set server max players. Values are currently hardcoded set to 2 min and 250 max. If users do not define the max player count in Game.ini, the server defaults to 100. Please note, we have not yet stress tested our servers for max capacity!
iServerMaxPlayers=maxPlayersValue
;range is 2-250

;This array config variable allows users to define who are admins. This must be set before the server is started. Add additional entries below the first.
sServerAdmins=steamAdminId
;ServerAdmins=Steam64ID
;ServerAdmins=Steam64ID
;etc.

;This blacklist array config variable allows users to ban players by their Steam ID. Replace Steam64ID with the actual Steam ID of the banned player.
;ServerBanList=Steam64ID
;ServerBanList=Steam64ID
;ServerBanList=Steam64ID
;etc.

;Change this value to True if the server uses a whitelist
bServerUseJoinList=whiteListBoolean

;This whitelist array config variable allows users to prevent any player from joining their server unless their Steam ID is on this whitelist. Replace Steam64ID with the actual Steam ID of the allowed player. bServerUseJoinList=true must be set to enable the whitelist.
;ServerJoinList=Steam64ID
;ServerJoinList=Steam64ID
;ServerJoinList=Steam64ID
;etc.

;This variable determines the time between server autosaves in seconds, defaults to 300 seconds (5 minutes)
iAutoSaveInterval=autoSaveTimerS
```

* Lines that start with `;` are comments, (configuration that the game will ignore).

* If you can't find the file `Game.ini` on the folder, modify the tempalte, copy it, and restart the container.
(MAKE SURE THE `UPDATE` VARIABLE IS `FALSE` OR IT WILL OVERWRITTE IT).

## Hosting multiple servers on same IP/machine
Day of Dragons uses Unreal port 7777, and Steam Server Query Port 27016 by default. Additional servers hosted on the same IP will need their own installation folder and then you will need to change the Steam Query Port in the Engine.ini file.

1) Browse to Dragons\Saved\Config\LinuxServer 
1) Browse to /home/steamsrv/predodconfig/

2) Edit file Engine.ini

```MARKDOWN
[OnlineSubsystemSteam]
GameServerQueryPort=27016
```
3) For each additional server, change port number, ex:
GameServerQueryPort=27017
GameServerQueryPort=27018
GameServerQueryPort=27019

4) Once finished, paste the file to: `/home/steamsrv/dayofdragons_server/Dragons/Saved/Config/LinuxServer/Engine.ini`

5) Restart the container.
(MAKE SURE THE `UPDATE` VARIABLE IS `FALSE` OR IT WILL OVERWRITTE IT).

## Other info:
- You can check the official server / client updates on the [OFFICIALUPDATES.md](https://github.com/Frenzoid/DayofDragons/blob/master/OFFICIALUPDATES.md) file, or on the official discord.
- You can check the server commands on the [COMMANDS.md](https://github.com/Frenzoid/DayofDragons/blob/master/COMMANDS.md) file.
