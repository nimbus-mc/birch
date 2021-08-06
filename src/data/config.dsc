birch_config:
  type: data
  enabled: true
  tokenfile: data/tokenfile.txt
  group: Project Chi
  bridge:
    channel: test
    startup: Server reloaded! (<util.time_now.format>)
    format:
      discord: birch_format_discord
      server: birch_format_server

birch_format_discord:
  type: procedure
  definitions: user|msg
  script:
  - determine "<[user].name> <&gt> <[msg]>"

birch_format_server:
  type: procedure
  definitions: player|msg
  script:
  - determine "**<[player].name>**: <[msg]>"