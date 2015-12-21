#!/bin/bash

export CATALINA_HOME=/e/Work/Java/apache-tomcat-7.0.52
export instanceName=instance1
export currentInstance=$CATALINA_HOME/instances/$instanceName

export CURRENT_DATE=$(date +"%Y-%m-%d")
#export CURRENT_DATE="2015-12-17"

export log_stdout=$currentInstance/logs/${instanceName}-stdout.${CURRENT_DATE}.log

tail -f $log_stdout


