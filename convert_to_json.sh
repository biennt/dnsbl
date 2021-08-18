#!/bin/bash
cat << EOF
{
    "kind": "tm:ltm:data-group:internal:internalstate",
    "name": "rpzdomains",
    "fullPath": "rpzdomains",
    "type": "string",
    "records": [
EOF

input="sample_domains.txt"
while IFS= read -r line
do
  fqdn=`echo $line | cut -d ':' -f 1`
  cname=`echo $line | cut -d ':' -f 2`
  echo "    {"
  echo "      \"name\": \"$fqdn\"",
  echo "      \"data\": \"$cname\""
  echo "    },"

done < "$input"

cat << EOF
    ]
}
EOF
