develop: node_modules
	rm -rf build
	node develop.js

optimize: node_modules
	rm -rf optimized
	node optimize.js

deploy: deploy_on_github

deploy_on_github:
	git subtree push --prefix optimized origin gh-pages

node_modules: package.json
	npm install

.PHONY: build
