pipeline {
    agent any
    environment {
        def docker_run = 'docker run -itd --name anil -p 9000:80 dockermen31/docker_jenkins'
        def docker_rmv_container = 'docker rm -f anil'
        def docker_rmi = 'docker rmi -f dockermen31/docker_jenkins'
    }
    stages {
        stage ('git checkout') {
            steps { 
			    git 'https://github.com/Anil-Tamadaddi/docker_jenkins.git'
                }
			}
        stage ('docker build image') {
            steps { 
                sh 'docker image build -t $JOB_NAME:v1.$BUILD_ID . '
                sh 'docker image tag $JOB_NAME:v1.$BUILD_ID dockermen31/$JOB_NAME:v1.$BUILD_ID'
                sh 'docker image tag $JOB_NAME:v1.$BUILD_ID dockermen31/$JOB_NAME:latest'
            }
        }
        stage ('push image to docker hub') {
            steps {
                //withCredentials([string(credentialsId: 'DockerPasswd', variable: 'DockerPasswd')]) {
                sh 'docker login -u dockermen31 -p Anil@12345'
                sh 'docker image push dockermen31/$JOB_NAME:v1.$BUILD_ID'
                sh 'docker image push dockermen31/$JOB_NAME:latest'
                sh 'docker image rm $JOB_NAME:v1.$BUILD_ID dockermen31/$JOB_NAME:v1.$BUILD_ID dockermen31/$JOB_NAME:latest'
            }
        }
        stage ('Docker Container Deployment') {
            steps {
                sshagent(['webapp_server']) {
                sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.45.36 ${docker_rmv_container}"    
                sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.45.36 ${docker_rmi}"    
                sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.45.36 ${docker_run}"
                //sh 'docker run -dit --name photogenic -p 7000:80 dockermen31/webapp'
                }
            }
        }
    }
}
