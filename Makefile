.PHONY: help install dependencies build opt-out clean

help:
	cat $(lastword $(MAKEFILE_LIST))

install: \
	dependencies \
	node_modules

dependencies:
	type npm > /dev/null
	type npx > /dev/null

build:
	npx --no-install gatsby build

node_modules:
	npm install --dev

opt-out:
	npx gatsby telemetry --disable

clean:
	rm -rf node_modules
