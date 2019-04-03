node {

    def server = Artifactory.server 'ART'
    def buildInfo
    def warnings

    def registry = "curs/showcase"
    def registryCredential = "dockerhub"
    def image
    def propertiesImage
    
    stage('Build common image') {
        image = docker.build(registry + ":6.1.$BUILD_NUMBER", '--build-arg "SHOWCASE_VERSION=${BUILD_NUMBER}"')
    }

    stage('Build common image') {
        propertiesImage = docker.build(registry + ":6.1.$BUILD_NUMBER-properties", '-f Dockerfile-properties', '--build-arg "SHOWCASE_VERSION=${BUILD_NUMBER}"')
    }

    stage('Push images') {
        image.push()
        propertiesImage.push()
    }
}
