#!/bin/bash

# Check if required environment variables are set
if [ -z "$JENKINS_URL" ] || [ -z "$JENKINS_SECRET" ] || [ -z "$JENKINS_AGENT_NAME" ]; then
  echo "Running in standalone mode, no Jenkins master connection."

  # Run an infinite loop to keep the container alive
  while true; do
    sleep 1000
  done
else
  # Run the Jenkins agent with provided environment variables
  java -jar /usr/share/jenkins/agent.jar -jnlpUrl ${JENKINS_URL}/computer/${JENKINS_AGENT_NAME}/slave-agent.jnlp -secret ${JENKINS_SECRET} -workDir ${JENKINS_AGENT_WORKDIR}
fi

