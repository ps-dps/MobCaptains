namespace = __name__.split(':')[0]

function ~/add:
    data modify entity @s PersistenceRequired set value 1b
    raw f'$execute store result score @s {namespace}.persistence run schedule function {namespace}:persistence/remove $(time) append'

function ~/remove:
    store result score .gametime ps-mob run time query gametime

    as @e[tag=f'{namespace}.captain',type=f'#{namespace}:captains']
        if score @s f'{namespace}.persistence' <= .gametime ps-mob
        data modify entity @s PersistenceRequired set value 0b
