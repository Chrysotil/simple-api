pipeline {
    agent any

    environment {
        IMAGE_NAME = "zebercet/simple-api"
        DOCKER_CREDENTIALS_ID = "docker-hub-creds"
    }

    stages {
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
            sh 'rm -f ~/.docker/config.json || true'
        }
    }
}
