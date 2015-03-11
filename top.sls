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

  'os:Debian':
    - match: grain
    - repos.apt
