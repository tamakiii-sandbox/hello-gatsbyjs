FROM node:13.7.0-alpine3.11 AS production-pseudo

RUN apk add --update --no-cache bash make && \
    rm -rf /var/cache/*

# --

FROM production-pseudo AS development

RUN apk add --update --no-cache git && \
    rm -rf /var/cache/*
