# Build Stage
FROM maven:3.8.5-openjdk-17 AS build
COPY . .
RUN mvn package -DskipTests

# Runtime Stage
FROM openjdk:17.0.1-jdk-slim
COPY --from=build /target/fullstack-backend-0.0.1-SNAPSHOT.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "fullstack-backend.jar"]
