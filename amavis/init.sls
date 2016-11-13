amavisd:
  pkg.installed:
    - name: amavisd-new

  service.running:
    - name: amavis
    - require:
      - pkg: amavisd
