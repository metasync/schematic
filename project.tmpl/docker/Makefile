include Makefile.env

build.app.dev:
	@$(MAKE) -C build/dev build

push.app.dev:
	@$(MAKE) -C build/dev push

shell.app.dev:
	@$(MAKE) -C build/dev shell

build.app.rel:
	@$(MAKE) -C build/rel build

push.app.rel:
	@$(MAKE) -C build/rel push

shell.app.rel:
	@$(MAKE) -C build/rel shell

prune:
	@${CONTAINER_CLI} image prune -f
clean: prune


up:
	@${CONTAINER_CLI} compose up -d
down:
	@${CONTAINER_CLI} compose down
ps:
	@${CONTAINER_CLI} compose ps -a
logs:
	@${CONTAINER_CLI} compose logs -f

up.dev:
	@${CONTAINER_CLI} compose up dev -d
shell.dev:
	@${CONTAINER_CLI} compose exec dev /bin/sh
restart.dev:
	@${CONTAINER_CLI} compose restart dev
logs.dev:
	@${CONTAINER_CLI} compose logs dev -f

up.dev.db:
	@${CONTAINER_CLI} compose up dev.db -d
shell.dev.db:
	@${CONTAINER_CLI} compose exec dev.db /bin/bash
restart.dev.db:
	@${CONTAINER_CLI} compose restart dev.db
logs.dev.db:
	@${CONTAINER_CLI} compose logs dev.db -f
