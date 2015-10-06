{% set pkgs = salt['pillar.get']('base:pkgs', {}) -%}
{% if pkgs %}
base_packages:
  pkg.installed:
    - pkgs:
{% for pkg in pkgs %}
      - {{ pkg }}
{% endfor %}
{% endif %}
