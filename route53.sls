r53_a_record:
  boto_route53.present:
    - name: {{ grains.id }}
    - value: {{ grains.ip_interfaces['eth0'][0] }}
    - zone: {{ grains.domain }}.
    - ttl: 300
    - record_type: A
    - profile: ugns_aws_profile

{% set ip6addrs = salt['network.ipaddrs6']('eth0') %}
{% if ip6addrs[1] is defined %}
r53_aaaa_record:
  boto_route53.present:
    - name: {{ grains.id }}
    - value: {{ ip6addrs[0] }}
    - zone: {{ grains.domain }}.
    - ttl: 300
    - record_type: AAAA
    - profile: ugns_aws_profile
{% endif %}