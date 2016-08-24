develop: node_modules
	rm -rf build
	node develop.js

optimize: node_modules
	rm -rf docs
	node optimize.js

node_modules: package.json
	npm install

.PHONY: build
