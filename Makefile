DIREKTIV_HOST ?= localhost:9191

.PHONY: delete-docker
delete-docker:
	docker stop test || true
	docker wait test || true
	docker rm test || true

.PHONY: tests-api
tests-api: delete-docker
	docker build -t test .
	docker run -p 9191:9191 --name test -d test
	docker run -it --rm \
	-v `pwd`/tests:/tests \
	-e 'DIREKTIV_HOST=http://${DIREKTIV_HOST}' \
	-e 'NODE_TLS_REJECT_UNAUTHORIZED=0' \
	--network=host \
	node:lts-alpine3.18 npm --prefix "/tests" run jest -- ${JEST_PREFIX} --runInBand --json --testLocationInResults
	$(MAKE) delete-docker
