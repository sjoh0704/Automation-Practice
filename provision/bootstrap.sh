#! /usr/bin/env bash

# ansible 설치 
yum install epel-release -y
yum install ansible -y


# 환경 설정 초기파일 구성 for vagrant only (사용자가 vagrant이므로)
mkdir -p /home/vagrant/.vim/autoload /home/vagrant/.vim/bundle
touch /home/vagrant/.vimrc
touch /home/vagrant/.bashrc
 