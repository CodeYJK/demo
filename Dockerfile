FROM jdk:1.8.0_191

ENV LOG_HOME=/logs/rent
ENV LOG_LEVEL=INFO
ENV CONFIG_NAME=demo
ENV APP_NAME=demo-0.0.1-SNAPSHOT
ENV APPLICATION_NAME=demo
ENV SEATA_ENV=prod
WORKDIR /tmp
COPY ./target/demo-0.0.1-SNAPSHOT.jar /app/demo-0.0.1-SNAPSHOT.jar

# 以下兼顾 变量替换 以及 java pid=1
ENTRYPOINT exec java -Xms256m -Xmx512m -Dfile.encoding=utf-8 -jar /app/$APP_NAME.jar  --logback.log-home=$LOG_HOME --logback.log-file=zulin-$CONFIG_NAME

