highstate_run:
  local.state.apply:
    - tgt: {{ data.name }}
    - kwarg:
        test: False
