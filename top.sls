base:
  '*':
    - users
    - github
    - salt.minion
    - ntp.ng

  'server_role:salt_master':
    - match: grain
    - salt.master
    - salt.formulas

  'server_role:salt_syndic':
    - match: grain
    - salt.syndic
    - salt.formulas

  'os:Debian':
    - match: grain
    - repos.apt
