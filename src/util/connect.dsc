birch_connect:
  type: task
  script:
  - define config <script[birch_config]>

  - stop if:<[config].proc[birch_ERR_CONFIG_MISSING_KEY].context[tokenfile]>

  - ~discordconnect id:birch tokenfile:<[config].data_key[tokenfile]>
  - wait 5s