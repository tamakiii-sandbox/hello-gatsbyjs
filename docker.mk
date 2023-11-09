.PHONY: help install install-dev build clean @development

export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1

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

@%:
	docker-compose run --rm node ls -lsa
	# docker-compose run --rm node make $(subst @,,$@) $(OPT)

$(ENVIRONMENTS):
	$(eval ENVIRONMENT := $@)
