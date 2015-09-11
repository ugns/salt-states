# vim: sts=2:ts=2:et:ai
drop.cidr:
  cmd.run:
    - name: wget -q -nd --output-document=- http://www.spamhaus.org/drop/drop.lasso |awk '/; SBL/ {printf("%s\tREJECT %s\n",$1,$3)}' > /etc/postfix/drop.cidr
