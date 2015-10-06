base_packages:
  pkg.installed:
    - pkgs:
{% for pkg in salt['pillar.get']('base:pkgs', {}) -%}
      - {{ pkg }}
{% endfor -%}
