FROM ubuntu
MAINTAINER Frenzoid <frenzoid@protonmail.com>

ENV VOL /root/steam/
ENV GAMEID 1088320
ENV GAMEPORT 9000

VOLUME ${VOL}

EXPOSE ${GAMEPORT}

RUN apt-get update 
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
        curl \
        lib32gcc1 \
        lib32tinfo5 \
      	libncurses5 \
        libncurses5 \
	      libc6 \
	      libstdc++6 \
	      lib32z1 \
	      libcurl3-gnutls \
	      curl
		
RUN mkdir -p /root/steam/dayofdragons_server/  /root/steam/steamcmd/ \
	&& cd /root/steam/steamcmd/ \
	&& curl -s 'https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz' | tar -vxz

RUN apt-get clean autoclean
RUN apt-get autoremove -y
RUN rm -rf /var/lib/apt/lists/*

WORKDIR /root/steam/steamcmd/
RUN ./steamcmd.sh +login anonymous +force_install_dir $GAMEDIR +app_update $GAMEID validate +quit

WORKDIR /root/steam/dayofdragons_server/
RUN chmod +x ./DragonsServer.sh

ENTRYPOINT ["/bin/bash", "-c", "./DragonsServer.sh]
