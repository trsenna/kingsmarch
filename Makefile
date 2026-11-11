.DEFAULT_GOAL := build

REGISTRY 			:= ghcr.io/trsenna/kingsmarch
IMAGE_FOUNDATION    := foundation
IMAGE_BASELINE    	:= baseline
IMAGE_ATELIER    	:= atelier
IMAGE_UNIVERSAL    	:= universal

.PHONY: build-foundation build-baseline \
	build-atelier build-universal build prune prune-all

# ---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---
#       LOREM IPSUM
#       Suspendisse sodales ipsum non justo imperdiet cursus.
# ---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---

build-foundation:
	@echo "Building $(IMAGE_FOUNDATION) image..."
	devcontainer build --workspace-folder images/$(IMAGE_FOUNDATION) --image-name $(REGISTRY)/$(IMAGE_FOUNDATION)

build-baseline:
	@echo "Building $(IMAGE_BASELINE) image..."
	devcontainer build --workspace-folder images/$(IMAGE_BASELINE) --image-name $(REGISTRY)/$(IMAGE_BASELINE)

build-atelier:
	@echo "Building $(IMAGE_ATELIER) image..."
	devcontainer build --workspace-folder images/$(IMAGE_ATELIER) --image-name $(REGISTRY)/$(IMAGE_ATELIER)

build-universal:
	@echo "Building $(IMAGE_UNIVERSAL) image..."
	devcontainer build --workspace-folder images/$(IMAGE_UNIVERSAL) --image-name $(REGISTRY)/$(IMAGE_UNIVERSAL)

# ---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---
#       LOREM IPSUM
#       Suspendisse sodales ipsum non justo imperdiet cursus.
# ---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---

build:
	build-foundation
	build-baseline
	build-atelier
	build-universal

# ---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---
#       LOREM IPSUM
#       Suspendisse sodales ipsum non justo imperdiet cursus.
# ---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---

prune:
	@echo "Prune Workstation..."
	docker system df
	docker container prune -f
	docker image prune -f
	docker builder prune -f --filter until=168h
	docker system df

prune-all:
	@echo "Prune All Workstation..."
	docker system df
	docker container prune -f
	docker image prune -af
	docker builder prune -f
	docker system df
