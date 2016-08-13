{% if grains.os == 'Debian' and 'laptop' in grains.roles %}
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
{% endif %}

{% if grains.os == 'Debian' %}
backports-repo:
  pkgrepo:
    - managed
    - name: deb http://ftp.debian.org/debian/ {{ grains.oscodename|lower }}-backports main
    - dist: {{ grains.oscodename|lower }}-backports
    - comps: main,contrib,non-free
    - file: /etc/apt/sources.list.d/backports.list
    - refresh_db: True
{% endif %}
