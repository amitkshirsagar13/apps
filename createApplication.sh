#!/bin/sh
NAMESPACE=$1
SERVICENAME=$2
BASEIMAGE=amitkshirsagar13
TAG=local
PORT=80

mkdir -p library/$NAMESPACE/$SERVICENAME

sed "s/NAMESPACE/${NAMESPACE}/g" template/template-application.yaml |\
sed "s/SERVICENAME/${SERVICENAME}/g" |\
sed -E "s|BASEIMAGE|${BASEIMAGE}|g" |\
sed "s/TAG/${TAG}/g" |\
sed "s/PORT/${PORT}/g" > library/$NAMESPACE/$SERVICENAME/$NAMESPACE-application.yaml

sed "s/NAMESPACE/${NAMESPACE}/g" template/template-service.yaml |\
sed "s/SERVICENAME/${SERVICENAME}/g" > library/$NAMESPACE/$SERVICENAME.yaml

sed "s/NAMESPACE/${NAMESPACE}/g" template/template-stack.yaml > ${NAMESPACE}-stack.yaml
sed "s/NAMESPACE/${NAMESPACE}/g" template/template-project.yaml > ${NAMESPACE}-project.yaml

kubectl create namespace ${NAMESPACE}
kubectl apply -f ${NAMESPACE}-project.yaml
kubectl apply -f ${NAMESPACE}-stack.yaml