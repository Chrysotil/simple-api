pipeline {
    agent any

    environment {
        IMAGE_NAME = "zebercet/simple-api"
        DOCKER_CREDENTIALS_ID = "docker-hub-creds"  // Jenkins'te tanımladığın Docker Hub Credentials ID
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
                        docker.image("${IMAGE_NAME}").push()
                    }
                }
            }
        }
    }

    post {
        always {
            // Güvenlik açısından config.json dosyasını sil
            sh 'rm -f ~/.docker/config.json || true'
        }
    }
}
