#! /usr/bin/env bash

echo "------------------------update start------------------------"

apt-get update

echo "------------------------download docker------------------------"

apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

apt-get install docker-ce docker-ce-cli containerd.io -y

echo "------------------------download minikube------------------------"


curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
  && chmod +x minikube

mkdir -p /usr/local/bin/

cp minikube /usr/local/bin/ 

apt-get install -y conntrack

echo "------------------------download kubectl------------------------"

apt-get update && apt-get install -y apt-transport-https gnupg2

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list

apt-get update

apt-get install -y kubectl

echo "------------------------minikube start------------------------"

su - vagrant -c "sudo minikube start --driver=none"

su - vagrant -c "sudo chown -R $USER $HOME/.kube $HOME/.minikube"


