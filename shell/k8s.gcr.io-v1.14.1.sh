#!/bin/bash
images=(
    kube-apiserver:v1.14.1
    kube-controller-manager:v1.14.1
    kube-scheduler:v1.14.1
    kube-proxy:v1.14.1
    pause:3.1
    etcd:3.3.10
    coredns:1.3.1
)

for key in ${images[@]} ; do
    docker pull registry.cn-shenzhen.aliyuncs.com/franktown/$key
    docker tag registry.cn-shenzhen.aliyuncs.com/franktown/$key k8s.gcr.io/$key
    docker rmi registry.cn-shenzhen.aliyuncs.com/franktown/$key
done
