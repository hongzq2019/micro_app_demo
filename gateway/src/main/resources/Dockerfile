FROM openjdk:8
VOLUME /docker/file
ADD appGateway.jar appGateway.jar
ENTRYPOINT ["java", "-jar", "-Xmx256m", "-Xms256m", "/appGateway.jar"]