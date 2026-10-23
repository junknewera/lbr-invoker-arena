function get_borbventure_types()
{
    var borbventure_types = 
    {
        borb_juice: 
        {
            chance: 25,
            
            reward: function(arg0, arg1 = undefined, arg2 = 0)
            {
                var min_value = arg0 * 15;
                var max_value = arg0 * 20;
                var value = max(1, irandom_range(min_value, max_value));
                value *= global.borbventures.get_rarity_multiplier(arg0);
                value = max(1, round(value));
                return 
                {
                    resources: build_resource_cost(global.resources.borb_juice, value)
                };
            },
            
            can_generate: function()
            {
                return global.borbventures.get_current_borbventures_type_count("borb_juice") < 2;
            }
        },
        borb_ascension_juice: 
        {
            chance: 25,
            min_level: 2,
            
            reward: function(arg0, arg1 = undefined, arg2 = 0)
            {
                var min_value = arg0 * 0.08;
                var max_value = arg0 * 0.16;
                var value = max(1, irandom_range(min_value, max_value));
                value *= global.borbventures.get_rarity_multiplier(arg0);
                value = max(1, round(value));
                return 
                {
                    resources: build_resource_cost(global.resources.borb_ascension_juice, value)
                };
            }
        },
        borb_rune: 
        {
            chance: 20,
            
            reward: function(arg0, arg1 = undefined, arg2 = 0)
            {
                var min_value = arg0 * 0.07;
                var max_value = arg0 * 0.14;
                var value = max(1, irandom_range(min_value, max_value));
                value *= global.borbventures.get_rarity_multiplier(arg0);
                value = max(1, round(value));
                return 
                {
                    resources: build_resource_cost(global.resources.borb_rune, value)
                };
            }
        },
        borb_ascension_rune: 
        {
            chance: 25,
            min_level: global.borbventures.borb_levels.epic,
            
            reward: function(arg0, arg1 = undefined, arg2 = 0)
            {
                var min_value = arg0 * 0.005;
                var max_value = arg0 * 0.015;
                var value = max(1, irandom_range(min_value, max_value));
                value *= global.borbventures.get_rarity_multiplier(arg0);
                value = max(1, round(value));
                return 
                {
                    resources: build_resource_cost(global.resources.borb_ascension_rune, value)
                };
            }
        },
        borb_token: 
        {
            chance: 25,
            
            reward: function(arg0, arg1 = undefined, arg2 = 0)
            {
                var min_value = 20 + (arg0 * 2);
                var max_value = 20 + (arg0 * 4);
                var value = max(1, irandom_range(min_value, max_value));
                value *= global.borbventures.get_rarity_multiplier(arg0);
                value = max(1, round(value));
                return 
                {
                    resources: build_resource_cost(global.resources.borb_token, value)
                };
            }
        },
        dice: 
        {
            chance: 20,
            multiplier_scale: 0.2,
            
            reward: function(arg0, arg1 = undefined, arg2 = 0)
            {
                var drop_value = get_dice_drop_value_min();
                var min_value = drop_value * arg0 * 0.03;
                var max_value = drop_value * arg0 * 0.05;
                var value = max(1, irandom_range(min_value, max_value));
                value *= global.borbventures.get_rarity_multiplier(arg0);
                value = max(1, round(value));
                return 
                {
                    resources: build_resource_cost(global.resources.dice, value)
                };
            },
            
            can_generate: function()
            {
                return is_unlocked_dice();
            },
            
            tags: ["dice"]
        },
        power_dice: 
        {
            chance: 5,
            multiplier_scale: 0.1,
            
            reward: function(arg0, arg1 = undefined, arg2 = 0)
            {
                var drop_value = get_dice_drop_value_min();
                var min_value = drop_value * arg0 * 0.001;
                var max_value = drop_value * arg0 * 0.002;
                var value = max(1, irandom_range(min_value, max_value));
                value *= global.borbventures.get_rarity_multiplier(arg0);
                value = max(1, round(value));
                return 
                {
                    resources: build_resource_cost(global.resources.power_dice, value)
                };
            },
            
            can_generate: function()
            {
                return is_unlocked_dice();
            },
            
            tags: ["dice"]
        },
        free_borb: 
        {
            name: __s("Free %s", "Borb"),
            chance: 2,
            max_rarity: global.borbventures.borb_levels.rare,
            sprite: spr_borb,
            scale_reward: false,
            
            reward: function(arg0, arg1 = undefined, arg2 = 0)
            {
                var rarity = variable_struct_get(global.borbventures.borb_levels, arg1.key);
                if (rarity.level > 3)
                {
                    rarity = global.borbventures.borb_levels.rare;
                }
                var res = 
                {
                    borbventure_item: {}
                };
                variable_struct_set(res.borbventure_item, rarity.key, 
                {
                    free_borb: 1
                });
                return res;
            }
        },
        random_candy: 
        {
            name: __("Random Candy"),
            chance: 15,
            sprite: spr_borbventure_item_candy,
            scale_reward: false,
            
            reward: function(arg0, arg1 = undefined, arg2 = 0)
            {
                var rarity = variable_struct_get(global.borbventures.borb_levels, arg1.key);
                var res = 
                {
                    borbventure_item: {}
                };
                var item = array_random_item(global.borbventures.borbventure_items_candy);
                variable_struct_set(res.borbventure_item, rarity.key, {});
                variable_struct_set(variable_struct_get(res.borbventure_item, rarity.key), item.key, 1);
                return res;
            }
        },
        random_item: 
        {
            name: __("Random Item"),
            chance: 35,
            max_rarity: global.borbventures.borb_levels.rare,
            sprite: spr_icon_questionbox,
            scale_reward: false,
            
            reward: function(arg0, arg1 = undefined, arg2 = 0)
            {
                var min_value = arg0 * 0.1;
                var max_value = arg0 * 0.2;
                var value = max(1, irandom_range(min_value, max_value));
                value *= global.borbventures.get_rarity_multiplier(arg0);
                value = max(1, round(value));
                var rarity = variable_struct_get(global.borbventures.borb_levels, arg1.key);
                var res = 
                {
                    borbventure_item: {}
                };
                variable_struct_set(res.borbventure_item, rarity.key, 
                {
                    random_item: value
                });
                return res;
            }
        },
        borbcipherer: 
        {
            name: __("Borbcipherer"),
            chance: 10,
            min_rarity: global.borbventures.borb_levels.uncommon,
            sprite: spr_icon_borbcipherer,
            scale_reward: false,
            
            reward: function(arg0, arg1 = undefined, arg2 = 0)
            {
                var res = 
                {
                    stats: 
                    {
                        borbcipherer: 1
                    }
                };
                return res;
            },
            
            can_generate: function()
            {
                return o_game.data.stats.borbcipherer == 0 && global.areas.shadow_cavern.check();
            }
        },
        nature_gems: 
        {
            name: global.resources.nature_gems.name,
            chance: 3,
            min_rarity: global.borbventures.borb_levels.mythical,
            sprite: global.resources.nature_gems.sprite,
            scale_reward: false,
            tags: ["event"],
            
            reward: function(arg0, arg1 = undefined, arg2 = 0)
            {
                var res = 
                {
                    resources: build_resource_cost(global.resources.nature_gems, 5)
                };
                return res;
            },
            
            can_generate: function()
            {
                if (!is_event_active(global.events.nature_season))
                {
                    return false;
                }
                return true;
            },
            
            generate_timeout: sec(3600)
        },
        nature_time_sphere: 
        {
            name: global.resources.nature_time_sphere.name,
            chance: 5,
            min_rarity: global.borbventures.borb_levels.rare,
            sprite: global.resources.nature_time_sphere.sprite,
            scale_reward: false,
            tags: ["event"],
            
            reward: function(arg0, arg1 = undefined, arg2 = 0)
            {
                var res = 
                {
                    resources: build_resource_cost(global.resources.nature_time_sphere, 1)
                };
                return res;
            },
            
            can_generate: function()
            {
                if (!is_event_active(global.events.nature_season))
                {
                    return false;
                }
                return true;
            },
            
            generate_timeout: sec(1800)
        },
        magic_mulch: 
        {
            name: global.resources.magic_mulch.name,
            chance: 10,
            min_rarity: global.borbventures.borb_levels.uncommon,
            sprite: global.resources.magic_mulch.sprite,
            scale_reward: false,
            tags: ["event"],
            
            reward: function(arg0, arg1 = undefined, arg2 = 0)
            {
                var res = 
                {
                    resources: build_resource_cost(global.resources.magic_mulch, 10 + (arg0 * 5))
                };
                return res;
            },
            
            can_generate: function()
            {
                if (!is_event_active(global.events.nature_season))
                {
                    return false;
                }
                return true;
            },
            
            generate_timeout: sec(600)
        },
        clover_basic3: 
        {
            name: global.resources.clover_basic3.name,
            chance: 10,
            min_rarity: global.borbventures.borb_levels.common,
            sprite: global.resources.clover_basic3.sprite,
            scale_reward: false,
            tags: ["event"],
            
            reward: function(arg0, arg1 = undefined, arg2 = 0)
            {
                var res = 
                {
                    resources: build_resource_cost(global.resources.clover_basic3, round(1 + (arg0 * 0.1)))
                };
                return res;
            },
            
            can_generate: function()
            {
                if (!is_event_active(global.events.nature_season))
                {
                    return false;
                }
                return true;
            },
            
            generate_timeout: sec(300)
        },
        clover_basic4: 
        {
            name: global.resources.clover_basic4.name,
            chance: 3,
            min_rarity: global.borbventures.borb_levels.rare,
            sprite: global.resources.clover_basic4.sprite,
            scale_reward: false,
            tags: ["event"],
            
            reward: function(arg0, arg1 = undefined, arg2 = 0)
            {
                var res = 
                {
                    resources: build_resource_cost(global.resources.clover_basic4, round(1 + (arg0 * 0.01)))
                };
                return res;
            },
            
            can_generate: function()
            {
                if (!is_event_active(global.events.nature_season))
                {
                    return false;
                }
                return true;
            },
            
            generate_timeout: sec(900)
        },
        quark_blob: 
        {
            chance: 10,
            input_multiplier: 500,
            min_rarity: global.borbventures.borb_levels.mythical,
            sprite: global.resources.quark_blob.sprite,
            scale_reward: false,
            tags: ["quarks"],
            
            reward: function(arg0, arg1 = undefined, arg2 = 0)
            {
                var res = 
                {
                    resources: build_resource_cost(global.resources.quark_blob, round(1 + (arg0 * 0.2)))
                };
                return res;
            },
            
            can_generate: function()
            {
                return is_unlocked_quarks() && has_bought_shop_item_safe(global.shops.quark_structure.quark_resources_enabled_in_bv);
            },
            
            generate_timeout: sec(600)
        },
        quark_structure: 
        {
            chance: 10,
            input_multiplier: 250,
            min_rarity: global.borbventures.borb_levels.mythical,
            sprite: global.resources.quark_structure.sprite,
            scale_reward: false,
            tags: ["quarks"],
            
            reward: function(arg0, arg1 = undefined, arg2 = 0)
            {
                var res = 
                {
                    resources: build_resource_cost(global.resources.quark_structure, round(1 + (arg0 * 5)))
                };
                return res;
            },
            
            can_generate: function()
            {
                return is_unlocked_quarks() && has_bought_shop_item_safe(global.shops.quark_structure.quark_resources_enabled_in_bv);
            },
            
            generate_timeout: sec(300)
        },
        quantum_blob: 
        {
            chance: 5,
            input_multiplier: 2000,
            min_rarity: global.borbventures.borb_levels.mythical,
            sprite: global.resources.quantum_blob.sprite,
            scale_reward: false,
            tags: ["quarks"],
            
            reward: function(arg0, arg1 = undefined, arg2 = 0)
            {
                var res = 
                {
                    resources: build_resource_cost(global.resources.quantum_blob, round(1 + (arg0 * 0.1)))
                };
                return res;
            },
            
            can_generate: function()
            {
                return is_unlocked_quarks() && has_bought_shop_item_safe(global.shops.quark_structure.quark_resources_enabled_in_bv);
            },
            
            generate_timeout: sec(900)
        }
    };
    add_keys_to_struct(borbventure_types);
    return borbventure_types;
}
