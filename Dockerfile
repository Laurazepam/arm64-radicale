#
# radicale Dockerfile
#
# https://github.com/Laurazepam/arm64-radicale
#

# Pull base image.
FROM    alpine:latest

ENV VER=3.1.7

RUN     apk add --no-cache --virtual=junk \
        gcc \
        python3-dev \
        musl-dev \
        && apk add --no-cache \
             python3 \
             curl \
             py3-pip \
        && python3 -m pip install --upgrade pip \
        && python3 -m pip install radicale==$VER passlib[bcrypt] \
        && apk del --purge junk

HEALTHCHECK --interval=45s --retries=5 CMD curl --fail http://localhost:5232 || exit 1

VOLUME  /etc/radicale/config \
        /var/lib/radicale/collections

COPY    start.sh /usr/local/bin/ 
COPY    config /etc/radicale/config/
        
RUN chmod +x /usr/local/bin/start

CMD ["start"]

EXPOSE 5232