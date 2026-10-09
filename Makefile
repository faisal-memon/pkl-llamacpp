PKL ?= pkl
OUT ?= out
VERSION ?= 0.1.0

.PHONY: render validate package
render:
	@mkdir -p "$(OUT)"
	@$(PKL) eval -o "$(OUT)/gemma.yaml" examples/gemma.pkl

validate: render
	@$(PKL) eval examples/gemma.pkl >/dev/null
	@echo "pkl-llamacpp validation succeeded."

package:
	@PKG_VERSION="$(VERSION)" $(PKL) project package --output-path dist
