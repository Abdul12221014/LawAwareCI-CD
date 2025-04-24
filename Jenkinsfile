pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-creds') // Jenkins Credential ID
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/abhishek12221732/law-aware-cicd'
            }
        }

        stage('Build Backend Docker Image') {
            steps {
                dir('.') {
                    script {
                        docker.build("law-backend", "-f Dockerfile .")
                    }
                }
            }
        }

        stage('Build Frontend Docker Image') {
            steps {
                dir('frontend') {
                    script {
                        docker.build("law-frontend", "-f Dockerfile .")
                    }
                }
            }
        }

        stage('Run Tests') {
            steps {
                echo '🧪 Add unit tests here (Node.js/React)'
            }
        }

        stage('Push to DockerHub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-creds') {
                        docker.image('law-backend').push('latest')
                        docker.image('law-frontend').push('latest')
                    }
                }
            }
        }

        stage('Cleanup') {
            steps {
                cleanWs()
            }
        }
    }
}
