node{
     
    stage('SCM Checkout'){
        git url:  'https://github.com/fmuhammad182/opstree.git',branch: 'master'
    }
    
    stage(" Maven Clean Package"){
      def mavenHome =  tool name: "maven-3.6.1", type: "maven"
      def mavenCMD = "${mavenHome}/bin/mvn"
      sh "${mavenCMD} clean install"
      
    } 
    
    
    stage('Build Docker Image'){
        sh 'docker build -t fmuhammad1824/wishtree:"$BUILD_NUMBER" .'
    }
    
    stage('Publish DockerHub'){
  /**  withCredentials([string(credentialsId: 'DOCKER', variable: 'DOCKER')]) {
        sh "docker login -u fmuhammad1824 -p ${DOCKER}"
           }

            sh 'docker push fmuhammad1824/wishtree' **/
            sh 'docker login -u fmuhammad1824 -p techugo@1123'
            sh 'docker push fmuhammad1824/wishtree:"$BUILD_NUMBER"'
        }
     
     stage("Deploy To Kuberates Cluster"){
      sh 'kubectl apply -f hpa.yml'
      sh 'export BUILD_NUMBER="$BUILD_NUMBER"'
      sh 'envsubst < deployment.yml | kubectl apply -f - '
      sh '''
      if ! kubectl rollout status deployment opstree; then
         kubectl rollout undo deployment opstree
         kubectl rollout status deployment opstree
         exit 1
      fi
      '''
 
      sh 'kubectl apply -f service.yml'
        
     }
}
