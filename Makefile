.PHONY: build
TAG ?= 0.20.1
build:
	docker build --build-arg HUGO_VERSION=$(TAG) -t agilebitsinc/hugo-generator:$(TAG) .
