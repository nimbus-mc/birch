birch_channel:
  type: procedure
  definitions: config|key
  script:
  - determine <[config].proc[birch_group].channel[<[config].data_key[<[key]>].get[channel]>]>