include:
  - boto

r53_a_record:
  boto_route53.present:
    - name: {{ grains.id }}
    - value: {{ grains.ip4_interfaces['eth0'][0] }}
    - zone: {{ grains.domain }}.
    - ttl: 300
    - record_type: A
    - profile: ugns_aws_profile

{% set ipv6_addr = grains.ip6_interfaces['eth0'][0] -%}
{% if not (ipv6_addr|string).startswith('fe80') -%}
r53_aaaa_record:
  boto_route53.present:
    - name: {{ grains.id }}
    - value: {{ ipv6_addr }}
    - zone: {{ grains.domain }}.
    - ttl: 300
    - record_type: AAAA
    - profile: ugns_aws_profile
{% endif -%}
