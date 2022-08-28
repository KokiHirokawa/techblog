PUBLISH_CLI_PATH := ./.build/release/publish-cli

.PHONY: setup
setup:
	$(MAKE) build-publish-cli

.PHONY: build-publish-cli
build-publish-cli:
	swift build -c release --product publish-cli

.PHONY: generate
generate:
	${PUBLISH_CLI_PATH} generate