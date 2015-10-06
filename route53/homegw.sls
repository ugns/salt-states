{% set ipinfo = salt['pillar.get']('my_real_ip', '127.0.0.1') %}
boto_pkg:
  pkg.installed:
    - name: python-boto

secure_net_a_record:
  boto_route53.present:
    - name: secure.undergrid.net
    - value: {{ ipinfo }}
    - zone: undergrid.net.
    - ttl: 300
    - record_type: A
    - profile: ugns_aws_profile

secure_com_a_record:
  boto_route53.present:
    - name: secure.undergrid.com
    - value: {{ ipinfo }}
    - zone: undergrid.com.
    - ttl: 300
    - record_type: A
    - profile: ugns_aws_profile

