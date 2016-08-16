{% set install_path = salt['pillar.get']('speedcomplainer:install_path') %}
speedcomplainer:
  git.latest:
    - name: https://github.com/UGNS/speedcomplainer.git
    - rev: master
    - target: {{ install_path }}
    - force_reset: True
    - force_fetch: True
    - watch_in:
      - service: speedcomplainer

  virtualenv.managed:
    - name: {{ install_path }}
    - requirements: {{ install_path }}/requirements.txt
    - require:
      - git: speedcomplainer

  service.running:
    - enable: True
    - require:
      - file: speedcomplainer_config
      - file: speedcomplainer_init
    - order: last

speedcomplainer_init:
  file.managed:
    {% if grains.init == 'systemd' -%}
    - name: /etc/systemd/system/speedcomplainer.service
    - source: salt://{{ slspath }}/files/systemd
    - mode: 644
    {% else -%}
    - name: /etc/init.d/speedcomplainer
    - source: salt://{{ slspath }}/files/init
    - mode: 755
    {% endif -%}
    - template: jinja
    - context:
        venv_path: {{ install_path }}
    - require:
      - virtualenv: speedcomplainer

speedcomplainer_config:
  file.managed:
    - name: {{ install_path }}/config.json
    - source: salt://{{ slspath }}/files/config.json
    - mode: 600
    - template: jinja
    - context:
        config: {{ salt['pillar.get']('speedcomplainer:config', {}) }}
    - require:
      - git: speedcomplainer
    - watch_in:
      - service: speedcomplainer