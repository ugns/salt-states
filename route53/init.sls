boto_pkg:
  pkg.installed:
    - name: python-boto

r53_a_record:
  boto_route53.present:
    - name: {{ grains.id }}
    - value: {{ grains.ip_interfaces['eth0'][0] }}
    - zone: {{ grains.domain }}.
    - ttl: 300
    - record_type: A
    - profile: ugns_aws_profile

#r53_aaaa_record:
#  boto_route53.present:
#    - name: {{ grains.id }}
#    - value: {{ grains.ip6_interfaces['eth0'][0] }}
#    - zone: {{ grains.domain }}.
#    - ttl: 300
#    - record_type: AAAA
#    - profile: ugns_aws_profile

