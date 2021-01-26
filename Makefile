#Dockerfile vars
alpver=3.13
digver=2.0.24

#vars
IMAGENAME=game-status
REPO=ra3se
IMAGEFULLNAME=${REPO}/${IMAGENAME}:${digver}

.PHONY: help build push all

help:
	@echo "Makefile arguments:"
	@echo ""
	@echo "alpver - Alpine Version"
	@echo "digver - gamedig version"
	@echo ""
	@echo "Makefile commands:"
	@echo "build"
	@echo "push"
	@echo "all"

.DEFAULT_GOAL := all

build:
	@docker build --pull --build-arg ALP_VER=${alpver} --build-arg DIG_VER=${digver} -t ${IMAGEFULLNAME} .

push:
	@docker push ${IMAGEFULLNAME}

all: build push
