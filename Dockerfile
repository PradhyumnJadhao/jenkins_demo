# Use official Jenkins LTS image
FROM jenkins/jenkins:lts

# Switch to root user to install dependencies
USER root

# Install Python and virtual environment
RUN apt-get update && apt-get install -y python3 python3-venv python3-pip

# Switch back to Jenkins user
USER jenkins

# Expose ports for Jenkins
EXPOSE 8080 50000

# Start Jenkins
CMD ["/usr/local/bin/jenkins.sh"]
