.DEFAULT_GOAL := build

REGISTRY 			:= ghcr.io/trsenna/kingsmarch
IMAGE_FOUNDATION    := foundation
IMAGE_BASELINE    	:= baseline

.PHONY: build-foundation ensure-foundation \
	build-baseline build build-all prune prune-all

# ---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---
#       LOREM IPSUM
#       Suspendisse sodales ipsum non justo imperdiet cursus.
# ---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---

build-foundation:
	@echo "Building $(IMAGE_FOUNDATION) image..."
	devcontainer build --workspace-folder images/$(IMAGE_FOUNDATION) --image-name $(REGISTRY)/$(IMAGE_FOUNDATION)

# ensure-foundation:
# 	@docker image inspect $(REGISTRY)/$(IMAGE_FOUNDATION) >/dev/null 2>&1 \
# 		|| $(MAKE) --no-print-directory build-foundation

# build-baseline: ensure-foundation
# 	@echo "Building $(IMAGE_BASELINE) image..."
# 	devcontainer build --workspace-folder images/$(IMAGE_BASELINE) --image-name $(REGISTRY)/$(IMAGE_BASELINE)

# ---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---
#       LOREM IPSUM
#       Suspendisse sodales ipsum non justo imperdiet cursus.
# ---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---~---

build:
	build-foundation
# build-all: build-foundation build-baseline

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
