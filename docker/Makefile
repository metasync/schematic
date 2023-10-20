include config/project.env
include config/docker.env
include config/${DB_ADAPTER}/docker.env
include config/${DB_ADAPTER}/secret.env
include config/cipher.env

export

include Makefile.env

build.base.dev:
	@$(MAKE) -C build/dev build

push.base.dev:
	@$(MAKE) -C build/dev push

shell.base.dev:
	@$(MAKE) -C build/dev shell

build.base.rel:
	@$(MAKE) -C build/rel build

push.base.rel:
	@$(MAKE) -C build/rel push

shell.base.rel:
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
