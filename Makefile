IMAGE  = gcr.io/$(PROJECT)/hello-k8s-world
VERSION=latest

docker/build:
	docker build -t $(IMAGE):$(VERSION) --build-arg version=$(VERSION) .

docker/run:
	docker run --rm -i -t -p 8080:8080 $(IMAGE):$(VERSION)

docker/push:
	docker push $(IMAGE):$(VERSION)
