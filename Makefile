SCRIPT_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
USER := $(shell whoami)

.PHONY: deploy format

deploy:
	ansible-playbook -i $(SCRIPT_DIR)/hosts $(SCRIPT_DIR)/localhost.yml --ask-become-pass -e "user=$(USER)"

format:
	yamlfmt -formatter indentless_arrays=true,retain_line_breaks=true .
