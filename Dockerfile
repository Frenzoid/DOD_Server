FROM ubuntu
MAINTAINER Frenzoid <frenzoid@protonmail.com>

ENV VOL /home/steamsrv/
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
	      
RUN useradd                             \
        -d /home/steamsrv               \
        -m                              \
        -s /bin/bash                    \
        steamsrv

USER steamsrv
RUN mkdir -p /home/steamsrv/steamcmd  /home/steamsrv/dayofdragons_server/          &&\
    cd /home/steamsrv/steamcmd                  &&\
    curl -s http://media.steampowered.com/installer/steamcmd_linux.tar.gz | tar -vxz &&\
    mkdir -p /home/steamsrv/.steam/sdk32	&&\
    ln -s /home/steamsrv/steamcmd/linux32/steamclient.so /home/steamsrv/.steam/sdk32/steamclient.so
	

WORKDIR /home/steamsrv

RUN /home/steamsrv/steamcmd/steamcmd.sh +login anonymous +force_install_dir /home/steamsrv/dayofdragons_server/ +app_update 1088320 validate +quit

RUN apt-get clean autoclean
RUN apt-get autoremove -y
RUN rm -rf /var/lib/apt/lists/*

RUN ["chmod", "+x", "/home/steamsrv/dayofdragons_server/DragonsServer.sh"]

WORKDIR /home/steamsrv/dayofdragons_server/
ENTRYPOINT ["/bin/bash", "-c", "./DragonsServer.sh]
