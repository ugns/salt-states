{% set pkgs in salt['pillar.get']('base:pkgs', {}) -%}
{% if pkgs -%}
base_packages:
  pkg.installed:
    - pkgs:
{% for pkg in pkgs|dictsort -%}
      - {{ pkg }}
{% endfor -%}
{% endif -%}
