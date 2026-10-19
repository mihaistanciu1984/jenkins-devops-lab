pipeline {
    agent any

    stages {
        stage('Start') {
            steps {
                echo 'Jenkins a pornit primul meu pipeline.'
            }
        }

        stage('Informatii despre build') {
            steps {
                echo "Job: ${env.JOB_NAME}"
                echo "Build: ${env.BUILD_NUMBER}"
            }
        }

        stage('Final') {
            steps {
                echo 'Pipeline-ul s-a terminat cu succes.'
            }
        }
    }
}