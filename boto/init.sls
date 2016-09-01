include:
  - pip

boto:
  pkg.purged:
    - name: python-boto

  pip.installed:
    - name: boto
    - reload_modules: True
    - require:
      - pkg: boto
