.PHONY: help install build ash clean

IMAGE := hello-gatzbyjs

help:
	cat $(lastword $(MAKEFILE_LIST))

install: \
	build

build:
	docker build -t $(IMAGE) .

ash:
	docker run --rm -it -v $(PWD):/app -w /app $(IMAGE) $@

develop:
	docker run --rm -it -v $(PWD):/app -w /app -p 8000:8000 $(IMAGE) npx --no-install gatsby develop

clean:
	docker image rm $(IMAGE)
