pipeline {
    agent any

    environment {
        IMAGE_NAME = "chrysotil/simple-api"
        DOCKER_CREDENTIALS_ID = "docker-hub-creds"  // Jenkins'te tanımlanacak
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Chrysotil/simple-api.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}")
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', "${DOCKER_CREDENTIALS_ID}") {
                        docker.image("${IMAGE_NAME}").push("latest")
                    }
                }
            }
        }
    }

    post {
        success {
            echo '✅ Build & push işlemi tamamlandı.'
        }
        failure {
            echo '❌ Build başarısız oldu.'
        }
    }
}
