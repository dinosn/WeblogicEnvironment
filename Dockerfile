# Basic image FROM centos
FROM centos
# Arguments passed
ARG JDK_PKG
ARG WEBLOGIC_JAR
# Fix for new centos releases
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum update -y
# to fix libnsl package issue
RUN yum -y install libnsl

# Create user
RUN groupadd -g 1000 oinstall && useradd -u 1100 -g oinstall oracle
# Create the required folders and environment variables 
RUN mkdir -p /install && mkdir -p /scripts
ENV JDK_PKG=$JDK_PKG
ENV WEBLOGIC_JAR=$WEBLOGIC_JAR


# Copy scripts
COPY scripts/jdk_install.sh /scripts/jdk_install.sh 
COPY scripts/jdk_bin_install.sh /scripts/jdk_bin_install.sh 

COPY scripts/weblogic_install11g.sh /scripts/weblogic_install11g.sh
COPY scripts/weblogic_install12c.sh /scripts/weblogic_install12c.sh
COPY scripts/create_domain11g.sh /scripts/create_domain11g.sh
COPY scripts/create_domain12c.sh /scripts/create_domain12c.sh
COPY scripts/open_debug_mode.sh /scripts/open_debug_mode.sh
COPY jdks/$JDK_PKG .
COPY weblogics/$WEBLOGIC_JAR .

# Checking for package version（bin/tar.gz）weblogic（11g/12c）and load the correct file, 
RUN if [ $JDK_PKG == *.bin ] ; then echo ****Load the JDK bin installation script**** && cp /scripts/jdk_bin_install.sh /scripts/jdk_install.sh ; else echo ***Load the JDK tar.gz installation script**** ; fi
RUN if [ $WEBLOGIC_JAR == *1036* ] ; then echo ****Loading the 11g installation script**** && cp /scripts/weblogic_install11g.sh /scripts/weblogic_install.sh && cp /scripts/create_domain11g.sh /scripts/create_domain.sh ; else echo ****Load the 12c installation script**** && cp /scripts/weblogic_install12c.sh /scripts/weblogic_install.sh && cp /scripts/create_domain12c.sh /scripts/create_domain.sh  ; fi

# Setting permissions 
RUN chmod +x /scripts/jdk_install.sh
RUN chmod +x /scripts/weblogic_install.sh
RUN chmod +x /scripts/create_domain.sh
RUN chmod +x /scripts/open_debug_mode.sh
# Running JDK installation
RUN /scripts/jdk_install.sh
# Running weblogic installation
RUN /scripts/weblogic_install.sh
# Setting up Weblogic Domain
RUN /scripts/create_domain.sh
# To open debug mode uncomment the following line
RUN /scripts/open_debug_mode.sh
# Starting up Weblogic Server
# CMD ["tail","-f","/dev/null"]
CMD ["/u01/app/oracle/Domains/ExampleSilentWTDomain/bin/startWebLogic.sh"]
EXPOSE 7001
