birch_bridge_gate:
  type: task
  definitions: action
  script:
  - run birch_send "defmap:<map.with[bridge].as[<script[birch_config].data_key[bridge]>].with[msg].as[**<player.name> <[action]> the game**]>"

birch_bridge:
  type: world
  events:
    #| SERVER-SIDE
    after player chats server_flagged:birch_enabled:
    - define bridge <script[birch_config].data_key[bridge]>
    - run birch_send defmap:<map.with[bridge].as[<[bridge]>].with[msg].as[<player.proc[<[bridge].get[format].get[server]>].context[<context.message>]>]>
    after player joins server_flagged:birch_enabled:
    - run birch_bridge_gate def:joined
    after player quits server_flagged:birch_enabled:
    - run birch_bridge_gate def:left

    #| DISCORD-SIDE
    after discord message received server_flagged:birch_enabled for:birch:
    - stop if:<server.online_players.is_empty>
    - define bridge <script[birch_config].data_key[bridge]>

    - if !<context.new_message.author.is_bot> && <context.channel.id> == <server.flag[birch_bridge_channel].id>:
      - narrate targets:<server.online_players> <context.new_message.author.proc[<[bridge].get[format].get[discord]>].context[<context.new_message.text>]>