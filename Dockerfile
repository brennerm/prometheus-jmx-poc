FROM openjdk:11 as build
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .
COPY src src
RUN ./mvnw package

FROM openjdk:11-jre
COPY --from=build /target/prometheus-jmx-poc-0.0.1-SNAPSHOT.jar prometheus-jmx-poc.jar
COPY javaagent-config.yaml .
ADD https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.14.0/jmx_prometheus_javaagent-0.14.0.jar jmx_prometheus_javaagent.jar
ENTRYPOINT java -javaagent:jmx_prometheus_javaagent.jar=8081:javaagent-config.yaml -jar prometheus-jmx-poc.jar