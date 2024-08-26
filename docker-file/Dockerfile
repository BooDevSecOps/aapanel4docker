# this is the official image of Ubuntu 22.04
FROM ubuntu:22.04 

USER root

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install -y tzdata
RUN apt-get install -y wget
RUN apt-get install -y procps

# ini aapanel install
RUN wget -O install.sh http://www.aapanel.com/script/install_7.0_en.sh
RUN echo 'echo -e "y\nn\n" | bash install.sh aapanel' > inst.sh
RUN bash inst.sh
RUN /www/server/panel/pyenv/bin/python3.12 -m pip install --upgrade pip
# end aapanel install

# fix to slow bt 1  

COPY entrypoint.sh /entrypoint.sh
RUN ["chmod", "+x", "/entrypoint.sh"]
COPY restart.sh /restart.sh
RUN ["chmod", "+x", "/restart.sh"]
COPY tail.sh /tail.sh
RUN ["chmod", "+x", "/tail.sh"]

ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]

EXPOSE 7800 443 80 888 3306
