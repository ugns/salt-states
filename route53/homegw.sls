{% set ipinfo = salt['http.query']('https://ipinfo.io/ip', text=True)['text'].replace('\n','') %}
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

secure_org_a_record:
  boto_route53.present:
    - name: secure.vistalakehoa.org
    - value: {{ ipinfo }}
    - zone: vistalakehoa.org.
    - ttl: 300
    - record_type: A
    - profile: ugns_aws_profile
