# Use an official Jenkins agent base image with JDK installed
FROM jenkins/inbound-agent:jdk11

# Switch to root to install software and manage permissions
USER root

# Installing Maven, awscli and procps for ps command 
RUN apt-get update && \
    apt-get install -y maven procps awscli && \
    apt-get clean

# Installing Helm
RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Copying the startup script so that jenkins runs even without a master and changing permissions
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Switching back to Jenkins user for security reasons
USER jenkins

# Setting the working directory
WORKDIR /home/jenkins/agent

# Setting the entrypoint to run the script
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

