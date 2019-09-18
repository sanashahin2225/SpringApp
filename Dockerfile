FROM openjdk:9
MAINTAINER Sana Shahin <sana.shahin@atmecs.com>
ADD target/springbootdemo-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8010

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
