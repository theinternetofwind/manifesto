develop: node_modules
	rm -rf build
	node develop.js

optimize: node_modules
	rm -rf optimized
	node optimize.js

deploy: deploy_on_github

deploy_on_github:
	git push origin master
	git subtree push -f --prefix optimized origin gh-pages

node_modules: package.json
	npm install

.PHONY: build
