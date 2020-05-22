node{
     
    stage('SCM Checkout'){
        git url:  'https://github.com/fmuhammad182/wishtree.git',branch: 'master'
    }
    
    stage(" Maven Clean Package"){
      def mavenHome =  tool name: "maven-3.6.1", type: "maven"
      def mavenCMD = "${mavenHome}/bin/mvn"
      sh "${mavenCMD} clean package"
      
    } 
    
    
    stage('Build Docker Image'){
        sh 'docker build -t fmuhammad1824/wishtree .'
    }
    
    stage('Publish DockerHub'){
  /**  withCredentials([string(credentialsId: 'DOCKER', variable: 'DOCKER')]) {
        sh "docker login -u fmuhammad1824 -p ${DOCKER}"
           }

            sh 'docker push fmuhammad1824/wishtree' **/
            sh 'docker login -u fmuhammad1824 -p techugo@1123'
            sh 'docker push fmuhammad1824/wishtree'
        }
     
     stage("Deploy To Kuberates Cluster"){
       kubernetesDeploy(
         configs: 'springBootMongo.yml', 
         kubeconfigId: 'KUBERNATES_CONFIG',
         enableConfigSubstitution: true
        )
     }
}
