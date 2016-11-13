clamav:
  pkg.installed:
    - name: clamav-daemon

  service.running:
    - name: clamav-daemon
    - enable: True
    - sig: clamd
    - require:
      - pkg: clamav
