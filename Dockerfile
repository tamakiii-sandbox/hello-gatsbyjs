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
RUN make install

ENV PATH /app/node_modules/.bin:$PATH

COPY docker-entrypoint.sh /usr/local/sbin/
ENTRYPOINT ["docker-entrypoint.sh"]

# --

FROM production-pseudo AS development

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        git \
        less \
        vim \
        && \
    apt-get clean && \
    rm -rf /var/cache/*

RUN make -f dev.mk install
