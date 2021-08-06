birch:
  type: world
  events:
    after server start:
    - ~run birch_connect
    - ~run birch_load
    after reload scripts:
    - ~run birch_load