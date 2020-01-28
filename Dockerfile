FROM node:13.7.0-alpine3.11

RUN apk add --update --no-cache bash make && \
    rm -rf /var/cache/*
