PYTHON_SOURCE_DIRS=rplugin/python3/nvj tests

all: format check test

clean:
	@echo "Not implemented"

check:
	@flake8 $(PYTHON_SOURCE_DIRS)
	@mypy $(PYTHON_SOURCE_DIRS)
	@isort --quiet --recursive --atomic --diff $(PYTHON_SOURCE_DIRS)
	@black --diff --quiet $(PYTHON_SOURCE_DIRS)

docs:
	@echo "Not implemented"

format:
	@isort --quiet --recursive --atomic $(PYTHON_SOURCE_DIRS)
	@black --quiet $(PYTHON_SOURCE_DIRS)

help:
	@echo "Development targets:"
	@echo "\tall:\tFormat code and run checks"
	@echo "\tclean\tRemove temporary files"
	@echo "\tcheck:\tRun checks"
	@echo "\tdocs:\tBuild html documentation"
	@echo "\tformat:\tFormat code"
	@echo "\thelp:\tShow this help"
	@echo "\ttest:\tRun tests"
	@echo "Pipeline targets:"
	@echo "\tpreprocess: preprocess all data."

test:
	@pytest -q -s
