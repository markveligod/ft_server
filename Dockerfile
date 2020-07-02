FROM debian:buster

MAINTAINER DKA DEVELOP <markveligod@yandex.ru>

RUN apt-get update && apt-get install -y cowsay && ln -s /usr/games/cowsay /usr/bin/cowsay

ENTRYPOINT ["cowsay"]