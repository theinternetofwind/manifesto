develop: node_modules
	rm -rf build
	node develop.js

optimize: node_modules
	rm -rf optimized
	node optimize.js

deploy:
	git push origin master
	git push origin `git subtree split --prefix optimized master`:gh-pages --force

node_modules: package.json
	npm install

.PHONY: build
