# Set jdk and maven version.
mvn_ver  := 3.6.3
ostype   := centos7
javatype := oracle
jdk_ver  := jdk8


# Set Argument.
src := .
cmd := mvn --version


# Variables used internally.
DOCKER_IMAGE   := maven:$(mvn_ver)-$(ostype)-$(javatype)-$(jdk_ver)
MOUNT_HOST_DIR := $(shell readlink -f $(src))
MOUNT_CONT_DIR := /home/project
WORK_DIR       := $(MOUNT_CONT_DIR)
EXEC_COMMAND   := $(cmd)


build: 
	docker build ./ -t $(DOCKER_IMAGE) --build-arg MVN_VER=$(mvn_ver) -f Dockerfile.$(ostype).$(javatype).$(jdk_ver)

run: 
	docker run -it --rm -v $(MOUNT_HOST_DIR):$(MOUNT_CONT_DIR) -w $(WORK_DIR) $(DOCKER_IMAGE) $(EXEC_COMMAND)

help:
	@echo "Do the following when creating an docker image."
	@echo "% make build"
	@echo ""
	@echo "Do the following when executing Maven build."
	@echo "% make run src=[Target Source] cmd=[Target Command]" 

