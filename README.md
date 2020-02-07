# hello-k8s-world

## minikube

```
minikube start
kubectl create secret docker-registry regcred \
  --docker-server=https://gcr.io \
  --docker-username=_json_key \
  --docker-email=$SERVICE_ACCOUNT_EMAIL \
  --docker-password="$(cat $SERVICE_ACCOUNT_KEY.json)"
kubectl apply k8s.json
```

## kustomize

### build

```
kustomize build kustomize/overlay/staging
kustomize build kustomize/overlay/production
```

### build & apply

```
kustomize build kustomize/overlay/staging | kubectl apply -f -
kustomize build kustomize/overlay/production | kubectl apply -f -
```
