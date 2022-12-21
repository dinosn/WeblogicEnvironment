# WeblogicEnvironment
WeblogicEnvironment docker setup for research

Idea is from https://github.com/QAX-A-Team/WeblogicEnvironment, this is a cleaned up setup and with fixed issues on the installation.

### Required files ### 
```fmw_12.2.1.3.0_wls.jar``` from https://www.oracle.com/middleware/technologies/weblogic-server-downloads.html ( select Generic )

Under ./weblogics/

```jdk-8u121-linux-x64.tar.gz``` from https://www.oracle.com/java/technologies/javase/javase8-archive-downloads.html 

Under ./jdks/


E.g.:
```
(root💀icestorm)-[~/tools/WeblogicEnvironment]# ls jdks 
jdk-7u21-linux-x64.tar.gz  jdk-8u121-linux-x64.tar.gz
                                                                                                                                                                                                   
(root💀icestorm)-[~/tools/WeblogicEnvironment]# ls weblogics 
fmw_12.2.1.3.0_wls.jar  wls1036_generic.jar
````

# Login
System will be reachable at :7001/console/login/LoginForm.jsp , with credentials `weblogic / qaxateam01`
