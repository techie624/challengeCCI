#!/usr/bin/env bash

#-----------------------------------------------------------------------------#

TAG=$(date +"%Y%m%d_%H%M%S");
pwd=`pwd`

#-----------------------------------------------------------------------------#
### Set ENV

set -e # Abort script at first error
set -u # Attempt to use undefined variable outputs error message
set -x # Verbose with commands displayed

#-----------------------------------------------------------------------------#
### Set ENV

pwd=`pwd` && echo $pwd
ls -larth
git status
git branch
docker build . -t cci-nginx
docker run -dti -p 80:80 cci-nginx
docker ps -a
sleep 3
curl localhost
docker run -d -p 4444:4444 --name sel-node -v /dev/shm:/dev/shm -v $pwd:$pwd selenium/standalone-chrome:4.0.0-beta-1-20210215
docker exec sel-node bash -c "cd $pwd && node test.js"
