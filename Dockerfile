FROM maven:3.8.3-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17.0.2-jdk-slim
COPY --from=build /target/RoleBasedAuthentication-0.0.1-SNAPSHOT.jar RoleBasedAuthentication.jar
EXPOSE 8085
ENTRYPOINT ["java","-jar","RoleBasedAuthentication.jar"]