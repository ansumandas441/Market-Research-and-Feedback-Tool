# Define variables
BASE_DIR := .
STRAPI_PROJECT := strapi-cms/strapi-project

# Default target
.PHONY: all
all: setup

# Install necessary dependencies
.PHONY: install
install:
	@echo "Installing necessary dependencies..."
	npm install

# Setup Strapi project
.PHONY: setup-strapi
setup-strapi:
	@echo "Setting up Strapi project..."
	mkdir -p $(BASE_DIR)/strapi-cms
	npx create-strapi-app@latest $(BASE_DIR)/$(STRAPI_PROJECT) --quickstart -y

# Run Strapi server
.PHONY: run-strapi
run-strapi:
	@echo "Running Strapi server..."
	cd $(BASE_DIR)/$(STRAPI_PROJECT) && npm run develop

# Main setup target
.PHONY: setup
setup: install setup-strapi run-strapi

# Clean the Strapi project
.PHONY: clean
clean:
	@echo "Cleaning up..."
	rm -rf $(STRAPI_DIR)
