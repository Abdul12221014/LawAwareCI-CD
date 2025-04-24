pipeline {
  agent any

  stages {
    stage('Checkout') {
      steps {
        git 'https://github.com/abhishek12221732/law-aware-cicd' // or use credentials
      }
    }

    stage('Build Docker Images') {
      steps {
        sh 'docker-compose build'
      }
    }

    stage('Run Tests') {
      steps {
        sh 'docker-compose up -d'
        sh 'sleep 10'
        // Optional: run integration tests here
      }
    }

    stage('Cleanup') {
      steps {
        sh 'docker-compose down'
      }
    }
  }
}
