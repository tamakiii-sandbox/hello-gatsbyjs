.PHONY: help install opt-out clean

help:
	cat $(lastword $(MAKEFILE_LIST))

install: \
	node_modules

node_modules:
	npm install --dev

opt-out:
	npx gatsby telemetry --disable

clean:
	rm -rf node_modules