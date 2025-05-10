FROM openjdk:24-slim

USER root

# Install required system tools
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    unzip \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Set Gradle version
ENV GRADLE_VERSION=8.14
ENV GRADLE_HOME=/opt/gradle/gradle-${GRADLE_VERSION}
ENV PATH="${GRADLE_HOME}/bin:${PATH}"

# Install Gradle manually
RUN wget https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip \
    && unzip gradle-${GRADLE_VERSION}-bin.zip -d /opt/gradle \
    && rm gradle-${GRADLE_VERSION}-bin.zip

# Verify installations
RUN java -version && gradle -v

# Set working directory
WORKDIR /app

# Default entrypoint (optional)
ENTRYPOINT ["/bin/bash"]
