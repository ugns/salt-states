base:
  '*':
    - users
    - github
    - salt.minion

  'salt01.undergrid.net':
    - salt.master
    - salt.formulas

  'os:Debian':
    - match: grain
    - repos.apt
