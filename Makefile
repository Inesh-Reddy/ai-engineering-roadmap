# -------------------------------
# Root Makefile for multi-week projects
# Supports: install, run, lint, format, test, clean
# Works on macOS and Linux
# -------------------------------

# Default week; 'all' applies to all weeks
WEEK ?= all

# Detect all week folders dynamically (cross-platform)
WEEKS := $(shell find . -maxdepth 1 -type d -name "week-*" -exec basename {} \;)



.PHONY: install run lint format test clean

# -------------------------------
# Install dependencies
install:
ifeq ($(WEEK),all)
	@echo "Installing dependencies for all weeks..."
	@INSTALLED=""
	@for w in $(WEEKS); do \
		echo "Installing $$w..."; \
		if cd $$w && poetry install; then \
			INSTALLED="$$INSTALLED $$w"; \
		else \
			echo "❌ Failed to install $$w"; \
		fi \
	done; \
	echo ""; \
	echo "✅ Successfully installed weeks: $$INSTALLED"
else
	@echo "Installing dependencies for $(WEEK)..."
	cd $(WEEK) && poetry install && echo "✅ Successfully installed $(WEEK)"
endif

# -------------------------------
# Run main.py
run:
ifeq ($(WEEK),all)
	@echo "Running main.py for all weeks..."
	@for w in $(WEEKS); do \
		echo "Running $$w..."; \
		if cd $$w/src/$$(echo $$w | tr '-' '_') && poetry run python main.py; then \
			echo "✅ $$w ran successfully"; \
		else \
			echo "❌ $$w failed"; \
		fi \
	done
else
	@echo "Running main.py for $(WEEK)..."
	cd $(WEEK)/src/$(shell echo $(WEEK) | tr '-' '_') && poetry run python main.py
endif

# -------------------------------
# Lint code using flake8
lint:
ifeq ($(WEEK),all)
	@echo "Linting all weeks..."
	@for w in $(WEEKS); do \
		echo "Linting $$w..."; \
		if cd $$w/src/$$w && poetry run flake8 .; then \
			echo "✅ $$w passed lint"; \
		else \
			echo "❌ $$w has lint errors"; \
		fi \
	done
else
	@echo "Linting $(WEEK)..."
	cd $(WEEK)/src/$(WEEK) && poetry run flake8 .
endif

# -------------------------------
# Format code using black
format:
ifeq ($(WEEK),all)
	@echo "Formatting all weeks..."
	@for w in $(WEEKS); do \
		echo "Formatting $$w..."; \
		cd $$w/src/$$w && poetry run black .; \
	done
else
	@echo "Formatting $(WEEK)..."
	cd $(WEEK)/src/$(WEEK) && poetry run black .
endif

# -------------------------------
# Run tests using pytest
test:
ifeq ($(WEEK),all)
	@echo "Running tests for all weeks..."
	@for w in $(WEEKS); do \
		echo "Testing $$w..."; \
		if cd $$w && poetry run pytest; then \
			echo "✅ $$w tests passed"; \
		else \
			echo "❌ $$w tests failed"; \
		fi \
	done
else
	@echo "Running tests for $(WEEK)..."
	cd $(WEEK) && poetry run pytest
endif

# -------------------------------
# Clean __pycache__ and temporary files
clean:
ifeq ($(WEEK),all)
	@echo "Cleaning all weeks..."
	@for w in $(WEEKS); do \
		echo "Cleaning $$w..."; \
		find $$w/src/$$w -type d -name "__pycache__" -exec rm -rf {} +; \
		find $$w/src/$$w -type d -name ".pytest_cache" -exec rm -rf {} +; \
	done
else
	@echo "Cleaning $(WEEK)..."
	find $(WEEK)/src/$(WEEK) -type d -name "__pycache__" -exec rm -rf {} +
	find $(WEEK)/src/$(WEEK) -type d -name ".pytest_cache" -exec rm -rf {} +
endif
