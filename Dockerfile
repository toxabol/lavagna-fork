FROM maven:3.5.0-jdk-8-alpine AS builder
WORKDIR /app
#ADD ./pom.xml pom.xml
#ADD ./src src/
COPY . .
RUN mvn clean install

FROM openjdk:8-jre-alpine
COPY --from=builder /app/target/lavagna-jetty-console.war lavagna-jetty-console.war
EXPOSE 8080
ENTRYPOINT ["java", "-jar","lavagna-jetty-console.war"]
