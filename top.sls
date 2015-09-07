# vim: sts=2:ts=2:et:ai
base:
  '*':
    - salt.minion
    - grains
    - ntp.ng
    - postfix.config
    - fail2ban.config
    - fail2ban.blacklist
    - users
    - sudoers
    - openssh.config
    - github

  'server_type:salt':
    - match: grain
    - salt.formulas

  'server_role:salt_master':
    - match: grain
    - salt.master

  'server_role:salt_syndic':
    - match: grain
    - salt.syndic

  'server_type:web':
    - match: grain
    - apache.debian_full
    - apache.modules
    - apache.mod_php5

  'os:Debian':
    - match: grain
    - repos.apt
