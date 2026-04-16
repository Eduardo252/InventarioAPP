# ================================================
# Stage 1: Build
# ================================================
FROM maven:3.9-eclipse-temurin-20 AS build

WORKDIR /app

COPY inventarios-spring/ .

RUN mvn clean package -DskipTests

# ================================================
# Stage 2: Runtime
# ================================================
FROM eclipse-temurin:20-jre

WORKDIR /app

COPY --from=build /app/target/inventarios-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
