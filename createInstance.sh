#!/bin/bash
## createInstance.sh
## This script create the skeleton of Apache Tomcat 7 instance in $CATALINA_HOME/instances directory
## Author: Julian Rivera Pineda
## E-mail: xtecuan@gmail.com
## Date: Dec 16, 2015
## export user=LRNROBOT
## export pass=IDBlrn#2015
## export http_proxy=http://$user:$pass@wwppool.local.iadb.org:9090
##export https_proxy=http://$user:$pass@wwppool.local.iadb.org:9090
## export baseUrl=http://hqpaknl02:7779/
## #export no_proxy=hqtaknldb01
## export no_proxy=hqpaknl02

export CATALINA_HOME=/opt/knlservices/services/apache-tomcat-7.0.67
export instance=$1

function usage(){
	echo "##############################################################"
	echo "## Usage:  $0 instanceName " 
	echo "## Where instanceName is the name of Tomcat instance to create"
	echo "##############################################################"
}

function makeInstancesDirectory(){
	
	instancesDirectory=$CATALINA_HOME/instances

	if [ -d "$instancesDirectory"  ]
	then
		echo "Instances directory $instancesDirectory already exists "
	else
		echo "Creating instances Directory $instancesDirectory"
		mkdir -p $instancesDirectory
	fi
}

function makeInstance(){
        
	makeInstancesDirectory
	if [ -n "$instance" ]
	then
		echo "Creating $1 directory"
		mkdir $CATALINA_HOME/instances/$instance
		mkdir $CATALINA_HOME/instances/$instance/bin
		mkdir $CATALINA_HOME/instances/$instance/conf
		mkdir $CATALINA_HOME/instances/$instance/lib
		mkdir $CATALINA_HOME/instances/$instance/logs
		mkdir $CATALINA_HOME/instances/$instance/temp
		mkdir $CATALINA_HOME/instances/$instance/webapps
		mkdir $CATALINA_HOME/instances/$instance/work
		cp $CATALINA_HOME/conf/server.xml.instance $CATALINA_HOME/instances/$instance/conf/server.xml
		cp $CATALINA_HOME/conf/web.xml $CATALINA_HOME/instances/$instance/conf
		cp $CATALINA_HOME/conf/tomcat-users.xml $CATALINA_HOME/instances/$instance/conf
		cp $CATALINA_HOME/conf/logging.properties $CATALINA_HOME/instances/$instance/conf
		cp $CATALINA_HOME/bin/bootstrap.jar $CATALINA_HOME/instances/$instance/bin
		cp $CATALINA_HOME/bin/commons-daemon.jar $CATALINA_HOME/instances/$instance/bin
		cp $CATALINA_HOME/bin/tomcat-juli.jar $CATALINA_HOME/instances/$instance/bin
		cp $CATALINA_HOME/lib/cfmx_bootstrap-coldfusion9.jar $CATALINA_HOME/instances/$instance/bin/cfmx_bootstrap-coldfusion9.jar
		cp $CATALINA_HOME/conf/instanceScript.txt $CATALINA_HOME/instances/$instance/bin/$instance.sh
		chmod a+x $CATALINA_HOME/instances/$instance/bin/$instance.sh
	else
		usage
	fi 	

	

}

if [ -n "$instance"  ]
then
	makeInstance $instance
else
	usage
fi



