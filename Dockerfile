FROM ubuntu:18.04
MAINTAINER Frenzoid <frenzoid@protonmail.com>

ENV VOL /root/steamsrv/
ENV GAMEPORT 9000

VOLUME ${VOL}
EXPOSE ${GAMEPORT}

RUN dpkg --add-architecture i386
RUN apt-get update                      &&      \
    apt-get upgrade -y                  &&      \
    apt-get install -y                          \
        curl                                    \
        lib32gcc1				\
	lib32tinfo5				\
	libncurses5				\
	libncurses5:i386			\
	libc6:i386				\
	libstdc++6:i386				\
	lib32z1					\
	libcurl3-gnutls:i386
	      

RUN mkdir -p /root/steamsrv/steamcmd  /root/steamsrv/dayofdragons_server/ && \
    cd /root/steamsrv/steamcmd && \
    curl -s http://media.steampowered.com/installer/steamcmd_linux.tar.gz | tar -vxz && \
    mkdir -p /root/steamsrv/.steam/sdk32 && \
    ln -s /root/steamsrv/steamcmd/linux32/steamclient.so /root/steamsrv/.steam/sdk32/steamclient.so
	

WORKDIR /root/steamsrv

RUN /root/steamsrv/steamcmd/steamcmd.sh +login anonymous +force_install_dir /root/steamsrv/dayofdragons_server/ +app_update 1088320 validate +quit

RUN apt-get clean autoclean
RUN apt-get autoremove -y
RUN rm -rf /var/lib/apt/lists/*

RUN ["chmod", "+x", "/root/steamsrv/dayofdragons_server/DragonsServer.sh"]

WORKDIR /root/steamsrv/dayofdragons_server/
ENTRYPOINT ["/bin/bash", "-c", "./DragonsServer.sh]
