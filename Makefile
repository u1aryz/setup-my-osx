.PHONY: deploy deploy-select format

# becomeパスワードが必要なrole。これらを含まないTAGS指定時はプロンプトをスキップする
BECOME_TAGS := fish homebrew
comma := ,
NEEDS_BECOME = $(if $(TAGS),$(filter $(BECOME_TAGS),$(subst $(comma), ,$(TAGS))),all)

deploy:
	ansible-playbook localhost.yml $(if $(TAGS),--tags $(TAGS)) $(if $(NEEDS_BECOME),,-e ansible_become_pass=)

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
