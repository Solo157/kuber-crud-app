.PHONY: all

clean:
	mvn clean package -DskipTests

docker-build: clean
	docker build -t kuber-crud-app:latest .

all: docker-build
