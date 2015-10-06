include:
  - nfs.mount

sksnfs:
  host.present:
    - ip:
{% for server, addrs in salt['mine.get']('nfs:sks', 'internal_ip_addr', expr_form='grain').items() %}
      - {{ addrs[0] }}
{% endfor %}
    - require_in:
      - mount: /var/lib/sks/dump
