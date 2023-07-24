namespace = __name__.split(':')[0]
config_score = f'{namespace}.config'

function ~/check_mob:
    if score .cool_down namespace matches 1.. return -1
    scoreboard players add .failure namespace 1
    unless predicate ./should_spawn return -1
    unless predicate ./per_faliure return -1

    scoreboard players operation #random namespace *= #rand_a namespace
    scoreboard players operation #random namespace += #rand_c namespace
    scoreboard players operation .rand% namespace = #random namespace
    scoreboard players operation .rand% namespace %= .weight_max namespace

    if score .rand% namespace <= .weight_common config_score function ./convert/common
    scoreboard players operation .rand% namespace -= .weight_common config_score
    if score .rand% namespace matches ..-1 return -1

    if score .rand% namespace <= .weight_uncommon config_score function ./convert/uncommon
    scoreboard players operation .rand% namespace -= .weight_uncommon config_score
    if score .rand% namespace matches ..-1 return -1

    if score .rand% namespace <= .weight_rare config_score function ./convert/rare
    scoreboard players operation .rand% namespace -= .weight_rare config_score
    if score .rand% namespace matches ..-1 return -1

    if score .rand% namespace <= .weight_legendary config_score function ./convert/legendary

predicate ./per_failure {
    "condition": "minecraft:inverted", "term": {
        "condition": "minecraft:value_check", "value": {
            "min": 0,
            "max": { "type": "minecraft:score", "target": {
                "type": "minecraft:fixed",
                "name": ".faliure" },
                "score": namespace }},
        "range": 0 }
    }

predicate ./should_spawn {
    "condition": "minecraft:value_check", "value": {
        "min": 1,
        "max": 1000 },
    "range": {
        "min": 1,
        "max": {
            "type": "minecraft:score", "target": { "type": "minecraft:fixed",
                "name": ".spawn_chance" },
        "score": config_score }
    }}
