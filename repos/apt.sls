saltstack-repo:
  pkgrepo:
    - managed
    - name: deb http://repo.saltstack.com/apt/{{ grains.os|lower }}/latest {{ grains.oscodename|lower }} main
    - dist: {{ grains.oscodename|lower }}
    - comps: main
    - file: /etc/apt/sources.list.d/saltstack.list
    - key_url: https://repo.saltstack.com/apt/{{ grains.os|lower }}/latest/SALTSTACK-GPG-KEY.pub
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
    - name: deb http://ftp.debian.org/debian/ {{ grains.oscodename|lower }}-backports main
    - dist: {{ grains.oscodename|lower }}-backports
    - comps: main,contrib,non-free
    - file: /etc/apt/sources.list.d/backports.list
    - refresh_db: True
