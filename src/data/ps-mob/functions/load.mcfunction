from ./particles import circle

namespace = __name__.split(':')[0]
config_score = f'{namespace}.config'

append function_tag load:load {"values":[f'{namespace}:load']}

scoreboard objectives add namespace dummy
scoreboard objectives add config_score dummy [{"text":"M","color":"white"},{"text":"o","color":"#FF0000"},{"text":"b C","color":"white"},{"text":"a","color":"#FF0000"},{"text":"ptains ","color":"white"},{"text":"Config","color":"gold"}]
scoreboard objectives add f'{namespace}.block_area' dummy
scoreboard objectives add f'{namespace}.persistence' dummy

config_dict = {
    ".cool_down":         60,
    ".spawn_chance":      10,
    ".notify_on_spawn":   2,
    ".notify_with_sound": 1,
    ".should_glow":       0,
    ".beam_on_spawn":     1,
    ".block_area":        12000,
    ".exists_for":        6000,

    ".weight_common":     50,
    ".weight_uncommon":   30,
    ".weight_rare":       9,
    ".weight_legendary":  2,
}
team_dict = {
    "common":    "gray",
    "uncommon":  "green",
    "rare":      "dark_purple",
    "legendary": "gold",
}

for name, value in config_dict.items():
    unless score name config_score = name config_score
        scoreboard players set name config_score value
for name, value in team_dict.items():
    team add f'{namespace}.{name}'
    team modify f'{namespace}.{name}' color value

scoreboard players operation .weight_max namespace = .weight_common config_score
scoreboard players operation .weight_max namespace += .weight_uncommon config_score
scoreboard players operation .weight_max namespace += .weight_rare config_score
scoreboard players operation .weight_max namespace += .weight_legendary config_score

unless score #random namespace = #random namespace store result score #random namespace run seed
unless score #rand_a namespace = #rand_a namespace scoreboard players set #rand_a namespace 1234567
unless score #rand_c namespace = #rand_c namespace scoreboard players set #rand_c namespace 1234567

store result storage ps:mob block_area.time int 1 run scoreboard players get .block_area config_score

store result storage ps:mob persistence.time int 1 run scoreboard players get .exists_for config_score

schedule function ./particles/tick_2t 2t replace:
    schedule function ./particles/tick_2t 2t replace
    as @e[type=f'#{namespace}:captains',tag=f'{namespace}.captain'] at @s run function ./particles/as_captain:
        if entity @s[tag=f'{namespace}.common'] run function ./particles/common:
            circle(1, 15, "dust 1 1 1 1", offset=(0,0.1,0))
            circle(2, 30, "dust 1 1 1 1", offset=(0,0.1,0))
        if entity @s[tag=f'{namespace}.uncommon'] run function ./particles/uncommon:
            circle(1, 15, "dust 0 1 0 1", offset=(0,0.1,0))
            circle(2, 30, "dust 0 1 0 1", offset=(0,0.1,0))
        if entity @s[tag=f'{namespace}.rare'] run function ./particles/rare:
            circle(1, 15, "dust 0.7 0 1 1", offset=(0,0.1,0))
            circle(2, 30, "dust 0.7 0 1 1", offset=(0,0.1,0))
        if entity @s[tag=f'{namespace}.legendary'] run function ./particles/legendary:
            circle(1, 15, "dust 10 10 10 1", offset=(0,0.1,0))
            circle(2, 30, "dust 10 10 10 1", offset=(0,0.1,0))
        anchored eyes positioned ^ ^ ^ run function ./particles/head:
            circle(0.25, 5, "soul_fire_flame", "out", 0.03, movement_offset=(0,2,0), offset=(0,0.8,0))
            circle(0.25, 5, "flame", "out", 0.13, offset=(0,0.8,0))


schedule function ./register/tick_1s 1s replace:
    schedule function ./register/tick_1s 1s replace
    if score .cool_down namespace matches 1.. scoreboard players remove .cool_down namespace 1
    unless score .cool_down namespace matches 1.. as @e[type=f'#{namespace}:captains',tag=!namespace,tag=!smithed.entity] function ./register/check_mob
    tag @e[type=f'#{namespace}:captains',tag=!namespace,tag=!smithed.entity] add namespace
