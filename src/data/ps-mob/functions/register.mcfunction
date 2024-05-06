namespace = __name__.split(':')[0]
config_score = f'{namespace}.config'

function ~/check_mob:
    if score .cool_down namespace matches 1.. return 0
    scoreboard players add .failure namespace 1
    at @s if entity @e[type=marker,limit=1,distance=..24,tag=f'{namespace}.block_area'] return 0
    unless predicate ./should_spawn return 0

    function ~/../random with storage ps:mob random

    if score #random namespace <= .weight_common config_score function ./convert/common
    scoreboard players operation #random namespace -= .weight_common config_score
    if score #random namespace matches ..0 return 1
    
    if score #random namespace <= .weight_uncommon config_score function ./convert/uncommon
    scoreboard players operation #random namespace -= .weight_uncommon config_score
    if score #random namespace matches ..0 return 1
    
    if score #random namespace <= .weight_rare config_score function ./convert/rare
    scoreboard players operation #random namespace -= .weight_rare config_score
    if score #random namespace matches ..0 return 1
    
    if score #random namespace <= .weight_legendary config_score function ./convert/legendary

function ~/random:
    raw f'$execute store result score #random {namespace} run random value 1..$(max)'

predicate ./should_spawn {
    "condition": "minecraft:value_check", "value": {
        "min": 1,
        "max": 1000 },
    "range": {
        "min": 0,
        "max": {
            "type": "minecraft:score", "target": { "type": "minecraft:fixed",
                "name": ".spawn_chance" },
        "score": config_score }
    }}
