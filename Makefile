NAME_CI:=environment-chefdk-ci
NAME_DESKTOP:=environment-chefdk-desktop

BUILD_CHEF_DK_CI=docker build -f Dockerfile.ci --no-cache --build-arg CHEFDK_VERSION=$(CHEFDK_VERSION) --build-arg DEBIAN_VERSION=$(DEBIAN_VERSION) -t $(NAME_CI):$(CHEFDK_VERSION) .
BUILD_CHEF_DK_DESKTOP=docker build -f Dockerfile.desktop --no-cache --build-arg CHEFDK_VERSION=$(CHEFDK_VERSION) --build-arg DEBIAN_VERSION=$(DEBIAN_VERSION) -t $(NAME_DESKTOP):$(CHEFDK_VERSION) .

#Chef14
3.5.13: CHEFDK_VERSION=3.5.13
3.5.13: DEBIAN_VERSION=9
3.5.13: chef
	
#Chef12
1.3.40: CHEFDK_VERSION=1.3.40
1.3.40: DEBIAN_VERSION=8
1.3.40: chef
	
chef:
	$(BUILD_CHEF_DK_CI)
	$(BUILD_CHEF_DK_DESKTOP)