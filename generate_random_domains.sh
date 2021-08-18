#!/bin/bash
tld[0]="com"
tld[1]="net"
tld[2]="org"
tldsize=${#tld[@]}

cname[0]="canhsat.gov.vn"
cname[1]="congan.gov.vn"
cname[2]="chinhphu.gov.vn"
cname[3]="anninh.gov.vn"
cname[4]="bothongtintruyenthong.gov.vn"
cnamesize=${#cname[@]}

i=0
while true; do
   firstpart=`tr -dc a-z </dev/urandom | head -c 13 ; echo ''`

   tldindex=$(($RANDOM % $tldsize))
   tldval=${tld[$tldindex]}

   cnameindex=$(($RANDOM % $cnamesize))
   cnameval=${cname[$cnameindex]}

   echo $firstpart.$tldval:$cnameval >> domains.txt
   echo $firstpart.$tldval:$cnameval

   i=`expr $i + 1`
   echo $i
done
