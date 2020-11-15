#!/bin/bash
function get_ips() {
  for ip in $(seq 1 254); do
    ping -c 1 $1.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" &
  done
}

function scanning_ip() {
  echo -e "\033[1;33mIPs escaneados:\033[m"
  sleep 3
  echo -e "\033[1;32m$(get_ips $1)\033[m"
  if [ -d "./scans" ]; then
    echo "$(get_ips $1)" >>./scans/ips_$(date | cut -d " " -f 5 | tr -d ":").txt &
  else
    mkdir ./scans &&
      echo -e "$(get_ips $1)" >>./scans/ips_$(date | cut -d " " -f 5 | tr -d ":").txt &
  fi
  sleep 3
  echo -e "\033[1;34mScanner terminado com sucesso!\033[m"
  echo -e "\033[1;36mGerando arquivo contendo IPs, aguarde..\033[m"
  sleep 3
  echo -e "\033[1;36mPronto :)\033[m"
}
