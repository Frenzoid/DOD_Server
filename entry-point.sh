#!/bin/bash

# Accept the eula first.
if [[ $EULA == "accept" || $EULA == "ACCEPT" || $EULA == "true" || $EULA == "TRUE" ]]
  then

  # Check if update is needed (by default this var is set to true, so the initial install triggers)
  if [[ $UPDATE == true || $UPDATE == "true" || $UPDATE == 1 ]]
    then
      mkdir -p "/home/steamsrv/dayofdragons_server/"
      /home/steamsrv/steamcmd/steamcmd.sh +login anonymous +force_install_dir /home/steamsrv/dayofdragons_server/ +app_update 1088320 validate $STEAMPARAMS +quit
  fi

  # Updates the Game.ini file.
  sed -i 's/steamAdminId/$ADMINSTEAMID/g' /home/steamsrv/predodconfig/Game.ini
  sed -i 's/maxPlayersValue/$MAXPLAYERS/g' /home/steamsrv/predodconfig/Game.ini
  sed -i 's/whiteListBoolean/$WHITELIST/g' /home/steamsrv/predodconfig/Game.ini
  sed -i 's/autoSaveTimerS/$AUTOSAVESECONDS/g' /home/steamsrv/predodconfig/Game.ini
  cp /home/steamsrv/predodconfig/Game.ini /home/steamsrv/dayofdragons_server/Dragons/Saved/Config/LinuxServer/Game.ini

  # Launches the DoD server.
  chmod 775 /home/steamsrv/dayofdragons_server/DragonsServer.sh
  /home/steamsrv/dayofdragons_server/DragonsServer.sh -$SERVERNAME $SERVERPARAMS

  else

    # If EULA was not accepted, show a message, and close the container.
    echo "EULA was not accepted!, current value: $EULA";
    exit 1;

fi
