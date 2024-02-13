# Build Stage
FROM maven:3.9.6-openjdk-21 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline
COPY . .
RUN mvn package -DskipTests

# Runtime Stage
FROM openjdk:21-jdk-slim
WORKDIR /app
COPY --from=build /app/target/fullstack-backend-0.01-SNAPSHOT.jar fullstack-backend.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "fullstack-backend.jar"]
