#! /usr/bin/bash
docker commit $(docker container ls  | grep 'aapanel' | awk '{print $1}') boohere/`hostname`:`date +%Y%m%d`
docker push boohere/`hostname`:`date +%Y%m%d`
docker image rm boohere/`hostname`:`date +%Y%m%d`
