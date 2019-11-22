FROM ubuntu:18.04
MAINTAINER Frenzoid <frenzoid@protonmail.com>

ENV VOL /root/steamsrv/
ENV GAMEPORT 9000
ENV UPDATE true

VOLUME ${VOL}
EXPOSE ${GAMEPORT}

RUN dpkg --add-architecture i386
RUN apt-get update  &&  \
    apt-get upgrade -y  &&   \
    apt-get install -y  \
		curl              \
		lib32gcc1			   	\
		lib32tinfo5				\
		libncurses5				\
		libncurses5:i386	\
		libc6:i386				\
		libstdc++6:i386		\
		lib32z1				  	\
		libcurl3-gnutls:i386
								

RUN useradd                             \
        -d /home/steamsrv               \
        -m                              \
        -s /bin/bash                    \
        steamsrv

USER steamsrv

RUN mkdir -p /home/steamsrv/steamcmd            &&\
    cd /home/steamsrv/steamcmd                          &&\
    curl -s http://media.steampowered.com/installer/steamcmd_linux.tar.gz | tar -vxz &&\
    mkdir -p /home/steamsrv/.steam/sdk32		&&\
    ln -s /home/steamsrv/steamcmd/linux32/steamclient.so /home/steamsrv/.steam/sdk32/steamclient.so
	
COPY entry-point.sh /home/steamsrv/entry-point.sh

ENTRYPOINT ["/home/steamsrv/steamcmd/entry-point.sh"]
