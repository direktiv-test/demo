.PHONY: tests-lint 
tests-lint: VERSION="v2.1"
tests-lint: ## Runs very strict linting on the project.
	docker run \
	--rm \
	--tty \
	-v `pwd`:/app \
	-w /app \
	-v /tmp/golangci:/root/.cache:rw \
	-e GOCACHE=/root/.cache/  \
	-e GOLANGCI_LINT_CACHE=/root/.cache/ \
	-e GOMODCACHE=/root/.cache/go/pkg/mod  \
	golangci/golangci-lint:${VERSION} golangci-lint run --verbose --config /app/.golangci.yaml