highstate_run:
  local.state.apply:
    - tgt: {{ data['id'] }}
    - ret: hipchat
