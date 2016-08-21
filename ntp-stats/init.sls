{% set ntp_stats = salt['pillar.get']('ntp-stats', {} ) -%}
{% set basepath = ntp_stats.get('basepath', '/srv/ntp-stats/') -%}
{% set ntp_user = ntp_stats.get('user', 'ntp') -%}

ntp-stats-graph:
  archive.extracted:
    - name: {{ basepath }}
    - source: https://www.davidov.net/download/ntp/ntp-stat-graphs.tar.gz
    - source_hash: https://www.davidov.net/download/ntp/ntp-stat-graphs.tar.gz.md5
    - archive_format: tar
    - user: {{ ntp_user }}
    - if_missing: {{ basepath }}/README

ntp-stats-dependencies:
  pkg.installed:
    - pkgs:
      - gnuplot
      - optipng
      - libdatetime-format-epoch-perl

{% for script in ['offsets', 'stats'] -%}
{% if 'host' in ntp_stats -%}
ntp-{{ script }}-host:
  file.replace:
    - name: {{ basepath }}ntp-{{ script }}.sh
    - pattern: |
        ^HOST=\S+
    - repl: |
        HOST={{ ntp_stats.get('host') }}
    - count: 1
    - backup: False
{% endif -%}

{% if 'log_dir' in ntp_stats -%}
ntp-{{ script }}-logs:
  file.replace:
    - name: {{ basepath }}ntp-{{ script }}.sh
    - pattern: |
        ^LOG_DIR=\S+
    - repl: |
        LOG_DIR={{ ntp_stats.get('log_dir') }}
    - count: 1
    - backup: False
{% endif -%}


{% if 'www_location' in ntp_stats -%}
ntp-{{ script }}-www:
  file.replace:
    - name: {{ basepath }}ntp-{{ script }}.sh
    - pattern: |
        ^WWW_LOCATION="\S+"
    - repl: |
        WWW_LOCATION="{{ ntp_stats.get('www_location') }}"
    - count: 1
    - backup: False
{% endif -%}
{% endfor -%}
