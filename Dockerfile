FROM ubuntu:18.04
MAINTAINER Frenzoid <frenzoid@protonmail.com>

ENV VOL /root/steamsrv/
ENV GAMEPORT 9000

VOLUME ${VOL}
EXPOSE ${GAMEPORT}

# Install dependencies
RUN dpkg --add-architecture i386
RUN apt-get update                      &&      \
    apt-get upgrade -y                     &&      \
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
					

RUN useradd                             \
        -d /home/steamsrv               \
        -m                              \
        -s /bin/bash                    \
        steamsrv

RUN mkdir -p /scripts
ADD InstallAppID /scripts/InstallAppID
ADD run_srcds_server /scripts/run_srcds_server
ADD StartServer /scripts/StartServer

USER steamsrv
# Download and extract SteamCMD
RUN mkdir -p /home/steamsrv/steamcmd            &&\
    cd /home/steamsrv/steamcmd                          &&\
    curl -s http://media.steampowered.com/installer/steamcmd_linux.tar.gz | tar -vxz &&\
    mkdir -p /home/steamsrv/.steam/sdk32		&&\
    ln -s /home/steamsrv/steamcmd/linux32/steamclient.so /home/steamsrv/.steam/sdk32/steamclient.so
	

WORKDIR /home/steamsrv

RUN /home/steamsrv/steamcmd/steamcmd.sh +login anonymous +force_install_dir /home/steamsrv/dayofdragons_server/ +app_update 1088320 validate +quit

RUN ["chmod", "+x", "/home/steamsrv/dayofdragons_server/DragonsServer.sh"]

WORKDIR /home/steamsrv/dayofdragons_server/
ENTRYPOINT ["/bin/bash", "-c", "./DragonsServer.sh]
