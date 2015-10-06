{% set sks_mp_dir = "/srv/sks" %}
nfs_sks_mountpoint:
  file.directory:
    - name: {{ sks_mp_dir }}

nfs_sks_keydump:
  cmd.run:
    - name: wget -q -r -np -nd -A pgp http://ftp.prato.linux.it/pub/keyring/dump-latest/ -e robots=off
    - cwd: {{ sks_mp_dir }}
    - creates: {{ sks_mp_dir }}/sks-dump-0000.pgp
    - require:
      - file: nfs_sks_mountpoint

nfs_sks_keydump_cleanup:
  cmd.run:
    - name: find -mtime +7 -type f -exec rm {} \;
    - cwd: {{ sks_mp_dir }}
    - require_in:
      - cmd: nfs_sks_keydump

