FROM jenkins/jenkins:lts

USER root

# 🐳 Install Docker CLI and Docker Compose
RUN apt-get update && \
    apt-get install -y docker.io curl && \
    curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \
    groupadd -f docker && \
    usermod -aG docker jenkins

# ✅ Create docker group if not already created (avoid error if it already exists)
RUN groupadd docker || true

# 🔐 Add Jenkins user to docker group
RUN usermod -aG docker jenkins

USER jenkins
