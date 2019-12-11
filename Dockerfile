FROM ubuntu:18.04

LABEL maintainer frenzoid
LABEL emailmaintainer frenzoid@protonmail.com

ENV VOLROOT /home/steamsrv/
ENV VOLSCMD /home/steamsrv/steamcmd/
ENV VOLSDOD /home/steamsrv/dayofdragons_server/
ENV VOLCONF /home/steamsrv/dayofdragons_server/Dragons/Saved/Config/LinuxServer/

ENV GAMEPORT1 7777
ENV GAMEPORT2 7778
ENV STEAMPORT1 27015
ENV STEAMPORT2 27016
ENV ADITIONPORT 4380
ENV WEBPORT 80
ENV SSLPORT 443

ENV UPDATEGAME true
ENV WHITELIST false
ENV MAXPLAYERS 200
ENV AUTOSAVESECONDS 300
ENV ADMINSTEAMID 76561198051558283
ENV UPDATECONFIG true
ENV SERVERNAME '"Docker Powered DoD server!"'

ENV STARTSERVER "/home/steamsrv/launchserver.sh &"
ENV STOPSERVER "/home/steamsrv/stopserver.sh"

EXPOSE ${WEBPORT}/tcp
EXPOSE ${SSLPORT}/tcp
EXPOSE ${GAMEPORT1}/udp
EXPOSE ${GAMEPORT2}/udp
EXPOSE ${ADITIONPORT}/udp
EXPOSE ${STEAMPORT1}/udp
EXPOSE ${STEAMPORT1}/tcp
EXPOSE ${STEAMPORT2}/udp
EXPOSE ${STEAMPORT2}/tcp

RUN dpkg --add-architecture i386
RUN apt-get update  	    &&	\
	apt-get upgrade -y  &&	\
	apt-get install -y	\
	curl              	\
	lib32gcc1		\
	lib32tinfo5		\
	libncurses5		\
	libncurses5:i386	\
	libc6:i386		\
	libstdc++6:i386		\
	lib32z1			\
	libcurl3-gnutls:i386 \
	sed \
	nano
								

RUN useradd                             \
        -d /home/steamsrv               \
        -m                              \
        -s /bin/bash                    \
        steamsrv

USER steamsrv

RUN mkdir -p /home/steamsrv/steamcmd /home/steamsrv/predodconfig/ && \
    cd /home/steamsrv/steamcmd && \
    curl -s http://media.steampowered.com/installer/steamcmd_linux.tar.gz | tar -vxz && \
    mkdir -p /home/steamsrv/.steam/sdk32 && \
    ln -s /home/steamsrv/steamcmd/linux32/steamclient.so /home/steamsrv/.steam/sdk32/steamclient.so
	
COPY entry-point.sh /home/steamsrv/steamcmd/entry-point.sh
COPY launchserver.sh /home/steamsrv/launchserver.sh
COPY stopserver.sh /home/steamsrv/stopserver.sh
COPY Game.ini /home/steamsrv/predodconfig/Game.ini
COPY Engine.ini /home/steamsrv/predodconfig/Engine.ini


ENTRYPOINT ["/home/steamsrv/steamcmd/entry-point.sh"]
