{% for username, user in salt['pillar.get']('users.active', {}).iteritems() %}
{{ username }}:
  user:
    - present
    - fullname: {{ user['fullname'] }}
    - uid: {{ user.get('uid', '') }}
    - gid_from_name: True
    - password: {{ user.get('password', '') }}
    - enforce_password: {{ user.get('enforce_password', False) }}
    - home: {{ user.get('home', '') }}
    - shell: {{ user.get('shell', '') }}
    - expire: {{ user.get('expire', '') }}
    - groups:
      {% for group in user.get('groups', []) %}
      - {{ group }}
      {% endfor %}
      {% if user['admin'] is defined and user['admin'] %}
      - root
      {%- endif %}

  {% if user['pub_ssh_keys'] is defined %}
  ssh_auth.present:
    - user: {{ username }}
    - names:
      {% for pub_ssh_key in user.get('pub_ssh_keys', []) %}
      - {{ pub_ssh_key }}
      {% endfor %}
    - require:
      - user: {{ username }}
  {% endif %}
{% endfor %}

{% for username, user in salt['pillar.get']('users.retired', {}).iteritems() %}
{{ username }}:
  user.absent:
    {% if user %}
    - purge: {{ user.get('purge', False) }}
    - force: {{ user.get('force', False) }}
    {% endif %}
{% endfor %}
