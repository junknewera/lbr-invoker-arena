function init_dice()
{
    global.dice_inventory = [];
    global.dice_backpack = [];
    global.dice_rarity = 
    {
        common: new Dice_Rarity(
        {
            name: __("Common"),
            name_full: __s("Common %s", __("Die")),
            level: 1,
            spawn_chance: 100
        }),
        uncommon: new Dice_Rarity(
        {
            name: __("Uncommon"),
            name_full: __s("Uncommon %s", __("Die")),
            level: 2,
            spawn_chance: 5,
            min_level: 15
        }),
        rare: new Dice_Rarity(
        {
            name: __("Rare"),
            name_full: __s("Rare %s", __("Die")),
            level: 3,
            spawn_chance: 1,
            min_level: 36
        }),
        epic: new Dice_Rarity(
        {
            name: __("Epic"),
            name_full: __s("Epic %s", __("Die")),
            level: 4,
            spawn_chance: 0.5,
            min_level: 71
        }),
        mythical: new Dice_Rarity(
        {
            name: __("Mythical"),
            name_full: __s("Mythical %s", __("Die")),
            level: 5,
            spawn_chance: 0.3,
            min_level: 106
        }),
        legendary: new Dice_Rarity(
        {
            name: __("Legendary"),
            name_full: __s("Legendary %s", __("Die")),
            level: 6,
            spawn_chance: 0.2,
            min_level: 129
        })
    };
    add_keys_to_struct(global.dice_rarity);
    call_struct(global.dice_rarity, "init");
    global.dice_rarity_sorted = struct_to_sorted_array_by(global.dice_rarity, "level", true);
    global.dice_rarity_length = array_length(global.dice_rarity_sorted);
    global.dice_types = 
    {
        alchemy: new Dice_Type(
        {
            name: __("Alchemy"),
            sprite: spr_icon_alchemy,
            upgrade_attributes: 
            {
                alchemy_brew_crit_chance: 0.001
            },
            
            can_generate: function()
            {
                return is_unlocked_alchemy();
            }
        }),
        battle_die: new Dice_Type(
        {
            name: __("Battle"),
            sprite: spr_icon_die_red,
            upgrade_attributes: 
            {
                dice_battlefield_damage_multiplier: 0.02
            }
        }),
        blc: new Dice_Type(
        {
            name: __("BLC"),
            sprite: spr_blc,
            upgrade_attributes: 
            {
                blc_value_multiplier_dice: 0.02
            }
        }),
        blower: new Dice_Type(
        {
            name: __("Blower"),
            sprite: spr_weapon_leaf_blower,
            upgrade_attributes: 
            {
                blower_enemy_damage_multiplier_dice: 0.03
            }
        }),
        borb: new Dice_Type(
        {
            name: __("Borb"),
            sprite: spr_borb_cool,
            upgrade_attributes: 
            {
                borbventure_increase_reward: 0.002
            }
        }),
        cursed_die: new Dice_Type(
        {
            name: __("Cursed"),
            sprite: spr_icon_cursed_die,
            upgrade_attributes: 
            {
                dice_cursed_critical_chance: 0.005,
                dice_cursed_critical_multiplier: 0.001
            }
        }),
        energy: new Dice_Type(
        {
            name: __("Energy"),
            sprite: spr_resource_electrical_energy,
            upgrade_attributes: 
            {
                max_energy_storage: 5
            },
            
            can_generate: function()
            {
                return is_unlocked_energy_electrical();
            }
        }),
        leaf: new Dice_Type(
        {
            name: __("Leaf"),
            sprite: spr_leaf_basic,
            upgrade_attributes: 
            {
                leaf_hard_multiplier: 0.01
            }
        }),
        leaf_counter: new Dice_Type(
        {
            name: __("Leaf Counter"),
            sprite: spr_icon_leaf_counter,
            upgrade_attributes: 
            {
                leaf_pub_counter_autocount: 0.01
            }
        }),
        material: new Dice_Type(
        {
            name: __("Material"),
            sprite: spr_material_copper_bar,
            upgrade_attributes: 
            {
                material_max_count: 5
            },
            
            can_generate: function()
            {
                return is_unlocked_materials();
            }
        }),
        mlc: new Dice_Type(
        {
            name: __("MLC"),
            sprite: spr_mlc,
            upgrade_attributes: 
            {
                mlc_value_multiplier_dice: 0.01
            },
            
            can_generate: function()
            {
                return is_unlocked_mlc();
            }
        }),
        nature: new Dice_Type(
        {
            name: __("Nature"),
            sprite: spr_plant_primula,
            upgrade_attributes: 
            {
                nature_global_upgrade_bonus_value: 0.00075
            },
            
            can_generate: function()
            {
                return is_event_active(global.events.nature_season);
            }
        }),
        printer: new Dice_Type(
        {
            name: __("Printer"),
            sprite: spr_icon_printer,
            upgrade_attributes: 
            {
                printer_multiplier_dice: 0.01,
                printer_printer_multiplier_dice: 0.02
            }
        }),
        quark: new Dice_Type(
        {
            name: __("Quark"),
            sprite: spr_icon_quark,
            upgrade_attributes: 
            {
                quark_damage_multiplier: 0.005,
                quark_reactor_add_chance_multiplier: 0.003
            },
            
            can_generate: function()
            {
                return is_unlocked_quarks();
            }
        }),
        quark_reactor: new Dice_Type(
        {
            name: __("Quark Reactor"),
            sprite: spr_icon_quark_reactor,
            upgrade_attributes: 
            {
                quark_reactor_inc_count_multiplier_dice: 0.003
            },
            
            can_generate: function()
            {
                return is_unlocked_quarks();
            }
        }),
        relic: new Dice_Type(
        {
            name: __("Relic"),
            sprite: spr_relic_uncommon,
            upgrade_attributes: 
            {
                relics_base_damage_multiplier_dice: 0.05
            },
            
            can_generate: function()
            {
                return is_unlocked_relics();
            }
        }),
        seed: new Dice_Type(
        {
            name: __("Seed"),
            sprite: spr_seed_leaf,
            upgrade_attributes: 
            {
                seed_value_add_global: 0.001
            }
        }),
        shadow_health: new Dice_Type(
        {
            name: __("Shadow Health"),
            sprite: spr_icon_heart_purple,
            upgrade_attributes: 
            {
                shadow_crystal_player_hp: 0.1,
                shadow_crystal_player_hp_multiplier_shadow: 0.001,
                shadow_crystal_player_rest_hp_value_multiplier: 0.001
            },
            
            can_generate: function()
            {
                return is_unlocked_shadow_crystal();
            }
        }),
        shadow_strength: new Dice_Type(
        {
            name: __("Shadow Strength"),
            sprite: spr_icon_strength_shadow,
            upgrade_attributes: 
            {
                shadow_crystal_attack_damage: 0.1,
                shadow_crystal_attack_damage_multiplier: 0.0005
            },
            
            can_generate: function()
            {
                return is_unlocked_shadow_crystal();
            }
        }),
        shard: new Dice_Type(
        {
            name: __("Shard"),
            sprite: spr_resource_shards,
            upgrade_attributes: 
            {
                enemy_shards_drop_multiplier_dice: 0.005
            },
            
            can_generate: function()
            {
                return is_unlocked_shards();
            }
        }),
        soul: new Dice_Type(
        {
            name: __("Soul"),
            sprite: spr_resource_soul_entity,
            upgrade_attributes: 
            {
                soul_forge_complete_count_multiplier_dice: 0.005
            },
            
            can_generate: function()
            {
                return is_unlocked_soul_crypt();
            }
        }),
        trade: new Dice_Type(
        {
            name: __("Trade"),
            sprite: spr_icon_trading,
            upgrade_attributes: 
            {
                trade_resources_multiplier_dice: 0.005
            }
        }),
        trout: new Dice_Type(
        {
            name: __("Trout"),
            sprite: spr_weapon_trout,
            upgrade_attributes: 
            {
                slap_multiplier_dice: 0.005
            }
        }),
        witch: new Dice_Type(
        {
            name: __("Witch"),
            sprite: spr_boss_witch,
            upgrade_attributes: 
            {
                witch_cursed_count: 0.05,
                witch_essence_count_multiplier: 0.001
            },
            
            can_generate: function()
            {
                return global.enemies.boss_witch.data.defeated > 0;
            }
        })
    };
    add_keys_to_struct(global.dice_types);
    global.dice_enemies_rarity = 
    {
        normal: 
        {
            name: __("Normal"),
            level: 1
        },
        champion: 
        {
            name: __("Champion"),
            level: 2
        },
        elite: 
        {
            name: __("Elite"),
            level: 3
        },
        alpha: 
        {
            name: __("Alpha"),
            level: 4
        }
    };
    add_keys_to_struct(global.dice_enemies_rarity);
    global.dice_enemies_rarity_sorted = struct_to_sorted_array_by(global.dice_enemies_rarity, "level", true);
    global.dice_enemies = [];
    global.dice_enemies_struct = {};
    global.dice_enemies_struct_flat = {};
    var level = 1;
    var __array = global.dice_enemies_rarity_sorted;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        variable_struct_set(global.dice_enemies_struct, mitem.key, []);
        var __array2 = global.leaf_dice_enemies;
        var __prop_len2 = array_length(__array2);
        for (var __i2 = 0; __i2 < __prop_len2; __i2++)
        {
            var mitem2 = __array2[__i2];
            var key = sprintf("%s_%s", mitem.key, mitem2.key);
            var enemy = new Dice_Enemy(
            {
                key: key,
                base_level: __i + 1,
                enemy_level: level,
                loop_level: __i2 + 1,
                rarity: mitem,
                resource: mitem2,
                upgrade_attributes: get_default_struct_value(mitem2, "upgrade_attributes_dice", {})
            });
            array_push(global.dice_enemies, enemy);
            array_push(variable_struct_get(global.dice_enemies_struct, mitem.key), enemy);
            variable_struct_set(global.dice_enemies_struct_flat, key, enemy);
            level++;
        }
    }
    __array = global.dice_enemies_rarity_sorted;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        var __array2 = variable_struct_get(global.dice_enemies_struct, mitem.key);
        var __prop_len2 = array_length(__array2);
        for (var __i2 = 0; __i2 < __prop_len2; __i2++)
        {
            var mitem2 = __array2[__i2];
            var previous_level = __i2 - 1;
            var previous_enemy_level = undefined;
            if (previous_level >= 0)
            {
                previous_enemy_level = @@array_get@@(variable_struct_get(global.dice_enemies_struct, mitem.key), previous_level);
            }
            mitem2.previous_enemy_level = previous_enemy_level;
            var previous_rarity = (__i > 0) ? global.dice_enemies_rarity_sorted[__i - 1] : undefined;
            var previous_enemy_rarity = undefined;
            if (is_struct(previous_rarity))
            {
                previous_enemy_rarity = @@array_get@@(variable_struct_get(global.dice_enemies_struct, previous_rarity.key), __i2);
            }
            mitem2.previous_enemy_rarity = previous_enemy_rarity;
            var next_level = __i2 + 1;
            var next_enemy_level = undefined;
            if (next_level < array_length(variable_struct_get(global.dice_enemies_struct, mitem.key)))
            {
                next_enemy_level = @@array_get@@(variable_struct_get(global.dice_enemies_struct, mitem.key), next_level);
            }
            mitem2.next_enemy_level = next_enemy_level;
            var next_rarity = ((__i + 1) < array_length(global.dice_enemies_rarity_sorted)) ? global.dice_enemies_rarity_sorted[__i + 1] : undefined;
            var next_enemy_rarity = undefined;
            if (is_struct(next_rarity))
            {
                next_enemy_rarity = @@array_get@@(variable_struct_get(global.dice_enemies_struct, next_rarity.key), __i2);
            }
            mitem2.next_enemy_rarity = next_enemy_rarity;
        }
    }
    global.dice_enemies_ordered = [];
    __array = global.dice_enemies_struct.normal;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        array_push(global.dice_enemies_ordered, mitem);
    }
    global.dice_enemies_ordered_length = array_length(global.dice_enemies_ordered);
    global.dice_enemies_length = array_length(global.dice_enemies_ordered);
    global.dice_enemies_rarity_length = array_length(global.dice_enemies_rarity_sorted);
    global.dice_enemies_rarity_sorted_flat = _clone_array(global.dice_enemies);
    sort_array_by(global.dice_enemies_rarity_sorted_flat, "sort_value");
    global.dice_types_sorted = struct_to_sorted_array_key(global.dice_types);
    global.dice_types_length = array_length(global.dice_types_sorted);
    global.dice_types_shuffled = [];
    array_copy(global.dice_types_shuffled, 0, global.dice_types_sorted, 0, global.dice_types_length);
    array_shuffle(global.dice_types_shuffled);
    __array = global.dice_rarity_sorted;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (__i == (global.dice_rarity_length - 1))
        {
            break;
        }
        mitem.next_rarity_type = global.dice_rarity_sorted[__i + 1];
    }
    __array = global.dice_enemies_rarity_sorted;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (__i == (global.dice_enemies_rarity_length - 1))
        {
            break;
        }
        mitem.next_rarity_type = global.dice_enemies_rarity_sorted[__i + 1];
    }
    __array = global.dice_types_sorted;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        mitem.index = __i;
    }
    var text = [];
    __array = global.dice_rarity_sorted;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (__i == 0)
        {
            continue;
        }
        array_push(text, sprintf("%s: %s+", mitem.name, mitem.min_level));
    }
    global.dice_rarity_drop_level_text = __("Rarity drop level requirements") + ": " + implode(", ", text);
}

function get_power_roll_count()
{
    var value = 2 + floor(get_cache_numeric("dice_power_roll_count", 2));
    return value;
}
