homegw_check:
  schedule.present:
    - function: state.sls
    - hours: 4
    - splay:
      - start: 10
      - stop: 20
    - args:
      - route53.homegw
    - kwargs:
      - test: False
    - enabled: True
    - maxrunning: 1
