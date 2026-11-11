.DEFAULT_GOAL := build

REGISTRY			:= ghcr.io/trsenna/kingsmarch
TAG					?= latest

IMAGE_FOUNDATION	:= foundation
IMAGE_BASELINE		:= baseline
IMAGE_ATELIER		:= atelier
IMAGE_UNIVERSAL		:= universal

.PHONY: build \
	build-foundation build-baseline \
	build-atelier build-universal \
	prune prune-all

# ---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---
#       LOREM IPSUM
#       Suspendisse sodales ipsum non justo imperdiet cursus.
# ---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---

build-foundation:
	@echo "Building $(IMAGE_FOUNDATION) image..."
	devcontainer build --workspace-folder src/$(IMAGE_FOUNDATION) --image-name $(REGISTRY)/$(IMAGE_FOUNDATION):$(TAG)

ensure-foundation:
	@docker image inspect $(REGISTRY)/$(IMAGE_FOUNDATION) >/dev/null 2>&1 \
		|| $(MAKE) --no-print-directory build-foundation

# ---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---
#       LOREM IPSUM
#       Suspendisse sodales ipsum non justo imperdiet cursus.
# ---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---

build-baseline: ensure-foundation
	@echo "Building $(IMAGE_BASELINE) image..."
	devcontainer build --workspace-folder src/$(IMAGE_BASELINE) --image-name $(REGISTRY)/$(IMAGE_BASELINE):$(TAG)

ensure-baseline:
	@docker image inspect $(REGISTRY)/$(IMAGE_FOUNDATION) >/dev/null 2>&1 \
		|| $(MAKE) --no-print-directory build-baseline

# ---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---
#       LOREM IPSUM
#       Suspendisse sodales ipsum non justo imperdiet cursus.
# ---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---

build-atelier: ensure-baseline
	@echo "Building $(IMAGE_ATELIER) image..."
	devcontainer build --workspace-folder src/$(IMAGE_ATELIER) --image-name $(REGISTRY)/$(IMAGE_ATELIER):$(TAG)

build-universal: ensure-baseline
	@echo "Building $(IMAGE_UNIVERSAL) image..."
	devcontainer build --workspace-folder src/$(IMAGE_UNIVERSAL) --image-name $(REGISTRY)/$(IMAGE_UNIVERSAL):$(TAG)

# ---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---
#       LOREM IPSUM
#       Suspendisse sodales ipsum non justo imperdiet cursus.
# ---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---

build: build-foundation build-baseline build-atelier build-universal
	@echo "All images built successfully!"
