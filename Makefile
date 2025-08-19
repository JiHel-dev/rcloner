ifeq (, $(shell which docker-compose 2> /dev/null))
	DOCKER_COMPOSE="docker compose"
else
	DOCKER_COMPOSE="docker-compose"
endif

REQUIRED_VARS := SYNC_DIR

define CHECK_VARS
	@$(foreach var,$(REQUIRED_VARS), \
		if [ -z "$($(var))" ]; then \
			echo "Error : variable '$(var)' is mandatory."; \
			exit 1; \
		fi; )
endef

configure:
	@echo "Building rclone builder..."
	$(DOCKER_COMPOSE) up builder
	$(DOCKER_COMPOSE) run --rm builder config

install:
	$(info Select rclone configuration to install :)
	$(eval CONFIG := $(shell $(DOCKER_COMPOSE) run --rm builder listremotes 2> /dev/null | tr -d : | xargs -o ./select.sh))
	$(call CHECK_VARS)
	@echo "Installing container $(CONFIG) with $(DOCKER_COMPOSE)..."
	SYNC_DIR=$(SYNC_DIR) CONFIG=$(CONFIG) $(DOCKER_COMPOSE) $(INSTALL_ARGS) -p $(CONFIG) up --no-start sync
