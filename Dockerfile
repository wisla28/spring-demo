FROM eclipse-temurin:21-jdk-alpine

ENV GRADLE_VERSION=8.14 \
    GRADLE_HOME=/opt/gradle \
    PATH=$PATH:/opt/gradle/bin

RUN apk add --no-cache \
    bash \
    git \
    unzip \
    wget \
    libstdc++


RUN wget -q https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -O /tmp/gradle.zip && \
    unzip -qd /opt /tmp/gradle.zip && \
    ln -s /opt/gradle-${GRADLE_VERSION} ${GRADLE_HOME} && \
    rm /tmp/gradle.zip

RUN addgroup -S spring && \
    adduser -S spring -G spring && \
    mkdir -p /app && \
    chown spring:spring /app

USER spring:spring
WORKDIR /app

RUN java -version && gradle -v

ENTRYPOINT ["/bin/sh", "-c"]