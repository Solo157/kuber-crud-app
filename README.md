Должен быть предустановленный minikube и kubectl.

Узнать IP кубера (будет IP по котором достучимся до nginx по 80 порту):
kubectl get nodes -o wide
Изменить hosts:
sudo nano /etc/hosts
меняем на {IP_minikube} arch.homework
Для проверки работоспособности выполняем curl:
curl -H "Host: arch.homework" http://{IP_minikube}/health

Создание приложения. Сбилдить образ.
make -f build.mk
[build.mk](build.mk)

Подключаем ingress-controller.
make -f install-nginx-ingress.mk all
[install-nginx-ingress.mk](install-nginx-ingress.mk)

Запускаем приложение.
Первый раз запускаем/инсталлируем:
make -f install.mk install-test -> запуск приложения в тестовом окружении
make -f install.mk install-prod -> запуск приложения в продовом окружении
В последующие разы просто обновляем:
make -f install.mk upgrade-test - обновить приложение в тестовое окружение
make -f install.mk upgrade-prod - обновить приложение в продовое окружение
[install.mk](install.mk)

Удалить/очистить приложение в кубернетес.
[clean.mk](clean.mk)

Добавить образ в докер миникуба с правильным неймингом и тегом.
[pull-to-minikube.mk](pull-to-minikube.mk)
Установить ingress-nginx через heml (внешний, не встроенный в кубернетес)
[install-nginx-ingress.mk](install-nginx-ingress.mk)

Выполнить команду. Выполняет все манифесты для кубернетеса, создает все объекты.
kubectl apply -f manifests/

Коллекция постман для проверки:
[OTUS-collection.postman_collection.json](postman/collection/OTUS-collection.postman_collection.json)