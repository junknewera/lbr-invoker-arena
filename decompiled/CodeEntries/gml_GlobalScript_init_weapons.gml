function init_weapons()
{
    init_weapon_types();
    global.shops_prestige_levels.weapons = global.prestige_levels.none;
    global.shops.weapons = 
    {
        hands: new Weapon(
        {
            index: -100,
            name: __("Your Hands"),
            description: __("Pushing away leaves with your bare hands. SO. MUCH. FUN."),
            damage: 1,
            size: 1,
            cost: 
            {
                leaves: 0
            },
            sprite: spr_solid,
            available: true,
            upgrade_material: global.materials.wood
        }),
        leaf_rake: new Weapon(
        {
            index: -50,
            name: __("Small Leaf Rake"),
            description: __("Pushing away leaves with a rake. Guess you're doing it wrong."),
            damage: 2,
            size: 2,
            cost: 
            {
                leaves: 50
            },
            sprite: spr_weapon_leaf_rake,
            upgrade_material: global.materials.mushroom_red
        }),
        leaf_rake_advanced: new Weapon(
        {
            index: -30,
            name: __("Large Leaf Rake"),
            description: __("Better, but it still feels wrong."),
            damage: 4,
            size: 4,
            cost: 
            {
                leaves: 500
            },
            sprite: spr_weapon_leaf_rake_advanced,
            upgrade_material: global.materials.feather
        }),
        leaf_blower: new Weapon(
        {
            index: 30,
            name: __("Leaf Blower"),
            description: __("Hey, this is quite fun!"),
            damage: 6,
            size: 6,
            cost: 
            {
                leaves: 5000
            },
            sprite: spr_weapon_leaf_blower,
            upgrade_material: global.materials.rose
        }),
        leaf_blower_advanced: new Weapon(
        {
            index: 40,
            name: __("Advanced Leaf Blower"),
            description: __("Wheeeeee!"),
            damage: 8,
            size: 8,
            cost: 
            {
                gold: 500
            },
            sprite: spr_weapon_leaf_blower_advanced,
            upgrade_material: global.materials.leather
        }),
        nuclear_leaf_blower: new Weapon(
        {
            index: 50,
            name: __("Nuclear Leaf Blower"),
            description: __("You need to take care not to blow away your house with this tool."),
            damage: 10,
            size: 10,
            cost: 
            {
                gold: 5000
            },
            sprite: spr_weapon_leaf_blower_nuclear,
            upgrade_material: global.materials.batwing
        }),
        airplane_turbine: new Weapon(
        {
            index: 60,
            name: __("Airplane Turbine"),
            description: __("Worth it."),
            damage: 12,
            size: 12,
            cost: 
            {
                platinum: 500
            },
            sprite: spr_weapon_airplane_turbine,
            upgrade_material: global.materials.meteor_rock
        }),
        leaf_powered_leaf_blower: new Weapon(
        {
            index: 70,
            name: __("Leaf Powered Leaf Blower"),
            description: __("A Leaf Blower powered with Leaves. Full Circle."),
            damage: 14,
            size: 14,
            cost: 
            {
                platinum: 5000
            },
            sprite: spr_weapon_leaf_powered_leaf_blower,
            upgrade_material: global.materials.dark_matter
        }),
        paint_roller: new Weapon(
        {
            index: 80,
            name: __("Large Paint Roller"),
            description: __("How does this even work?"),
            damage: 15,
            size: 15,
            cost: 
            {
                bismuth: 500
            },
            sprite: spr_weapon_paint_roller,
            upgrade_material: global.materials.goo
        }),
        rocket_engine: new Weapon(
        {
            index: 90,
            name: __("Rocket Engine"),
            description: __("TOTALLY WORTH IT."),
            damage: 16,
            size: 16,
            cost: 
            {
                cosmic: 500
            },
            sprite: spr_weapon_rocket_engine,
            upgrade_material: global.materials.soul
        }),
        lazer: new Weapon(
        {
            index: 100,
            name: __("Lazer"),
            description: __("The letter Z stands for understatement."),
            damage: 18,
            size: 18,
            cost: 
            {
                void: 500
            },
            sprite: spr_weapon_laser,
            upgrade_material: global.materials.bone
        }),
        alien_turbine: new Weapon(
        {
            index: 110,
            name: __("Alien Turbine"),
            description: __("Where did you get this from?"),
            damage: 20,
            size: 22,
            cost: 
            {
                flask_red: 500
            },
            sprite: spr_weapon_alien_turbine,
            upgrade_material: global.materials.eyeball
        }),
        ace_of_spades: new Weapon(
        {
            index: 120,
            name: __("Ace of Spades"),
            description: __("If you like to blow leaves, I tell you I'm your man. Going with the blow, it's all a game to me."),
            damage: 24,
            size: 24,
            cost: 
            {
                flask_green: 500
            },
            sprite: spr_weapon_ace_of_spades,
            upgrade_material: global.materials.cloud
        }),
        blowfish: new Weapon(
        {
            index: 130,
            name: __("Blowfish"),
            description: __("A BLOWfish... Hahah... Do you get it?"),
            damage: 26,
            size: 26,
            cost: 
            {
                flask_blue: 500
            },
            sprite: spr_weapon_blowfish,
            upgrade_material: global.materials.butterfly
        }),
        gfx_card: new Weapon(
        {
            index: 140,
            name: __("Graphics Card"),
            description: __("An overclocked graphics card with a large fan."),
            damage: 28,
            size: 28,
            cost: 
            {
                flask_magenta: 500
            },
            sprite: spr_weapon_gfx_card,
            upgrade_material: global.materials.mysterious_plant
        }),
        drill: new Weapon(
        {
            index: 150,
            name: __("Drill"),
            description: __("An overclocked drill that you borrowed from your neighbor a few years ago."),
            damage: 30,
            size: 30,
            cost: 
            {
                flask_orange: 500
            },
            sprite: spr_weapon_drill,
            upgrade_material: global.materials.spider_web
        }),
        fan: new Weapon(
        {
            index: 160,
            name: __("Fan"),
            description: __("I'm a total fan of this fan."),
            damage: 32,
            size: 32,
            cost: 
            {
                flask_black: 500
            },
            sprite: spr_weapon_fan,
            upgrade_material: global.materials.ash
        }),
        compressor: new Weapon(
        {
            index: 170,
            name: __("Compressor"),
            description: __("Compressed air is made of the same air you breathe in and out, but more compressed."),
            damage: 34,
            size: 34,
            cost: 
            {
                flask_strange: 500
            },
            sprite: spr_weapon_compressor,
            upgrade_material: global.materials.pumice
        }),
        bellows: new Weapon(
        {
            index: 180,
            name: __("Bellows"),
            description: __("Blow the bellows, blow the leaves!"),
            damage: 36,
            size: 36,
            cost: 
            {
                exotic: 50000000000
            },
            sprite: spr_weapon_bellows,
            upgrade_material: global.materials.battery
        }),
        celestial_blower: new Weapon(
        {
            index: 190,
            name: __("The Celestial Blower"),
            description: __("This leaf blower is not as good as other tools but each Celestial Leaf is worth +50 more."),
            damage: 18,
            size: 12,
            cost: 
            {
                celestial: 50
            },
            sprite: spr_weapon_celestial_blower,
            upgrade_attributes_active: 
            {
                resources_leaf_add: 
                {
                    celestial: 50
                }
            },
            upgrade_material: global.materials.screw
        }),
        drill_ht: new Weapon(
        {
            index: 200,
            name: __("THE HIGHTECH DRILL"),
            description: __("THE HIGHTECH DRILL features high blowing power but lacks blowing range."),
            damage: 512,
            size: 8,
            cost: 
            {
                mythical: 5000000000000
            },
            sprite: spr_weapon_drill_ht,
            upgrade_material: global.materials.oyster
        }),
        sword: new Weapon(
        {
            index: 210,
            name: __("Leaf Sword"),
            description: __("The Leaf Sword makes mulch out of leaves."),
            damage: 0,
            size: 4,
            sprite: spr_weapon_sword,
            can_blow: false,
            can_mulch: true,
            is_sword: true,
            cost: 
            {
                lava: 5000000000000000
            },
            
            is_buyable: function()
            {
                return get_upgrade_count(global.shops.blc.unlock_mulch) > 0;
            },
            
            is_obfuscated: function()
            {
                return get_upgrade_count(global.shops.blc.unlock_mulch) == 0;
            },
            
            upgrade_material: global.materials.moon_dust
        }),
        borb_sword: new Weapon(
        {
            index: 211,
            name: sprintf("%s %s", "Borb", __("Sword")),
            description: __s("Makes delicious juice out of %s. No %s get hurt.", "Borbs", "Borbs"),
            damage: 0,
            size: 4,
            sprite: spr_weapon_borb_sword,
            can_blow: false,
            can_juice: true,
            is_sword: true,
            cost: 
            {
                borbs: 100000
            },
            upgrade_material: global.materials.moon_dust
        }),
        carpenters_cup: new Weapon(
        {
            index: 220,
            name: __("Carpenter's Cup"),
            description: __("It doesn't seem to be powerful..."),
            damage: 1,
            size: 1,
            cost: 
            {
                silver_token: 1000,
                gold_token: 42
            },
            sprite: spr_weapon_carpenters_cup,
            upgrade_material: global.materials.bar_copper
        }),
        holy_grail: new Weapon(
        {
            index: 221,
            name: __("The Holy Grail"),
            description: __("It's really The Holy Grail! Increases Silver/Gold Token rewards by +500%, enemy damage +500%, ALB damage by +2500%."),
            damage: 1024,
            size: 8,
            sprite: spr_weapon_holy_grail,
            cost: 
            {
                silver_token: 50000,
                gold_token: 15000
            },
            
            is_buyable: function()
            {
                return get_upgrade_count(global.unique_leaves.holy) > 0;
            },
            
            is_obfuscated: function()
            {
                return get_upgrade_count(global.unique_leaves.holy) == 0;
            },
            
            upgrade_attributes_active: 
            {
                resources_multiplier: 
                {
                    silver_token: 5,
                    gold_token: 5
                },
                blower_enemy_damage_multiplier_global: 5,
                alb_enemy_damage_multiplier: 25
            },
            upgrade_material: global.materials.bar_iron
        }),
        bellows_ht: new Weapon(
        {
            index: 320,
            name: __("THE HIGHTECH BELLOWS"),
            description: __("THE BELLOWS DRILL features both high blowing power and a medium range. It's hightech."),
            damage: 768,
            size: 16,
            cost: 
            {
                sand: 5000000000000000
            },
            sprite: spr_weapon_bellows_ht,
            upgrade_material: global.materials.sand
        }),
        ace_of_spades_ht: new Weapon(
        {
            index: 330,
            name: __("THE HIGHTECH ACE OF SPADES"),
            description: __("You know I'm born to blow, and gambling's for leaves. But that's the way I like it Borb. I don't wanna blow for ever... And dont forget the cheese!"),
            damage: 1024,
            size: 24,
            cost: 
            {
                ancient: 500000000
            },
            sprite: spr_weapon_ace_of_spades_ht,
            upgrade_material: global.materials.scarab
        }),
        strange_blower: new Weapon(
        {
            index: 340,
            name: __("Strange Blower"),
            description: __("A blower held together by flickering neon tape. Once you figure out how to control this thing, it becomes quite useful."),
            damage: 1024,
            inverse: true,
            size: 30,
            cost: 
            {
                water_crystal: 50
            },
            sprite: spr_weapon_strange_leaf_blower,
            upgrade_material: global.materials.tide_crystal_advanced
        }),
        shovel: new Weapon(
        {
            index: 10000,
            name: __("Shovel"),
            description: global.texts.shovel_desc,
            damage: 0,
            size: 3,
            sprite: spr_weapon_shovel,
            action_timeout: sec(6),
            alb_equippable: false,
            can_blow: false,
            can_dig: true,
            dig_count: 1,
            dig_level: 1,
            cost: 
            {
                gold: 50000
            },
            upgrade_material: global.materials.moon_crystal
        }),
        shovel_ht: new Weapon(
        {
            index: 10100,
            name: __("THE HIGHTECH SHOVEL"),
            damage: 0,
            size: 3,
            sprite: spr_weapon_shovel_ht,
            action_timeout: sec(5),
            alb_equippable: false,
            can_blow: false,
            can_dig: true,
            dig_count: 2,
            dig_level: 2,
            cost: 
            {
                mythical: 5000000000000000000000000000000
            },
            upgrade_material: global.materials.moon_crystal
        }),
        shovel_nuclear: new Weapon(
        {
            index: 10200,
            name: __("Nuclear Shovel"),
            damage: 0,
            size: 3,
            sprite: spr_weapon_shovel_nuclear,
            action_timeout: sec(4),
            alb_equippable: false,
            can_blow: false,
            can_dig: true,
            dig_count: 3,
            dig_level: 3,
            cost: 
            {
                moonstone: 1000000000000000000000000000000
            },
            upgrade_material: global.materials.moon_crystal
        }),
        shovel_soul: new Weapon(
        {
            index: 10300,
            name: __("Soul Shovel"),
            description: __s("Can dig %s.", global.resources.soul_particles.name_plural),
            damage: 0,
            size: 3,
            sprite: spr_weapon_shovel_soul,
            action_timeout: sec(3.5),
            alb_equippable: false,
            can_blow: false,
            can_dig: true,
            dig_count: 4,
            dig_level: 4,
            cost: 
            {
                soul_particles: 500
            },
            upgrade_material: global.materials.raw_soul_stone
        }),
        trout: new Weapon(
        {
            index: 20000,
            name: __("Large Trout"),
            description: global.texts.trout_description,
            damage: 5,
            damage_base: 50,
            size: 2,
            scale: 2,
            sprite: spr_weapon_trout,
            action_distance: 64,
            action_timeout: sec(3),
            alb_equippable: false,
            can_damage_enemy: true,
            cost: 
            {
                gold: 2500000
            },
            upgrade_material: global.materials.pearl
        }),
        trout_ht: new Weapon(
        {
            index: 20100,
            name: __("THE HIGHTECH TROUT"),
            damage: 10,
            damage_base: 100,
            size: 2,
            scale: 2,
            sprite: spr_weapon_trout_ht,
            action_distance: 64,
            action_timeout: sec(2),
            alb_equippable: false,
            can_damage_enemy: true,
            cost: 
            {
                mythical: 5000000000000000000000000000000
            },
            upgrade_material: global.materials.pearl
        }),
        trout_nuclear: new Weapon(
        {
            index: 20200,
            name: __("Nuclear Trout"),
            damage: 50,
            damage_base: 500,
            size: 2,
            scale: 2,
            sprite: spr_weapon_trout_nuclear,
            action_distance: 96,
            action_timeout: sec(1.5),
            alb_equippable: false,
            can_damage_enemy: true,
            cost: 
            {
                moonstone: 1000000000000000000000000000000
            },
            upgrade_material: global.materials.pearl
        }),
        trout_soul: new Weapon(
        {
            index: 20300,
            name: __("Soul Trout"),
            damage: 60,
            damage_base: 600,
            size: 2,
            scale: 2,
            sprite: spr_weapon_trout_soul,
            action_distance: 112,
            action_timeout: sec(1.25),
            alb_equippable: false,
            can_damage_enemy: true,
            cost: 
            {
                soul_particles: 2000
            },
            upgrade_material: global.materials.raw_soul_stone
        })
    };
    add_keys_to_struct(global.shops.weapons);
    global.weapons_sorted = struct_to_sorted_array(global.shops.weapons);
    global.shop_items_weapons = {};
    global.weapon_sections = {};
    var __struct = global.weapon_types;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(global.shop_items_weapons, mkey, []);
        variable_struct_set(global.weapon_sections, mkey, []);
    }
    __struct = global.shops.weapons;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        array_push(variable_struct_get(global.weapon_sections, mitem.type.key), mitem);
    }
}
