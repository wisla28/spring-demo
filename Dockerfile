FROM openjdk:24-slim

USER root

# Install required tools
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    wget \
    && apt-get clean

# Install Gradle manually
ENV GRADLE_VERSION=8.6
RUN wget https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip \
    && unzip gradle-${GRADLE_VERSION}-bin.zip \
    && mv gradle-${GRADLE_VERSION} /opt/gradle \
    && ln -s /opt/gradle/bin/gradle /usr/bin/gradle \
    && rm gradle-${GRADLE_VERSION}-bin.zip

# Show versions
RUN java -version && gradle -v

# Default entrypoint
ENTRYPOINT []
