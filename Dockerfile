#
# radicale Dockerfile
#
# https://github.com/Laurazepam/arm64-radicale
#

# Pull base image.
FROM    alpine:latest

ENV VER=3.1.7

WORKDIR /temp

RUN rm -rf /var/cache/apk/* && \
    rm -rf /tmp/*

RUN     apk update \
        && apk add --no-cache --virtual=junk \
           gcc \
           python3-dev \
           musl-dev \
           libffi-dev \
        && apk add --no-cache \
             python3 \
             curl \
             py3-pip \
        && rm -rf /var/cache/apk/* \
        && rm -rf /tmp/*
        
RUN python3 -m pip install --upgrade pip \
        && python3 -m pip install wheel \
        && python3 -m pip install radicale==$VER passlib[bcrypt] \
        && python3 -m pip uninstall -y wheel \
        && apk del --purge junk \
        && mkdir /mytemp

HEALTHCHECK --interval=45s --retries=5 CMD curl --fail http://localhost:5232 || exit 1

VOLUME  /etc/radicale/config \
        /var/lib/radicale/collections

COPY    start /usr/local/bin/start 
COPY    config /mytemp/config
        
RUN chmod +x /usr/local/bin/start

CMD ["start"]

EXPOSE 5232