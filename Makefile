# .PHONY: tests-lint 
# tests-lint: VERSION="v2.1"
# tests-lint: ## Runs very strict linting on the project.
# 	docker run \
# 	--rm \
# 	--tty \
# 	-v `pwd`:/app \
# 	-w /app \
# 	-v /tmp/golangci:/root/.cache:rw \
# 	-e GOCACHE=/root/.cache/  \
# 	-e GOLANGCI_LINT_CACHE=/root/.cache/ \
# 	-e GOMODCACHE=/root/.cache/go/pkg/mod  \
# 	golangci/golangci-lint:${VERSION} golangci-lint run --verbose --config /app/.golangci.yaml


DIREKTIV_HOST ?= localhost:9191

.PHONY: tests-api
tests-api: ## Runs end-to-end tests. DIREKTIV_HOST=128.0.0.1 make tests-api [JEST_PREFIX=/tests/namespaces]	
	docker run -it --rm \
	-v `pwd`/tests:/tests \
	-e 'DIREKTIV_HOST=http://${DIREKTIV_HOST}' \
	-e 'NODE_TLS_REJECT_UNAUTHORIZED=0' \
	--network=host \
	node:lts-alpine3.18 npm --prefix "/tests" run jest -- ${JEST_PREFIX} --runInBand