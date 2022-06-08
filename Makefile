#!/usr/bin/make
# Makefile readme (ru): <http://linux.yaroslavl.ru/docs/prog/gnu_make_3-79_russian_manual.html>
# Makefile readme (en): <https://www.gnu.org/software/make/manual/html_node/index.html#SEC_Contents>

dc_bin := $(shell command -v docker-compose 2> /dev/null)
docker_bin := $(shell command -v docker 2> /dev/null)
mock_server_label := specs-mock-server

SHELL = /bin/sh

.PHONY : help \
         docs-watch mock-server \
         pull down \
         validate
.SILENT : help mock-server
.DEFAULT_GOAL : help

define get_container_ip_by_lable
	$(docker_bin) inspect -f "{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}" \`$(docker_bin)  ps --filter "label=$(1)" --format {{.ID}}\`
endef

# This will output the help for each task. thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help: ## Show this help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

docs-watch: ## Run documentation watcher
	$(dc_bin) run -p 3000:3000 docs-watch yarn run start

mock-server: ## Run mock-server
	$(dc_bin) up -d mock-server
	printf " \e[30;48;5;82m  %s  \033[0m\n" "Api endpoints:"
	printf " \e[30;48;5;82m  %s  \033[0m\n" "http://localhost:8080"
	printf " \e[30;48;5;82m  %s  \033[0m\n" "http://`$(call get_container_ip_by_lable, $(mock_server_label))`:8080"

validate: ## Validate JSON schema
	$(dc_bin) run openrpc-validator

down: ## Destroy all running containers
	$(dc_bin) down

pull: ## Pull latest images
	$(dc_bin) pull
