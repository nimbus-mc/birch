birch:
  type: world
  events:
    after server start:
    - inject birch_connect
    - inject birch_load
    after reload scripts:
    - inject birch_load