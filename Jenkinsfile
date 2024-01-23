pipeline {
    agent any
  
    environment {
        // Define your AWS ECR registry URL
        ECR_REGISTRY = "381492123764.dkr.ecr.eu-north-1.amazonaws.com/go-app-images"
    
      
    }

    stages {

        stage('Build and Push Docker Image') {
            steps {
                script {
                    // Define Docker tag
          
                    def dockerTag = 'first'
                    sh "docker rm -f go-app"
                    sh "aws s3 ls"
                    sh "echo 'AWS configured!'"
                    sh "aws ecr get-login-password --region eu-north-1 | docker login --username AWS --password-stdin ${ECR_REGISTRY}"

                    sh "docker build -t ${ECR_REGISTRY}:${dockerTag} ."

                    // Push Docker image to AWS ECR
                    sh "docker push ${ECR_REGISTRY}:${dockerTag}"
                  //run image
                    sh "docker run -d --name go-app -p 3001:3001 ${ECR_REGISTRY}:${dockerTag}"

    
                }
            }
        }
    }
}
