FROM openjdk:11
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} todo-app.jar
ENTRYPOINT ["java", "-jar", "/todo-app.jar"]
EXPOSE 9999