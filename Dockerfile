FROM openjdk:8-jdk-alpine

VOLUME /tmp

MAINTAINER Samuel Birocchi <samuel.birocchi@gobots.com.br>

ADD target/*.jar app.jar

COPY newrelic newrelic

ENV JAVA_OPTS=""
ENV SPRING_PROFILE="default"
ENV MONGO_PASSWORD=""

ENTRYPOINT exec java $JAVA_OPTS \
 -javaagent:newrelic/newrelic.jar \
 -Djava.security.egd=file:/dev/./urandom \
 -Dspring.profiles.active=$SPRING_PROFILE \
 -Dmongo.password=$MONGO_PASSWORD \
 -jar app.jar
