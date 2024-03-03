pipeline{
    agent any

    stages{
        stage('Prepare'){
            steps{
                echo "Prepare Build Environment"
                sh 'sudo wget -qO- http://get.docker.com/ | sh'
                sh 'git clone https://github.com/LIMDANBI/CICD.git'
                sh 'cd CICD'
                sh 'pwd'
                sh 'docker build -t practice:1.0 .'
                // sh 'mkdir resources'
                // dir('resources') {
                //     git branch: 'main', credentialsId: 'LIMDANBI', url: 'https://github.com/LIMDANBI/CICD.git'
                //     sh 'pwd'
                //     sh 'docker build -t practice:1.0 .'
                // }
            }
        }

        stage('Build'){
            steps{
                echo "Start Docker daily build"
                sh 'docker run --rm --name buildpractice -i practice:1.0 ./build_docker.sh'
            }
        }

        stage('Clean up'){
            steps{
                echo "Remove Docker resources"
                sh '''#!bin/bash
                    if [ -n "`docker images|grep -o practice`" ]; then
                        docker rmi -f practice:1.0
                    fi     
                '''
                sh 'rm -rf resources'
            }
        }
    }

    post{
        success{
            echo "Build success"
        }
        failure{
            echo "Build failure"
        }
        always{
            echo "Complete Build"
        }
    }
}