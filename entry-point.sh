#!/bin/bash

# Accept the eula first.
if [[ $EULA == "accept" || $EULA == "ACCEPT" || $EULA == "true" || $EULA == "TRUE" ]]
  then

  # Check if update is needed (by default this var is set to true, so the initial install triggers)
  if [[ $UPDATEGAME == true || $UPDATEGAME == "true" || $UPDATEGAME == 1 ]]
    then
      mkdir -p "/home/steamsrv/dayofdragons_server/"
      /home/steamsrv/steamcmd/steamcmd.sh +login anonymous +force_install_dir /home/steamsrv/dayofdragons_server/ +app_update 1088320 validate $STEAMPARAMS +quit
      chmod 775 /home/steamsrv/dayofdragons_server/Dragons/Binaries/Linux/DragonsServer-Linux-Shipping
  fi
  
  # Launches the DoD server.
  /home/steamsrv/dayofdragons_server/Dragons/Binaries/Linux/DragonsServer-Linux-Shipping -SteamServerName=$SERVERNAME $SERVERPARAMS

  else
    # If EULA was not accepted, show a message, and close the container.
    echo "EULA was not accepted!, current value: $EULA";
    exit 1;

fi
