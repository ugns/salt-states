{% set install_path = '/usr/local/share/speedcomplainer' %}
speedcomplainer_repo:
  git.latest:
    - name: https://github.com/UGNS/speedcomplainer.git
    - rev: master
    - target: {{ install_path }}
    - force_reset: True

speedcomplainer_venv:
  virtualenv.managed:
    - name: {{ install_path }}
    - requirements: {{ install_path }}/requirements.txt

speedcomplainer_init:
  file.managed:
    - name: /etc/init.d/speedcomplainer
    - source: salt://{{ slspath }}/files/init
    - mode: 755
    - template: jinja
    - context:
        venv_path: {{ install_path }}
