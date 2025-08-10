.PHONY: all clean-minikube-docker clean-minikube

clean-minikube-docker:
	eval $$(minikube docker-env) && \
	docker ps -a --filter ancestor=kuber-crud-app:latest -q | xargs -r docker rm -f && \
	docker rmi kuber-crud-app:latest --force && \
	eval $$(minikube docker-env -u)

clean-minikube:
	helm uninstall nginx --namespace kuber-crud-app-space || true && \
	helm uninstall kuber-crud-app-space --namespace kuber-crud-app-space --ignore-not-found || true

all: clean-minikube-docker clean-minikube
