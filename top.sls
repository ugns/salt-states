# vim: sts=2:ts=2:et:ai
base:

# Debian Servers
  'G@os:Debian':
    - repos.apt

# Raspberry Pi Servers
  'G@cpuarch:armv7l and G@os:Raspbian':
    - match: compound
    - raspberrypi

# Exclude Vagrant environment
  'G@kernel:linux and not G@environment:vagrant':
    - grains

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
    - base.pkgs
    - base.issue
    - snmp.conf

# All external servers
  'G@domain:undergrid.net':
    - route53
    - duo.login

# Salt Servers
  'G@roles:salt:*':
    - salt.formulas
    - salt.gitfs.keys

  'G@roles:salt:master':
    - cert
    - salt.master
    - salt.cloud

  'G@roles:salt:syndic':
    - salt.syndic

# Mail Servers
  # 'G@roles:mail:*':

  'G@roles:mail:mx':
    - postfix.antispam

# Nginx Servers
  'G@roles:nginx:lb':
    - nginx.ng

# # Database Servers
#   'G@roles:database:*':

# Key Servers
  'G@roles:sks:*':
    - sks.config

  'G@roles:sks:frontend':
    - cert
    - nginx.ng
    - sks.nginx

# Apache Servers
  'G@roles:apache:*':
    - apache.debian_full
    - apache.modules
    - apache.mod_php5

# SpeedComplainer
  'G@roles:speedcomplainer':
    - github
    - speedcomplainer
