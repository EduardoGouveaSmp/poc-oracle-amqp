
set USER_PASS=hr/hr
set SCHEMA=HR
set LOADJAVA_OPTS=-v -u %USER_PASS%

rem mvn clean package
rem mvn dependency:copy-dependencies

rem load dependencies
loadjava %LOADJAVA_OPTS% -resolve -resolver "((* %SCHEMA%) (* PUBLIC) (* -))" target/dependency/commons-logging*.jar
loadjava %LOADJAVA_OPTS% -resolve -resolver "((* %SCHEMA%) (* PUBLIC) (* -))" target/dependency/amqp-client*.jar

rem load the actual Java procedures
loadjava %LOADJAVA_OPTS% -resolve -resolver "((* %SCHEMA%) (* PUBLIC) (* -))" target/classes/com/zenika/oracle/amqp/*.class
