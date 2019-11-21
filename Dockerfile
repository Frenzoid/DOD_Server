FROM ubuntu
MAINTAINER Frenzoid <frenzoid@protonmail.com>

ENV VOL /usr/share/steam/
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
		
RUN mkdir -p /usr/share/steam/dayofdragons_server/  /usr/share/steam/steamcmd/
WORKDIR /usr/share/steam/steamcmd/
RUN curl -s 'https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz' | tar -vxz
RUN chmod +x /usr/share/steam/steamcmd/steamcmd.sh

RUN apt-get clean autoclean
RUN apt-get autoremove -y
RUN rm -rf /var/lib/apt/lists/*

RUN /usr/share/steam/steamcmd/steamcmd.sh +login anonymous +force_install_dir /usr/share/steam/dayofdragons_server/ +app_update 1088320 validate +quit
RUN chmod +x /usr/share/steam/dayofdragons_server/DragonsServer.sh

ENTRYPOINT ["/bin/bash", "-c", "./DragonsServer.sh]
