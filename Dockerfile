
#FROM openjdk:8

#RUN mkdir -p /opt/app
#ENV PROJECT_HOME /opt/app


#COPY target/Spring3HibernateApp.war $PROJECT_HOME/Spring3HibernateApp.war

#WORKDIR $PROJECT_HOME


#CMD ["java", "-jar" , "Spring3HibernateApp.war"]
FROM tomcat:8.0
COPY target/Spring3HibernateApp.war /usr/local/tomcat/webapps/


