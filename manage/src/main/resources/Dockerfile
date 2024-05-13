FROM openjdk:8
VOLUME /docker/file
ADD manage.jar manage.jar
ENTRYPOINT ["java", "-jar", "-Xmx256m", "-Xms256m", "/manage.jar"]