.PHONY: deploy deploy-select format

deploy:
	ansible-playbook localhost.yml $(if $(TAGS),--tags $(TAGS))

deploy-select:
	@tags=$$(grep -oE 'tags: [a-z_]+' localhost.yml | cut -d' ' -f2 | \
		fzf --multi --no-input --reverse \
			--pointer='' --marker='✔ ' --color=marker:white \
			--bind 'space:toggle' \
			--bind 'a:transform([ "$$FZF_SELECT_COUNT" -eq "$$FZF_MATCH_COUNT" ] && echo deselect-all || echo select-all)' \
			--header 'Space: 選択 / a: 全選択/全解除 / Enter: 実行' | \
		paste -sd, -); \
	if [ -n "$$tags" ]; then $(MAKE) deploy TAGS=$$tags; fi

format:
	ansible-lint --fix
