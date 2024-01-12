namespace = __name__.split(':')[0]
config_score = f'{namespace}.config'

function ~/unconvert:
    attribute @s generic.max_health modifier remove 15213119-2-2-2-2
    attribute @s generic.armor modifier remove 15213119-2-2-2-2
    attribute @s generic.movement_speed modifier remove 15213119-2-2-2-2
    attribute @s generic.attack_damage modifier remove 15213119-2-2-2-2
    attribute @s generic.knockback_resistance modifier remove 15213119-2-2-2-2
    tag @s remove smithed.entity
    tag @s remove f'{namespace}'
    tag @s remove f'{namespace}.captain'
    tag @s remove f'{namespace}.legendary'
    tag @s remove f'{namespace}.rare'
    tag @s remove f'{namespace}.uncommon'
    tag @s remove f'{namespace}.common'
    tag @s remove f'{namespace}.fake_particles'
    team leave @s


function ~/config:
    function ./config

    function ~/default:
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
        for name, value in config_dict.items():
            scoreboard players set name config_score value

    function ~/swift_spawn:
        config_dict = {
            ".cool_down":         1,
            ".spawn_chance":      1000,
            ".notify_on_spawn":   0,
            ".notify_with_sound": 0,
            ".should_glow":       1,
            ".beam_on_spawn":     1,
            ".block_area":        0,
            ".exists_for":        0,

            ".weight_common":     50,
            ".weight_uncommon":   30,
            ".weight_rare":       9,
            ".weight_legendary":  2,
        }
        for name, value in config_dict.items():
            scoreboard players set name config_score value
    
    function ~/only_legendary:
        config_dict = {
            ".cool_down":         60,
            ".spawn_chance":      10,
            ".notify_on_spawn":   2,
            ".notify_with_sound": 1,
            ".should_glow":       0,
            ".beam_on_spawn":     1,
            ".block_area":        12000,
            ".exists_for":        6000,

            ".weight_common":     0,
            ".weight_uncommon":   0,
            ".weight_rare":       0,
            ".weight_legendary":  2,
        }
        for name, value in config_dict.items():
            scoreboard players set name config_score value


function ~/convert:
    function ~/common:
        tag @s add f'{namespace}.fake_particles'
        function ./convert/common
        schedule function ~/ 2t replace
    function ~/uncommon:
        tag @s add f'{namespace}.fake_particles'
        function ./convert/uncommon
        schedule function ~/ 2t replace
    function ~/rare:
        tag @s add f'{namespace}.fake_particles'
        function ./convert/rare
        schedule function ~/ 2t replace
    function ~/legendary:
        tag @s add f'{namespace}.fake_particles'
        function ./convert/legendary
        schedule function ~/ 2t replace
    function ~/none:
        function ~/../unconvert


function ./zzz/fake_particles:
    as @a[tag=f'{namespace}.fake_particles'] function ./particles/as_captain
    if entity @a[tag=f'{namespace}.fake_particles', limit=1] schedule function ~/ 2t replace
