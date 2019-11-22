#!/bin/bash

if [ $UPDATE == true || $UPDATE == "true" || $UPDATE == 1 ]
  then
    mkdir -p "/home/steamsrv/dayofdragons_server/"
    /home/steamsrv/steamcmd/steamcmd.sh +login anonymous +force_install_dir /home/steamsrv/dayofdragons_server/ +app_update 1088320 validate +quit
fi

chmod 775 /home/steamsrv/dayofdragons_server/DragonsServer.sh
/home/steamsrv/dayofdragons_server/DragonsServer.sh
