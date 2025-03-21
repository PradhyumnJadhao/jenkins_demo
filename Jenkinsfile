pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'pradhyumnjadhao/jenkins_demo'  
        DOCKER_CREDENTIALS = 'docker-hub-credentials'  
    }

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/PradhyumnJadhao/jenkins_demo.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                    docker build -t $DOCKER_IMAGE:latest .
                '''
            }
        }

        stage('Login to Docker Hub') {
            steps {
                withCredentials([string(credentialsId: 'docker-hub-credentials', variable: 'DOCKER_PASSWORD')]) {
                    sh '''
                        echo $DOCKER_PASSWORD | docker login -u pradhyumnjadhao --password-stdin
                    '''
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                sh '''
                    docker push $DOCKER_IMAGE:latest
                '''
            }
        }
    }
}