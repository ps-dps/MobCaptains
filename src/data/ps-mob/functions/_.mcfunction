
function ~/unconvert:
    attribute @s generic.max_health modifier remove 15213119-2-2-2-2
    attribute @s generic.armor modifier remove 15213119-2-2-2-2
    attribute @s generic.movement_speed modifier remove 15213119-2-2-2-2
    attribute @s generic.attack_damage modifier remove 15213119-2-2-2-2
    attribute @s generic.knockback_resistance modifier remove 15213119-2-2-2-2
    tag @s remove smithed.entity
    tag @s remove ps-mob
    tag @s remove ps-mob.captain
    tag @s remove ps-mob.legendary
    tag @s remove ps-mob.rare
    tag @s remove ps-mob.uncommon
    tag @s remove ps-mob.common
    team leave @s
