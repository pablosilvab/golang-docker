APP_NAME = demo-golang-docker
APP_VERSION = 0.0.1.SNAPSHOT
USER_HUB = pablon27

helm-purge:
	helm delete --purge demo-golang-docker

helm-upgrade:
	helm upgrade --install demo-golang-docker ./charts/

helm-release:
	helm delete demo-golang-docker && helm install --replace --name demo-golang-docker ./charts/

helm-reinstall:
	helm install --replace --name demo-golang-docker ./charts 

helm-install:
	helm install --name demo-golang-docker ./charts/

docker-push:
	docker build -t ${USER_HUB}/${APP_NAME}:${APP_VERSION} .
	docker push ${USER_HUB}/${APP_NAME}:${APP_VERSION}

docker-build: 
	docker build -t ${USER_HUB}/${APP_NAME}:${APP_VERSION} .

docker-run:
	docker run -p 8080:8080 ${USER_HUB}/${APP_NAME}:${APP_VERSION}

go-run:
	go run cmd/main.go

go-build:
	go build -o ./build/${APP_NAME} ./cmd/main.go

go-shell:
	./build/${APP_NAME}
