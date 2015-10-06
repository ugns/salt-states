{% set pkgs = salt['pillar.get']('base:pkgs', {}).items() -%}
{% if pkgs -%}
base_packages:
  pkg.installed:
    - pkgs:
{% for pkg in pkgs|dictsort -%}
      - {{ pkg }}
{% endfor -%}
{% endif -%}
