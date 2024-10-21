.DEFAULT_GOAL := help


.PHONY: prepare_env
prepare_env: ## prepare env
	uv venv .venv 
	uv pip install mini-racer ruff

.PHONY: prepare_env313jit
prepare_env313jit: ## prepare env python 3.13 with jit
# PYTHON_CONFIGURE_OPTS="--enable-experimental-jit --disable-gil" pyenv install 3.13.0rc2
	PYTHON_CONFIGURE_OPTS="--enable-experimental-jit" pyenv install 3.13.0rc2
	pyenv local 3.13.0rc2
	python -m venv .venv
	pyenv local --unset
	. .venv/bin/activate
	uv pip install mini-racer ruff

.PHONY: prepare_env313
prepare_env313: ## prepare env python 3.13
	pyenv install 3.13.0rc2
	pyenv local 3.13.0rc2
	python -m venv .venv
	pyenv local --unset
	. .venv/bin/activate
	uv pip install mini-racer ruff

.PHONY: clean
clean: ## clean
	rm -rf .venv

.PHONY: build
build: ## build go library
	go build  -buildmode=c-shared -o out/library.so library.go

.PHONY: run
run: ## run tests.py
	. .venv/bin/activate && python tests.py


.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-16s\033[0m %s\n", $$1, $$2}'
##	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-16s\033[0m %s\n", $$1, $$2}'
