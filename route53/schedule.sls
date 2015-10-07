homegw_check:
  schedule.present:
    - function: state.sls
    - hours: 4
    - job_args:
      - route53.homegw
    - job_kwargs:
      - test: False
    - enabled: True
    - maxrunning: 1
    - returner: hipchat
