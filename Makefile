#
# Tasks Makefile
# ==============
#
# Shortcuts for various tasks.
#
# This file is part of the `aiovalidator` package.
# (c) 2016-2017 Kozlovski Lab <vladimir@kozlovskilab.com>
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.
#

INPUT_DOCS_DIR ?= docs
BUILD_DOCS_DIR ?= docs/_build

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  run            to run service"
	@echo "  test           to run tests"
	@echo "  coverage       to get a report of the test coverage"
	@echo "  typecheck      to run static type checker"
	@echo "  stylecheck     to check code style"
	@echo "  doc            to update the documentation"
	@echo "  update         to update the dependencies"
	@echo "  clean          to clean the project from junk files"

run:
	python3.6 -m aiovalidator

test:
	python3.6 -m pytest -v tests

coverage:
	@(coverage run --source=aiovalidator --module py.test $(TEST_OPTIONS) $(TESTS))
	@(coverage report)

typecheck:
	python3.6 -m mypy -m aiovalidator

stylecheck:
	flake8 --ignore E501

#tox-test:
#	tox

doc:
	sphinx-build $(INPUT_DOCS_DIR) $(BUILD_DOCS_DIR)

update:
	/usr/local/bin/python3.6 -m pip install -r requirements_dev.txt

clean:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +
	find . -name '__pycache__' -exec rm -rf {} +
