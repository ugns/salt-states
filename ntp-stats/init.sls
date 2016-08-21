{% set ntp_stats = salt['pillar.get']('ntp-stats', {} ) -%}
{% set basepath = ntp_stats.get('basepath', '/srv/ntp-stats/') -%}

ntp-stats-graph:
  archive.extracted:
    - name: {{ basepath }}
    - source: https://www.davidov.net/download/ntp/ntp-stat-graphs.tar.gz
    - source_hash: https://www.davidov.net/download/ntp/ntp-stat-graphs.tar.gz.md5
    - archive_format: tar
    - user: ntp
    - group: ntp
    - if_missing: {{ basepath }}

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
        ^HOST=.*$
    - repl: |
        HOST={{ ntp_stats.get('host') }}\n
    - count: 1
{% endif -%}

{% if 'log_dir' in ntp_stats -%}
ntp-{{ script }}-logs:
  file.replace:
    - name: {{ basepath }}ntp-{{ script }}.sh
    - pattern: |
        ^LOG_DIR=.*$
    - repl: |
        LOG_DIR={{ ntp_stats.get('log_dir') }}\n
    - count: 1
{% endif -%}


{% if 'www_location' in ntp_stats -%}
ntp-{{ script }}-www:
  file.replace:
    - name: {{ basepath }}ntp-{{ script }}.sh
    - pattern: |
        ^LOCATION=.*$
    - repl: |
        WWW_LOCATION="{{ ntp_stats.get('www_location') }}"\n
    - count: 1
{% endif -%}
{% endfor -%}
