{% set dist = grains['oscodename'] %}

saltstack-repo:
  pkgrepo:
    - managed
    - name: deb http://debian.saltstack.com/debian {{ dist }}-saltstack main
    - dist: {{ dist }}-saltstack
    - comps: main
    - file: /etc/apt/sources.list.d/saltstack.list
    - key_url: http://debian.saltstack.com/debian-salt-team-joehealy.gpg.key
    - refresh_db: True

google-chrome-repo:
  pkgrepo:
    - managed
    - disabled: True
    - name: deb http://dl.google.com/linux/chrome/deb/ stable main
    - dist: stable
    - comps: main
    - file: /etc/apt/sources.list.d/google-chrome.list
    - keyid: 7FAC5991
    - keyserver: pool.sks-keyservers.net
    - refresh_db: True

backports-repo:
  pkgrepo:
    - managed
    - name: deb http://ftp.debian.org/debian/ {{ dist }}-backports main
    - dist: {{ dist }}-backports
    - comps: main,contrib,non-free
    - file: /etc/apt/sources.list.d/backports.list
    - refresh_db: True
