#!/bin/bash

docker rm -f $(docker ps -aq)
images=( insurance-peer insurance-ca hospital-peer hospital-ca orderer insurance-cli hospital-cli web)
for i in "${images[@]}"
do
	echo Removing image : $i
  docker rmi -f $i
done

#docker rmi -f $(docker images | grep none)
images=( dev-insurance-peer dev-hospital-peer)
for i in "${images[@]}"
do
	echo Removing image : $i
  docker rmi -f $i
done
