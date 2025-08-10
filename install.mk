.PHONY: all prepare-docker-minikube install-test install-prod

prepare-docker-minikube:
	-kubectl create namespace kuber-crud-app-space || true
	eval $$(minikube docker-env) && \
	docker build -t kuber-crud-app:latest . && \
	eval $$(minikube docker-env -u)

install-test: prepare-docker-minikube
	helm install kuber-crud-app-space ./mychart -f ./mychart/test-values.yaml -n kuber-crud-app-space

install-prod: prepare-docker-minikube
	helm install kuber-crud-app-space ./mychart -f ./mychart/prod-values.yaml -n kuber-crud-app-space

upgrade-test: prepare-docker-minikube
	helm uninstall kuber-crud-app-space -n kuber-crud-app-space || true
	helm install kuber-crud-app-space ./mychart -f ./mychart/test-values.yaml -n kuber-crud-app-space

upgrade-prod: prepare-docker-minikube
	helm uninstall kuber-crud-app-space -n kuber-crud-app-space || true
	helm install kuber-crud-app-space ./mychart -f ./mychart/prod-values.yaml -n kuber-crud-app-space

