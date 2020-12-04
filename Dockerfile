FROM java:8-jdk-alpine

COPY ./target/cicddemo-0.0.1-SNAPSHOT.war /usr/app/

WORKDIR /usr/app

RUN sh -c 'touch cicddemo-0.0.1-SNAPSHOT.war'

ENTRYPOINT ["java","-jar","cicddemo-0.0.1-SNAPSHOT.war"]

