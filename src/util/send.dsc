birch_send:
  type: task
  definitions: bridge|msg
  script:
  - ~discordmessage id:birch channel:<server.flag[birch_bridge_channel]> <[msg]>