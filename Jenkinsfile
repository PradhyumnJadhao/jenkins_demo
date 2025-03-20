pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/PradhyumnJadhao/jenkins_demo.git'
            }
        }
        
        stage('Setup Environment') {
            steps {
                sh '''
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
                    pytest StudentProject/app1/ StudentProject/app2/ --rootdir=.

                '''
            }
        }
    }
}
