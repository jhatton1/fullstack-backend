# Build Stage
FROM maven:3.9.6-eclipse-temurin-21 AS build
WORKDIR /Fullstack-Backend
COPY pom.xml .
RUN mvn dependency:go-offline
COPY . .
RUN mvn package -DskipTests

# Runtime Stage
FROM openjdk:17-jdk-slim
WORKDIR /Fullstack-Backend
COPY --from=build /Fullstack-Backend/target/fullstack-backend-0.0.1-SNAPSHOT.jar .
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "fullstack-backend-0.0.1-SNAPSHOT.jar"]