FROM ubuntu
MAINTAINER Frenzoid <frenzoid@protonmail.com>

ENV VOL /steam/
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
	libc6 \
	libstdc++6 \	
	lib32z1 \
	libcurl3-gnutls
	      
RUN mkdir -p /steam/steamcmd/ /steam/dayofdragons_server/
WORKDIR /steam/steamcmd/

RUN curl -s 'https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz' | tar -vxz
RUN /steam/steamcmd/steamcmd.sh +login anonymous +force_install_dir /steam/dayofdragons_server/ +app_update 1088320 validate +quit

RUN apt-get clean autoclean
RUN apt-get autoremove -y
RUN rm -rf /var/lib/apt/lists/*

RUN ["chmod", "+x", "/steam/dayofdragons_server/DragonsServer.sh"]

WORKDIR /steam/dayofdragons_server/
ENTRYPOINT ["/bin/bash", "-c", "./DragonsServer.sh]
