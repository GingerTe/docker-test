node {
    if (!(env.BRANCH_NAME == 'trunk')){
        currentBuild.result = 'SUCCESS'
        return
    }

    def server = Artifactory.server 'ART'
    def buildInfo
    def warnings
    
    stage ('Clone') {
        checkout scm
    }

    if (env.BRANCH_NAME == 'trunk') {
        stage('Build images') {
            sh 'build.sh'
        }
    }
}
