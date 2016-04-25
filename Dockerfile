# using latest Debian image
FROM stackbrew/debian:jessie

MAINTAINER Nick hazlett 

# update Debian and install wget
RUN apt-get update
RUN apt-get install -y wget

# download, extract, move, and cleanup TS3 tarball
RUN wget http://dl.4players.de/ts/releases/3.0.11.1/teamspeak3-server_linux-amd64-3.0.11.1.tar.gz -O /tmp/teamspeak.tar.gz && tar zxf /tmp/teamspeak.tar.gz -C /opt && mv /opt/teamspeak3-server_* /opt/ts3 && rm /tmp/teamspeak.tar.gz

# expose ports for virtual voice server, ServerQuery, and file transfer
EXPOSE 9987/udp 10011 30033

# create mount point for any TS3-Data to be accessible from the host
VOLUME /opt/ts3

# starts teamspeak
CMD ["opt/ts3/ts3server_minimal_runscript.sh"]
