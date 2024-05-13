FROM openjdk:8
VOLUME /docker/file
ADD collect.jar collect.jar
ENTRYPOINT ["java", "-jar", "-Xmx256m", "-Xms256m", "/collect.jar"]