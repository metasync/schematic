include Makefile.env

build.dev:
	@$(MAKE) -C dev build

push.dev:
	@$(MAKE) -C dev push

shell.dev:
	@$(MAKE) -C dev shell

build.rel:
	@$(MAKE) -C rel build

push.rel:
	@$(MAKE) -C rel push

shell.rel:
	@$(MAKE) -C rel shell

prune:
	@${CONTAINER_CLI} image prune -f
clean: prune
