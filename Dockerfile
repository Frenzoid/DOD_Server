FROM ubuntu:18.04

LABEL maintainer frenzoid
LABEL emailmaintainer frenzoid@protonmail.com

ENV VOLROOT /home/steamsrv/
ENV VOLSCMD /home/steamsrv/steamcmd/
ENV VOLSDOD /home/steamsrv/dayofdragons_server/

ENV GAMEPORT 7777
ENV UPDATE true
ENV WHITELIST false
ENV MAXPLAYERS 200
ENV AUTOSAVESECONDS 300
ENV ADMINSTEAMID STEAM_0:1:45646277

EXPOSE ${GAMEPORT}/udp
EXPOSE ${GAMEPORT}/tcp

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
								

RUN useradd                             \
        -d /home/steamsrv               \
        -m                              \
        -s /bin/bash                    \
        steamsrv

USER steamsrv

RUN mkdir -p /home/steamsrv/steamcmd && \
    mkdir -p /home/steamsrv/predodconfig/ \
    cd /home/steamsrv/steamcmd && \
    curl -s http://media.steampowered.com/installer/steamcmd_linux.tar.gz | tar -vxz && \
    mkdir -p /home/steamsrv/.steam/sdk32 && \
    ln -s /home/steamsrv/steamcmd/linux32/steamclient.so /home/steamsrv/.steam/sdk32/steamclient.so
	
COPY entry-point.sh /home/steamsrv/steamcmd/entry-point.sh
COPY Game.ini /home/steamsrv/predodconfig/Game.ini

ENTRYPOINT ["/home/steamsrv/steamcmd/entry-point.sh"]
