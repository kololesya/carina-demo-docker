FROM openjdk:11-jdk-slim
RUN apt-get update && \
    apt-get install -y maven && \
    rm -rf /var/lib/apt/lists/*
WORKDIR /opt/carina-demo
COPY . /opt/carina-demo
RUN mvn clean verify -DskipTests
ENTRYPOINT ["mvn", "test", "-q"]
