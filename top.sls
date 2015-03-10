base:
  '*':
    - users
    - github
    - salt.minion
    - ntp.ng

  'salt01.undergrid.net':
    - salt.master
    - salt.formulas

  'os:Debian':
    - match: grain
    - repos.apt
