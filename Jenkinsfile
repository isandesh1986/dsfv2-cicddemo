pipeline {
    agent any
    tools { 
        maven 'Maven3' 
        jdk 'jdk8' 
    }
    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
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
        withCredentials([usernamePassword(credentialsId: 'docker-hub-id', passwordVariable: 'DOCKER_HUB_ID_USER', usernameVariable: 'DOCKER_HUB_ID_PWD')]) {
            sh "mvn package -Pdocker"        
            }
        }
    }
}