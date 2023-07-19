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
    scoreboard players add .rand% namespace 1

    if score .rand% namespace <= .weight_common config_score function ./convert/common
    scoreboard players operation .rand% namespace -= .weight_common config_score

    if score .rand% namespace <= .weight_uncommon config_score function ./convert/uncommon
    scoreboard players operation .rand% namespace -= .weight_uncommon config_score

    if score .rand% namespace <= .weight_rare config_score function ./convert/rare
    scoreboard players operation .rand% namespace -= .weight_rare config_score

    if score .rand% namespace <= .weight_legendary config_score function ./convert/legendary
