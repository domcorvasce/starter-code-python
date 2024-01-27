SOURCE_DIRECTORIES := src tests

.PHONY: install
install:
	poetry install

.PHONY: format
format:
	poetry run isort ${SOURCE_DIRECTORIES}
	poetry run black ${SOURCE_DIRECTORIES}

.PHONY: lint
lint:
	poetry run flake8 ${SOURCE_DIRECTORIES}
	poetry run mypy ${SOURCE_DIRECTORIES}

.PHONY: docs
docs:
	poetry run mkdocs serve --dev-addr=0.0.0.0:9000

.PHONY: test
test:
	poetry run pytest tests
