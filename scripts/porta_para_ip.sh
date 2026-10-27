#!/bin/bash
# porta_para_ip.sh - diz qual IP privado usava uma porta publica
# Uso: ./scripts/porta_para_ip.sh PORTA
P="$1"
if ! [[ "$P" =~ ^[0-9]+$ ]] || [ "$P" -lt 1024 ] || [ "$P" -gt 42023 ]; then
  echo "Porta invalida ou fora dos blocos do CGNAT (1024 a 42023)"
  exit 1
fi
N=$(( 10 + (P - 1024) / 1000 ))
echo "Porta $P -> IP privado 100.64.0.$N"
echo "Logins com esse IP no log:"
grep -a "logged in, 100.64.0.$N from" /var/log/cgnat/r1.log
