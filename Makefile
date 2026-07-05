.PHONY: deploy format

deploy:
	ansible-playbook localhost.yml $(if $(TAGS),--tags $(TAGS))

format:
	ansible-lint --fix
