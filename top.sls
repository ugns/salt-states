# vim: sts=2:ts=2:et:ai
base:
  '*':
    - grains
    - users
    - github
    - salt.minion
    - ntp.ng
    - postfix.config

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
    - apache.rewrite
    - apache.php5

  'os:Debian':
    - match: grain
    - repos.apt
