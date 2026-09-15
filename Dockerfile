FROM jenkins/jenkins:lts-jdk21

USER root

# Install Docker CLI so Jenkins pipelines can communicate
# with the separate Docker-in-Docker daemon.
RUN apt-get update && \
    apt-get install -y docker.io && \
    rm -rf /var/lib/apt/lists/*

# Pipeline execution should not normally run as root.
USER jenkins
