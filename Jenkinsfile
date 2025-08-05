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
                    sh '''
                        # Find the container using port 8082
                        CONTAINER_ID=$(docker ps -q --filter "publish=8082")

                        # Stop and remove the container if found
                        if [ ! -z "$CONTAINER_ID" ]; then
                            echo "Stopping container using port 8082: $CONTAINER_ID"
                            docker stop $CONTAINER_ID
                            docker rm $CONTAINER_ID
                        fi

                        # Run new container
                        docker run -d --name react-container -p 8082:80 react-app-image
                        '''
        }
    }
}

    }
}
