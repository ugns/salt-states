{% set ext_ip_addrs = salt['cmd.run']('curl -s https://ipinfo.io/ip') %}
boto_pkg:
  pkg.installed:
    - name: python-boto

curl_pkg:
  pkg.installed:
    - name: curl

secure_net_a_record:
  boto_route53.present:
    - name: secure.undergrid.net
    - value: {{ ext_ip_addrs }}
    - zone: undergrid.net.
    - ttl: 300
    - record_type: A
    - profile: ugns_aws_profile

secure_com_a_record:
  boto_route53.present:
    - name: secure.undergrid.com
    - value: {{ ext_ip_addrs }}
    - zone: undergrid.com.
    - ttl: 300
    - record_type: A
    - profile: ugns_aws_profile

