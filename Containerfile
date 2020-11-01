FROM ubuntu:20.04

ENV TZ=Europe/Berlin
ARG DEBIAN_FRONTEND=noninteractive

RUN adduser --disabled-login --gecos '' user
WORKDIR /home/user

RUN apt-get update && apt-get -y install wget nano libgtk-3-0 libnotify4 libnss3 libxss1 libxtst6 xdg-utils libatspi2.0-0 libappindicator3-1 libsecret-1-0
RUN wget -O /home/user/zettlr.deb https://github.com/Zettlr/Zettlr/releases/download/v1.7.5/Zettlr-1.7.5-amd64.deb
RUN dpkg -i /home/user/zettlr.deb
USER user


CMD ["zettlr", "--no-sandbox"]
