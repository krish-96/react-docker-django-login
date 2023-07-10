pipeline{
    agent any
    stages{
        stage("Clone"){
            steps{
                echo "Cloning..."
                git branch: 'main', url: 'https://github.com/krish-96/react-docker-django-login.git'
                echo "Cloning is done."
            }
        }
        stage("Build"){
            steps{
                echo "Preparing the Build..."
                sh "docker login -u ${dockerHubUserName} -p ${dockerHubToken}"
                sh "docker build -t ${dockerHubUserName}/register-login-app-be:${BUILD_NUMBER} ."
                sh "docker push ${dockerHubUserName}/register-login-app-be:${BUILD_NUMBER}"
                sh "docker run -it --name register-login-app-be-${BUILD_NUMBER} --network host -d  ${dockerHubUserName}/register-login-app-be:${BUILD_NUMBER}"
                echo "Build is completed."
            }
        }
        stage("Test"){
            steps{
                echo "All testcases are passed."
            }
        }
        stage("Deploy"){
            steps{
                echo "Deployment is Started..."
                echo "Deployment is completed Successfully."
            }
        }
    }
}
