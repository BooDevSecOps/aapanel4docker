# this is the official image of Ubuntu 22.04
FROM ubuntu:22.04 

USER root

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get clean -y
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get dist-upgrade -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata
RUN apt-get install -y wget
RUN apt-get install -y procps

# ini aapanel install
RUN URL=https://www.aapanel.com/script/install_7.0_en.sh && if [ -f /usr/bin/curl ];then curl -ksSO "$URL" ;else wget --no-check-certificate -O install_7.0_en.sh "$URL";fi;
RUN echo 'echo -e "y\nn\n" | bash install_7.0_en.sh aapanel' > inst.sh
RUN bash inst.sh
# end aapanel install

# ini SO installs  
RUN apt-get install -y passwd 
RUN apt-get install -y sudo
RUN apt-get install -y nano
RUN apt-get install -y iproute2
RUN apt-get install -y net-tools
RUN apt-get install -y locales-all
RUN apt-get install -y procps
RUN apt-get install -y telnet
RUN apt-get install -y iputils-ping
RUN apt-get install -y net-tools
RUN apt-get install -y nmon
RUN apt-get install -y ncdu
RUN apt-get install -y htop
# end SO installs

COPY entrypoint.sh /entrypoint.sh
RUN ["chmod", "+x", "/entrypoint.sh"]
COPY restart.sh /restart.sh
RUN ["chmod", "+x", "/restart.sh"]
COPY tail.sh /tail.sh
RUN ["chmod", "+x", "/tail.sh"]

ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]

EXPOSE 7800 443 80 888 3306
