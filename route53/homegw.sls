{% set ipinfo = salt['cmd.run']('/usr/bin/curl -s http://ipinfo.io/') %}
boto_pkg:
  pkg.installed:
    - name: python-boto

test_output:
  cmd.run:
    - name: echo {{ ipinfo|yaml }}
{#
secure_net_a_record:
  boto_route53.present:
    - name: secure.undergrid.net
    - value: {{ ipinfo['ip'] }}
    - zone: undergrid.net.
    - ttl: 300
    - record_type: A
    - profile: ugns_aws_profile

secure_com_a_record:
  boto_route53.present:
    - name: secure.undergrid.com
    - value: {{ ipinfo['ip'] }}
    - zone: undergrid.com.
    - ttl: 300
    - record_type: A
    - profile: ugns_aws_profile
#}
