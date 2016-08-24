highstate_run:
  local.state.highstate:
    - tgt: {{ data.name }}
    - kwarg:
        test: False
