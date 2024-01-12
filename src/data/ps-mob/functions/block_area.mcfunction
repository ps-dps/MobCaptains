namespace = __name__.split(':')[0]

function ~/add:
    tag @s add f'{namespace}.block_area'
    raw f'$execute store result score @s {namespace}.block_area run schedule function {namespace}:block_area/remove $(time) append'

function ~/remove:
    store result score .gametime ps-mob run time query gametime

    as @e[tag=f'{namespace}.block_area',type=marker]
        if score @s f'{namespace}.block_area' <= .gametime ps-mob
        kill @s
