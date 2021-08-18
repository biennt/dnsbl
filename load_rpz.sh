#!/bin/bash
curl "http://192.168.40.2/delete"
input="sample_domains.txt"
while IFS= read -r line
do
  fqdn=`echo $line | cut -d ':' -f 1`
  cname=`echo $line | cut -d ':' -f 2`
  curl "http://192.168.40.2/insert?fqdn=$fqdn&cname=$cname"
  curl "http://192.168.40.2/count"
done < "$input"
