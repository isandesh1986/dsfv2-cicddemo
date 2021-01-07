pipeline {
    agent any
    tools { 
        maven 'Maven3' 
        jdk 'jdk8' 
    }
    environment {
      DOCKER_HUB_ID = credentials('docker_hub_id')
    }
    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
                echo "${DOCKER_HUB_ID_USR}"
                echo "${DOCKER_HUB_ID_PSW}"
            }
        }
        stage('Test Maven') {
            steps {
                sh 'mvn -version'
            }
        }
        stage('Build') {
            steps {
				        checkout scm
                //sh 'mvn clean install'
            }
        }
        stage('Build and Push the container image to docker hub registry') {
          steps {
            withCredentials([usernamePassword(credentialsId: 'docker_hub_id', passwordVariable: 'DOCKER_HUB_ID_PSW', usernameVariable: 'DOCKER_HUB_ID_USR')]) {
                sh "mvn compile jib:build"
                }
              }
        }
        stage('Install Kubectl'){
          steps {
             sh 'curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"'  
             sh 'chmod u+x ./kubectl'
             sh './kubectl version' 
          }
        }

        stage {
            
        }
    }
}