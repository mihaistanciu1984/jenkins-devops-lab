
@Library('devops-shared') _
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

        stage('Parallel validation') {
            parallel {
                stage('Inspect image') {
                    steps {
                        sh 'docker image inspect jenkins-devops-lab:${BUILD_NUMBER} > /dev/null'
                        echo 'Imaginea exista.'
                    }
                }

                stage('Check HTML in image') {
                    steps {
                        sh 'docker run --rm --entrypoint cat jenkins-devops-lab:${BUILD_NUMBER} /usr/share/nginx/html/index.html | grep -q "Jenkins Docker Lab"'
                        echo 'Fisierul HTML este inclus in imagine.'
                    }
                }
            }
        }

        stage('Matrix build and test') {
            matrix {
                axes {
                    axis {
                        name 'NGINX_TAG'
                        values 'alpine', 'stable-alpine'
                    }
                }

                stages {
                    stage('Build image variant') {
                        steps {
                            sh 'docker build --build-arg NGINX_TAG=${NGINX_TAG} -t jenkins-devops-lab:${NGINX_TAG}-${BUILD_NUMBER} .'
                        }
                    }
                  
                    }
                    stage('Check HTML') {
                        steps {
                            sh 'docker run --rm --entrypoint cat jenkins-devops-lab:${NGINX_TAG}-${BUILD_NUMBER} /usr/share/nginx/html/index.html | grep -q "Jenkins Docker Lab"'
                        }
                    }
                    stage('Shared Library') {
                        steps {
                            sayHello('jenkins-devops-lab')
                       }
                }
            }
        }
    }
}