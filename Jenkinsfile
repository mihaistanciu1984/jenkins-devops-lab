pipeline {
    agent any

    stages {
        stage('Start') {
            steps {
                echo 'Jenkins a pornit pipeline-ul.'
            }
        }

        stage('Informatii despre build') {
            steps {
                echo "Job: ${env.JOB_NAME}"
                echo "Build: ${env.BUILD_NUMBER}"
            }
        }

        stage('Build Docker image') {
            steps {
                sh 'docker build -t jenkins-devops-lab:${BUILD_NUMBER} .'
            }
        }

        stage('Verify Docker image') {
            steps {
                sh 'docker image inspect jenkins-devops-lab:${BUILD_NUMBER} > /dev/null'
                echo 'Imaginea Docker a fost construita si verificata.'
            }
        }
    }
}