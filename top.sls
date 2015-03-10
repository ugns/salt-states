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

  'os:Debian':
    - match: grain
    - repos.apt
