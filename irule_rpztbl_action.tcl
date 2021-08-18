when DNS_REQUEST {
set ttl 3600
set fqdn [DNS::question name]
set tbllook [table lookup -subtable rpztbl $fqdn]
  if {$tbllook ne ""} {
    DNS::answer insert "[DNS::question name]. $ttl IN CNAME $tbllook"
    DNS::return
  }
}
