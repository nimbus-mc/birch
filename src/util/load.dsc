birch_load:
  type: task
  script:
  # Reset enabled flag
  - flag server birch_enabled:false

  # Check config
  - define config <script[birch_config]>

  - stop if:<[config].proc[birch_ERR_CONFIG_MISSING_KEY].context[bridge]>

  # Check bridge key
  - define bridge <[config].data_key[bridge]>

  - foreach <list[group|channel|format]> as:key:
    - stop if:<[bridge].proc[birch_ERR_CONFIG_MAP_MISSING_KEY].context[bridge|<[key]>]>

  # Check format key
  - define format <[bridge].get[format]>

  # Check script validity
  - foreach <list[discord|server]> as:key:
    - stop if:<[format].proc[birch_ERR_CONFIG_MAP_MISSING_KEY].context[format|<[key]>]>
    - stop if:<[format].get[<[key]>].proc[birch_ERR_INVALID_SCRIPT]>

  # Send startup message
  - if <[bridge].contains[startup]>:
    - debug log <[bridge].get[group]>
    - run birch_send defmap:<map.with[bridge].as[<[bridge]>].with[msg].as[<[bridge].get[startup].parsed>]>

  # Set enabled flag
  - flag server birch_enabled:true