highstate_run:
  local.state.apply:
    - tgt: {{ data['id'] }}
    - kwarg:
        test: False
