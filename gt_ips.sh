#!/bin/bash
source ./functions.sh

function gt_ips() {
  echo -e "\033[1;34mGet IPs iniciado\033[m"
  sleep 3
  echo -e "\033[1;36mScanning em progresso...\033[m"
  if [ "$1" == "" ]; then
    echo -e "\033[1;31mID de rede não inserido :(\033[m"
    echo -e "\033[1;33mInsira por exemplo: 192.168.0 \033[m"
    echo -e "\033[1;34mFinalizando script...\033[m"
    sleep 3
  else
    scanning_ip $1
  fi
}

gt_ips $1
