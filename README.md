# Online Shoping

**<u>Application Server Setup</u>**

**Server Name** - Tomcat 9.0 (https://tomcat.apache.org/download-90.cgi) 

- Adjusting Server Memory

  - Create setenv.bat under \Tomcat 9.0\bin folder and add following content in file 

  - set "JAVA_OPTS=%JAVA_OPTS% -Xms**512**m -Xmx**8192**m -XX:MaxPermSize=**256**m -server"

- Setting port 

  - Open \Tomcat 9.0\conf\server.xml1

    <Connector port="8088" protocol="HTTP/1.1"
                   connectionTimeout="20000"
                   redirectPort="8443" />

- Add Windows Service

  - Open \Tomcat 9.0\bin\service.bat 

  - modify default service name 

  - run service.bat to create windows service

    ![image-20220514094934745](C:\Users\Pravin\AppData\Roaming\Typora\typora-user-images\image-20220514094934745.png)

- Check memory usage
  - http://localhost:8080/manager/jmxproxy/?get=java.lang:type=Memory&att=HeapMemoryUsage

**<u>Troubleshooting</u>**

- Error on TldScanner 

  Try removing web.xml, webapp.xml, context.xml

  