FROM openjdk:11
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} todo-app.jar
ENTRYPOINT ["java", "-Djava.net.preferIPv4Stack=true", "-jar", "/todo-app.jar"]
EXPOSE 9999