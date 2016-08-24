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
    - kwargs:
      - test: False
