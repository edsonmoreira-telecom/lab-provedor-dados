# 2026-10-27 19:53:26 by RouterOS 7.24.5
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
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.10" \
    out-interface=ether1 protocol=tcp src-address=100.64.0.10 to-addresses=\
    10.0.2.15 to-ports=1024-2023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.10" \
    out-interface=ether1 protocol=udp src-address=100.64.0.10 to-addresses=\
    10.0.2.15 to-ports=1024-2023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.11" \
    out-interface=ether1 protocol=tcp src-address=100.64.0.11 to-addresses=\
    10.0.2.15 to-ports=2024-3023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.11" \
    out-interface=ether1 protocol=udp src-address=100.64.0.11 to-addresses=\
    10.0.2.15 to-ports=2024-3023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.12" \
    out-interface=ether1 protocol=tcp src-address=100.64.0.12 to-addresses=\
    10.0.2.15 to-ports=3024-4023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.12" \
    out-interface=ether1 protocol=udp src-address=100.64.0.12 to-addresses=\
    10.0.2.15 to-ports=3024-4023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.13" \
    out-interface=ether1 protocol=tcp src-address=100.64.0.13 to-addresses=\
    10.0.2.15 to-ports=4024-5023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.13" \
    out-interface=ether1 protocol=udp src-address=100.64.0.13 to-addresses=\
    10.0.2.15 to-ports=4024-5023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.14" \
    out-interface=ether1 protocol=tcp src-address=100.64.0.14 to-addresses=\
    10.0.2.15 to-ports=5024-6023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.14" \
    out-interface=ether1 protocol=udp src-address=100.64.0.14 to-addresses=\
    10.0.2.15 to-ports=5024-6023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.15" \
    out-interface=ether1 protocol=tcp src-address=100.64.0.15 to-addresses=\
    10.0.2.15 to-ports=6024-7023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.15" \
    out-interface=ether1 protocol=udp src-address=100.64.0.15 to-addresses=\
    10.0.2.15 to-ports=6024-7023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.16" \
    out-interface=ether1 protocol=tcp src-address=100.64.0.16 to-addresses=\
    10.0.2.15 to-ports=7024-8023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.16" \
    out-interface=ether1 protocol=udp src-address=100.64.0.16 to-addresses=\
    10.0.2.15 to-ports=7024-8023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.17" \
    out-interface=ether1 protocol=tcp src-address=100.64.0.17 to-addresses=\
    10.0.2.15 to-ports=8024-9023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.17" \
    out-interface=ether1 protocol=udp src-address=100.64.0.17 to-addresses=\
    10.0.2.15 to-ports=8024-9023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.18" \
    out-interface=ether1 protocol=tcp src-address=100.64.0.18 to-addresses=\
    10.0.2.15 to-ports=9024-10023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.18" \
    out-interface=ether1 protocol=udp src-address=100.64.0.18 to-addresses=\
    10.0.2.15 to-ports=9024-10023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.19" \
    out-interface=ether1 protocol=tcp src-address=100.64.0.19 to-addresses=\
    10.0.2.15 to-ports=10024-11023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.19" \
    out-interface=ether1 protocol=udp src-address=100.64.0.19 to-addresses=\
    10.0.2.15 to-ports=10024-11023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.20" \
    out-interface=ether1 protocol=tcp src-address=100.64.0.20 to-addresses=\
    10.0.2.15 to-ports=11024-12023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.20" \
    out-interface=ether1 protocol=udp src-address=100.64.0.20 to-addresses=\
    10.0.2.15 to-ports=11024-12023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.21" \
    out-interface=ether1 protocol=tcp src-address=100.64.0.21 to-addresses=\
    10.0.2.15 to-ports=12024-13023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.21" \
    out-interface=ether1 protocol=udp src-address=100.64.0.21 to-addresses=\
    10.0.2.15 to-ports=12024-13023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.22" \
    out-interface=ether1 protocol=tcp src-address=100.64.0.22 to-addresses=\
    10.0.2.15 to-ports=13024-14023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.22" \
    out-interface=ether1 protocol=udp src-address=100.64.0.22 to-addresses=\
    10.0.2.15 to-ports=13024-14023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.23" \
    out-interface=ether1 protocol=tcp src-address=100.64.0.23 to-addresses=\
    10.0.2.15 to-ports=14024-15023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.23" \
    out-interface=ether1 protocol=udp src-address=100.64.0.23 to-addresses=\
    10.0.2.15 to-ports=14024-15023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.24" \
    out-interface=ether1 protocol=tcp src-address=100.64.0.24 to-addresses=\
    10.0.2.15 to-ports=15024-16023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.24" \
    out-interface=ether1 protocol=udp src-address=100.64.0.24 to-addresses=\
    10.0.2.15 to-ports=15024-16023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.25" \
    out-interface=ether1 protocol=tcp src-address=100.64.0.25 to-addresses=\
    10.0.2.15 to-ports=16024-17023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.25" \
    out-interface=ether1 protocol=udp src-address=100.64.0.25 to-addresses=\
    10.0.2.15 to-ports=16024-17023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.26" \
    out-interface=ether1 protocol=tcp src-address=100.64.0.26 to-addresses=\
    10.0.2.15 to-ports=17024-18023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.26" \
    out-interface=ether1 protocol=udp src-address=100.64.0.26 to-addresses=\
    10.0.2.15 to-ports=17024-18023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.27" \
    out-interface=ether1 protocol=tcp src-address=100.64.0.27 to-addresses=\
    10.0.2.15 to-ports=18024-19023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.27" \
    out-interface=ether1 protocol=udp src-address=100.64.0.27 to-addresses=\
    10.0.2.15 to-ports=18024-19023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.28" \
    out-interface=ether1 protocol=tcp src-address=100.64.0.28 to-addresses=\
    10.0.2.15 to-ports=19024-20023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.28" \
    out-interface=ether1 protocol=udp src-address=100.64.0.28 to-addresses=\
    10.0.2.15 to-ports=19024-20023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.29" \
    out-interface=ether1 protocol=tcp src-address=100.64.0.29 to-addresses=\
    10.0.2.15 to-ports=20024-21023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.29" \
    out-interface=ether1 protocol=udp src-address=100.64.0.29 to-addresses=\
    10.0.2.15 to-ports=20024-21023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.30" \
    out-interface=ether1 protocol=tcp src-address=100.64.0.30 to-addresses=\
    10.0.2.15 to-ports=21024-22023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.30" \
    out-interface=ether1 protocol=udp src-address=100.64.0.30 to-addresses=\
    10.0.2.15 to-ports=21024-22023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.31" \
    out-interface=ether1 protocol=tcp src-address=100.64.0.31 to-addresses=\
    10.0.2.15 to-ports=22024-23023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.31" \
    out-interface=ether1 protocol=udp src-address=100.64.0.31 to-addresses=\
    10.0.2.15 to-ports=22024-23023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.32" \
    out-interface=ether1 protocol=tcp src-address=100.64.0.32 to-addresses=\
    10.0.2.15 to-ports=23024-24023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.32" \
    out-interface=ether1 protocol=udp src-address=100.64.0.32 to-addresses=\
    10.0.2.15 to-ports=23024-24023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.33" \
    out-interface=ether1 protocol=tcp src-address=100.64.0.33 to-addresses=\
    10.0.2.15 to-ports=24024-25023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.33" \
    out-interface=ether1 protocol=udp src-address=100.64.0.33 to-addresses=\
    10.0.2.15 to-ports=24024-25023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.34" \
    out-interface=ether1 protocol=tcp src-address=100.64.0.34 to-addresses=\
    10.0.2.15 to-ports=25024-26023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.34" \
    out-interface=ether1 protocol=udp src-address=100.64.0.34 to-addresses=\
    10.0.2.15 to-ports=25024-26023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.35" \
    out-interface=ether1 protocol=tcp src-address=100.64.0.35 to-addresses=\
    10.0.2.15 to-ports=26024-27023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.35" \
    out-interface=ether1 protocol=udp src-address=100.64.0.35 to-addresses=\
    10.0.2.15 to-ports=26024-27023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.36" \
    out-interface=ether1 protocol=tcp src-address=100.64.0.36 to-addresses=\
    10.0.2.15 to-ports=27024-28023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.36" \
    out-interface=ether1 protocol=udp src-address=100.64.0.36 to-addresses=\
    10.0.2.15 to-ports=27024-28023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.37" \
    out-interface=ether1 protocol=tcp src-address=100.64.0.37 to-addresses=\
    10.0.2.15 to-ports=28024-29023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.37" \
    out-interface=ether1 protocol=udp src-address=100.64.0.37 to-addresses=\
    10.0.2.15 to-ports=28024-29023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.38" \
    out-interface=ether1 protocol=tcp src-address=100.64.0.38 to-addresses=\
    10.0.2.15 to-ports=29024-30023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.38" \
    out-interface=ether1 protocol=udp src-address=100.64.0.38 to-addresses=\
    10.0.2.15 to-ports=29024-30023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.39" \
    out-interface=ether1 protocol=tcp src-address=100.64.0.39 to-addresses=\
    10.0.2.15 to-ports=30024-31023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.39" \
    out-interface=ether1 protocol=udp src-address=100.64.0.39 to-addresses=\
    10.0.2.15 to-ports=30024-31023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.40" \
    out-interface=ether1 protocol=tcp src-address=100.64.0.40 to-addresses=\
    10.0.2.15 to-ports=31024-32023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.40" \
    out-interface=ether1 protocol=udp src-address=100.64.0.40 to-addresses=\
    10.0.2.15 to-ports=31024-32023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.41" \
    out-interface=ether1 protocol=tcp src-address=100.64.0.41 to-addresses=\
    10.0.2.15 to-ports=32024-33023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.41" \
    out-interface=ether1 protocol=udp src-address=100.64.0.41 to-addresses=\
    10.0.2.15 to-ports=32024-33023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.42" \
    out-interface=ether1 protocol=tcp src-address=100.64.0.42 to-addresses=\
    10.0.2.15 to-ports=33024-34023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.42" \
    out-interface=ether1 protocol=udp src-address=100.64.0.42 to-addresses=\
    10.0.2.15 to-ports=33024-34023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.43" \
    out-interface=ether1 protocol=tcp src-address=100.64.0.43 to-addresses=\
    10.0.2.15 to-ports=34024-35023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.43" \
    out-interface=ether1 protocol=udp src-address=100.64.0.43 to-addresses=\
    10.0.2.15 to-ports=34024-35023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.44" \
    out-interface=ether1 protocol=tcp src-address=100.64.0.44 to-addresses=\
    10.0.2.15 to-ports=35024-36023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.44" \
    out-interface=ether1 protocol=udp src-address=100.64.0.44 to-addresses=\
    10.0.2.15 to-ports=35024-36023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.45" \
    out-interface=ether1 protocol=tcp src-address=100.64.0.45 to-addresses=\
    10.0.2.15 to-ports=36024-37023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.45" \
    out-interface=ether1 protocol=udp src-address=100.64.0.45 to-addresses=\
    10.0.2.15 to-ports=36024-37023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.46" \
    out-interface=ether1 protocol=tcp src-address=100.64.0.46 to-addresses=\
    10.0.2.15 to-ports=37024-38023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.46" \
    out-interface=ether1 protocol=udp src-address=100.64.0.46 to-addresses=\
    10.0.2.15 to-ports=37024-38023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.47" \
    out-interface=ether1 protocol=tcp src-address=100.64.0.47 to-addresses=\
    10.0.2.15 to-ports=38024-39023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.47" \
    out-interface=ether1 protocol=udp src-address=100.64.0.47 to-addresses=\
    10.0.2.15 to-ports=38024-39023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.48" \
    out-interface=ether1 protocol=tcp src-address=100.64.0.48 to-addresses=\
    10.0.2.15 to-ports=39024-40023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.48" \
    out-interface=ether1 protocol=udp src-address=100.64.0.48 to-addresses=\
    10.0.2.15 to-ports=39024-40023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.49" \
    out-interface=ether1 protocol=tcp src-address=100.64.0.49 to-addresses=\
    10.0.2.15 to-ports=40024-41023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.49" \
    out-interface=ether1 protocol=udp src-address=100.64.0.49 to-addresses=\
    10.0.2.15 to-ports=40024-41023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.50" \
    out-interface=ether1 protocol=tcp src-address=100.64.0.50 to-addresses=\
    10.0.2.15 to-ports=41024-42023
add action=src-nat chain=srcnat comment="cgnat-det 100.64.0.50" \
    out-interface=ether1 protocol=udp src-address=100.64.0.50 to-addresses=\
    10.0.2.15 to-ports=41024-42023
add action=masquerade chain=srcnat comment="cgnat-resto (ping e outros)" \
    out-interface=ether1 src-address=100.64.0.0/24
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
