namespace = __name__.split(':')[0]
config_score = f'{namespace}.config'

function ~/captain:
    if score .should_glow config_score matches 1 effect give @s glowing 1000000 0 true
    tag @s add smithed.entity
    tag @s add f'{namespace}.captain'
    scoreboard players reset #try namespace
    scoreboard players reset .failure namespace
    scoreboard players operation .cool_down namespace = .cool_down config_score
    store result entity @s Health float 1 attribute @s minecraft:generic.max_health get
    at @s summon marker function ./block_area/add with storage ps:mob block_area

function ~/common:
    attribute @s minecraft:generic.max_health modifier add 15213119-2-2-2-2 f'{namespace}.max_health' 0.5 multiply
    attribute @s minecraft:generic.armor modifier add 15213119-2-2-2-2 f'{namespace}.armor' 2 add
    attribute @s minecraft:generic.movement_speed modifier add 15213119-2-2-2-2 f'{namespace}.movement_speed' 0.15 multiply
    attribute @s minecraft:generic.attack_damage modifier add 15213119-2-2-2-2 f'{namespace}.attack_damage' 0.7 multiply
    attribute @s minecraft:generic.knockback_resistance modifier add 15213119-2-2-2-2 f'{namespace}.knockback_resistance' 0.03 add
    tag @s add f'{namespace}.common'
    team join f'{namespace}.common' @s
    data modify entity @s DeathLootTable set value "ps-mob:captain/common"
    if score .notify_on_spawn config_score matches 4.. at @s run tellraw @a[distance=..128] ["", {"text": "\u2620", "color": "gray"}, {"text": " A ", "color": "white"}, {"text": "common Mob Captain", "color": "gray"}, {"text": " has spawned nearby!", "color": "white"}]
    if score .notify_on_spawn config_score matches 4.. if score .notify_with_sound config_score matches 1 at @s run playsound entity.wither.spawn ambient @a[distance=..128] ~ ~ ~ 0.5 1.8 0.5
    if score .beam_on_spawn config_score matches 1 at @s run particle dust 1 1 1 5 ~ ~ ~ 0 200 0 0 300 force
    function ~/../captain

function ~/uncommon:
    attribute @s minecraft:generic.max_health modifier add 15213119-2-2-2-2 f'{namespace}.max_health' 0.9 multiply
    attribute @s minecraft:generic.armor modifier add 15213119-2-2-2-2 f'{namespace}.armor' 4 add
    attribute @s minecraft:generic.movement_speed modifier add 15213119-2-2-2-2 f'{namespace}.movement_speed' 0.25 multiply
    attribute @s minecraft:generic.attack_damage modifier add 15213119-2-2-2-2 f'{namespace}.attack_damage' 1.2 multiply
    attribute @s minecraft:generic.knockback_resistance modifier add 15213119-2-2-2-2 f'{namespace}.knockback_resistance' 0.1 add
    tag @s add f'{namespace}.uncommon'
    team join f'{namespace}.uncommon' @s
    data modify entity @s DeathLootTable set value "ps-mob:captain/uncommon"
    if score .notify_on_spawn config_score matches 3.. at @s run tellraw @a[distance=..128] ["", {"text": "\u2620", "color": "#00FF00"}, {"text": " An ", "color": "white"}, {"text": "uncommon Mob Captain", "color": "#00FF00"}, {"text": " has spawned nearby!", "color": "white"}]
    if score .notify_on_spawn config_score matches 3.. if score .notify_with_sound config_score matches 1 at @s run playsound entity.wither.spawn ambient @a[distance=..128] ~ ~ ~ 0.5 1.8 0.5
    if score .beam_on_spawn config_score matches 1 at @s run particle dust 0 1 0 5 ~ ~ ~ 0 200 0 0 300 force
    function ~/../captain

function ~/rare:
    attribute @s minecraft:generic.max_health modifier add 15213119-2-2-2-2 f'{namespace}.max_health' 1.8 multiply
    attribute @s minecraft:generic.armor modifier add 15213119-2-2-2-2 f'{namespace}.armor' 8 add
    attribute @s minecraft:generic.movement_speed modifier add 15213119-2-2-2-2 f'{namespace}.movement_speed' 0.4 multiply
    attribute @s minecraft:generic.attack_damage modifier add 15213119-2-2-2-2 f'{namespace}.attack_damage' 2.1 multiply
    attribute @s minecraft:generic.knockback_resistance modifier add 15213119-2-2-2-2 f'{namespace}.knockback_resistance' 0.5 add
    tag @s add f'{namespace}.rare'
    team join f'{namespace}.rare' @s
    data modify entity @s DeathLootTable set value "ps-mob:captain/rare"
    if score .notify_on_spawn config_score matches 2.. at @s run tellraw @a[distance=..128] ["", {"text": "\u2620", "color": "#B400FF"}, {"text": " A ", "color": "white"}, {"text": "rare Mob Captain", "color": "#B400FF"}, {"text": " has spawned nearby!", "color": "white"}]
    if score .notify_on_spawn config_score matches 2.. if score .notify_with_sound config_score matches 1 at @s run playsound entity.wither.spawn ambient @a[distance=..128] ~ ~ ~ 0.5 1.8 0.5
    if score .beam_on_spawn config_score matches 1 at @s run particle dust 0.7 0 1 5 ~ ~ ~ 0 200 0 0 300 force
    function ~/../captain

function ~/legendary:
    attribute @s minecraft:generic.max_health modifier add 15213119-2-2-2-2 f'{namespace}.max_health' 2.7 multiply
    attribute @s minecraft:generic.armor modifier add 15213119-2-2-2-2 f'{namespace}.armor' 15 add
    attribute @s minecraft:generic.movement_speed modifier add 15213119-2-2-2-2 f'{namespace}.movement_speed' 0.8 multiply
    attribute @s minecraft:generic.attack_damage modifier add 15213119-2-2-2-2 f'{namespace}.attack_damage' 3 multiply
    attribute @s minecraft:generic.knockback_resistance modifier add 15213119-2-2-2-2 f'{namespace}.knockback_resistance' 1 add
    tag @s add f'{namespace}.legendary'
    team join f'{namespace}.legendary' @s
    data modify entity @s DeathLootTable set value "ps-mob:captain/legendary"
    if score .notify_on_spawn config_score matches 1.. at @s run tellraw @a[distance=..128] ["", {"text": "\u2620", "color": "red"}, {"text": " A ", "color": "white"}, {"text": "l", "color": "#ff5151"}, {"text": "e", "color": "#ffb74d"}, {"text": "g", "color": "#ffff87"}, {"text": "e", "color": "#51ff51"}, {"text": "n", "color": "#4d4dff"}, {"text": "d", "color": "#9933cc"}, {"text": "a", "color": "#cc66cc"}, {"text": "r", "color": "#cc00cc"}, {"text": "y", "color": "#ff87ff"}, {"text": " Mob Captain", "color": "red"}, {"text": " has spawned nearby!", "color": "white"}]
    if score .notify_on_spawn config_score matches 1.. if score .notify_with_sound config_score matches 1 at @s run playsound entity.wither.spawn ambient @a[distance=..128] ~ ~ ~ 0.5 1.8 0.5
    if score .beam_on_spawn config_score matches 1 at @s run particle dust 10 10 10 5 ~ ~ ~ 0 200 0 0 300 force
    function ~/../captain
