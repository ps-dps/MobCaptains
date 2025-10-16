namespace = __name__.split(':')[0]
config_score = f'{namespace}.config'

function ~/unconvert:
    attribute @s max_health modifier remove ps-mob:captain
    attribute @s armor modifier remove ps-mob:captain
    attribute @s movement_speed modifier remove ps-mob:captain
    attribute @s attack_damage modifier remove ps-mob:captain
    attribute @s knockback_resistance modifier remove ps-mob:captain
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
        reload

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
        reload
    
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
        reload


function ~/convert:
    function ~/common:
        function ~/../../unconvert
        tag @s add f'{namespace}.fake_particles'
        function ./convert/common
        schedule function ./zzz/fake_particles 2t replace
    function ~/uncommon:
        function ~/../../unconvert
        tag @s add f'{namespace}.fake_particles'
        function ./convert/uncommon
        schedule function ./zzz/fake_particles 2t replace
    function ~/rare:
        function ~/../../unconvert
        tag @s add f'{namespace}.fake_particles'
        function ./convert/rare
        schedule function ./zzz/fake_particles 2t replace
    function ~/legendary:
        function ~/../../unconvert
        tag @s add f'{namespace}.fake_particles'
        function ./convert/legendary
        schedule function ./zzz/fake_particles 2t replace
    function ~/none:
        function ~/../../unconvert


function ./zzz/fake_particles:
    as @a[tag=f'{namespace}.fake_particles'] at @s function ./particles/as_captain
    if entity @a[tag=f'{namespace}.fake_particles', limit=1] schedule function ~/ 2t replace
