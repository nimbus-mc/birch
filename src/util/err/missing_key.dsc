birch_ERR_MISSING_KEY:
  type: procedure
  definitions: bool|map|key
  script:
  - determine "<[bool].proc[birch_ERR_VALUE].context[<[map]> is missing '<aqua><[key]><&r>' key]>"