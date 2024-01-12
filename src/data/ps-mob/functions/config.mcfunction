namespace = __name__.split(':')[0]
config_score = f'{namespace}.config'

def to_config(name, fakeplayer, from_to, is_range, description):

    if is_range:
        range = f'[{from_to[0]} to {from_to[1]}]'
    else:
        range = f'[{from_to[0]} or {from_to[1]}]'

    return [
        { "text": "\n" },
        { "text": f'{name} ',
            "clickEvent": {
                "action": "suggest_command",
                "value": f'/scoreboard players set {fakeplayer} {config_score} ' },
            "hoverEvent": {
                "action": "show_text",
                "contents": description }},
        { "text": range, "color": "gray" },
        { "text": " " },
        { "score": {
                "name": fakeplayer,
                "objective": config_score },
            "color": "red" }
    ]

config = ["", { "text": "\n" }, {"text":"M","color":"white"},{"text":"o","color":"#FF0000"},{"text":"b C","color":"white"},{"text":"a","color":"#FF0000"},{"text":"ptains ","color":"white"},{"text":"Config","color":"gold"}]

config.extend(to_config(
    "Cool down", ".cool_down", (0, 2147483647), True,
    "The time, in seconds, to stop trying to spawn a captain after successfully spawning one" ))
config.extend(to_config(
    "Spawn chance", ".spawn_chance", (0, 1000), True,
    "The maximum chance, that a mob becomes a Mob Captain, with 1 being 0.1% and 1000 being 100%" ))
config.extend(to_config(
    "Notify on spawn", ".notify_on_spawn", (0, 4), True,
    "What rarity of Mob Captain is announced to chat, with 0 being for none, 1 only for legendaries and 4 being for all rarities of Mob Captain" ))
config.extend(to_config(
    "Notify with sound", ".notify_with_sound", (0, 1), False,
    "If a Mob Captain is announced to chat, a sound to all nearby players will play, with 0 being disabled and 1 being enabled" ))
config.extend(to_config(
    "Should glow", ".should_glow", (0, 1), False,
    "If a Mob Captain's silhouette should show through blocks, with 0 being disabled and 1 being enabled" ))
config.extend(to_config(
    "Beam on spawn", ".beam_on_spawn", (0, 1), False,
    "If Mob Captains should create a particle beam when spawning that shows their location for about 1 second, with 1 being turned on and 0 it being turned off" ))
config.extend(to_config(
    "Block Area", ".block_area", (0, 2147483647), True,
    "How long should Mob Captain spawning be stopped within 24 blocks of another Mob Captain spawning in ticks, so 20 -> 1 Second, 1200 -> 1 Minute, 12000 -> 10 Minutes" ))
config.extend(to_config(
    "Weight common", ".weight_common", (0, 2147483647), True,
    "Weight for a Mob Captain being of common rarity" ))
config.extend(to_config(
    "Weight uncommon", ".weight_uncommon", (0, 2147483647), True,
    "Weight for a Mob Captain being of uncommon rarity" ))
config.extend(to_config(
    "Weight rare", ".weight_rare", (0, 2147483647), True,
    "Weight for a Mob Captain being of rare rarity" ))
config.extend(to_config(
    "Weight legendary", ".weight_legendary", (0, 2147483647), True,
    "Weight for a Mob Captain being of legendary rarity" ))

config.extend([
    { "text": "\n\nYou need to run " },
    { "text": "/reload",
        "clickEvent": {
            "action": "run_command",
            "value": f'/reload' },
        "hoverEvent": {
            "action": "show_text",
            "contents": "Click to run the /reload command" },
    "color": "red" },
    { "text": " for some of the changes to take effect" },
])

tellraw @s config
