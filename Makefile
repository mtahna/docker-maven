# Set jdk and maven version.
vendor  := oracle
jdk_ver := jdk8
mvn_ver := 3.6.3


# Set Argument.
src := .
cmd := mvn package


# Variables used internally.
DOCKER_IMAGE  := maven:$(mvn_ver)-$(vendor)-$(jdk_ver)
MOUNT_SRC_DIR := $(shell readlink -f $(src))
MOUNT_DST_DIR := /home/project
WORK_DIR      := $(MOUNT_DST_DIR)
EXEC_COMMAND  := $(cmd)


build: 
	docker build ./ -t $(DOCKER_IMAGE) --build-arg MVN_VER=$(mvn_ver) -f Dockerfile.$(vendor).$(jdk_ver)

run: 
	docker run -it --rm -v $(MOUNT_SRC_DIR):$(MOUNT_DST_DIR) -w $(WORK_DIR) $(DOCKER_IMAGE) $(EXEC_COMMAND)

help:
	@echo "Do the following when creating an docker image."
	@echo "% make build"
	@echo ""
	@echo "Do the following when executing Maven build."
	@echo "% make run src=[Target Source] cmd=[Target Command]" 

