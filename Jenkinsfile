pipeline {
    agent any
  
    environment {
        // Define your AWS ECR registry URL
        ECR_REGISTRY = "381492123764.dkr.ecr.eu-north-1.amazonaws.com"
        // Define your Docker image name
        DOCKER_IMAGE_NAME = "go-app-image"
        //configure aws
        AWS_CREDENTIALS = credentials('aws-ec22')
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    // Checkout source code from version control
                    checkout scm
                }
            }
        }

        stage('Build and Push Docker Image') {
            steps {
                script {
                    // Define Docker tag
          
                    def dockerTag = 'first'
                    

                    sh "aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin ${ECR_REGISTRY}"

                    sh "docker build -t ${ECR_REGISTRY}/${DOCKER_IMAGE_NAME}:${dockerTag} ."

                    // Push Docker image to AWS ECR
                    sh "docker push ${ECR_REGISTRY}/${DOCKER_IMAGE_NAME}:${dockerTag}"
                  //run image
                    sh "docker run -d -p 3001:3001 ${ECR_REGISTRY}/${DOCKER_IMAGE_NAME}:${dockerTag}"

    
                }
            }
        }
    }
}
