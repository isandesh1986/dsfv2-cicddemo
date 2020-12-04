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
                sh 'mvn clean install'
            }
        }
    }
}