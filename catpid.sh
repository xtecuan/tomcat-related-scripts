#!/bin/bash

export CATALINA_HOME=/D/Work/Java/apache-tomcat-7.0.65/

export instanceName=$1

export pid_file=$CATALINA_HOME/instances/$instanceName/logs/$instanceName.pid

echo $(cat $pid_file)
