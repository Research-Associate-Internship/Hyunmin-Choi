pipeline {
    // define the exact agent you want to use to run these jobs via label
    agent {
        label 'workernode1'
    }

    stages {
        stage('Checkout') {
            steps {
                // Get some code from a GitHub repository
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Research-Associate-Internship/Hyunmin-Choi.git']]])
        
            }
        }  

        stage('Build image from Dockerfile') {
            steps {
                dir("${WORKSPACE}/") {
                sh 'docker build -t hchoi3/demo:v1 .'
                }
            }

        }

        
        stage('Login to Docker Hub') {
            steps {
                withCredentials([[$class: 'VaultUsernamePasswordCredentialBinding', credentialsId: 'vault-docker', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME']]) {
                sh 'echo $PASSWORD | docker login -u $USERNAME --password-stdin'
                }
            }
        }

        stage('Push image to registry') {
            steps {
                //WithDockerRegistry([credentialsId: "docker_registry", url: "" ]) {
                sh 'docker push hchoi3/demo:v1'
                //}
            }
        }
     
      
    }
//after all instructions are ran this makes sure to log out of your registry   
post{
    always {  
      sh 'docker logout'           
    }      
  }

}