@ECHO OFF
TITLE Jenkins - Sistemas New Bank
C:
CD "C:\distributions"
java -jar jenkins.war --httpPort=18080 --prefix=/jenkins
PAUSE
