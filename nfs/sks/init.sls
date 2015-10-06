nfs_sks_mountpoint:
  file.directory:
    - name: /srv/sks

nfs_sks_keydump:
  cmd.run:
    - name: wget -q -r -np -nd -A pgp http://ftp.prato.linux.it/pub/keyring/dump-latest/ -e robots=off
    - cwd: /srv/sks
    - unless: test -f sks-dump-0000.pgp
    - require:
      - file: nfs_sks_mountpoint

nfs_sks_keydump_cleanup:
  cmd.run:
    - name: find -mtime +7 -type f -exec rm {} \;
    - cwd: /srv/sks
    - onlyif: test -f sks-dump-0000.pgp
    - require:
      - file: nfs_sks_mountpount
    - require_in:
      = cmd: nfs_sks_keydump
