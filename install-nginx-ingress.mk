# Устанавливаем внешний (не встроенный) ingress-nginx контроллер для внешних запросов.
all:
	kubectl create namespace kuber-crud-app-space || true
	helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx || true
	helm repo update
	helm install nginx ingress-nginx/ingress-nginx --namespace kuber-crud-app-space --create-namespace -f manifests/nginx-ingress.yaml
