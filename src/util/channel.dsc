birch_channel:
  type: procedure
  definitions: bridge
  script:
  - debug log <[bridge]>
  - determine <discord[birch].group[<[bridge].get[group]>].channel[<[bridge].get[channel]>]>