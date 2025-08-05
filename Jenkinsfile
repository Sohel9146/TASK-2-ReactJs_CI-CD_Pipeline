pipeline {
    agent any

    stages {
        stage('Clone Code From Github') {
            steps {
                git 'https://github.com/your-username/your-react-repo.git'
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
