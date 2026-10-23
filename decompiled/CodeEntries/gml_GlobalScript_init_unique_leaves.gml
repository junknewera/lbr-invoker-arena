function init_unique_leaves()
{
    global.unique_leaves_sorted = [];
    global.unique_leaves = 
    {
        alchemy: new Unique_Leaf(
        {
            index: -200,
            name: __("Alchemy Leaf"),
            description: sprintf(__("Reduces alchemy brew time by %s and increases brew crit chance by %s. You used the Shovel on The Moon while having 1e30 Moonstone leaves."), number_format_percent(0.025), number_format_percent(0.0025)),
            description_locked: __("Below the craters you will find some kind of magic."),
            sprite: spr_leaf_unique_alchemy,
            spawn_area: global.areas.moon,
            requirements: [],
            
            check: function()
            {
                return global.resources.moonstone.data.count >= 1000000000000000000000000000000 && o_blower.blower.key == global.shops.weapons.shovel.key;
            },
            
            upgrade_attributes: 
            {
                alchemy_brew_crit_chance: 0.0025,
                alchemy_brew_time_reduction: 0.025
            },
            max_count: 1
        }),
        bone: new Unique_Leaf(
        {
            index: -100,
            name: __("Bone Leaf"),
            description: __("400% enemy rewards. You used the Ace of Spades in the Volcano while having 100m Lava leaves."),
            description_locked: __("Playing for the high one, dancing with the fire."),
            sprite: spr_leaf_unique_bone,
            spawn_area: global.areas.volcano,
            
            check: function()
            {
                return global.resources.lava.data.count >= 100000000 && o_blower.blower.key == global.shops.weapons.ace_of_spades.key;
            },
            
            upgrade_attributes: 
            {
                enemy_drop_multiplier: 4
            },
            max_count: 1
        }),
        borb: new Unique_Leaf(
        {
            index: -90,
            name: __("Borb Leaf"),
            description: "Borb borb borb, borb. Borb borb/borb. Borb? BORB BORB! +500% Borbs/Borb.",
            description_locked: "Borb borb, borb borb borb. BORB! Borb Leaf Borb Blower Borb Neighbor Borb 10k Borb.",
            sprite: spr_leaf_unique_borb,
            spawn_area: global.areas.neighbors_garden,
            
            check: function()
            {
                return global.resources.borbs.data.count >= 10000 && o_blower.blower.key == global.shops.weapons.leaf_blower.key;
            },
            
            upgrade_attributes: 
            {
                resources_leaf_add: 
                {
                    borbs: 5
                }
            },
            max_count: 1
        }),
        crystal: new Unique_Leaf(
        {
            index: 0,
            name: __("Crystal Leaf"),
            description: __("Adds +5 to your daily reward gems. You used your hands at your neighbor's garden while having 1c Platinum leaves."),
            description_locked: __("Help your neighbor to pick up some platinum leaves."),
            sprite: spr_leaf_unique_crystal,
            spawn_area: global.areas.neighbors_garden,
            
            check: function()
            {
                return global.resources.platinum.data.count >= 1000000000000000000000 && o_blower.blower.key == global.shops.weapons.hands.key;
            },
            
            upgrade_attributes: 
            {
                daily_reward_gems: 5
            },
            max_count: 1
        }),
        energy: new Unique_Leaf(
        {
            index: 50,
            name: __("Electrical Energy Leaf"),
            description_locked: __("Fight electrical energy with nuclear energy!"),
            generatable_in_quests: false,
            sprite: spr_leaf_unique_energy_electrical,
            spawn_area: global.areas.spark_range,
            
            check: function()
            {
                return global.resources.energy_electrical.data.count >= 1000 && o_blower.blower.key == global.shops.weapons.trout_nuclear.key;
            },
            
            required_amount: 1000,
            required_area: "spark_range",
            required_resource: "energy_electrical",
            required_tool: "trout_nuclear",
            upgrade_attributes: 
            {
                max_energy_storage: 100,
                energy_base_charge_value_multiplier_single: 
                {
                    energy_electrical: 0.5
                }
            }
        }),
        equipment: new Unique_Leaf(
        {
            index: 60,
            name: __("Equipment Leaf"),
            description_locked: __("Model A321."),
            sprite: spr_leaf_unique_equipment,
            spawn_area: global.areas.tower,
            
            check: function()
            {
                return global.current_tower_floor == 321 && o_blower.blower.key == global.shops.weapons.airplane_turbine.key;
            },
            
            required_area: "tower",
            required_floor: 321,
            required_tool: "airplane_turbine",
            upgrade_attributes: 
            {
                claw_equipment: 10,
                item_collect_count: 2
            }
        }),
        fire: new Unique_Leaf(
        {
            index: 100,
            name: __("Fire Leaf"),
            description: __("ALB enemy damage increased by 800%. You used the Lazer in THE VOID while having 1C Void leaves."),
            description_locked: __("Lazers can be dangerous in voids."),
            sprite: spr_leaf_unique_fire,
            spawn_area: global.areas.void,
            
            check: function()
            {
                return global.resources.void.data.count >= 1000000000000000000000000 && o_blower.blower.key == global.shops.weapons.lazer.key;
            },
            
            func: function()
            {
                with (o_autoblower)
                {
                    init();
                }
            },
            
            upgrade_attributes: 
            {
                alb_enemy_damage_multiplier: 8
            }
        }),
        ghost: new Unique_Leaf(
        {
            index: 200,
            name: __("Ghost Leaf"),
            description: __("BLC value increased by 500%. You used the Blowfish in Space while having 1d Cosmic leaves."),
            description_locked: __("Did you know you can blow away Ghosts in Space with a fish?"),
            sprite: spr_leaf_unique_ghost,
            spawn_area: global.areas.space,
            
            check: function()
            {
                return global.resources.cosmic.data.count >= 1000000000000000000000000000 && o_blower.blower.key == global.shops.weapons.blowfish.key;
            },
            
            upgrade_attributes: 
            {
                blc_value_multiplier_adder: 5
            }
        }),
        glitter: new Unique_Leaf(
        {
            index: 300,
            name: __("Glitter Leaf"),
            description: __("Increases combo rewards by 300%. You used any Rake at the Mountain while having 1D Bismuth leaves."),
            description_locked: __("A rake can be used as a cane in the mountains."),
            sprite: spr_leaf_unique_glitter,
            spawn_area: global.areas.mountain,
            
            check: function()
            {
                return global.resources.bismuth.data.count >= 1000000000000000000000000000000 && (o_blower.blower.key == global.shops.weapons.leaf_rake.key || o_blower.blower.key == global.shops.weapons.leaf_rake_advanced.key);
            },
            
            upgrade_attributes: 
            {
                combo_multiplier_multiplier: 3
            }
        }),
        heart: new Unique_Leaf(
        {
            index: 400,
            name: __("Heart Leaf"),
            description: __("Increases all fruit rewards by 1000%. You used the Leaf Blower at the Garden while having 1e Gold leaves."),
            description_locked: __("Home is where your Leaf Blower is."),
            sprite: spr_leaf_unique_heart,
            spawn_area: global.areas.garden,
            
            check: function()
            {
                return global.resources.gold.data.count >= 1000000000000000000000000000000000 && o_blower.blower.key == global.shops.weapons.leaf_blower.key;
            },
            
            upgrade_attributes: 
            {
                fruit_value_multiplier: 10
            }
        }),
        holy: new Unique_Leaf(
        {
            index: 410,
            name: __("The Holy Leaf"),
            description: __("Unlocks The Holy Grail. Increases Silver/Gold Token rewards by 250%. You used the Carpenter's Cup in The Leaf Tower Floor 42 while having 1k Silver Tokens and 42 Gold Tokens."),
            description_locked: __("This leaf consists of silver and gold. The Legend says the number 42 is engraved at the back of it."),
            sprite: spr_leaf_unique_holy,
            spawn_area: global.areas.tower,
            
            check: function()
            {
                return global.current_tower_floor == 42 && global.resources.silver_token.data.count >= 1000 && global.resources.gold_token.data.count >= 42 && o_blower.blower.key == global.shops.weapons.carpenters_cup.key;
            },
            
            upgrade_attributes: 
            {
                resources_multiplier: 
                {
                    silver_token: 2.5,
                    gold_token: 2.5
                }
            }
        }),
        leafscension: new Unique_Leaf(
        {
            index: 415,
            name: __("Leafscension Leaf"),
            description_locked: __("Seven or eleven, snekko eyes watching you. Double up or bridge, double stake or split..."),
            sprite: spr_leaf_unique_leafscension,
            spawn_area: global.areas.exalted_bridge,
            
            check: function()
            {
                return global.pets.snake.is_active() && o_blower.blower.key == global.shops.weapons.ace_of_spades_ht.key;
            },
            
            required_area: "exalted_bridge",
            required_pet: "snake",
            required_tool: "ace_of_spades_ht",
            upgrade_attributes: 
            {
                leafscender_decrease_convert_time: 0.05,
                leafscender_decrease_input_cost_multiplier: 0.03
            }
        }),
        material: new Unique_Leaf(
        {
            index: 430,
            name: __("Material Leaf"),
            description_locked: __("Once upon a time, a mighty quack dug something up in a small town with a cursed person."),
            sprite: spr_leaf_unique_material,
            spawn_area: global.areas.kokkaupunki,
            
            check: function()
            {
                return global.pets.ducko.is_active() && o_blower.blower.key == global.shops.weapons.shovel_nuclear.key;
            },
            
            required_area: "kokkaupunki",
            required_pet: "ducko",
            required_tool: "shovel_nuclear",
            upgrade_attributes: 
            {
                material_spawn_chance_add_base: 0.01,
                material_autocollect: 0.016666666666666666
            }
        }),
        nuclear: new Unique_Leaf(
        {
            index: 450,
            name: __("Nuclear Leaf"),
            description: sprintf(__("Increases blow power by %s% and enemy damage by %s%. You used the Nuclear Leaf Blower in Leafsink Harbor while having 100k Benitoite leaves."), number_format(500), number_format(50)),
            description_locked: __("An old shipwreck glows blue by day and green by night."),
            sprite: spr_leaf_unique_nuclear,
            spawn_area: global.areas.harbor,
            
            check: function()
            {
                return global.resources.benitoite.data.count >= 100000 && o_blower.blower.key == global.shops.weapons.nuclear_leaf_blower.key;
            },
            
            upgrade_attributes: 
            {
                nuclear_fuel_multiplier: 5,
                blower_enemy_damage_multiplier_global: 0.5
            }
        }),
        pet: new Unique_Leaf(
        {
            index: 470,
            name: __("Pet Leaf"),
            description_locked: __("Someone left a sacred slap tool at a research station."),
            sprite: spr_leaf_unique_pet,
            spawn_area: global.areas.antarctica,
            
            check: function()
            {
                return global.resources.sacred.data.count >= 10000 && o_blower.blower.key == global.shops.weapons.trout.key;
            },
            
            required_amount: 10000,
            required_area: "antarctica",
            required_resource: "sacred",
            required_tool: "trout",
            upgrade_attributes_apply_mid: true,
            upgrade_attributes_apply_mid_index: 0,
            upgrade_attributes: 
            {
                upgrade_section_multiplier: 
                {
                    pets: 0.2
                }
            }
        }),
        rainbow: new Unique_Leaf(
        {
            index: 500,
            name: __("Rainbow Leaf"),
            description: __("Increases seed rewards by 50%. You used the Rocket Engine at the Celestial Plane while having 100k Celestial leaves."),
            description_locked: __("A physical device may help you to reach the sky."),
            sprite: spr_leaf_unique_rainbow,
            spawn_area: global.areas.celestial_plane,
            
            check: function()
            {
                return global.resources.celestial.data.count >= 100000 && o_blower.blower.key == global.shops.weapons.rocket_engine.key;
            },
            
            upgrade_attributes: 
            {
                seed_value_add_global: 0.5
            }
        }),
        relic: new Unique_Leaf(
        {
            index: 510,
            name: __("Relic Leaf"),
            description_locked: __("They both have four legs each and they are distant relatives. Usually, they meet in an ancient place exchanging thousands of sacred leaves."),
            sprite: spr_leaf_unique_relic,
            spawn_area: global.areas.ancient_sanctum,
            
            check: function()
            {
                return global.pets.deer.is_active() && global.resources.sacred.data.count >= 1000;
            },
            
            required_amount: 100000,
            required_area: "ancient_sanctum",
            required_pet: "deer",
            required_resource: "sacred",
            upgrade_attributes: 
            {
                relics_base_damage_multiplier_unique: 2,
                relics_enemy_drop_chance: 0.01
            }
        }),
        robot: new Unique_Leaf(
        {
            index: 600,
            name: __("Robot Leaf"),
            description: __("Increases printer output by 5000%. You used the Graphics Card in the Abyss while having 1m Exotic leaves."),
            description_locked: __("01000111 01010000 01010101 00100000 01000001 01100010 01111001 01110011 01110011 00100000 00110001 01101101 00100000 01000101 01111000 01101111 01110100 01101001 01100011"),
            sprite: spr_leaf_unique_robot,
            spawn_area: global.areas.abyss,
            
            check: function()
            {
                return global.resources.exotic.data.count >= 100000 && o_blower.blower.key == global.shops.weapons.gfx_card.key;
            },
            
            upgrade_attributes: 
            {
                printer_multiplier_multiplier: 50
            }
        }),
        shard: new Unique_Leaf(
        {
            index: 630,
            name: __("Shard Leaf"),
            description_locked: __("Biological high-tech equipment is useful in forests."),
            sprite: spr_leaf_unique_shard,
            generatable_in_quests: false,
            spawn_area: global.areas.biotite_forest,
            
            check: function()
            {
                return global.resources.shards.data.count >= 5000 && o_blower.blower.key == global.shops.weapons.trout_ht.key;
            },
            
            required_amount: 5000,
            required_area: "biotite_forest",
            required_resource: "shards",
            required_tool: "trout_ht",
            upgrade_value: 0.25,
            upgrade_value_text: number_format_percent(0.25),
            upgrade_attributes: 
            {
                enemy_shards_drop_multiplier_unique: 0.25
            }
        }),
        tool: new Unique_Leaf(
        {
            index: 640,
            name: __("Tool Leaf"),
            description_locked: __("okcolF desu a egral fael ekar ni eht onacloV. tI's repus evitceffe!"),
            sprite: spr_leaf_unique_tool,
            spawn_area: global.areas.volcano,
            
            check: function()
            {
                return global.pets.flocko.is_active() && o_blower.blower.key == global.shops.weapons.leaf_rake_advanced.key;
            },
            
            required_area: "volcano",
            required_pet: "flocko",
            required_tool: "leaf_rake_advanced",
            upgrade_attributes: 
            {
                blower_blow_leaf_range_multiplier: 0.2,
                leaf_merge_count_add: 1,
                leaf_merge_range: 5
            }
        }),
        unique: new Unique_Leaf(
        {
            index: 650,
            name: __("Unique Unique Leaf"),
            description_locked: __("SLAP. SAND."),
            sprite: spr_leaf_unique_unique,
            spawn_area: global.areas.desert,
            
            check: function()
            {
                return global.resources.sand.data.count >= 1000000000 && o_blower.blower.key == global.shops.weapons.trout.key;
            },
            
            required_amount: 1000000000,
            required_area: "desert",
            required_resource: "sand",
            required_tool: "trout",
            upgrade_value: 0.25,
            upgrade_value_text: number_format_percent(0.25),
            upgrade_attributes_apply_mid: true,
            upgrade_attributes_apply_mid_index: 10,
            upgrade_attributes: 
            {
                upgrade_section_multiplier: 
                {
                    unique: 0.25
                }
            }
        }),
        water: new Unique_Leaf(
        {
            index: 700,
            name: __("Water Leaf"),
            description: sprintf(__("Increases global trade multiplier by %s%, decreases trade refresh cooldown by %s% and trade delivery time by %s%. You used the Fan in The Hidden Sea while having 1m Obsidian leaves."), number_format(100), number_format(15), number_format(10)),
            description_locked: __("You might need some kind of a seaglide to get this leaf."),
            sprite: spr_leaf_unique_water,
            spawn_area: global.areas.hidden_sea,
            
            check: function()
            {
                return global.resources.obsidian.data.count >= 100000 && o_blower.blower.key == global.shops.weapons.fan.key;
            },
            
            upgrade_attributes: 
            {
                trade_refresh_decrease_timer: 0.15,
                trade_duration_decrease_timer: 0.1,
                trade_resources_multiplier_global: 1
            }
        }),
        wood: new Unique_Leaf(
        {
            index: 800,
            name: __("Wood Leaf"),
            description: __("Increases material base spawn rate by [value]. You used the [tool] in [area] while having [amount] [resource]."),
            description_locked: __("Drunk usage of high tech equipment should be forbidden in dark areas."),
            sprite: spr_leaf_unique_wood,
            spawn_area: global.areas.dark_glade,
            
            check: function()
            {
                return global.resources.beer.data.count >= 10000 && o_blower.blower.key == global.shops.weapons.shovel_ht.key;
            },
            
            required_amount: 10000,
            required_area: "dark_glade",
            required_resource: "beer",
            required_tool: "shovel_ht",
            upgrade_value: 0.01,
            upgrade_value_text: number_format_percent(0.01),
            upgrade_attributes: 
            {
                material_spawn_chance_add_base: 0.01
            }
        })
    };
    global.unique_leaves_generatable = [];
    global.unique_leaves_upgrade_early = [];
    global.unique_leaves_upgrade_mid = [];
    global.unique_leaves_upgrade_late = [];
    var __struct = global.unique_leaves;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        mitem.key = mkey;
        if (!is_undefined(struct_get_from_hash(mitem.upgrade_attributes, variable_get_hash("upgrade_section_multiplier"))))
        {
            mitem.upgrade_attributes_apply_early = true;
            if (mitem.upgrade_attributes_apply_mid)
            {
                array_push(global.unique_leaves_upgrade_mid, mitem);
            }
            else
            {
                array_push(global.unique_leaves_upgrade_early, mitem);
            }
        }
        else
        {
            array_push(global.unique_leaves_upgrade_late, mitem);
        }
        if (mitem.generatable_in_quests)
        {
            array_push(global.unique_leaves_generatable, mitem);
        }
        array_push(global.unique_leaves_sorted, mitem);
    }
    sort_array_by(global.unique_leaves_upgrade_mid, "upgrade_attributes_apply_mid_index", false);
    array_sort(global.unique_leaves_sorted, function(arg0, arg1)
    {
        return arg0.index - arg1.index;
    });
}
