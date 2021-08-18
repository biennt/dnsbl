#!/bin/bash
input="sample_domains.txt"
while IFS= read -r line
do
  fqdn=`echo $line | cut -d ':' -f 1`
  dig $fqdn
done < "$input"
