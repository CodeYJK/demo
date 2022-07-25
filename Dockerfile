FROM maven:3.6.3

WORKDIR /code
COPY pom.xml /code/pom.xml
RUN mvn --batch-mode dependency:resolve
RUN mvn --batch-mode verify

COPY ["src/main", "/code/src/main"]
RUN mvn --batch-mode package

FROM openjdk:8-jre-alpine
COPY --from=builder /code/target/demo-0.0.1-SNAPSHOT.jar /app/compose/services/app/demo-0.0.1-SNAPSHOT.jar

CMD ["java", "-XX:+UnlockExperimentalVMOptions", "-XX:+UseCGroupMemoryLimitForHeap", "-jar", "/app/compose/services/app/demo-0.0.1-SNAPSHOT.jar"]