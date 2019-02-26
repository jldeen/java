FROM openjdk:10-jre-slim
ENV PORT 4567
EXPOSE 4567
COPY target/*.jar .

CMD ["/bin/bash", "-c", "find -type f -name '*-with-dependencies.jar' | xargs java -jar"]
