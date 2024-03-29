-- enable the JVM to connect to all your RabbitMQ instances or load-balancers
--call dbms_java.grant_permission( 'HR', 'SYS:java.net.SocketPermission', '192.168.56.1:5671', 'connect,resolve' );
--call dbms_java.grant_permission( 'HR', 'SYS:java.net.SocketPermission', '192.168.56.1:5672', 'connect,resolve' );
--call dbms_java.grant_permission( 'HR', 'SYS:java.net.SocketPermission', '192.168.56.1:5673', 'connect,resolve' );
call dbms_java.grant_permission( 'HR', 'SYS:java.net.SocketPermission', '127.0.0.1:5671', 'connect,resolve' );
call dbms_java.grant_permission( 'HR', 'SYS:java.net.SocketPermission', '127.0.0.1:5672', 'connect,resolve' );
call dbms_java.grant_permission( 'HR', 'SYS:java.net.SocketPermission', '127.0.0.1:5673', 'connect,resolve' );

-- tell the Oracle JVM to prefer IPv4 over IPv6 (if needed)...
call dbms_java.grant_permission( 'HR', 'SYS:java.util.PropertyPermission', 'java.net.preferIPv4Stack', 'write' );

-- the code takes care of setting the property, but only at initialization, so you may need to reload the classes
-- or it should be possible to use dbms_java.set_property('java.net.preferIPv4Stack', 'true');

-- for remote Java debugging and fun
-- grant DEBUG ANY PROCEDURE to hr;
-- grant DEBUG CONNECT SESSION to hr;
