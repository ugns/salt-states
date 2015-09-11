# vim: sts=2:ts=2:et:ai
drop.cidr:
  cmd.run:
    - name: wget -q -nd --output-document=- http://www.spamhaus.org/drop/drop.lasso |awk '/; SBL/ {printf("%s\tREJECT %s\n",$1,$3)}' > /etc/postfix/drop.cidr

bogon_networks.cidr:
  cmd.run:
    - name:  wget -q -nd --output-document=- http://www.cymru.com/Documents/bogon-bn-agg.txt |awk '{printf("%s\tREJECT IP address of MX host is in bogon netspace\n",$1)}' > /etc/postfix/bogon_networks.cidr
