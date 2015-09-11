# vim: sts=2:ts=2:et:ai
drop.cidr:
  cmd.run:
    - name: wget -q -nd --output-document=- http://www.spamhaus.org/drop/drop.lasso |awk '/; SBL/ {printf("%s\tREJECT %s\n",$1,$3)}' > /etc/postfix/drop.cidr

bogon_networks.cidr:
  cmd.run:
    - name:  wget -q -nd --output-document=- http://www.cymru.com/Documents/bogon-bn-agg.txt |awk '{printf("%s\tREJECT IP address of MX host is in bogon netspace\n",$1)}' > /etc/postfix/bogon_networks.cidr
    - creates: /etc/postfix/bogon_networks.cidr

sender_access:
  file.managed:
    - name: /etc/postfix/sender_access
    - source: salt://{{ slspath }}/files/sender_access

header_checks:
  file.managed:
    - name: /etc/postfix/sender_access
    - source: salt://{{ slspath }}/files/sender_access

archive_mappings:
  file.managed:
    - name: /etc/postfix/archive_mappings
    - source: salt://{{ slspath }}/files/archive_mappings

archive_mappings.db:
  cmd.wait:
    - name: postmap hash:/etc/postfix/archive_mappings
    - watch:
      - file: archive_mappings
