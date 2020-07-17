NS = joergklein
REPO = texlive
NAME = texlive
VERSION = latest
VOLUMES = -v $PWD:/data

.PHONY: pull build shell run start stop rm

pull:
	docker pull $(NS)/${REPO}:${VERSION}

build:
	docker build -t $(NS)/$(REPO):${VERSION} .

shell:
	docker run --rm --name $(NAME) -i -t $(PORTS) $(VOLUMES) $(ENV) $(NS)/$(REPO):${VERSION} /bin/bash

run:
	docker run --rm --name $(NAME) $(PORTS) $(VOLUMES) $(ENV) $(NS)/$(REPO):${VERSION}

start:
	docker run -d --name $(NAME) $(PORTS) $(VOLUMES) $(ENV) $(NS)/$(REPO):${VERSION}

stop:
	docker stop $(NAME)

rm:
	docker rm $(NAME)

default: pull
