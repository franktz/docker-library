#!/bin/bash
images=(
    kube-apiserver:v1.14.1
    kube-controller-manager:v1.14.1
    kube-scheduler:v1.14.1
    kube-proxy:v1.14.1
    pause:3.1
    etcd:3.3.10
    coredns:1.3.1

    kubernetes-dashboard-amd64:v1.10.1
)

for key in ${images[@]} ; do
    docker pull registry.cn-shenzhen.aliyuncs.com/franktown/$key
    docker tag registry.cn-shenzhen.aliyuncs.com/franktown/$key k8s.gcr.io/$key
    docker rmi registry.cn-shenzhen.aliyuncs.com/franktown/$key
done


docker pull registry.cn-shenzhen.aliyuncs.com/franktown/flannel:v0.11.0-amd64
docker tag registry.cn-shenzhen.aliyuncs.com/franktown/flannel:v0.11.0-amd64 quay.io/coreos/flannel:v0.11.0-amd64
docker rmi registry.cn-shenzhen.aliyuncs.com/franktown/flannel:v0.11.0-amd64
