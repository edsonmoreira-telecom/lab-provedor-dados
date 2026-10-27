# Lab de provedor: PPPoE, CGNAT, logs e dados

Laboratório em VirtualBox que simula um provedor de internet pequeno, do login do assinante até a resposta a um ofício judicial. Todos os dados são fictícios.

## Topologia

- **R1 (MikroTik CHR, RouterOS 7):** concentrador PPPoE, CGNAT (100.64.0.0/24) e envio de logs por syslog.
- **Cliente (MikroTik CHR):** simula o roteador do assinante.
- **Logs (Ubuntu Server 26.04):** recebe os logs do R1 (rsyslog, UDP 514), guarda por 13 meses (logrotate) e transforma em tabelas.
- **Rede de gerência:** 192.168.50.0/24, separada da rede dos clientes.

## O que tem aqui

- `r1/` - configuração exportada do R1, sem senhas.
- `servidor-logs/` - rede (netplan), rsyslog e logrotate do servidor.
- `scripts/log_para_csv.sh` - gera tabelas de logins e logouts a partir do log.

## O que aprendi

- Responder a um ofício: IP público + porta + horário levam ao IP privado e à sessão PPPoE que contém aquele instante.
- No MikroTik, a linha de logout não traz o IP: é preciso conferir a sessão pelo usuário.
- Relógio (NTP) e fuso corretos fazem parte da prova.
- Desligamento brusco corrompe o log (bytes nulos); `grep -a` lê o arquivo mesmo assim.
