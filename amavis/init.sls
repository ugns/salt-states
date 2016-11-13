amavisd:
  pkg.installed:
    - name: amavisd-new

  service.running:
    - name: amavis
    - enable: True
    - sig: amavisd-new
    - require:
      - pkg: amavisd
