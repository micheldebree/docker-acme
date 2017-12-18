VERSION=0.96.2
IMAGE=micheldebree/acme:$(VERSION)

build: dockerimage
	echo "#!/bin/bash" > acme.sh
	echo "docker run -it --rm -v \"\$$PWD\":/root $(IMAGE) \$$1 \$$2 \$$3 \$$4 \$$5 \$$6 \$$7 \$$8 \$$9" >> acme.sh
	chmod +x acme.sh

run: dockerimage
	docker run -it --rm $(IMAGE) -V

dockerimage: Dockerfile
	docker build -t $(IMAGE) .

debug: dockerimage
	docker run -it --rm --entrypoint /bin/sh $(IMAGE)
	
