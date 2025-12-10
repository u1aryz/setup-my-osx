USER := $(shell whoami)

.PHONY: deploy format

deploy:
	ansible-playbook localhost.yml --ask-become-pass -e "user=$(USER)" $(if $(TAGS),--tags $(TAGS))

format:
	ansible-lint --fix
