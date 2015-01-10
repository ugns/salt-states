base:
  '*':
    - users
    - github

  'os:Debian':
    - match: grain
    - repos.apt
