.PHONY: build publish quick
include .env
build: 		mkdocs.yml docs/
	$(MKDOCS) build -q 2>/dev/null
quick:		mkdocs.yml docs/
	$(MKDOCS) build --dirty
publish: 	mkdocs.yml docs/
	$(MKDOCS) build -q 2>/dev/null
	$(MKDOCS) gh-deploy 
