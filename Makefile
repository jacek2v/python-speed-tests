.DEFAULT_GOAL := help


.PHONY: prepare_env
prepare_env: ## prepare env
	uv venv .venv 
	uv pip install mini-racer ruff

.PHONY: build
build: ## build go library
	go build  -buildmode=c-shared -o out/library.so library.go

.PHONY: run
run: ## run use.py
	python reduce.py


.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-16s\033[0m %s\n", $$1, $$2}'
##	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-16s\033[0m %s\n", $$1, $$2}'
