#!/bin/bash

# REMOTE_REPOSITORY=https://github.com/innovationacademy-kr/swlabs-helper.git
# REPOSITORY=/home/ec2-user/git/server
# APP_NAME=swlabs-helper

#REMOTE_REPOSITORY=https://github.com/platanus-kr/actiontest.git
REPOSITORY=$(PWD)
APP_NAME=actiontest

#if [ ! -d "$REPOSITORY" ]; then
#  git clone $REMOTE_REPOSITORY server
#fi

#cd $REPOSITORY
git pull
sh mvnw package

JAR_NAME=$(ls $REPOSITORY/target | grep jar | head -n 1)
JAR_PATH=$REPOSITORY/target/$JAR_NAME

CURRENT_PID=$(pgrep -f $APP_NAME)
if [ -z $CURRENT_PID ]
then
  echo ">>>> java process not found."
else
  echo ">>>> PID: $CURRENT_PID kill."
  kill -15 $CURRENT_PID
  sleep 5
fi

echo ">>>> $JAR_PATH java execute."
nohup java -jar $JAR_PATH > /dev/null 2> /dev/null < /dev/null &
sleep 3
CURRENT_PID=$(pgrep -f $APP_NAME)
echo ">>>> New PID: $CURRENT_PID"
