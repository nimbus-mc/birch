birch_bridge:
  type: world
  events:
    after player chats:
    - if <server.flag[birch_enabled].if_null[false]>:
      - define bridge <script[birch_config].data_key[bridge]>
      - run birch_send defmap:<map.with[bridge].as[<[bridge]>].with[msg].as[<player.proc[<[bridge].get[format].get[server]>].context[<context.message>]>]>
    after discord message received for:birch:
    - if <server.flag[birch_enabled].if_null[false]>:
      - define bridge <script[birch_config].data_key[bridge]>

      - if !<context.new_message.author.is_bot> && <context.channel.id> == <server.flag[birch_bridge_channel].id>:
        - narrate targets:<server.online_players> <context.new_message.author.proc[<[bridge].get[format].get[discord]>].context[<context.new_message.text>]>