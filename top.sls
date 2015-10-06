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

# Salt Servers
  'G@roles:salt:*':
    - duo.login
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

# VPN Servers
  'G@roles:vpn:*':
    - duo.login

# Apache Servers
  'G@roles:apache:*':
    - duo.login
    - apache.debian_full
    - apache.modules
    - apache.mod_php5

# Debian Servers
  'G@os:Debian':
    - repos.apt
