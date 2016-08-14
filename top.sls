# vim: sts=2:ts=2:et:ai
base:

# Debian Servers
  'G@os:Debian':
    - repos.apt
    - salt.pkgrepo

# Linux Servers
  'G@kernel:linux':
    - salt.minion
    - ntp.ng
    - postfix.config
    - fail2ban.config
    - fail2ban.blacklist
    - users
    - sudoers
    - openssh.config
    - github
    - basepkgs
    - snmp.conf

# Exclude Vagrant environment
  'G@kernel:linux and not G@environment:vagrant':
    - grains

# All external servers
  'G@domain:undergrid.net':
    - route53
    - duo.login

# Salt Servers
  'G@roles:salt:*':
    - salt.formulas

  'G@roles:salt:master':
    - salt.master

  'G@roles:salt:syndic':
    - salt.syndic

# Mail Servers
  'G@roles:mail:*':
    - duo.login

  'G@roles:mail:mx':
    - postfix.antispam

# Nginx Servers
  'G@roles:nginx:lb':
    - duo.login
    - nginx.ng

# Database Servers
  'G@roles:database:*':
    - duo.login

# Key Servers
  'G@roles:sks:*':
    - duo.login
    - sks
    - nfs.sks.mount

  'G@roles:sks:frontend':
    - cert
    - nginx.ng
    - sks.nginx

  'G@roles:nfs:sks':
    - nfs.sks

# Apache Servers
  'G@roles:apache:*':
    - duo.login
    - apache.debian_full
    - apache.modules
    - apache.mod_php5

# SpeedComplainer
  'G@roles:speedcomplainer':
    - github
    - speedcomplainer
