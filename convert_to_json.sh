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
nitem=`wc -l sample_domains.txt | cut -d ' ' -f 1`
i=1
while IFS= read -r line
do
  fqdn=`echo $line | cut -d ':' -f 1`
  cname=`echo $line | cut -d ':' -f 2`
  echo "        {"
  echo "          \"name\": \"$fqdn\"",
  echo "          \"data\": \"$cname\""
  i=`expr $i + 1`
  if [ $i -gt $nitem ]; then
    echo "        }"
  else
    echo "        },"
  fi
done < "$input"

cat << EOF
    ]
}
EOF
