#FROM tomcat:8.0.20-jre8
# Dummy text to test 
#COPY target/java-web-app*.war /usr/local/tomcat/webapps/java-web-app.war

# Build a JAR File
FROM maven:3.6.3-jdk-8-slim AS stage1
WORKDIR /home/app
COPY . /home/app/
RUN mvn -f /home/app/pom.xml clean package

# Create an Image
FROM tomcat:8.0.20-jre8
# Dummy text to test 
COPY --from=stage1 /home/app/target/java-web-app*.war /usr/local/tomcat/webapps/java-web-app.war 
#COPY  /home/app/target/java-web-app*.war /usr/local/tomcat/webapps/java-web-app.war

# Create an Image
#FROM openjdk:8-jdk-alpine
#EXPOSE 8080
#COPY --from=stage1 /home/app/target/java-web-app*.war java-web-app.war
#ENTRYPOINT ["sh", "-c", "app -war /java-web-app.war"]
