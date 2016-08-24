highstate_run:
  local.state.highstate:
    - tgt: {{ data.name }}
    - kwarg:
        test: False

notify_slack:
  local.slack.post_message:
    - tgt: {{ data.name }}
    - arg:
      - 'automation'
      - "Highstate ran on {{ data.name }}"
      - 'SaltStack'
      - {{ salt['pillar.get']('salt:returners:slack:api_key') }}
    - kwargs:
      - test: False
