pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'lawaware-app'
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/your-username/law-aware.git'
            }
        }

        stage('Build & Test') {
            steps {
                sh 'docker-compose -f docker-compose.yml up --build -d'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('SonarQube') {
                    sh 'sonar-scanner'
                }
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker-compose down'
                sh 'docker-compose up -d'
            }
        }
    }
}
