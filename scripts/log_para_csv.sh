#!/bin/bash
# log_para_csv.sh - transforma o log do R1 em tabelas CSV
# Uso: ./scripts/log_para_csv.sh [arquivo_de_log]
LOG="${1:-/var/log/cgnat/r1.log}"

(echo "hora,usuario,ip,mac"
 grep -a 'logged in' "$LOG" | awk '{print $1","$4","$7","$9}') > logins.csv

(echo "hora,usuario,minutos"
 grep -a 'logged out' "$LOG" | awk '{printf "%s,%s,%.0f\n", $1, $4, $7/60}') > logouts.csv

echo "Logins por cliente:"
grep -a 'logged in' "$LOG" | awk '{print $4}' | sort | uniq -c
