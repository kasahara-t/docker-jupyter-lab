ROOT_DIR := $(shell git rev-parse --show-toplevel)

.PHONY: start
start: init
	docker-compose up -d

.PHONY: stop
stop:
	docker-compose down

.PHONY: rebuild
rebuild: init
	docker-compose down
	docker-compose up --build -d

.PHONY: init
init: init-project
	@echo "Initialization complete."
	
.PHONY: clean
clean: clean-app clean-project
	@echo "Clean complete."

# Application
.PHONY: clean-app
clean-app:
	docker compose down --rmi all --remove-orphans --volumes
	@echo "Clean of app complete."

# Project
.env:
	@if [ ! -f $(ROOT_DIR)/.env ]; then \
		echo "Creating root .env from template"; \
		cp $(ROOT_DIR)/.env.template $(ROOT_DIR)/.env; \
	else \
		echo "$(ROOT_DIR)/.env already exists."; \
	fi

.PHONY: init-project
init-project: .env
	@echo "Initialization of project complete."
	
.PHONY: clean-project
clean-project:
	rm -f $(ROOT_DIR)/.env
	@echo "Clean of project complete."