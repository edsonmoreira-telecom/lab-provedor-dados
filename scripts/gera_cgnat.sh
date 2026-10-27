#!/bin/bash
# gera_cgnat.sh - gera as regras de CGNAT deterministico do R1
# Cada IP privado 100.64.0.N recebe um bloco fixo de portas no IP publico.
# Uso: ./scripts/gera_cgnat.sh > r1/cgnat-deterministico.rsc
PUBLICO="10.0.2.15"
PRIMEIRO=10
ULTIMO=50
BLOCO=1000
BASE=1024

echo "/ip firewall nat"
for N in $(seq $PRIMEIRO $ULTIMO); do
  INICIO=$(( BASE + (N - PRIMEIRO) * BLOCO ))
  FIM=$(( INICIO + BLOCO - 1 ))
  for PROTO in tcp udp; do
    echo "add chain=srcnat src-address=100.64.0.$N out-interface=ether1 protocol=$PROTO action=src-nat to-addresses=$PUBLICO to-ports=$INICIO-$FIM comment=\"cgnat-det 100.64.0.$N\""
  done
done
