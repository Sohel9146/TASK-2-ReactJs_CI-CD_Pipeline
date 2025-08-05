pipeline {
    agent any

    stages {
        stage('Clone Code From Github') {
            steps {
                git url: 'https://github.com/Sohel9146/TASK-2-ReactJs_CI-CD_Pipeline.git', branch: 'main'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Build React App') {
            steps {
                sh 'npm run build'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("react-app-image")
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    dockerImage.run("-d -p 80:80")
                }
            }
        }
    }
}
