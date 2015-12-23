#!/bin/bash
## instanceManager.sh
## This script manages a export of Apache Tomcat 7 instances in $CATALINA_HOME/instances directory
## Author: Julian Rivera Pineda
## E-mail: xtecuan@gmail.com
## Date: Dec 16, 2015

## JAVA_HOME change accord yours settings
export JAVA_HOME=/opt/knlservices/Java/jdk1.6.0_45

## CATALINA_HOME change accord to yours settings
export CATALINA_HOME=/opt/knlservices/services/apache-tomcat-7.0.67
export PATH=$JAVA_HOME/bin:$CATALINA_HOME/bin:$PATH

## INSTANCES_DIR
export INSTANCES_DIR=$CATALINA_HOME/instances


## Parameters
export instance=$1
export action=$2
export instanceScript=$INSTANCES_DIR/$instance/bin/$instance.sh

function usage(){
	echo "#################################################################################"
	echo "## Usage:  $0 instanceName action " 
	echo "## Where instanceName es the Tomcat instance Name to execute some action "
        echo "## And action is three of the follow commands: start,stop or restart "
	echo "##############################################################"
}


function setCatalinaBase(){
	export CATALINA_BASE=$INSTANCES_DIR/$instance
}

function setCatalinaOpts(){
	export CATALINA_PID=$INSTANCES_DIR/$instance/logs/$instance.pid
	export CATALINA_OPTS="-Djava.awt.headless=true -Dfile.encoding=UTF-8 -server -Xms256m -Xmx512m -Xmn128m -XX:PermSize=128m -XX:MaxPermSize=256m -XX:+HeapDumpOnOutOfMemoryError -XX:+UseParallelGC -Xbatch -XX:+CMSClassUnloadingEnabled -Dsun.io.useCanonCaches=false -XX:+UseParallelGC -Dorg.apache.coyote.USE_CUSTOM_STATUS_MSG_IN_HEADER=true"
	if [ -f "$instanceScript" ]
	then
		. $instanceScript
	fi
}

function startInstance(){
	setCatalinaBase
	setCatalinaOpts
	catalina.sh start
}

function stopInstance(){
	setCatalinaBase
	setCatalinaOpts
	catalina.sh stop -force
	if [ -f "$CATALINA_PID" ]
        then
	  rm $CATALINA_PID
        fi
}

function restartInstance(){
	setCatalinaBase
	setCatalinaOpts
	if [ -f "$CATALINA_PID" ]
	then
		stopInstance
        fi 
	startInstance
}


if [  -n "$instance" -a -n "$action" ]
then
	toExecute=$(echo "${action}Instance")
	$toExecute
else
	usage
fi

