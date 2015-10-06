r53_a_record:
  boto_route53.present:
    - name: {{ grains.id }}
    - value: {{ grains.ip_interfaces['eth0'][0] }}
    - zone: {{ grains.domain }}.
    - ttl: 300
    - record_type: A
    - profile: ugns_aws_profile

{% set ipaddrs6 = salt['network.ipaddrs6']('eth0') %}
{% if ipaddrs6|length > 1 %}
r53_aaaa_record:
  boto_route53.present:
    - name: {{ grains.id }}
    - value: {{ ipaddrs6[0] }}
    - zone: {{ grains.domain }}.
    - ttl: 300
    - record_type: A
    - profile: ugns_aws_profile
{% endif %}
