when DNS_REQUEST {
  set ttl 3600
  set fqdn [DNS::question name]
  set cname [class match -value $fqdn ends_with rpzdomains]
  if {$cname ne ""} {
    DNS::answer insert "[DNS::question name]. $ttl IN CNAME $cname"
    DNS::return
  }
}
