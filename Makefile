.PHONY: install clean optout

install: \
	node_modules

node_modules:
	npm install

optout:
	npx --no-install gatsby telemetry --disable

clean:
	rm -rf node_modules

