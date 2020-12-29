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
        stage('publish docker') {
        steps {
          withCredentials([usernamePassword(credentialsId: 'docker_hub_id', passwordVariable: 'DOCKER_HUB_ID_PSW', usernameVariable: 'DOCKER_HUB_ID_USR')]) {
              sh "mvn compile jib:build 
              //-Djib.to.auth.username=${DOCKER_HUB_ID_USR} -Djib.to.auth.password=${DOCKER_HUB_ID_PSW}
              }
            }
        }
    }
}