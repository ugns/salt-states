homegw_check:
  schedule.present:
    - function: state.sls
    - hours: 4
    - args:
      - route53.homegw
    - kwargs:
      - test: False
    - enabled: True
    - maxrunning: 1
