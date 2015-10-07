homegw_check:
  schedule.present:
    - function: state.sls
    - seconds: 3600
    - args:
      - route53.homegw
    - kwargs:
      - test: False
    - enabled: True
    - maxrunning: 1
    - returner: hipchat
