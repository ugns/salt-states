clear_minion_cache:
  runner.cache.clear_all:
    - tgt: {{ data.id }}
