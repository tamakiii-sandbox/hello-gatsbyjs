.PHONY: help install start clean

help:
	cat $(lastword $(MAKEFILE_LIST))

install: \
	node_modules

start:
	cd hello-world && \
		gatsby develop --host=0.0.0.0

node_modules:
	npm install --dev

clean:
	rm -rf node_modules