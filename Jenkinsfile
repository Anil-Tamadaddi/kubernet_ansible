pipeline {
    agent any
    stages {
        stage ('git checkout') {
            steps { 
			    git 'https://github.com/Anil-Tamadaddi/kubernet_ansible.git'
            }
        }
        stage ('pushing dockerfile to ansible sever over ssh') {
            steps {
                sshagent(['ansible_demo']) {
                sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.45.36'
                sh 'scp /var/lib/jenkins/workspace/k8_project/* ubuntu@172.31.45.36:/home/ubuntu'
                }
            }
        }
        stage ('docker build image') {
            steps {
                sshagent(['ansible_demo']) {
                sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.45.36 cd /home/ubuntu/'
                sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.45.36 docker image build -t $JOB_NAME:v1.$BUILD_ID .'
                }
            }
        }
        stage ('docker tagging') {
            steps {
                sshagent(['ansible_demo']) {
                sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.45.36 cd /home/ubuntu/'
                sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.45.36 docker image tag $JOB_NAME:v1.$BUILD_ID dockermen31/$JOB_NAME:v1.$BUILD_ID '
                sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.45.36 docker image tag $JOB_NAME:v1.$BUILD_ID dockermen31/$JOB_NAME:latest '
                }
            }
            
        }
        stage ('push image to docker hub') {
            steps {
                sshagent(['ansible_demo']) {
                sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.45.36 docker login -u dockermen31 -p Anil@12345'
                sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.45.36 docker image push dockermen31/$JOB_NAME:v1.$BUILD_ID '
                sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.45.36 docker image push dockermen31/$JOB_NAME:latest '
                sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.45.36 docker image rm dockermen31/$JOB_NAME:v1.$BUILD_ID dockermen31/$JOB_NAME:latest '
                }    
            }
        }
        stage ('copy file from ansible to kubernet server') {
            steps {
                sshagent(['kubernet_server']) {
                sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.5.117'
                sh 'scp /var/lib/jenkins/workspace/k8_project/* ubuntu@172.31.5.117:/home/ubuntu/'
                }
            }
        }
        stage ('kubernet deployment using ansible') {
            steps {
                sshagent(['ansible_demo']) {
                sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.45.36 cd /home/ubuntu/'
                sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.45.36 ansible-playbook ansible.yml'
                }
            }
        }
    }
}
