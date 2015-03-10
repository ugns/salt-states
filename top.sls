base:
  '*':
    - users
    - github
    - salt.minion
    - ntp.ng

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
