FROM ghost:5-alpine

LABEL maintainer="git@danny.works"

RUN apk add --no-cache --update curl ca-certificates openssl git tar zsh bash sqlite fontconfig ncurses mysql mysql-client \
    && adduser --disabled-password --home /home/container container

USER container
ENV  USER=container HOME=/home/container IMAGE_VERSION=5-alpine

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]