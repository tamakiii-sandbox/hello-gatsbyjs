.PHONY: help install install-dev build clean @development

ENVIRONMENTS := production-pseudo development
ENVIRONMENT := production-pseudo

help:
	cat $(lastword $(MAKEFILE_LIST))

install: \
	.env \
	build

install-dev: \
	development \
	install

build:
	docker-compose build

.env:
	echo "ENVIRONMENT=$(ENVIRONMENT)" > $@

clean:
	rm -rf .env
	docker-compose down -v

$(ENVIRONMENTS):
	$(eval ENVIRONMENT := $@)