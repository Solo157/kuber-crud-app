FROM openjdk:21-jdk-slim-bullseye
WORKDIR /app
COPY /target/kuber-crud-app-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8000
ENTRYPOINT ["java", "-jar", "app.jar", "--server.port=8000"]
