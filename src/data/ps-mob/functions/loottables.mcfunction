#> This function only exists to create the loot tables using bolt
namespace = __name__.split(':')[0]

def item(item, funcs):
    funcs.append({"function":"minecraft:set_lore",
        "lore": [{ "text": "MobCaptains",
                    "color": "blue",
                    "italic": "false"}]})
    return {
        "type": "minecraft:item",
        "name": f'minecraft:{item}',
        "functions": funcs,
    }

def enchantments(*enchantments):
    enchs = {}
    for id, lvl in zip(enchantments[::2], enchantments[1::2]):
        if type(lvl) == tuple:
            enchs[f'minecraft:{id}'] = { "min": lvl[0], "max": lvl[1] }
        else:
            enchs[f'minecraft:{id}'] = lvl
    return {"function": "minecraft:set_enchantments", "enchantments": enchs}

def nbt(nbt):
    return { "function": "minecraft:set_nbt", "tag": nbt }

def name(name, color):
    return { "function": "minecraft:set_name", "name": {
        "text": name,
        "color": color,
        "italic": "false"}}

# //////////////////////////////////////////////// #

loot_table ./overworld/common {
    "pools": [{ "rolls": 1, "entries": [
        item('potion', [
            name('Medkit', '#ff45f6'),
            nbt('{CustomPotionEffects:[{Id:10,Amplifier:4b,Duration:240}]}'),
            {"function": "minecraft:set_potion", "id": "minecraft:strong_healing"},
        ]),
        item('shield', [
            name('Riot Shield', '#2c348f'),
            nbt('{BlockEntityTag:{Patterns:[{Pattern:"gru",Color:9},{Pattern:"hhb",Color:8},{Pattern:"ms",Color:7},{Pattern:"bo",Color:7}],Base:0}}'),
            enchantments('unbreaking', (3,5), 'protection', (2,4)),
        ]),
        item('stick', [
            name('Knockback Stick', '#ff9d00'),
            enchantments('knockback', (2,4))
        ]),
        item('golden_axe', [
            name('Greed', '#d99307'),
            enchantments('looting', (1,4))
        ]),
        item('leather_helmet', [
            name('Propeller Hat', '#00ff00'),
            enchantments('feather_falling', (1,4))
            nbt('{display:{color:16711680}}')
        ]),
        item('golden_chestplate', [
            name('Cactus', '#30de00'),
            enchantments('thorns', (1,5))
        ]),
        item('wooden_sword', [
            name('Match', '#c23511'),
            enchantments('fire_aspect', (1,4))
        ]),
        item('crossbow', [
            name('Multiplier', '#96ffcb'),
            enchantments('piercing', (1,4), 'multishot', 1)
        ]),
        item('iron_axe', [
            name('Mjölnir', '#fff291'),
            enchantments('smite', (2,5))
        ]),
        item('stone_axe', [
            name('Primitive Chainsaw', '#383130'),
            enchantments('efficiency', (3,6))
        ]),
        item('golden_pickaxe', [
            name('Primitive Mining Drill', '#756e6c'),
            enchantments('efficiency', (3,6))
        ]),
    ]}]}

loot_table ./overworld/uncommon {
    "pools": [{ "rolls": 1, "entries": [
        item('golden_chestplate', [
            name('S.W.A.T. Vest', '#997932'),
            enchantments('binding_curse', 1, 'protection', (4,7)),
        ]),
        item('iron_horse_armor', [
            name('Tough Horse Armor', '#995f32'),
            enchantments('binding_curse', 1, 'protection', (4,7)),
        ]),
        item('iron_boots', [
            name('Long Fall Boots', '#44d3e3'),
            enchantments('feather_falling', (5,6)),
        ]),
        item('golden_leggings', [
            name('S.W.A.T. Pants', '#997932'),
            enchantments('binding_curse', 1, 'protection', (4,7)),
        ]),
        item('chainmail_boots', [
            name('Soul Stepper', '#45b3cc'),
            enchantments('soul_speed', (4,5), 'unbreaking', 2),
        ]),
        item('diamond_boots', [
            name('Winter Flippers', '#abedeb'),
            enchantments('frost_walker', (1,2), 'depth_strider', (1,3)),
        ]),
        item('turtle_helmet', [
            name('Diving Helmet', '#21ff55'),
            enchantments('respiration', (2,4), 'depth_strider', (1,3)),
        ]),
        item('chainmail_chestplate', [
            name('Bulletproof Vest', '#edc266'),
            enchantments('projectile_protection', (4,6)),
        ]),
        item('iron_sword', [
            name('Apocalypse', '#d90000'),
            enchantments('sharpness', (1,5), 'smite', (1,5)),
        ]),
    ]}]}

loot_table ./overworld/rare {
    "pools": [{ "rolls": 1, "entries": [
        item('trident', [
            name('Ripper', '#470854'),
            enchantments('riptide', (3,5)),
        ]),
        item('totem_of_undying', [
            name('Lucky Charm', '#81d600'),
            enchantments('protection', 1),
            {"function": "minecraft:set_attributes", "modifiers": [{"attribute": "minecraft:generic.luck", "name": "ps-mob.lucky_charm", "amount": 1, "operation": "addition", "id": "42600878-6e02-419a-97b4-695e8e4e3e14", "slot": "mainhand"}]},
        ]),
        item('netherite_hoe', [
            name('Reaper\'s Scythe', '#21000d'),
            enchantments('sharpness', (3,6), 'vanishing_curse', 1),
        ]),
        item('trident', [
            name('Poseidon\'s Trident', '#006653'),
            enchantments('sharpness', (2,5)),
        ]),
        item('bow', [
            name('Cornucopia', '#d4a715'),
            enchantments('looting', (1,4)),
        ]),
        item('totem_of_undying', [
            name('Y.O.L.O.', '#960019'),
            enchantments('vanishing_curse', 1),
        ]),
    ]}]}

loot_table ./overworld/legendary {
    "pools": [{ "rolls": 1, "entries": [
        item('elytra', [
            name('Plated Elytra', '#ccbdf0'),
            enchantments('protection', (2,4)),
        ]),
        item('diamond_chestplate', [
            name('Immortal', '#ff9ee5'),
            enchantments('protection', (2,4), 'blast_protection', (2,4), 'projectile_protection', (2,4), 'fire_protection', (2,4)),
        ]),
        item('bow', [
            name('Robin\'s Bow', '#49db00'),
            enchantments('mending', 1, 'infinity', 1),
        ]),
    ]}]}
