{% if salt['pillar.get']('users.active') %}
{% for name, user in pillar['users.active'].iteritems() %}
{{ name }}:
  user:
    - present
    - fullname: {{ user['fullname'] }}
{% if 'uid' in user %}
    - uid: {{ user['uid'] }}
{% endif %}
    - gid_from_name: True
{% if 'password' in user %}
    - password: {{ user['password'] }}
{% if 'enforce_password' in user %}
    - enforce_password: {{ user['enforce_password'] }}
{% endif %}
{% endif %}
{% if 'home' in user %}
    - home: {{ user['home'] }}
{% endif %}
{% if 'shell' in user %}
    - shell: {{ user['shell'] }}
{% endif %}
{% if 'expire' in user %}
    - expire: {{ user['expire'] }}
{% endif %}
{% if 'groups' in user %}
    - groups: {{ user['groups'] }}
{% endif %}
{% if 'admin' in user and user['admin'] %}
    - optional_groups:
      - root
{% endif %}

{% if 'key.pub' in user and user['key.pub'] %}
{{ name }}_key.pub:
  ssh_auth:
    - present
    - user: {{ name }}
    - source: salt://users/{{ name }}/keys/key.pub
{% endif %}
{% endfor %}
{% endif %}

{% if salt['pillar.get']('users.retired') %}
{% for name, user in pillar['users.retired'].iteritems() %}
{{ name }}:
  user:
    - absent
    - purge: True
    - force: True
{% endfor %}
{% endif %}
