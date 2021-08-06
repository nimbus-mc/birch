birch_ERR_CONFIG_MISSING_KEY:
  type: procedure
  definitions: config|key
  script:
  - determine "<[config].list_keys.contains[<[key]>].not.proc[birch_ERR_MISSING_KEY].context[Birch config|<[key]>]>"

birch_ERR_CONFIG_MAP_MISSING_KEY:
  type: procedure
  definitions: map|name|key
  script:
  - determine "<[map].contains[<[key]>].not.if_null[true].proc[birch_ERR_MISSING_KEY].context[Birch config key '<aqua><[name]><&r>'|<[key]>]>"