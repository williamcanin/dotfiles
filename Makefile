# ----- Makefile -----

BRANCH := $(shell git branch --show-current)
REMOTES := $(shell git remote)
.DEFAULT_GOAL := help

# ----- COLORS -----
RESET  = \033[0m
BOLD   = \033[1m

RED    = \033[31m
GREEN  = \033[32m
YELLOW = \033[33m
BLUE   = \033[34m
CYAN   = \033[36m
WHITE  = \033[37m

.PHONY: help commit push push-lease

# ----- MENU -----
help:
	@printf "\n"
	@printf "  $(GREEN)make commit$(RESET)     -> Automatic commit\n"
	@printf "  $(BLUE)make push$(RESET)       -> Performs a remote push to all branches\n"
	@printf "  $(YELLOW)make push-lease$(RESET) -> Performs a remote push with lease mode\n\n"

# ----- GIT -----
commit:
	@printf "$(CYAN)[INFO]$(RESET) Checking changes...\n"
	@if ! git diff-index --quiet HEAD --; then \
		printf "$(GREEN)[OK]$(RESET) Changes detected\n"; \
		git add .; \
		git commit -m "$$(date +Date:%Y-%m-%d-Time:%H:%M:%S)"; \
	else \
		printf "$(YELLOW)[WARN]$(RESET) Nothing to commit\n"; \
	fi

push: commit
	@printf "$(BLUE)[PUSH]$(RESET) Push origin -> $(BRANCH)\n"
	@for remote in $(REMOTES); do \
		echo "  pushing to $$remote..."; \
		git push $$remote $(BRANCH); \
	done

push-lease:
	@printf "$(YELLOW)[PUSH]$(RESET) Push with --force-with-lease -> $(BRANCH)\n"
	@for remote in $(REMOTES); do \
		echo "  pushing to $$remote..."; \
		git push --force-with-lease $$remote $(BRANCH); \
	done
