FROM tomcat:8.5-alpine
#  Default arguments 
ARG SHOWCASE_MAJOR=6.1
ARG SHOWCASE_VERSION=101
ARG WAR_NAME=ROOT

# remove default webapps
RUN rm -rf webapps/*

RUN apk add -U unzip && rm -rf /var/cache/apk/*
# SHOWCASE
# ADD https://artifactory.corchestra.ru/artifactory/libs-snapshot-local/ru/curs/showcase/${SHOWCASE_MAJOR}/showcase-${SHOWCASE_MAJOR}.war webapps/showcase.war

ADD http://artifactory.corchestra.ru/artifactory/corchestra-dev/${SHOWCASE_VERSION}/showcase-${SHOWCASE_MAJOR}-SNAPSHOT.war webapps/${WAR_NAME}.war
# ADD http://jenkins.curs.ru:1111/job/Showcase/lastSuccessfulBuild/artifact/build/artifacts/Showcase-${SHOWCASE_MAJOR}.${SHOWCASE_VERSION}.war webapps/${WAR_NAME}.war

RUN unzip webapps/${WAR_NAME}.war -d webapps/${WAR_NAME} && rm webapps/${WAR_NAME}.war

# SHOWCASE_VERSION=5050
# docker build --rm -t curs/showcase:6.1.${SHOWCASE_VERSION} -t curs/showcase:latest --build-arg "SHOWCASE_VERSION=${SHOWCASE_VERSION}" .