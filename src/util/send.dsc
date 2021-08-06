birch_send:
  type: task
  definitions: bridge|msg
  script:
  - ~discordmessage id:birch channel:<[bridge].proc[birch_channel]> <[msg]>