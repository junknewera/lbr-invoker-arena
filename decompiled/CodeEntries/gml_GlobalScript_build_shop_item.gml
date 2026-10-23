function build_shop_item(arg0, arg1, arg2 = 0, arg3 = undefined)
{
    if (is_undefined(arg2))
    {
        arg2 = 0;
    }
    var base_cost = 1000000000000000000000;
    var cost_exp = undefined;
    var func = undefined;
    var max_count = 1;
    var shop_item_build = undefined;
    var shop_item = {};
    var value = get_default_struct_value(arg3, "value", false);
    var resource_key = get_default_struct_value(arg3, "resource_key", undefined);
    var resource = undefined;
    switch (arg0)
    {
        case "alchemy_brew_crit_chance":
            base_cost = 100000000;
            value = get_default_struct_value(arg3, "value", 0.001);
            shop_item_build = 
            {
                name: __("Alchemyritical"),
                sprite: spr_icon_alchemy,
                description: sprintf(__("Adds some Critical Cheddar to the cauldron. Increases critical brews by %s."), number_format_percent(value)),
                cost_exp: get_default_struct_value(arg3, "cost_exp", 8),
                upgrade_attributes: 
                {
                    alchemy_brew_crit_chance: value
                },
                max_count: get_default_struct_value(arg3, "max_count", 10),
                
                is_obfuscated: function()
                {
                    return !is_unlocked_alchemy();
                }
            };
            break;
        case "alchemy_brew_time_reduction":
            base_cost = 100000000;
            value = get_default_struct_value(arg3, "value", 0.01);
            shop_item_build = 
            {
                name: __("SuperStirr"),
                sprite: spr_icon_alchemy,
                description: sprintf(__("Upgrades the SuperStirr device on the cauldron. Decreases alchemy brew time by %s."), number_format_percent(value)),
                cost_exp: get_default_struct_value(arg3, "cost_exp", 16),
                upgrade_attributes: 
                {
                    alchemy_brew_time_reduction: value
                },
                max_count: get_default_struct_value(arg3, "max_count", 10),
                
                is_obfuscated: function()
                {
                    return !is_unlocked_alchemy();
                }
            };
            break;
        case "add_resource_storage":
            base_cost = 1000000;
            resource = variable_struct_get(global.resources, resource_key);
            shop_item_build = 
            {
                name: __s("More %s Storage", resource.name_single),
                description: __s("Adds %s more %s storage space.", number_format(value), resource.name_single),
                sprite: resource.sprite,
                max_count: get_default_struct_value(arg3, "max_count", 10),
                resource_key: resource_key,
                is_obfuscated: get_default_struct_value(arg3, "is_obfuscated"),
                upgrade_attributes: 
                {
                    max_resource_storage: {}
                }
            };
            variable_struct_set(shop_item_build.upgrade_attributes.max_resource_storage, resource.key, value);
            break;
        case "autobuy_accelerator":
            base_cost = 100000000;
            value = get_default_struct_value(arg3, "value", 0.01);
            shop_item_build = 
            {
                name: __("Autobuy Accelerator"),
                sprite: spr_icon_cog,
                description: sprintf(__("Reduces the Autobuy Bot delay by %s seconds per level."), value),
                cost_exp: 8,
                upgrade_attributes: 
                {
                    autobuy_accelerator: value
                },
                max_count: 20
            };
            break;
        case "autobuy_shop":
            resource = get_default_struct_value(arg3, "resource");
            var auto_upgrade_shop = get_default_struct_value(arg3, "auto_upgrade_shop", resource.key);
            shop_item_build = 
            {
                name: __s("%s Upgrade Bot", resource.name_plural),
                sprite: resource.sprite,
                description: __s(global.texts.auto_upgrade_shop_description, resource.name_plural),
                is_toggle: true,
                max_count: 1,
                resource: resource,
                auto_upgrade_shop: auto_upgrade_shop,
                
                is_obfuscated: function()
                {
                    return variable_struct_get(global.resources, self.resource.key).data.collected_total == 0;
                }
            };
            break;
        case "autocraft_delay_reduction":
            base_cost = 100000000;
            value = get_default_struct_value(arg3, "value", 0.01);
            shop_item_build = 
            {
                name: __("Faster Autocraft"),
                sprite: spr_icon_crafting,
                description: __s("Reduces the autocraft delay by %s.", number_format_percent(value)),
                cost_exp: get_default_struct_value(arg3, "cost_exp", 100),
                max_count: get_default_struct_value(arg3, "max_count", 5),
                upgrade_attributes: 
                {
                    autocraft_delay_reduction: value
                },
                
                is_obfuscated: function()
                {
                    return !is_unlocked_crafting();
                }
            };
            break;
        case "area_enemies_decrease":
            var area_key = get_default_struct_value(arg3, "area_key", undefined);
            var area = get_default_struct_value(arg3, "area", undefined);
            if (is_struct(area))
            {
                area_key = arg3.area.key;
                area = arg3.area;
            }
            else
            {
                area = variable_struct_get(global.areas, area_key);
            }
            base_cost = 100000000;
            value = get_default_struct_value(arg3, "value", 1);
            shop_item_build = 
            {
                name: __("Less Pyramid Enemies"),
                sprite: spr_icon_area_pyramid,
                description: __s("Decreases the number of enemies in The Inner Cursed Pyramid by %s.", number_format(value)),
                cost_exp: get_default_struct_value(arg3, "cost_exp", 100),
                max_count: get_default_struct_value(arg3, "max_count", 5),
                upgrade_attributes: 
                {
                    area_enemies_decrease: {}
                },
                
                is_obfuscated: function()
                {
                    return !is_unlocked_pyramid();
                }
            };
            variable_struct_set(shop_item_build.upgrade_attributes.area_enemies_decrease, area_key, value);
            break;
        case "artifact_autouse_timer_delay_reduction_multiplier":
            base_cost = 5000000;
            shop_item_build = 
            {
                name: __("Faster Autofacts"),
                description: __s("Reduces the Autofacts timer by %s.", number_format_percent(value)),
                sprite: spr_artifact_orb,
                upgrade_attributes: 
                {
                    artifact_autouse_timer_delay_reduction_multiplier: value
                }
            };
            break;
        case "artifact_fruits":
            base_cost = 500000;
            shop_item_build = 
            {
                name: __("Fruitifacts"),
                sprite: spr_fruit,
                description: sprintf(__("When a fruit is collected, the spawn time of a random Artifact is reduced by %s second(s) per level."), value),
                cost_exp: 12,
                upgrade_attributes: 
                {
                    artifact_fruit_seconds_reduction: value
                },
                max_count: 10
            };
            break;
        case "better_pets":
            base_cost = 100000000;
            value = get_default_struct_value(arg3, "value", 0.01);
            shop_item_build = 
            {
                name: __("Better Pets"),
                sprite: spr_pet_dog,
                description: sprintf(__("Increases Pet bonuses by %s% %s"), value * 100, pluralize(max_count, "", __("per level"))),
                cost_exp: get_default_struct_value(arg3, "cost_exp", 5),
                upgrade_attributes: 
                {
                    upgrade_section_multiplier: 
                    {
                        pets: value
                    }
                },
                
                is_obfuscated: function()
                {
                    return get_upgrade_count(global.shops.blc.unlock_pets) == 0;
                }
            };
            break;
        case "better_unique_leaves":
            base_cost = 100000000;
            value = get_default_struct_value(arg3, "value", 0.001);
            shop_item_build = 
            {
                name: __("Better Unique Leaves"),
                sprite: spr_leaf_unique_rainbow,
                description: sprintf(__("Increases Unique Leaves bonuses by %s% %s"), value * 100, pluralize(max_count, "", __("per level"))),
                cost_exp: get_default_struct_value(arg3, "cost_exp", 5),
                upgrade_attributes: 
                {
                    upgrade_section_multiplier: 
                    {
                        unique: value
                    }
                },
                
                is_obfuscated: function()
                {
                    return get_upgrade_count(global.shops.blc.unlock_unique_leaves) == 0;
                }
            };
            break;
        case "blc_value_adder_real":
            base_cost = 500000;
            value = get_default_struct_value(arg3, "value", 100);
            shop_item_build = 
            {
                name: __("Moar BLC"),
                sprite: spr_blc,
                description: sprintf(__("Increases BLC Coins rewards by +%s per level. Nice."), number_format(value, 2)),
                cost_exp: 2.5,
                upgrade_attributes: 
                {
                    blc_value_adder: value
                },
                
                is_obfuscated: function()
                {
                    return global.resources.blc.data.collected_total == 0;
                },
                
                max_count: get_default_struct_value(arg3, "max_count", 50)
            };
            break;
        case "blc_science":
            base_cost = 500000000;
            value = get_default_struct_value(arg3, "value", 0.5);
            var upgrade_key = get_default_struct_value(arg3, "upgrade_key", "blc_value_multiplier_adder");
            shop_item_build = 
            {
                name: __("BLC Science"),
                description: __s("Increase your BLC coin rewards by %s%.", number_format(value * 100)),
                sprite: spr_blc,
                cost_exp: get_default_struct_value(arg3, "cost_exp", 4),
                upgrade_attributes: {},
                max_count: get_default_struct_value(arg3, "max_count", 10),
                
                is_obfuscated: function()
                {
                    if (o_game.data.stats.prestige_mlc > 0)
                    {
                        return false;
                    }
                    return get_upgrade_count(global.shops.flask_black.unlock_big_crunch) == 0;
                }
            };
            variable_struct_set(shop_item_build.upgrade_attributes, upgrade_key, value);
            break;
        case "blower_hit_damage":
            base_cost = 75;
            shop_item_build = 
            {
                name: __("Leaf Damage"),
                description: sprintf(__("Increases leaf hit damage by %s per level."), value),
                sprite: spr_weapon_leaf_blower,
                upgrade_attributes: 
                {
                    blower_enemy_damage: value
                },
                cost_exp: get_default_struct_value(arg3, "cost_exp", 5),
                max_count: 0
            };
            break;
        case "blower_hit_damage_multiplier":
            base_cost = 75;
            var upgrade_key = get_default_struct_value(arg3, "upgrade_key", "blower_enemy_damage_multiplier");
            shop_item_build = 
            {
                name: __("Leaf Damage Multiplier"),
                description: sprintf(__("Increases leaf hit damage multiplier by %s% per level."), number_format(value * 100)),
                sprite: spr_weapon_leaf_blower,
                upgrade_attributes: {},
                cost_exp: get_default_struct_value(arg3, "cost_exp", 8),
                max_count: 0
            };
            variable_struct_set(shop_item_build.upgrade_attributes, upgrade_key, value);
            break;
        case "card_parts_drop_chance":
            base_cost = 75;
            value = get_default_struct_value(arg3, "value", 0.001);
            shop_item_build = 
            {
                name: __("Card Parts Detector"),
                description: __s("Increases card parts drop chance by %s.", number_format_percent(value)),
                sprite: spr_icon_card_part,
                upgrade_attributes: 
                {
                    card_parts_drop_chance: value
                },
                cost_exp: get_default_struct_value(arg3, "cost_exp", 4),
                max_count: get_default_struct_value(arg3, "max_count", 0),
                
                is_obfuscated: function()
                {
                    return !is_unlocked_cards();
                }
            };
            break;
        case "cards_boss_drop_chance":
            base_cost = 75;
            value = get_default_struct_value(arg3, "value", 0.001);
            shop_item_build = 
            {
                name: __("Boss Cards Detector"),
                description: __s("Increases boss card drop chance by %s.", number_format_percent(value)),
                sprite: spr_card_uncommon,
                upgrade_attributes: 
                {
                    cards_boss_drop_chance: value
                },
                cost_exp: get_default_struct_value(arg3, "cost_exp", 16),
                max_count: get_default_struct_value(arg3, "max_count", 5),
                
                is_obfuscated: function()
                {
                    return !is_unlocked_cards();
                }
            };
            break;
        case "cards_enemy_drop_chance":
            base_cost = 75;
            value = get_default_struct_value(arg3, "value", 0.001);
            shop_item_build = 
            {
                name: __("Cards Detector"),
                description: __s("Increases enemy card drop chance by %s.", number_format_percent(value)),
                sprite: spr_card_uncommon,
                upgrade_attributes: 
                {
                    cards_enemy_drop_chance: value
                },
                cost_exp: get_default_struct_value(arg3, "cost_exp", 4),
                max_count: get_default_struct_value(arg3, "max_count", 5),
                
                is_obfuscated: function()
                {
                    return !is_unlocked_cards();
                }
            };
            break;
        case "chest_rarity_increase":
            base_cost = 750000;
            value = get_default_struct_value(arg3, "value", 1);
            shop_item_build = 
            {
                name: __("Mulched Luck"),
                description: sprintf(__("Increases the chance to get better chests per level.")),
                sprite: spr_chest_uncommon,
                cost_exp: get_default_struct_value(arg3, "cost_exp", 4),
                upgrade_attributes: 
                {
                    chest_rarity_increase: value
                },
                max_count: get_default_struct_value(arg3, "max_count", 50),
                
                is_obfuscated: function()
                {
                    return get_upgrade_count(global.areas.inner_pyramid) == 0;
                }
            };
            break;
        case "chest_spawn_chance":
            base_cost = 250000;
            value = get_default_struct_value(arg3, "value", 1);
            shop_item_build = 
            {
                name: __("Mulched Chests"),
                description: sprintf(__("Increases chest spawn chance in dungeons by %s per level."), number_format_percent(value)),
                sprite: spr_chest_uncommon,
                cost_exp: get_default_struct_value(arg3, "cost_exp", 3),
                upgrade_attributes: 
                {
                    chest_spawn_chance: value
                },
                max_count: get_default_struct_value(arg3, "max_count", 10),
                
                is_obfuscated: function()
                {
                    return get_upgrade_count(global.areas.inner_pyramid) == 0;
                }
            };
            break;
        case "claw_curses":
            base_cost = 250000;
            value = get_default_struct_value(arg3, "value", 1);
            shop_item_build = 
            {
                name: __("Cursed Pub"),
                description: sprintf(__("Increases curse count per hooked curse by %s. This also applies to the slot machine."), number_format(value)),
                sprite: spr_icon_cursed_cheese,
                cost_exp: get_default_struct_value(arg3, "cost_exp", 3),
                upgrade_attributes: 
                {
                    claw_curses: value
                },
                max_count: get_default_struct_value(arg3, "max_count", 10),
                
                is_obfuscated: function()
                {
                    return !global.areas.cheese_pub.check();
                }
            };
            break;
        case "craft_level":
            base_cost = 250000;
            value = get_default_struct_value(arg3, "value", 1);
            shop_item_build = 
            {
                name: __("Craft Forge"),
                description: sprintf(__("Increases your craft level by %s. With higher craft levels, you can craft better leaves."), value),
                sprite: spr_icon_crafting,
                cost_exp: 12,
                upgrade_attributes: 
                {
                    craft_level: value
                },
                max_count: get_default_struct_value(arg3, "max_count", 3),
                
                is_obfuscated: function()
                {
                    return get_upgrade_count(global.shops.blc.unlock_crafting) == 0;
                }
            };
            break;
        case "craft_item_max_level":
            base_cost = 10000;
            value = get_default_struct_value(arg3, "value", 1);
            shop_item_build = 
            {
                name: __("Craft Fire"),
                description: sprintf(__("Increases your forge's max temperature, so you can upgrade your crafted leaves' max level by +1."), value),
                sprite: spr_icon_crafting,
                cost_exp: 25,
                upgrade_attributes: 
                {
                    craft_item_max_level: value
                },
                max_count: get_default_struct_value(arg3, "max_count", 10),
                
                is_obfuscated: function()
                {
                    return get_upgrade_count(global.shops.blc.unlock_crafting) == 0;
                }
            };
            break;
        case "craft_min_chance":
            base_cost = 10000;
            value = get_default_struct_value(arg3, "value", 1);
            shop_item_build = 
            {
                name: __("Craft Hammer"),
                description: sprintf(__("Increases the chance to craft rarer items."), value),
                sprite: spr_icon_crafting,
                cost_exp: 3.5,
                upgrade_attributes: 
                {
                    craft_min_chance: value
                },
                max_count: get_default_struct_value(arg3, "max_count", 25),
                
                is_obfuscated: function()
                {
                    return get_upgrade_count(global.shops.blc.unlock_crafting) == 0;
                }
            };
            break;
        case "craft_rng_quality":
            base_cost = 10000;
            value = get_default_struct_value(arg3, "value", 1);
            shop_item_build = 
            {
                name: __("Craft Beer"),
                description: sprintf(__("Increases the minimum RNG quality by %s% per level."), value * 100),
                sprite: spr_icon_crafting,
                cost_exp: 2,
                upgrade_attributes: 
                {
                    craft_min_rng_quality: value
                },
                max_count: get_default_struct_value(arg3, "max_count", 20),
                
                is_obfuscated: function()
                {
                    return get_upgrade_count(global.shops.blc.unlock_crafting) == 0;
                }
            };
            break;
        case "craft_sets_size":
            base_cost = 10000;
            value = get_default_struct_value(arg3, "value", 1);
            shop_item_build = 
            {
                name: __("More Craft Sets"),
                description: sprintf(__("Increases the number of craft sets by %s per level."), value),
                sprite: spr_icon_crafting,
                cost_exp: get_default_struct_value(arg3, "cost_exp", 1.5),
                upgrade_attributes: 
                {
                    craft_sets_size: value
                },
                max_count: get_default_struct_value(arg3, "max_count", 5),
                
                is_obfuscated: function()
                {
                    return !is_unlocked_crafting();
                }
            };
            break;
        case "critical_converters_crit_chance":
            base_cost = 1000000;
            shop_item_build = 
            {
                name: __("Critical Converters"),
                description: __s("Increases critical chance of converters by %s per level.", number_format_percent(value)),
                sprite: spr_icon_converters,
                cost_exp: 4,
                upgrade_attributes: 
                {
                    converter_crit_chance: value
                },
                max_count: 50
            };
            break;
        case "critical_converters_crit_value":
            base_cost = 1000000;
            shop_item_build = 
            {
                name: __("Critical Output"),
                description: sprintf(__("Increases critical value of converters by %s per level."), value * 100),
                sprite: spr_icon_converters,
                cost_exp: 6,
                upgrade_attributes: 
                {
                    converter_crit_value: value
                },
                max_count: 50
            };
            break;
        case "combo_multiplier_multiplier":
            base_cost = 10;
            shop_item_build = 
            {
                name: __("Super Combo"),
                description: sprintf(__("Increases combo multiplier by %s% per level."), value * 100),
                sprite: spr_icon_combo,
                cost_exp: 4,
                upgrade_attributes: 
                {
                    combo_multiplier_multiplier: value
                },
                max_count: 0,
                tag: global.shop_item_tags.combo
            };
            break;
        case "damage_resistance":
            base_cost = 10;
            shop_item_build = 
            {
                name: __("Leaf Armor"),
                sprite: spr_icon_heart,
                description: sprintf(__("Decreases enemy damage by %s% per level."), value * 100),
                cost_exp: get_default_struct_value(arg3, "cost_exp", 15),
                upgrade_attributes: 
                {
                    damage_resistance: value
                },
                max_count: 50
            };
            break;
        case "dig_count":
            base_cost = 10;
            value = get_default_struct_value(arg3, "value", 1);
            shop_item_build = 
            {
                name: __("Dig Force"),
                description: __s("Train your dig force! Increases dig count by %s.", number_format(value)),
                sprite: spr_weapon_shovel,
                cost_exp: get_default_struct_value(arg3, "cost_exp", 8),
                max_count: get_default_struct_value(arg3, "max_count", 1),
                
                is_obfuscated: function()
                {
                    return global.shops.weapons.shovel.data.collected == 0;
                },
                
                upgrade_attributes: 
                {
                    dig_count: value
                }
            };
            break;
        case "dig_count_multiplier":
            base_cost = 10;
            value = get_default_struct_value(arg3, "value", 1);
            shop_item_build = 
            {
                name: __("Dig Muscles"),
                description: __s("Train your dig muscles! Increases dig count per dig by %s.", number_format_percent(value)),
                sprite: spr_weapon_shovel,
                cost_exp: get_default_struct_value(arg3, "cost_exp", 8),
                max_count: get_default_struct_value(arg3, "max_count", 1),
                
                is_obfuscated: function()
                {
                    return global.shops.weapons.shovel.data.collected == 0;
                },
                
                upgrade_attributes: 
                {
                    dig_count_multiplier: value
                }
            };
            break;
        case "dig_item_chance_reduction":
            base_cost = 10;
            value = get_default_struct_value(arg3, "value", 0.01);
            shop_item_build = 
            {
                name: __("Dig Knowledge"),
                description: sprintf(__("Dig smarter! Increases item find chance when digging by %s."), number_format_percent(value)),
                sprite: spr_weapon_shovel,
                cost_exp: get_default_struct_value(arg3, "cost_exp", 2),
                max_count: get_default_struct_value(arg3, "max_count", 1),
                
                is_obfuscated: function()
                {
                    return global.shops.weapons.shovel.data.collected == 0;
                },
                
                upgrade_attributes: 
                {
                    dig_item_chance_reduction: value
                }
            };
            break;
        case "dig_reduce_timeout":
            base_cost = 10;
            value = get_default_struct_value(arg3, "value", 0.01);
            shop_item_build = 
            {
                name: __("Dig Technique"),
                description: sprintf(__("Dig faster! Decreases dig delay by %s."), number_format_percent(value)),
                sprite: spr_weapon_shovel,
                cost_exp: get_default_struct_value(arg3, "cost_exp", 8),
                max_count: get_default_struct_value(arg3, "max_count", 1),
                
                is_obfuscated: function()
                {
                    return global.shops.weapons.shovel.data.collected == 0;
                },
                
                upgrade_attributes: 
                {
                    dig_reduce_timeout: value
                }
            };
            break;
        case "enemy_drop_multiplier":
            base_cost = 200;
            value = get_default_struct_value(arg3, "value", 0.25);
            shop_item_build = 
            {
                name: __("Worthy Enemies"),
                description: sprintf(__("Enemy resource rewards increased by +%s% per level."), number_format(value * 100)),
                sprite: spr_enemy_bee,
                cost_exp: get_default_struct_value(arg3, "cost_exp", 3),
                max_count: get_default_struct_value(arg3, "max_count", 0),
                upgrade_attributes: 
                {
                    enemy_drop_multiplier: value
                }
            };
            break;
        case "equipment_max_upgrade_level":
            base_cost = 200;
            value = get_default_struct_value(arg3, "value", 1);
            shop_item_build = 
            {
                name: __("Max Equipment Level"),
                description: sprintf(__("Increases max upgrade level of equipment items by %s."), 1),
                sprite: spr_equip_armor,
                cost_exp: 150,
                max_count: get_default_struct_value(arg3, "max_count", 1),
                upgrade_attributes: 
                {
                    equipment_max_upgrade_level: value
                }
            };
            break;
        case "faster_artifacts":
            base_cost = 500;
            value = get_default_struct_value(arg3, "value", 0.3);
            shop_item_build = 
            {
                name: __("Faster Artifacts"),
                description: sprintf(__("Spawn time of Artifacts are reduced by %s%."), number_format(value * 100)),
                sprite: spr_artifact_orb,
                upgrade_attributes: 
                {
                    artifact_spawn_time_reduction: value
                },
                cost_exp: get_default_struct_value(arg3, "cost_exp", 6),
                max_count: get_default_struct_value(arg3, "max_count", 1),
                
                func: function()
                {
                    var __struct = global.artifacts;
                    var __prop_names = struct_get_names(__struct);
                    var __prop_len = array_length(__prop_names);
                    for (var __i = 0; __i < __prop_len; __i++)
                    {
                        var mkey = __prop_names[__i];
                        var mitem = variable_struct_get(__struct, mkey);
                        if (is_undefined(mitem))
                        {
                            continue;
                        }
                        mitem.reduce_spawn_time_relative(self.upgrade_attributes.artifact_spawn_time_reduction);
                    }
                }
            };
            break;
        case "fertilizer":
            base_cost = 10;
            value = get_default_struct_value(arg3, "value", 1);
            resource = get_default_struct_value(arg3, "resource", arg1);
            shop_item_build = 
            {
                name: __s("%s Fertilizer", resource.name_single),
                description: __s("Increases chance to spawn %s by %s.", resource.name_plural, number_format(value) + "%"),
                sprite: spr_icon_fertilizer,
                upgrade_attributes: 
                {
                    leaf_spawn_chance: {}
                },
                cost_exp: get_default_struct_value(arg3, "cost_exp", 1.5),
                max_count: get_default_struct_value(arg3, "max_count", 50)
            };
            variable_struct_set(shop_item_build.upgrade_attributes.leaf_spawn_chance, resource.key, value);
            break;
        case "fish_baits":
            var fish_baits = arg3.fish_baits;
            shop_item_build = 
            {
                name: fish_baits.name,
                sprite: fish_baits.sprite,
                is_static: true,
                max_count: 0,
                
                is_obfuscated: function()
                {
                    return !is_unlocked_fishing_baits();
                }
            };
            break;
        case "inventory_size":
            base_cost = 50;
            shop_item_build = 
            {
                name: __("Bigger Crafting Inventory"),
                sprite: spr_icon_inventory,
                description: sprintf(__("Increases crafting inventory size by %s per level."), value),
                cost_exp: get_default_struct_value(arg3, "cost_exp", 20),
                upgrade_attributes: 
                {
                    craft_inventory_size: value
                },
                max_count: get_default_struct_value(arg3, "max_count", 2)
            };
            break;
        case "crafting_backpack_size":
            base_cost = 250;
            value = get_default_struct_value(arg3, "value", 1);
            shop_item_build = 
            {
                name: __("Bigger Crafting Backpack"),
                sprite: spr_icon_backpack,
                description: sprintf(__("Increases crafting backpack size by %s per level."), value),
                cost_exp: get_default_struct_value(arg3, "cost_exp", 15),
                upgrade_attributes: 
                {
                    craft_backpack_size: value
                },
                max_count: get_default_struct_value(arg3, "max_count", 5),
                
                is_obfuscated: function()
                {
                    return !is_unlocked_crafting();
                }
            };
            break;
        case "item_drop_chance":
            base_cost = 50;
            shop_item_build = 
            {
                name: __("Item Drop Chance"),
                sprite: spr_equip_shield,
                description: sprintf(__("Increases item drop chance by %s% per level."), value * 100),
                cost_exp: get_default_struct_value(arg3, "cost_exp", 4),
                upgrade_attributes: 
                {
                    item_drop_chance: value
                },
                max_count: 30
            };
            break;
        case "item_drop_count":
            base_cost = 50;
            value = get_default_struct_value(arg3, "value", 1);
            shop_item_build = 
            {
                name: __("Item Drop Count"),
                sprite: spr_equip_shield,
                description: sprintf(__("Increases item drop count by %s per level."), value),
                cost_exp: get_default_struct_value(arg3, "cost_exp", 16),
                upgrade_attributes: 
                {
                    item_drop_count: value
                },
                max_count: get_default_struct_value(arg3, "max_count", 5)
            };
            break;
        case "leaf_affect_combo":
            base_cost = 500;
            shop_item_build = 
            {
                name: sprintf(__("%s Combo"), arg1.name_single),
                sprite: spr_icon_combo,
                description: sprintf(__("Combo affects %s."), arg1.name_plural),
                max_count: 1,
                upgrade_attributes: 
                {
                    resources_leaf_special_upgrades: {}
                },
                tag: global.shop_item_tags.combo
            };
            variable_struct_set(shop_item_build.upgrade_attributes.resources_leaf_special_upgrades, arg1.key, 1);
            break;
        case "leaf_counter_value":
            base_cost = 500;
            shop_item_build = 
            {
                name: __("Better Counting"),
                sprite: spr_icon_leaf_counter,
                description: __s("Upgrades the leaf counter button to increase its count by %s.", number_format(value)),
                cost_exp: get_default_struct_value(arg3, "cost_exp", 96),
                max_count: get_default_struct_value(arg3, "max_count", 10),
                upgrade_attributes: 
                {
                    leaf_pub_counter: value
                }
            };
            break;
        case "leaf_marketing":
            base_cost = 500;
            value = get_default_struct_value(arg3, "value", 1);
            var marketing_resource = get_default_struct_value(arg3, "marketing_resource", arg1);
            shop_item_build = 
            {
                name: __s("%s Marketing", marketing_resource.name),
                description: get_default_struct_value(arg3, "description", sprintf(global.texts.leaf_marketing_resource, marketing_resource.name_single)),
                sprite: spr_icon_marketing,
                cost_exp: get_default_struct_value(arg3, "cost_exp", 3.5),
                max_count: get_default_struct_value(arg3, "max_count", 5),
                upgrade_attributes: 
                {
                    resources_leaf_add: {}
                }
            };
            variable_struct_set(shop_item_build.upgrade_attributes.resources_leaf_add, marketing_resource.key, value);
            break;
        case "leaf_merge_range_inc":
            base_cost = 500000000;
            shop_item_build = 
            {
                name: __("Leaf Merginator"),
                sprite: spr_leaf,
                description: sprintf(__("Increases max leaf merge range by %s pixels per level."), value),
                cost_exp: 6,
                upgrade_attributes: 
                {
                    leaf_merge_range: value
                },
                max_count: 10
            };
            break;
        case "leaf_multiplier_all":
            base_cost = 75;
            var ua_key = get_default_struct_value(arg3, "upgrade_key", "leaf_hard_multiplier");
            shop_item_build = 
            {
                name: __("All Leaves+"),
                description: sprintf(__("Increase your leaf reward by +%s% for all leaves."), number_format(value * 100)),
                sprite: spr_leaf,
                max_count: get_default_struct_value(arg3, "max_count", 1),
                cost_exp: get_default_struct_value(arg3, "cost_exp", 4),
                upgrade_attributes: {}
            };
            variable_struct_set(shop_item_build.upgrade_attributes, ua_key, value);
            break;
        case "leafscender_decrease_convert_time":
            base_cost = 75;
            value = get_default_struct_value(arg3, "value", 1);
            shop_item_build = 
            {
                name: __("Leafscend Accelerator"),
                description: sprintf(__("Decreases leafscend conversion time by %s."), number_format_percent(value)),
                sprite: spr_icon_leafscension,
                max_count: get_default_struct_value(arg3, "max_count", 10),
                cost_exp: get_default_struct_value(arg3, "cost_exp", 24),
                
                is_obfuscated: function()
                {
                    return !is_unlocked_leafscension();
                },
                
                upgrade_attributes: 
                {
                    leafscender_decrease_convert_time: value
                }
            };
            break;
        case "leafscender_decrease_input_cost":
            base_cost = 75;
            value = get_default_struct_value(arg3, "value", 1);
            shop_item_build = 
            {
                name: __("Leafcheapers"),
                description: sprintf(__("Decreases Leafscender input resources by %s. Leafscension to Level 1 is not affected by this upgrade."), number_format(value)),
                sprite: spr_icon_leafscension,
                upgrade_attributes: 
                {
                    leafscender_decrease_input_cost: value
                },
                max_count: get_default_struct_value(arg3, "max_count", 1),
                cost_exp: get_default_struct_value(arg3, "cost_exp", 12),
                
                is_obfuscated: function()
                {
                    return !is_unlocked_leafscension();
                }
            };
            break;
        case "longer_artifacts_duration":
            base_cost = 1000000;
            shop_item_build = 
            {
                name: __("Durable Artifacts"),
                sprite: spr_artifact_orb,
                description: sprintf(__("Increases expire duration of Artifacts by %s seconds per level."), value),
                cost_exp: 3,
                upgrade_attributes: 
                {
                    artifact_expire_duration: value
                },
                max_count: 60
            };
            break;
        case "master_of_mlc":
            base_cost = 10;
            value = get_default_struct_value(arg3, "value", 0.05);
            var upgrade_key = get_default_struct_value(arg3, "upgrade_key", "mlc_value_multiplier_adder");
            shop_item_build = 
            {
                name: __("Master of MLC"),
                description: __s("Gain %s% more MLCs per level.", value * 100),
                sprite: spr_mlc,
                cost_exp: get_default_struct_value(arg3, "cost_exp", 12),
                
                is_obfuscated: function()
                {
                    return !is_unlocked_mlc() && self.data.count <= 0;
                },
                
                upgrade_attributes: {}
            };
            variable_struct_set(shop_item_build.upgrade_attributes, upgrade_key, value);
            break;
        case "master_of_ulc":
            base_cost = 10;
            value = get_default_struct_value(arg3, "value", 0.05);
            var upgrade_key = get_default_struct_value(arg3, "upgrade_key", "ulc_value_multiplier");
            shop_item_build = 
            {
                name: __("Master of ULC"),
                sprite: spr_ulc,
                cost_exp: get_default_struct_value(arg3, "cost_exp", 12),
                
                is_obfuscated: function()
                {
                    return !is_unlocked_ulc();
                },
                
                upgrade_attributes: {}
            };
            variable_struct_set(shop_item_build.upgrade_attributes, upgrade_key, value);
            break;
        case "material_finder":
            base_cost = 10;
            value = get_default_struct_value(arg3, "value", 0.1);
            var upgrade_attribute_key = get_default_struct_value(arg3, "upgrade_attribute_key", "material_spawn_chance_multiplier");
            shop_item_build = 
            {
                name: __("Material Finder"),
                description: sprintf(__("Multiplies base spawn chance of materials by +%s per level."), number_format_percent(value)),
                sprite: spr_material_copper_bar,
                cost_exp: get_default_struct_value(arg3, "cost_exp", 5),
                max_count: get_default_struct_value(arg3, "max_count", 1),
                
                is_obfuscated: function()
                {
                    return get_upgrade_count(global.shops.blc.unlock_materials) == 0;
                },
                
                upgrade_attributes: {}
            };
            variable_struct_set(shop_item_build.upgrade_attributes, upgrade_attribute_key, value);
            break;
        case "material_spawn_count":
            base_cost = 1000000000;
            value = get_default_struct_value(arg3, "value", 1);
            shop_item_build = 
            {
                name: __("Material Duplicator"),
                description: sprintf(__("Spawns %s additional %s per level."), number_format(value), pluralize(value, __("material"), __("materials"))),
                sprite: spr_material_copper_bar,
                cost_exp: get_default_struct_value(arg3, "cost_exp", 20),
                max_count: get_default_struct_value(arg3, "max_count", 1),
                
                is_obfuscated: function()
                {
                    return get_upgrade_count(global.shops.blc.unlock_materials) == 0;
                },
                
                upgrade_attributes: 
                {
                    material_spawn_count: value
                }
            };
            break;
        case "material_storage_inc":
            base_cost = 75000;
            value = get_default_struct_value(arg3, "value", 50);
            shop_item_build = 
            {
                name: __("Material Storage"),
                description: sprintf(__("Increases material storage by %s per level."), number_format(value)),
                sprite: spr_material_copper_bar,
                cost_exp: get_default_struct_value(arg3, "cost_exp", 1.5),
                max_count: get_default_struct_value(arg3, "max_count", 50),
                
                is_obfuscated: function()
                {
                    return get_upgrade_count(global.shops.blc.unlock_materials) == 0;
                },
                
                upgrade_attributes: 
                {
                    material_max_count: value
                }
            };
            break;
        case "max_mirrors":
            base_cost = 1;
            shop_item_build = 
            {
                name: __("Max Mirrors"),
                sprite: spr_artifact_mirror,
                description: __("Increases the number of simultaneously placed mirrors."),
                upgrade_attributes: 
                {
                    max_mirrors: value
                },
                max_count: 1,
                
                is_obfuscated: function()
                {
                    return !is_unlocked_mirror();
                }
            };
            break;
        case "max_pets":
            base_cost = 2000000;
            shop_item_build = 
            {
                name: __("Pet House"),
                sprite: spr_pet_dog,
                description: __("You can equip an additional pet."),
                upgrade_attributes: 
                {
                    max_pets: 1
                },
                cost_exp: 6,
                max_count: 1,
                
                is_obfuscated: function()
                {
                    return get_upgrade_count(global.shops.blc.unlock_pets) == 0;
                },
                
                tag: global.shop_item_tags.pets
            };
            break;
        case "max_trades":
            base_cost = 2000000;
            value = get_default_struct_value(arg3, "value", 1);
            shop_item_build = 
            {
                name: __("Leaf Trader"),
                sprite: spr_icon_trading,
                description: sprintf(__("Increases max trades by %s per level."), value),
                upgrade_attributes: 
                {
                    trade_max_count: 1
                },
                cost_exp: get_default_struct_value(arg3, "cost_exp", 6),
                max_count: get_default_struct_value(arg3, "cost_exp", 3),
                after_apply: generate_trades,
                
                is_obfuscated: function()
                {
                    return get_upgrade_count(global.shops.blc.unlock_trading) == 0;
                }
            };
            break;
        case "mirror_efficiency":
            shop_item_build = 
            {
                name: __("Mirror Gloss"),
                sprite: spr_artifact_mirror,
                upgrade_attributes: 
                {
                    mirror_efficiency: get_default_struct_value(arg3, "value", 0.01)
                },
                
                is_obfuscated: function()
                {
                    return !is_unlocked_mirror();
                }
            };
            break;
        case "more_pyramid_floors":
            base_cost = 200000;
            value = get_default_struct_value(arg3, "value", 10);
            shop_item_build = 
            {
                name: __("More Pyramid Floors"),
                sprite: spr_icon_area_pyramid,
                description: sprintf(__("Increases the cap on unlocking pyramid floors beyond 100 by +%s per level."), value),
                upgrade_attributes: 
                {
                    pyramid_floors: value
                },
                cost_exp: 2.5,
                max_count: get_default_struct_value(arg3, "max_count", 10)
            };
            break;
        case "more_tower_floors":
            base_cost = 40;
            value = get_default_struct_value(arg3, "value", 20);
            shop_item_build = 
            {
                name: __("More Tower Floors"),
                description: sprintf(__("Unlocks %s more Leaf Tower floors per level. Gain more MLCs the higher your tower floor peak is."), number_format(value)),
                sprite: spr_icon_tower_floor,
                cost_exp: get_default_struct_value(arg3, "cost_exp", 8),
                max_count: get_default_struct_value(arg3, "max_count", 10),
                upgrade_attributes: 
                {
                    tower_floor: value
                }
            };
            break;
        case "more_tower_floors_pct":
            base_cost = 40;
            value = get_default_struct_value(arg3, "value", 20);
            shop_item_build = 
            {
                name: __("More Tower Floors%"),
                description: sprintf(__("Unlocks %s more Leaf Tower floors per level."), number_format_percent(value)),
                sprite: spr_icon_tower_floor,
                cost_exp: get_default_struct_value(arg3, "cost_exp", 8),
                max_count: get_default_struct_value(arg3, "max_count", 10),
                upgrade_attributes: 
                {
                    tower_floor_pct: value
                }
            };
            break;
        case "offline_artifacts":
            base_cost = 1000000000;
            value = get_default_struct_value(arg3, "value", 1);
            shop_item_build = 
            {
                name: __("Offline Artifacts"),
                description: sprintf(__("Collect %s %s per %s spawn cycles."), value, pluralize(value, __("Artifact"), __("Artifacts")), global.game_settings.artifacts_offline_divisor),
                sprite: spr_artifact_orb,
                cost_exp: 15,
                upgrade_attributes: 
                {
                    artifact_collect_offline: value
                },
                max_count: get_default_struct_value(arg3, "max_count", 1),
                prestige_level: get_default_struct_value(arg3, "prestige_level", global.prestige_levels.mlc.level),
                
                is_obfuscated: function()
                {
                    return get_upgrade_count(global.shops.blc.unlock_artifacts) == 0;
                }
            };
            break;
        case "offline_crunches":
            base_cost = 250000;
            value = get_default_struct_value(arg3, "value", 1);
            var value2 = get_default_struct_value(arg3, "value2", 0.001);
            shop_item_build = 
            {
                name: __("Offline Crunches"),
                description: sprintf(__("Perform %s offline %s per minute per level and gain %s BLCs of your highest BLC per offline crunch."), value, pluralize(value, __("crunch"), __("crunches")), number_format_percent(value2)),
                sprite: spr_blc,
                cost_exp: get_default_struct_value(arg3, "cost_exp", 32),
                upgrade_attributes: 
                {
                    offline_crunches: value,
                    offline_crunches_blc_pct: value2
                },
                max_count: get_default_struct_value(arg3, "max_count", 1)
            };
            break;
        case "offline_crunches_blc_pct":
            base_cost = 250000;
            value = get_default_struct_value(arg3, "value", 0.01);
            shop_item_build = 
            {
                name: __("Offline BLC"),
                description: sprintf(__("Gain %s BLCs of your highest BLC per offline crunch."), number_format_percent(value)),
                sprite: spr_blc,
                cost_exp: get_default_struct_value(arg3, "cost_exp", 24),
                upgrade_attributes: 
                {
                    offline_crunches_blc_pct: value
                },
                max_count: get_default_struct_value(arg3, "max_count", 1),
                
                is_obfuscated: function()
                {
                    return get_upgrade_count(global.shops.blc.offline_crunches) == 0 && get_upgrade_count(global.shops.gems.offline_crunches) == 0;
                }
            };
            break;
        case "offline_mlc":
            base_cost = 250000;
            value = get_default_struct_value(arg3, "value", 1);
            var value2 = get_default_struct_value(arg3, "value2", 0.001);
            shop_item_build = 
            {
                name: __("Offline MLC"),
                description: sprintf(__("Perform %s offline %s per minute per level and gain %s MLCs of your highest MLC per offline MLC"), value, pluralize(value, __("MLC"), __("MLCs")), number_format_percent(value2)),
                sprite: spr_mlc,
                cost_exp: get_default_struct_value(arg3, "cost_exp", 32),
                upgrade_attributes: 
                {
                    offline_mlc: value,
                    offline_mlc_pct: value2
                },
                max_count: get_default_struct_value(arg3, "max_count", 1)
            };
            break;
        case "offline_mlc_pct":
            base_cost = 250000;
            value = get_default_struct_value(arg3, "value", 0.01);
            shop_item_build = 
            {
                name: __("Offline MLC"),
                description: sprintf(__("Gain %s MLCs of your highest MLCs per offline MLC."), number_format_percent(value)),
                sprite: spr_mlc,
                cost_exp: get_default_struct_value(arg3, "cost_exp", 24),
                upgrade_attributes: 
                {
                    offline_mlc_pct: value
                },
                max_count: get_default_struct_value(arg3, "max_count", 1),
                
                is_obfuscated: function()
                {
                    return get_upgrade_count(global.shops.mlc.offline_mlc) == 0 && get_upgrade_count(global.shops.gems.offline_mlc) == 0;
                }
            };
            break;
        case "offline_prestige":
            base_cost = 250000;
            value = get_default_struct_value(arg3, "value", 1);
            var value2 = get_default_struct_value(arg3, "value2", 0.001);
            shop_item_build = 
            {
                name: __("Offline Prestige"),
                description: sprintf(__("Perform %s offline %s per minute per level and gain %s Prestige Coins of your highest Prestige per offline crunch."), value, pluralize(value, __("prestige"), __("prestiges")), number_format_percent(value2)),
                sprite: spr_gold,
                cost_exp: get_default_struct_value(arg3, "cost_exp", 32),
                upgrade_attributes: 
                {
                    offline_prestige: value,
                    offline_prestige_pct: value2
                },
                max_count: get_default_struct_value(arg3, "max_count", 1)
            };
            break;
        case "offline_prestige_pct":
            base_cost = 250000;
            value = get_default_struct_value(arg3, "value", 0.01);
            shop_item_build = 
            {
                name: __("Offline Prestige Coins"),
                description: sprintf(__("Gain %s Prestige Coins of your highest Prestige per offline prestige."), number_format_percent(value)),
                sprite: spr_gold,
                cost_exp: get_default_struct_value(arg3, "cost_exp", 24),
                upgrade_attributes: 
                {
                    offline_prestige_pct: value
                },
                max_count: get_default_struct_value(arg3, "max_count", 1),
                
                is_obfuscated: function()
                {
                    return get_upgrade_count(global.shops.coins.offline_prestige) == 0 && get_upgrade_count(global.shops.gems.offline_prestige) == 0;
                }
            };
            break;
        case "offline_seeds":
            base_cost = 1000000000;
            value = get_default_struct_value(arg3, "value", 1);
            max_count = 0;
            var desc_per_level = __("per level");
            if (max_count == 1)
            {
                desc_per_level = "";
            }
            shop_item_build = 
            {
                name: __("Offline Seeds"),
                description: sprintf(__("Get %s random %s %s every offline minute."), value, iif(value > 1, __("seeds"), __("seed")), desc_per_level),
                sprite: spr_seed_leaf,
                cost_exp: 8,
                upgrade_attributes: 
                {
                    offline_seeds: value
                },
                tag: global.shop_item_tags.farming
            };
            break;
        case "offline_tower_floors":
            base_cost = 1000000000;
            value = get_default_struct_value(arg3, "value", 1);
            shop_item_build = 
            {
                name: __("Offline Tower"),
                description: __s("Climb %s tower floors per minute while you're offline. This only works if your highest tower floor is greater than 101.", value),
                sprite: spr_icon_tower_floor,
                cost_exp: 3000,
                max_count: get_default_struct_value(arg3, "max_count", 1),
                upgrade_attributes: 
                {
                    offline_tower_floors: value
                },
                
                is_obfuscated: function()
                {
                    return global.areas.tower.get_highest_floor_current_run() < 1000;
                }
            };
            break;
        case "pet_max_upgrade_level":
            base_cost = 200;
            value = get_default_struct_value(arg3, "value", 1);
            shop_item_build = 
            {
                name: __("Max Pet Level"),
                description: sprintf(__("Increases max upgrade level of pets by %s."), 1),
                sprite: spr_pet_dog,
                cost_exp: 150,
                max_count: get_default_struct_value(arg3, "max_count", 1),
                upgrade_attributes: 
                {
                    pet_max_upgrade_level: value
                }
            };
            break;
        case "plant_hugger":
            base_cost = 200;
            value = get_default_struct_value(arg3, "value", 1);
            shop_item_build = 
            {
                name: __s("Plant Hugger"),
                sprite: spr_plant_tulip,
                cost_exp: get_default_struct_value(arg3, "cost_exp", 1.5),
                max_count: get_default_struct_value(arg3, "max_count", 10),
                upgrade_attributes: 
                {
                    nature_plant_xp_multiplier_global: value
                }
            };
            break;
        case "player_hp":
            base_cost = 10000000;
            value = get_default_struct_value(arg3, "value", 1);
            shop_item_build = 
            {
                name: __("Player HP"),
                sprite: spr_icon_heart,
                description: sprintf(__("Increases Player HP by +%s per level."), value),
                cost_exp: 1.5,
                upgrade_attributes: 
                {
                    player_hp: value
                },
                max_count: 0,
                
                is_obfuscated: function()
                {
                    return global.areas.volcano.data.count == 0;
                }
            };
            break;
        case "player_hp_multiplier":
            base_cost = 10000000;
            value = get_default_struct_value(arg3, "value", 1);
            shop_item_build = 
            {
                name: __("Vitality++"),
                sprite: spr_icon_heart,
                description: sprintf(__("Increases Player HP by +%s% per level."), value),
                cost_exp: 6,
                upgrade_attributes: 
                {
                    player_hp_multiplier: value
                },
                max_count: 0
            };
            break;
        case "player_hp_reg":
            base_cost = 20;
            shop_item_build = 
            {
                name: __("Healthy Lifestyle"),
                sprite: spr_icon_heart,
                description: sprintf(__("Increases Player HP Regeneration rate by +%s per level."), value),
                cost_exp: 1.5,
                upgrade_attributes: 
                {
                    player_hp_reg: value
                },
                max_count: 0
            };
            break;
        case "player_resistance":
            base_cost = 2000000;
            value = get_default_struct_value(arg3, "value", 1);
            shop_item_build = 
            {
                name: __("Leaf Shield"),
                description: sprintf(__("Increases your resistance in HP draining areas by %s."), value),
                sprite: spr_icon_heart,
                cost_exp: 4,
                upgrade_attributes: 
                {
                    player_resistance: value
                },
                max_count: 0,
                
                is_obfuscated: function()
                {
                    return get_upgrade_count(global.areas.volcano) == 0;
                }
            };
            break;
        case "printer_printer":
            base_cost = 200000000;
            shop_item_build = 
            {
                name: __("Printer Printer"),
                description: sprintf(__("Prints %s printers each second."), value),
                sprite: spr_icon_printer,
                cost_exp: 8,
                upgrade_attributes: 
                {
                    printer_printer: value
                },
                max_count: 300,
                tag: global.shop_item_tags.printer
            };
            break;
        case "reactor_size":
            shop_item_build = 
            {
                name: __s("Bigger Reactor"),
                sprite: spr_icon_quark_reactor,
                cost_exp: 4,
                max_count: 0,
                upgrade_attributes: 
                {
                    quark_reactor_size: value
                }
            };
            break;
        case "relics_base_damage":
            base_cost = 200000000;
            value = get_default_struct_value(arg3, "value", 0.001);
            shop_item_build = 
            {
                name: __("Relics BASE DAMAGE!"),
                description: sprintf(__("Increases relic base damage by %s."), number_format_percent(value)),
                sprite: spr_relic_uncommon,
                cost_exp: 4,
                upgrade_attributes: 
                {
                    relics_base_damage: value
                },
                max_count: get_default_struct_value(arg3, "max_count", 10),
                tag: global.shop_item_tags.relics,
                
                is_obfuscated: function()
                {
                    return !is_unlocked_relics();
                }
            };
            break;
        case "relics_base_damage_multiplier":
            base_cost = 200000000;
            value = get_default_struct_value(arg3, "value", 0.01);
            shop_item_build = 
            {
                name: __("Relics DAMAGE MULTIPLIER!"),
                description: sprintf(__("Increases relic base damage by %s."), number_format_percent(value)),
                sprite: spr_relic_uncommon,
                cost_exp: 12,
                upgrade_attributes: 
                {
                    relics_base_damage_multiplier: value
                },
                max_count: get_default_struct_value(arg3, "max_count", 10),
                tag: global.shop_item_tags.relics,
                
                is_obfuscated: function()
                {
                    return !is_unlocked_relics();
                }
            };
            break;
        case "relic_spawn_chance":
            base_cost = 200000000;
            value = get_default_struct_value(arg3, "value", 0.01);
            shop_item_build = 
            {
                name: __("Relics GET!"),
                description: sprintf(__("Increases the drop rate of relics by %s."), number_format_percent(value)),
                sprite: spr_relic_uncommon,
                cost_exp: 16,
                upgrade_attributes: 
                {
                    relics_enemy_drop_chance: value
                },
                max_count: get_default_struct_value(arg3, "max_count", 10),
                tag: global.shop_item_tags.relics,
                
                is_obfuscated: function()
                {
                    return !is_unlocked_relics();
                }
            };
            break;
        case "scrolls_concurrent_max":
            base_cost = 5000000000;
            value = get_default_struct_value(arg3, "value", 1);
            shop_item_build = 
            {
                name: __("Concurrent Scrolls"),
                description: sprintf(__("Increases max concurrent scrolls by %s per level."), value),
                sprite: spr_scroll_damage,
                cost_exp: 20,
                upgrade_attributes: 
                {
                    scrolls_active_max: value
                },
                max_count: get_default_struct_value(arg3, "max_count", 3),
                tag: global.shop_item_tags.scrolls
            };
            break;
        case "scroll_drop_chance":
            base_cost = 75000000000;
            value = get_default_struct_value(arg3, "value", 1);
            shop_item_build = 
            {
                name: __("Frequent Scrolls"),
                description: sprintf(__("Increases drop chance of scrolls by %s% per level."), number_format(value)),
                sprite: spr_scroll_damage,
                cost_exp: 12,
                upgrade_attributes: 
                {
                    scroll_drop_chance: value
                },
                max_count: get_default_struct_value(arg3, "max_count", 5),
                tag: global.shop_item_tags.scrolls
            };
            break;
        case "scrolls_duration":
            base_cost = 500000000;
            value = get_default_struct_value(arg3, "value", 0.025);
            shop_item_build = 
            {
                name: __("Durable Scrolls"),
                description: sprintf(__("Increases duration of scrolls by %s% per level."), number_format(value * 100)),
                sprite: spr_scroll_damage,
                cost_exp: 6,
                upgrade_attributes: 
                {
                    scrolls_duration: value
                },
                max_count: get_default_struct_value(arg3, "max_count", 20),
                tag: global.shop_item_tags.scrolls
            };
            break;
        case "seed_spawn_count":
            base_cost = 250;
            shop_item_build = 
            {
                name: __("SEEDS!"),
                description: sprintf(__("Seeds, seeds, seeds! Increases seed spawn count by +%s per level."), value),
                sprite: spr_seed_leaf,
                cost_exp: 16,
                upgrade_attributes: 
                {
                    seed_spawn_count: value
                },
                max_count: 10,
                tag: global.shop_item_tags.farming
            };
            break;
        case "shardify_increase_output":
            base_cost = 1;
            value = get_default_struct_value(arg3, "value", 1);
            shop_item_build = 
            {
                name: __("Shardify++"),
                description: __s("Increases Shardify output by %s.", number_format(value)),
                sprite: spr_resource_shards,
                cost_exp: get_default_struct_value(arg3, "cost_exp", 40),
                upgrade_attributes: 
                {
                    shardify_increase_output: value
                },
                max_count: get_default_struct_value(arg3, "max_count", 5),
                
                is_obfuscated: function()
                {
                    return get_upgrade_count(global.shops.malachite.unlock_shardify_artifacts) == 0;
                }
            };
            break;
        case "shards_max_count":
            base_cost = 1;
            value = get_default_struct_value(arg3, "value", 1);
            shop_item_build = 
            {
                name: __("Saturated Shards"),
                description: sprintf(__("Increases max Shards count per leaf by %s. This doesn't extend the max Shards count per property."), value),
                sprite: spr_resource_shards,
                cost_exp: get_default_struct_value(arg3, "cost_exp", 20),
                upgrade_attributes: 
                {
                    shards_max_count: value
                },
                max_count: get_default_struct_value(arg3, "max_count", 3)
            };
            break;
        case "shards_reduce_selection_cost":
            base_cost = 1;
            value = get_default_struct_value(arg3, "value", 1);
            shop_item_build = 
            {
                name: __("Sharp Shards"),
                description: sprintf(__("Reduces the selection shards cost by %s per level."), value),
                sprite: spr_resource_shards,
                cost_exp: 20,
                upgrade_attributes: 
                {
                    shards_reduce_selection_cost: value
                },
                max_count: 5
            };
            break;
        case "slap_multiplier":
            base_cost = 500;
            value = get_default_struct_value(arg3, "value", 0.1);
            shop_item_build = 
            {
                name: __("Slap Force"),
                description: sprintf(__("SLAP THE ENEMIES! Increases trout slap damage by %s."), number_format_percent(value)),
                sprite: spr_weapon_trout,
                cost_exp: 3,
                upgrade_attributes: 
                {
                    slap_multiplier: value
                },
                max_count: get_default_struct_value(arg3, "max_count", 10)
            };
            break;
        case "time_travel":
            base_cost = 100;
            shop_item_build = 
            {
                value: get_default_struct_value(arg3, "value", 1),
                name: sprintf(__("Time Travel %s"), arg3.value_name),
                description: sprintf(__("Receive offline rewards for the next %s instantly."), arg3.value_name),
                sprite: spr_icon_clock,
                max_count: get_default_struct_value(arg3, "max_count", 0),
                is_static: true,
                is_usable: true,
                add_to_inventory: true,
                
                use: function(arg0)
                {
                    use_time_travel(arg0);
                }
            };
            break;
        case "trade_decrease_input_count":
            base_cost = 20000000;
            shop_item_build = 
            {
                name: __("Trading Optimization"),
                sprite: spr_icon_trading,
                description: sprintf(__("Decreases trade input resources by 50%. This effect is multiplicative."), number_format_percent(value)),
                upgrade_attributes: 
                {
                    trade_decrease_input_count: value
                },
                cost_exp: get_default_struct_value(arg3, "cost_exp", 16),
                max_count: get_default_struct_value(arg3, "max_count", 10),
                after_apply: generate_trades,
                
                is_obfuscated: function()
                {
                    return !is_unlocked_trading();
                }
            };
            break;
        case "trade_education":
            base_cost = 20000000;
            shop_item_build = 
            {
                name: __("Trading Education"),
                sprite: spr_icon_trading,
                description: __("Increases max trade level by 1 per upgrade level."),
                upgrade_attributes: 
                {
                    trade_base_level: 1
                },
                cost_exp: 24,
                max_count: 50,
                after_apply: generate_trades,
                
                is_obfuscated: function()
                {
                    return !is_unlocked_trading();
                }
            };
            break;
        case "trade_education_advanced":
            base_cost = 20000000;
            value = get_default_struct_value(arg3, "value", 1);
            shop_item_build = 
            {
                name: __("Advanced Trading Education"),
                sprite: spr_icon_trading,
                description: __("Increases min and max trade level by 1 per upgrade level."),
                upgrade_attributes: 
                {
                    trade_base_level: 1,
                    trade_base_level_min: 1
                },
                cost_exp: 5,
                max_count: 30,
                after_apply: generate_trades,
                
                is_obfuscated: function()
                {
                    return get_upgrade_count(global.shops.blc.unlock_trading) == 0;
                }
            };
            break;
        case "trade_gems_max_value":
            shop_item_build = 
            {
                name: __("Gems Business"),
                sprite: spr_resource_gem,
                upgrade_attributes: 
                {
                    trade_gems_max_value: get_default_struct_value(arg3, "value", 1)
                }
            };
            break;
        case "trade_refresh_decrease_timer":
            base_cost = 3000000;
            value = get_default_struct_value(arg3, "value", 0.01);
            shop_item_build = 
            {
                name: __("Customer Acquisition"),
                sprite: spr_icon_trading,
                description: sprintf(__("Find new trades faster! Decreases trades refresh cooldown by %s%."), value * 100),
                upgrade_attributes: 
                {
                    trade_refresh_decrease_timer: value
                },
                cost_exp: 125,
                max_count: get_default_struct_value(arg3, "max_count", 10),
                after_apply: refresh_trades_refresh_timer,
                
                is_obfuscated: function()
                {
                    return !is_unlocked_trading();
                }
            };
            break;
        case "unique_max_upgrade_level":
            base_cost = 200;
            value = get_default_struct_value(arg3, "value", 1);
            shop_item_build = 
            {
                name: __("Max Unique Level"),
                description: sprintf(__("Increases max upgrade level of Unique Leaves by %s."), 1),
                sprite: spr_leaf_unique_fire,
                cost_exp: 150,
                max_count: get_default_struct_value(arg3, "max_count", 1),
                upgrade_attributes: 
                {
                    unique_max_upgrade_level: value
                }
            };
            break;
        case "unlock_converter":
            base_cost = 1000000;
            var converter = variable_struct_get(global.converters, value);
            shop_item_build = 
            {
                name: function()
                {
                    return __s("Unlock %s", variable_struct_get(global.converters, self.converter).name);
                },
                
                description: function()
                {
                    return (variable_struct_get(global.converters, self.converter)).get_description();
                },
                
                sprite: converter.sprite,
                converter: value,
                description: "",
                max_count: 1,
                
                func: function()
                {
                    var converter = variable_struct_get(global.converters, self.converter);
                    converter.data.unlocked = true;
                },
                
                is_obfuscated: get_default_struct_value(arg3, "is_obfuscated", false)
            };
            break;
        case "unlock_resource":
            base_cost = 1000000;
            shop_item_build = 
            {
                name: __s("Unlock %s", value.name_plural),
                sprite: value.sprite,
                description: "",
                max_count: 1,
                resource: value,
                
                func: function()
                {
                    self.resource.data.unlocked = true;
                },
                
                is_obfuscated: get_default_struct_value(arg3, "is_obfuscated", false)
            };
            if (value.is_gem_leaf)
            {
                shop_item_build.upgrade_attributes = 
                {
                    gem_leaf_multiplier: 1
                };
            }
            break;
        case "unlock_seed":
            base_cost = 1000000;
            var default_name = sprintf(__("Unlock %s Seeds"), arg3.resource.name_single);
            var name = get_default_struct_value(arg3, "name", default_name);
            shop_item_build = 
            {
                name: name,
                description: sprintf(__("This upgrade unlocks %s seeds in the farming shop."), arg3.resource.name_single),
                sprite: arg3.resource.sprite,
                max_count: 1,
                resource: arg3.resource,
                upgrade_attributes: 
                {
                    seed_unlocked: {}
                }
            };
            variable_struct_set(shop_item_build.upgrade_attributes.seed_unlocked, arg3.resource.key, 1);
            break;
        case "weapon_max_upgrade_level":
            base_cost = 200;
            value = get_default_struct_value(arg3, "value", 1);
            shop_item_build = 
            {
                name: __("Max Tool Level"),
                description: sprintf(__("Increases max upgrade level of Tools by %s."), 1),
                sprite: spr_weapon_leaf_blower,
                cost_exp: 150,
                max_count: get_default_struct_value(arg3, "max_count", 1),
                upgrade_attributes: 
                {
                    weapon_max_upgrade_level: value
                }
            };
            break;
        case "witch_cursed_count":
            base_cost = 1000000;
            value = get_default_struct_value(arg3, "value", 11);
            shop_item_build = 
            {
                name: __("Witch Curses"),
                description: sprintf(__("Defeating The Witch yields %s more curses per level."), number_format(value)),
                sprite: spr_icon_cursed_cheese,
                max_count: get_default_struct_value(arg3, "max_count", 666),
                
                is_obfuscated: function()
                {
                    return global.areas.kokkaupunki_cursed.data.count == 0;
                },
                
                upgrade_attributes: 
                {
                    witch_cursed_count: value
                }
            };
            break;
        case "witch_essence_count":
            base_cost = 1000000;
            value = get_default_struct_value(arg3, "value", 10);
            shop_item_build = 
            {
                name: __("Witch Essences"),
                description: sprintf(__("Defeating The Witch yields %s more %s per level."), number_format(value), pluralize(value, __("essence"), __("essences"))),
                sprite: spr_material_essence_cosmic,
                max_count: get_default_struct_value(arg3, "max_count", 10),
                
                is_obfuscated: function()
                {
                    return global.areas.kokkaupunki_cursed.data.count == 0;
                },
                
                upgrade_attributes: 
                {
                    witch_essence_count: value
                }
            };
            break;
        case "witch_spawn_delay":
            base_cost = 1000000;
            value = get_default_struct_value(arg3, "value", 0.01);
            shop_item_build = 
            {
                name: __("Witch Reviver"),
                description: sprintf(__("The Witch spawns %s faster per level."), number_format_percent(value)),
                sprite: spr_icon_tombstone,
                max_count: get_default_struct_value(arg3, "max_count", 20),
                
                is_obfuscated: function()
                {
                    return global.areas.kokkaupunki_cursed.data.count == 0;
                },
                
                upgrade_attributes: 
                {
                    area_boss_spawn_delay_decrease_area: 
                    {
                        kokkaupunki_cursed: value
                    }
                }
            };
            break;
        case "borbventure_craft_cost_multiplier":
            base_cost = 2500;
            shop_item_build = 
            {
                name: __s("Hagglin' %s", "Borb"),
                sprite: spr_resource_borb_rune,
                upgrade_attributes: 
                {
                    borbventure_craft_cost_multiplier: value
                },
                
                is_obfuscated: function()
                {
                    return !is_unlocked_borbventure();
                }
            };
            break;
        case "borbventure_refresh_timer_multiplier":
            base_cost = 2500;
            shop_item_build = 
            {
                name: __s("Refresh Tutorial"),
                sprite: spr_borb_jones,
                upgrade_attributes: 
                {
                    borbventure_refresh_timer_multiplier: value
                },
                
                is_obfuscated: function()
                {
                    return !is_unlocked_borbventure();
                },
                
                buy_after: function()
                {
                }
            };
            break;
        case "borbventure_increase_reward":
            base_cost = 2500;
            shop_item_build = 
            {
                name: __s("Squeeze Tutorial"),
                sprite: spr_borbventure_item_pirate_hat,
                upgrade_attributes: 
                {
                    borbventure_increase_reward: value
                },
                
                is_obfuscated: function()
                {
                    return !is_unlocked_borbventure();
                }
            };
            break;
        case "borbventure_increase_xp":
            base_cost = 2500;
            shop_item_build = 
            {
                name: __s("Efficiency Tutorial"),
                sprite: spr_borbventure_item_glasses,
                upgrade_attributes: 
                {
                    borbventure_increase_xp: value
                },
                
                is_obfuscated: function()
                {
                    return !is_unlocked_borbventure();
                }
            };
            break;
        case "borbventure_items_ascend_count":
            base_cost = 2500;
            shop_item_build = 
            {
                name: __s("Upgrade Tutorial"),
                sprite: spr_resource_borb_rune,
                upgrade_attributes: 
                {
                    borbventure_items_ascend_count: value
                },
                
                is_obfuscated: function()
                {
                    return !is_unlocked_borbventure();
                }
            };
            break;
        case "borbventure_special_recruit_chance":
            base_cost = 2500;
            shop_item_build = 
            {
                name: __s("Special Type Tutorial"),
                sprite: spr_borb_jones,
                upgrade_attributes: 
                {
                    borbventure_special_recruit_chance: value
                },
                
                is_obfuscated: function()
                {
                    return !is_unlocked_borbventure();
                }
            };
            break;
        case "max_borbventure_items":
            base_cost = 2500;
            shop_item_build = 
            {
                name: __s("Item Shelf"),
                sprite: spr_icon_backpack,
                upgrade_attributes: 
                {
                    borbventure_inventory_size: value
                },
                
                is_obfuscated: function()
                {
                    return !is_unlocked_borbventure();
                }
            };
            break;
        case "dice_count":
            shop_item_build = 
            {
                name: __("Dice Count"),
                sprite: spr_icon_die,
                max_count: 10,
                description_suffix: "\n" + __s("Applies to dice bag and battlefield."),
                upgrade_attributes: 
                {
                    dice_dice: get_default_struct_value(arg3, "value", 1)
                }
            };
            break;
        case "dice_sides":
            shop_item_build = 
            {
                name: __("Sides Count"),
                sprite: spr_icon_die,
                max_count: 10,
                description_suffix: "\n" + __s("Applies to dice bag and battlefield."),
                upgrade_attributes: 
                {
                    dice_sides: get_default_struct_value(arg3, "value", 1)
                }
            };
            break;
        case "dice_backpack_size":
            shop_item_build = 
            {
                name: __("Bigger Dice Backpack"),
                sprite: spr_icon_backpack,
                max_count: 5,
                upgrade_attributes: 
                {
                    dice_backpack_size: get_default_struct_value(arg3, "value", 1)
                }
            };
            break;
        case "dice_inventory_size":
            shop_item_build = 
            {
                name: __("Bigger Dice Bag"),
                sprite: spr_icon_backpack,
                max_count: 5,
                upgrade_attributes: 
                {
                    dice_inventory_size: get_default_struct_value(arg3, "value", 1)
                }
            };
            break;
        case "dice_timeout_reduction":
            shop_item_build = 
            {
                name: __("Faster Dice"),
                sprite: spr_icon_die,
                max_count: 10,
                description_suffix: "\n" + __s("Applies to dice bag."),
                upgrade_attributes: 
                {
                    dice_timeout_reduction: get_default_struct_value(arg3, "value", 0.5)
                }
            };
            break;
        case "dice_battlefield_roll_timeout_reduction":
            shop_item_build = 
            {
                name: __("Faster Battle Dice"),
                sprite: spr_icon_die,
                max_count: 5,
                upgrade_attributes: 
                {
                    dice_battlefield_roll_timeout_reduction: get_default_struct_value(arg3, "value", 1)
                }
            };
            break;
        default:
            shop_item_build = {};
            break;
    }
    if (is_struct(shop_item_build))
    {
        shop_item_build.index = arg2;
        shop_item_build.after_apply_ua = get_default_struct_value(arg3, "after_apply_ua");
        shop_item_build.cost = {};
        variable_struct_set(shop_item_build.cost, arg1.key, get_default_struct_value(arg3, "base_cost", get_default_struct_value(shop_item_build, "base_cost", base_cost)));
        shop_item_build.cost_exp = get_default_struct_value(arg3, "cost_exp", get_default_struct_value(shop_item_build, "cost_exp", 2));
        shop_item_build.func = get_default_struct_value(arg3, "func", get_default_struct_value(shop_item_build, "func", func));
        shop_item_build.max_count = get_default_struct_value(arg3, "max_count", get_default_struct_value(shop_item_build, "max_count", max_count));
        shop_item_build.name = get_default_struct_value(arg3, "name", get_default_struct_value(shop_item_build, "name", __("Unknown")));
        shop_item_build.refresh_ua = get_default_struct_value(arg3, "refresh_ua", false);
        shop_item_build.refresh_section = get_default_struct_value(arg3, "refresh_section");
        shop_item_build.sprite = get_default_struct_value(arg3, "sprite", get_default_struct_value(shop_item_build, "sprite", spr_placeholder));
        shop_item_build.upgrade_attributes = get_default_struct_value(arg3, "upgrade_attributes", get_default_struct_value(shop_item_build, "upgrade_attributes", undefined));
        var description = get_default_struct_value(arg3, "description", get_default_struct_value(shop_item_build, "description", undefined));
        shop_item_build.description_prefix = get_default_struct_value(arg3, "description_prefix", get_default_struct_value(shop_item_build, "description_prefix", ""));
        shop_item_build.description_suffix = get_default_struct_value(arg3, "description_suffix", get_default_struct_value(shop_item_build, "description_suffix", ""));
        if (is_undefined(description))
        {
            description = method(shop_item_build, get_general_description);
        }
        shop_item_build.description = description;
        var supporters_tier = get_default_struct_value(arg3, "supporters_tier", UnknownEnum.Value_0);
        if (supporters_tier > UnknownEnum.Value_0)
        {
            shop_item_build.supporters_only = true;
            shop_item_build.supporters_tier = supporters_tier;
        }
        var section = get_default_struct_value(arg3, "section", undefined);
        if (!is_undefined(section))
        {
            shop_item_build.section = section;
        }
        apply_struct_to_struct(shop_item, shop_item_build);
        var __struct = shop_item_build;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            if (is_callable(mitem))
            {
                variable_struct_set(shop_item, mkey, mitem);
            }
        }
        if (is_struct(arg3))
        {
            apply_struct_to_struct(shop_item, arg3);
            var is_obfuscated_item = get_default_struct_value(arg3, "is_obfuscated", undefined);
            if (!is_undefined(is_obfuscated_item))
            {
                shop_item.is_obfuscated = is_obfuscated_item;
            }
        }
        var name_suffix = get_default_struct_value(arg3, "name_suffix", "");
        if (!is_empty(name_suffix))
        {
            shop_item.name += " " + string(name_suffix);
        }
    }
    return shop_item;
}

enum UnknownEnum
{
    Value_0
}
