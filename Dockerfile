FROM node:13.13.0 AS production-pseudo

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        bash \
        make \
        && \
    apt-get clean && \
    rm -rf /var/cache/*

WORKDIR /app
COPY . /app

COPY docker-entrypoint.sh /usr/local/sbin/
ENTRYPOINT ["docker-entrypoint.sh"]

# --

FROM production-pseudo AS development

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        git \
        && \
    apt-get clean && \
    rm -rf /var/cache/*

