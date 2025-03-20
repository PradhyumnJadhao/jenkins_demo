pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/PradhyumnJadhao/jenkins_demo.git'
            }
        }

        stage('Setup Environment') {
            steps {
                sh '''
                #!/bin/bash
                if ! command -v python3 &> /dev/null
                then
                    echo "Python3 not found! Installing..."
                    apt-get update && apt-get install -y python3 python3-venv python3-pip
                fi
                python3 -m venv venv
                . venv/bin/activate
                pip install --upgrade pip
                pip install -r requirements.txt
                '''
            }
        }

        stage('Run Tests') {
            steps {
                sh '''
                . venv/bin/activate
                pytest
                '''
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying Application...'
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
