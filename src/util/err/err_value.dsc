birch_ERR_VALUE:
  type: procedure
  definitions: bool|err
  script:
  - if <[bool]>:
    - debug error <[err]>
    - determine true
  - determine false