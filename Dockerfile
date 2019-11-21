FROM ubuntu
MAINTAINER Frenzoid <frenzoid@protonmail.com>

ENV VOL /root/steam
ENV STEAMCMDDIR ${VOL}/steamcmd
ENV GAMEDIR ${VOL}/dayofdragons_server
ENV GAMEID 1088320
ENV GAMEPORT 9000

VOLUME ${VOL}

EXPOSE ${GAMEPORT}

COPY start.sh /root/steam/steamcmd/start.sh

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
		
RUN mkdir -p ${STEAMCMDDIR} ${GAMEDIR} \
	&& cd ${STEAMCMDDIR} \
	&& curl -s 'https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz' | tar -vxz

RUN apt-get clean autoclean
RUN apt-get autoremove -y
RUN rm -rf /var/lib/apt/lists/*

RUN chmod +x ${STEAMCMDDIR}/start.sh

WORKDIR ${STEAMCMDDIR}
RUN ./steamcmd.sh +login anonymous +force_install_dir ${GAMEDIR} +app_update ${GAMEID} validate +quit

WORKDIR ${GAMEDIR}
RUN chmod +x ./DragonsServer.sh

ENTRYPORT ["/bin/bash", "-c", "./DragonsServer.sh]
