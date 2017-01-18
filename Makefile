BUILD_CONTAINER_NAME := build-kalilinux
BUILD_DOCKER_IMAGE := r.j3ss.co/build-kalilinux
DOCKER_IMAGE := r.j3ss.co/kalilinux

.PHONY: all
all: image

.PHONY: build
build: clean
	@docker run --privileged -v $(CURDIR)/build.sh:/usr/bin/build.sh:ro --name $(BUILD_CONTAINER_NAME) --entrypoint build.sh r.j3ss.co/debootstrap
	@docker commit $(BUILD_CONTAINER_NAME) $(BUILD_DOCKER_IMAGE)

.PHONY: image
image: build
	@docker run --rm --disable-content-trust=true --entrypoint bash $(BUILD_DOCKER_IMAGE) -c 'tar -C kali-root -c .' | docker import - "$(DOCKER_IMAGE)"
	@echo "Build OK"

.PHONY: clean
clean:
	-@docker rm -f $(BUILD_CONTAINER_NAME) > /dev/null 2>&1
