birch_load:
  type: task
  script:
  # Reset enabled flag
  - flag server birch_enabled:!

  # Check config
  - define config <script[birch_config]>

  - foreach <list[group|bridge]> as:key:
    - stop if:<[config].proc[birch_ERR_CONFIG_MISSING_KEY].context[<[key]>]>

  # Check bridge key
  - define bridge <[config].data_key[bridge]>

  - foreach <list[channel|format]> as:key:
    - stop if:<[bridge].proc[birch_ERR_CONFIG_MAP_MISSING_KEY].context[bridge|<[key]>]>

  # Check format key
  - define format <[bridge].get[format]>

  # Check script validity
  - foreach <list[discord|server]> as:key:
    - stop if:<[format].proc[birch_ERR_CONFIG_MAP_MISSING_KEY].context[format|<[key]>]>
    - stop if:<[format].get[<[key]>].proc[birch_ERR_INVALID_SCRIPT]>

  # Set discord flags
  - flag server birch_group:<[config].proc[birch_group]>
  - flag server birch_bridge_channel:<[config].proc[birch_channel].context[bridge]>
  #- flag server birch_auth_channel:

  # Set enabled flag
  - flag server birch_enabled:true

  # Send startup message
  - if <[bridge].contains[startup]>:
    - run birch_send defmap:<map.with[bridge].as[<[bridge]>].with[msg].as[<[bridge].get[startup].parsed>]>