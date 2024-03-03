pipeline {
    agent any

    stages {
        stage('Prepare') {
            steps {
                echo "Prepare Build Environment"
                script {
                    // Docker 설치
                    sh 'apt-get update && apt-get install -y docker.io'
                    // 이미 존재하는 디렉토리인지 확인 후 git clone
                    dir('CICD') {
                        if (!fileExists('.git')) {
                            sh 'git clone https://github.com/LIMDANBI/CICD.git .'
                        } else {
                            echo "CICD directory already exists and is not empty"
                        }
                    }
                }
            }
        }

        stage('Build') {
            steps {
                echo "Start Docker daily build"
                sh 'docker run --rm --name buildpractice -i practice:1.0 ./build_docker.sh'
            }
        }

        stage('Clean up') {
            steps {
                echo "Remove Docker resources"
                sh '''#!bin/bash
                    if [ -n "`docker images|grep -o practice`" ]; then
                        docker rmi -f practice:1.0
                    fi
                '''
                sh 'rm -rf CICD'
            }
        }
    }

    post {
        success {
            echo "Build success"
        }
        failure {
            echo "Build failure"
        }
        always {
            echo "Complete Build"
        }
    }
}
