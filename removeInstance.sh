#!/bin/bash
## removeInstance.sh
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
	echo "## Where instanceName is the name of Tomcat instance to remove"
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

function removeInstance(){
        
	if [ -n "$instance" ]
	then
		echo "Removing $1 directory"
		rm -rfv  $CATALINA_HOME/instances/$instance
	else
		usage
	fi 	

	

}

if [ -n "$instance"  ]
then
	removeInstance $instance
else
	usage
fi



