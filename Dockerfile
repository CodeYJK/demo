FROM maven:3.6.3

WORKDIR /code
COPY pom.xml /code/pom.xml
RUN mvn --batch-mode dependency:resolve
RUN mvn --batch-mode verify

# Adding source, compile and package into a fat jar
COPY ["src/main", "/code/src/main"]
RUN mvn --batch-mode package

FROM jdk:1.8.0_191

COPY --from=build /code/target/demo-0.0.1-SNAPSHOT.jar /demo-0.0.1-SNAPSHOT.jar

CMD ["java", "-XX:+UnlockExperimentalVMOptions", "-XX:+UseCGroupMemoryLimitForHeap", "-jar", "/demo-0.0.1-SNAPSHOT.jar"]