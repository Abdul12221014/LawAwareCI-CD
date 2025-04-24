pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'lawaware-app'
    }

    stages {
        stage('Checkout') {
            steps {
                echo '🔄 Cloning repository...'
                git 'https://github.com/abhishek12221732/law-aware-cicd.git'
            }
        }

        stage('Build & Run Containers') {
            steps {
                echo '🚀 Building and starting containers...'
                sh 'docker-compose -f docker-compose.yml up --build -d'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                echo '🔍 Running SonarQube analysis...'
                withSonarQubeEnv('SonarQube') {
                    sh 'sonar-scanner'
                }
            }
        }

        stage('Restart Containers for Deployment') {
            steps {
                echo '♻️ Restarting containers for deployment...'
                sh 'docker-compose down'
                sh 'docker-compose up -d'
            }
        }

        stage('Cleanup (Optional)') {
            steps {
                echo '🧹 Cleaning up old Docker images...'
                sh 'docker image prune -f'
            }
        }
    }
}
