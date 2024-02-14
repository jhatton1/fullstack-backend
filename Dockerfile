# Build Stage
FROM maven:3.9.6-eclipse-temurin-21 AS build
WORKDIR /Fullstack-Backend
COPY pom.xml .
RUN mvn dependency:go-offline
COPY . .
RUN mvn package -DskipTests

# Runtime Stage
FROM adoptopenjdk:11-jdk-hotspot
WORKDIR /Fullstack-Backend
COPY --from=build /Fullstack-Backend/target/fullstack-backend-0.0.1-SNAPSHOT.jar fullstack-backend.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "fullstack-backend.jar"]

