issue_authorized:
  file.managed:
    - name: /etc/issue.authorized
    - contents_pillar: issue
    - user: root
    - group: root
    - mode: 0644
