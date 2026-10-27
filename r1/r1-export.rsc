# 2026-10-27 15:59:40 by RouterOS 7.24.5
#
/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no
set [ find default-name=ether2 ] disable-running-check=no
set [ find default-name=ether3 ] disable-running-check=no
/ip pool
add name=cgnat ranges=100.64.0.10-100.64.0.50
/ppp profile
set *0 dns-server=8.8.8.8 local-address=100.64.0.1 remote-address=cgnat
add dns-server=8.8.8.8 local-address=100.64.0.1 name=plano-10M rate-limit=\
    10M/10M remote-address=cgnat
add dns-server=8.8.8.8 local-address=100.64.0.1 name=plano-20M rate-limit=\
    20M/20M remote-address=cgnat
/system logging action
add name=serverlog remote=192.168.50.10 target=remote
/interface pppoe-server server
add disabled=no interface=ether2 service-name=lab
/ip address
add address=192.168.50.1/24 interface=ether3 network=192.168.50.0
/ip dhcp-client
add interface=ether1 name=client1
/ip firewall nat
add action=masquerade chain=srcnat log=yes log-prefix=CGNAT out-interface=\
    ether1 src-address=100.64.0.0/24
/ppp secret
add name=cliente1 profile=plano-10M service=pppoe
add name=cliente2 profile=plano-20M service=pppoe
add name=cliente3 profile=plano-20M service=pppoe
add name=cliente4 profile=plano-20M service=pppoe
/system clock
set time-zone-name=America/Sao_Paulo
set name=R1
/system logging
add action=serverlog topics=firewall
add action=serverlog topics=ppp,!debug
/system ntp client
set enabled=yes
/system ntp client servers
add address=a.st1.ntp.br
