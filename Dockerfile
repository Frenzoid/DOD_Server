FROM ubuntu
MAINTAINER Frenzoid <frenzoid@protonmail.com>

ENV VOL /home/steam/
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
	      
RUN useradd -m steam && useradd -m steam

USER steam
RUN mkdir -p /home/steam/dayofdragons_server/  /home/steam/steamcmd/
COPY preparesteamcmd.sh /home/steam/steamcmd/preparesteamcmd.sh

USER root
RUN chmod +x /home/steam/preparesteamcmd.sh && chown steam /home/steam/preparesteamcmd.sh

USER steam
WORKDIR /home/steam/steamcmd/

RUN ./preparesteamcmd.sh
RUN ./steamcmd.sh +login anonymous +force_install_dir /home/steam/dayofdragons_server/ +app_update 1088320 validate +quit

RUN apt-get clean autoclean
RUN apt-get autoremove -y
RUN rm -rf /var/lib/apt/lists/*

USER root
RUN chmod +x /home/steam/dayofdragons_server/DragonsServer.sh && chown steam -R /home/steam/

USER steam
ENTRYPOINT ["/bin/bash", "-c", "./DragonsServer.sh]
