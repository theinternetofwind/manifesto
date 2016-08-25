develop: node_modules
	rm -rf build
	node develop.js

optimize: node_modules
	rm -rf optimized
	node optimize.js

deploy:
	./check_and_deploy.sh

node_modules: package.json
	npm install

.PHONY: build
