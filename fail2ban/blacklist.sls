# vim: sts=2:ts=2:et:ai
/etc/fail2ban/ip.blacklist:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - contents_pillar: ip:blacklist
