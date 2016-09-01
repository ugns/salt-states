boto_pkg:
  pkg.purged:
    - name: python-boto

  pip.installed:
    - name: python-boto
    - require:
      - pkg: boto_pkg

r53_a_record:
  boto_route53.present:
    - name: {{ grains.id }}
    - value: {{ grains.ip4_interfaces['eth0'][0] }}
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

