namespace = __name__.split(':')[0]
config_score = f'{namespace}.config'

function ~/captain:
    if score .should_glow config_score matches 1 effect give @s glowing 1000000 0 true
    tag @s add smithed.entity
    tag @s add f'{namespace}.captain'
    scoreboard players reset .failure namespace
    scoreboard players operation .cool_down namespace = .cool_down config_score
    store result entity @s Health float 1 attribute @s max_health get
    if score .block_area config_score matches 1.. at @s summon marker function ./block_area/add with storage ps:mob block_area
    if score .exists_for config_score matches 1.. function ./persistence/add with storage ps:mob persistence

function ~/common:
    attribute @s max_health modifier add ps-mob:captain 0.5 add_multiplied_total
    attribute @s armor modifier add ps-mob:captain 2 add_value
    attribute @s movement_speed modifier add ps-mob:captain 0.15 add_multiplied_total
    attribute @s attack_damage modifier add ps-mob:captain 0.7 add_multiplied_total
    attribute @s knockback_resistance modifier add ps-mob:captain 0.03 add_value
    tag @s add f'{namespace}.common'
    team join f'{namespace}.common' @s
    data modify entity @s DeathLootTable set value "ps-mob:captain/common"
    if score .notify_on_spawn config_score matches 4.. at @s run tellraw @a[distance=..128] ["", {"text": "\u2620", "color": "gray"}, {"text": " A ", "color": "white"}, {"text": "common Mob Captain", "color": "gray"}, {"text": " has spawned nearby!", "color": "white"}]
    if score .notify_on_spawn config_score matches 4.. if score .notify_with_sound config_score matches 1 at @s run playsound entity.wither.spawn ambient @a[distance=..128] ~ ~ ~ 0.5 1.8 0.5
    if score .beam_on_spawn config_score matches 1 at @s run particle dust{scale:4,color:[1,1,1]} ~ ~ ~ 0 200 0 0 300 force
    function ~/../captain

function ~/uncommon:
    attribute @s max_health modifier add ps-mob:captain 0.9 add_multiplied_total
    attribute @s armor modifier add ps-mob:captain 4 add_value
    attribute @s movement_speed modifier add ps-mob:captain 0.25 add_multiplied_total
    attribute @s attack_damage modifier add ps-mob:captain 1.2 add_multiplied_total
    attribute @s knockback_resistance modifier add ps-mob:captain 0.1 add_value
    tag @s add f'{namespace}.uncommon'
    team join f'{namespace}.uncommon' @s
    data modify entity @s DeathLootTable set value "ps-mob:captain/uncommon"
    if score .notify_on_spawn config_score matches 3.. at @s run tellraw @a[distance=..128] ["", {"text": "\u2620", "color": "#00FF00"}, {"text": " An ", "color": "white"}, {"text": "uncommon Mob Captain", "color": "#00FF00"}, {"text": " has spawned nearby!", "color": "white"}]
    if score .notify_on_spawn config_score matches 3.. if score .notify_with_sound config_score matches 1 at @s run playsound entity.wither.spawn ambient @a[distance=..128] ~ ~ ~ 0.5 1.8 0.5
    if score .beam_on_spawn config_score matches 1 at @s run particle dust{scale:4,color:[0,1,0]} ~ ~ ~ 0 200 0 0 300 force
    function ~/../captain

function ~/rare:
    attribute @s max_health modifier add ps-mob:captain 1.8 add_multiplied_total
    attribute @s armor modifier add ps-mob:captain 8 add_value
    attribute @s movement_speed modifier add ps-mob:captain 0.4 add_multiplied_total
    attribute @s attack_damage modifier add ps-mob:captain 2.1 add_multiplied_total
    attribute @s knockback_resistance modifier add ps-mob:captain 0.5 add_value
    tag @s add f'{namespace}.rare'
    team join f'{namespace}.rare' @s
    data modify entity @s DeathLootTable set value "ps-mob:captain/rare"
    if score .notify_on_spawn config_score matches 2.. at @s run tellraw @a[distance=..128] ["", {"text": "\u2620", "color": "#B400FF"}, {"text": " A ", "color": "white"}, {"text": "rare Mob Captain", "color": "#B400FF"}, {"text": " has spawned nearby!", "color": "white"}]
    if score .notify_on_spawn config_score matches 2.. if score .notify_with_sound config_score matches 1 at @s run playsound entity.wither.spawn ambient @a[distance=..128] ~ ~ ~ 0.5 1.8 0.5
    if score .beam_on_spawn config_score matches 1 at @s run particle dust{scale:4,color:[0.7,0.0,1.0]} ~ ~ ~ 0 200 0 0 300 force
    function ~/../captain

function ~/legendary:
    attribute @s max_health modifier add ps-mob:captain 2.7 add_multiplied_total
    attribute @s armor modifier add ps-mob:captain 15 add_value
    attribute @s movement_speed modifier add ps-mob:captain 0.8 add_multiplied_total
    attribute @s attack_damage modifier add ps-mob:captain 3 add_multiplied_total
    attribute @s knockback_resistance modifier add ps-mob:captain 1 add_value
    tag @s add f'{namespace}.legendary'
    team join f'{namespace}.legendary' @s
    data modify entity @s DeathLootTable set value "ps-mob:captain/legendary"
    if score .notify_on_spawn config_score matches 1.. at @s run tellraw @a[distance=..128] ["", {"text": "\u2620", "color": "red"}, {"text": " A ", "color": "white"}, {"text": "l", "color": "#ff5151"}, {"text": "e", "color": "#ffb74d"}, {"text": "g", "color": "#ffff87"}, {"text": "e", "color": "#51ff51"}, {"text": "n", "color": "#4d4dff"}, {"text": "d", "color": "#9933cc"}, {"text": "a", "color": "#cc66cc"}, {"text": "r", "color": "#cc00cc"}, {"text": "y", "color": "#ff87ff"}, {"text": " Mob Captain", "color": "red"}, {"text": " has spawned nearby!", "color": "white"}]
    if score .notify_on_spawn config_score matches 1.. if score .notify_with_sound config_score matches 1 at @s run playsound entity.wither.spawn ambient @a[distance=..128] ~ ~ ~ 0.5 1.8 0.5
    if score .beam_on_spawn config_score matches 1 at @s run particle dust{scale:4,color:[10,10,10]} ~ ~ ~ 0 200 0 0 300 force
    function ~/../captain
