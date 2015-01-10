{% for name, user in salt['pillar.get']('users.active', {}).iteritems() %}
{{ name }}:
  user:
    - present
    - fullname: {{ user['fullname'] }}
{% if user['uid'] is defined %}
    - uid: {{ user['uid'] }}
{% endif %}
    - gid_from_name: True
{% if user['password'] is defined %}
    - password: {{ user['password'] }}
{% if user['enforce_password'] is defined %}
    - enforce_password: {{ user['enforce_password'] }}
{% endif %}
{% endif %}
{% if user['home'] is defined %}
    - home: {{ user['home'] }}
{% endif %}
{% if user['shell'] is defined %}
    - shell: {{ user['shell'] }}
{% endif %}
{% if user['expire'] is defined %}
    - expire: {{ user['expire'] }}
{% endif %}
{% if user['groups'] is defined %}
    - groups: {{ user['groups'] }}
{% endif %}
{% if user['admin'] is defined and user['admin'] %}
    - optional_groups:
      - root
{% endif %}

{% if user['key.pub'] is defined and user['key.pub'] %}
{{ name }}_key.pub:
  ssh_auth:
    - present
    - user: {{ name }}
    - source: salt://users/{{ name }}/keys/key.pub
{% endif %}
{% endfor %}

{% for name, user in salt['pillar.get']('users.retired', {}).iteritems() %}
{{ name }}:
  user:
    - absent
    - purge: True
    - force: True
{% endfor %}
