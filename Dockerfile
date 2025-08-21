FROM eclipse-temurin:21
RUN mkdir /opt/app
COPY target/quarkus-app /opt/app
CMD ["java", "-jar", "/opt/app/quarkus-run.jar"]


