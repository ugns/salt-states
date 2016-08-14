# vim: sts=2:ts=2:et:ai
{% set nginx = salt['pillar.get']('sks:nginx', {
    'conf_dir': '/etc/nginx/conf.d',
    'pool': 'sks_servers',
    'balancer': 'least_conn',
    'port': 11371,
    'tgt': 'roles:sks:backend',
    'fun': 'internal_ip_addrs',
    'expr_form': 'grain',
}) %}
{% set config = [] %}
{% set upstream = [] %}
{% do upstream.append({nginx.balancer: ''}) %}
{% for addrs in salt['network.ip_addrs']('lo', include_loopback=True) %}
{%   do upstream.append({'server': addrs ~ ':' ~ nginx.port}) %}
{% endfor %}
{% for server, addrs in salt['mine.get'](nginx.tgt, nginx.fun, expr_form=nginx.expr_form).items() %}
{%   do upstream.append({'server': addrs[0] ~ ':' ~ nginx.port}) %}
{% endfor %}
{% do config.append({'upstream ' ~ nginx.pool: upstream}) %}
nginx_conf_{{ nginx.pool}}:
  file.managed:
    - name: {{ nginx.conf_dir }}/{{ nginx.pool }}.conf
    - source: salt://nginx/ng/files/vhost.conf
    - template: jinja
    - context:
        config: {{ config|json }}

