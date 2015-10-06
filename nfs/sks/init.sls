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
