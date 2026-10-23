function init_shop_menus_stats()
{
    variable_struct_set(titles, UnknownEnum.Value_90, 
    {
        title: __("Stats"),
        subtitle: __("What's an idle game without stats?")
    });
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_90), gui_inline_button(__s("Show offline rewards") + " (1m)", function()
    {
        instance_destroy(o_show_offline_rewards);
        var o = instance_create_layer(0, 0, "Control", o_show_offline_rewards);
        o.offline_seconds = 60;
    }));
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_90), gui_inline_button(__s("Show offline rewards") + " (1h)", function()
    {
        instance_destroy(o_show_offline_rewards);
        var o = instance_create_layer(0, 0, "Control", o_show_offline_rewards);
        o.offline_seconds = 3600;
    }));
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_90), gui_inline_button(__s("Show offline rewards") + " (1d)", function()
    {
        instance_destroy(o_show_offline_rewards);
        var o = instance_create_layer(0, 0, "Control", o_show_offline_rewards);
        o.offline_seconds = 86400;
    }));
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_90), gui_inline_button(__s("Show offline rewards") + " (3d)", function()
    {
        instance_destroy(o_show_offline_rewards);
        var o = instance_create_layer(0, 0, "Control", o_show_offline_rewards);
        o.offline_seconds = 259200;
    }));
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_90), new Gui_Item(UnknownEnum.Value_51, -1, 
    {
        height: 5
    }));
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_90), new Gui_Item(UnknownEnum.Value_54, id, 
    {
        text: function()
        {
            var prestige_time_fastest = "-";
            var prestige_time_fastest_blc = "-";
            if (o_game.data.stats.prestige_time_fastest != -1)
            {
                if (variable_struct_get(o_game.data.stats.prestige_time_fastest, global.prestige_levels.prestige.level) != -1)
                {
                    prestige_time_fastest = format_time(secr(variable_struct_get(o_game.data.stats.prestige_time_fastest, global.prestige_levels.prestige.level)), true);
                }
                if (variable_struct_get(o_game.data.stats.prestige_time_fastest, global.prestige_levels.blc.level) != -1)
                {
                    prestige_time_fastest_blc = format_time(secr(variable_struct_get(o_game.data.stats.prestige_time_fastest, global.prestige_levels.blc.level)), true);
                }
            }
            return sprintf("Leaves spawned each interval: %s | Leaf spawn interval: %s seconds | Time played: %s", o_game.spawn_count, number_format(secr(o_game.spawn_interval_duration), 2), format_time(floor(secr(o_game.data.stats.time_elapsed))));
        }
    }));
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_90), new Gui_Item(UnknownEnum.Value_54, id, 
    {
        text: function()
        {
            var text = sprintf("Blowing Damage: %s | Slap Damage: %s | Critical slap chance: %s | Critical slap multiplier: %s | Blowing Power: %s | ALB Blowing power: %s | ALB Damage: %s", number_format(get_blower_enemy_damage(1), 2), number_format(get_slap_damage(), 2), number_format_percent(get_critical_slap_chance()), number_format_percent(get_critical_slap_multiplier()), number_format(o_blower.damage, 2, false, false), number_format(get_alb_blowing_power()), number_format(get_alb_enemy_damage()));
            if (is_unlocked_quarks())
            {
                text += sprintf(" | Quark Damage: %s", number_format(get_default_struct_value(global.cache, "quark_damage", 0)));
            }
            return text;
        }
    }));
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_90), new Gui_Item(UnknownEnum.Value_54, id, 
    {
        text: function()
        {
            return sprintf("Player HP: %s/%s | HP reg/second: %s | Absolute damage resistance: %s | Relative damage resistance: %s | Area resistance: %s | Heat resistance: %s", number_format(o_blower.hp), number_format(o_blower.hp_max), number_format(get_hp_reg(), 0, false, false), number_format(global.upgrade_attributes.damage_resistance_absolute, 0), number_format_percent(get_player_damage_resistance(), 2), number_format(global.upgrade_attributes.player_resistance, 0), number_format_percent(get_upgrade_attribute_value(struct_get_from_hash(global.upgrade_attributes.damage_types_environment_resistance, variable_get_hash("heat")))));
        }
    }));
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_90), new Gui_Item(UnknownEnum.Value_54, id, 
    {
        text: function()
        {
            return concatstr(__s("Curses: %s", number_format(o_game.data.stats.cursed_count)), " | ", __s("Curses/s: %s", number_format(get_autocollect_curses())));
        }
    }));
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_90), new Gui_Item(UnknownEnum.Value_54, id, 
    {
        text: function()
        {
            var texts = [sprintf(__("Crafted leaves: %s | Craft Level: %s | Craft Max Chance: %s%\n"), number_format(o_game.data.stats.crafted_leaves), get_craft_level(), number_format(get_craft_max_chance(), 5))];
            var __array = global.craft_leaf_types_rarity_array;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                array_push(texts, sprintf("%s: %s", mitem.name, number_format(get_default_struct_value(o_game.data.stats.crafted_leaves_types, mitem.key, 0))));
            }
            return implode(" | ", texts);
        },
        
        is_visible: function()
        {
            return o_game.data.stats.crafted_leaves > 0;
        }
    }));
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_90), new Gui_Item(UnknownEnum.Value_54, id, 
    {
        text: function()
        {
            var daily_data = get_daily_data_today();
            return __s("Trades: %s | Trade Global Multiplier: %s | Min/Max Trade Levels: %s/%s | Gems traded today: %s | Reduced Gems trade cap: %s", o_game.data.stats.trades_finished, number_format_percent(get_trade_global_multiplier() - 1), get_min_trade_level(), get_max_trade_level(), number_format(get_default_struct_value(daily_data.data, "trade_gems", 0)), number_format(get_max_gems_trades_today()));
        },
        
        is_visible: function()
        {
            return o_game.data.stats.trades_finished > 0;
        }
    }));
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_90), new Gui_Item(UnknownEnum.Value_54, id, 
    {
        text: function()
        {
            return concatstr(__s("Leaf Tower | Skip tower floor chance: %s | Floors skipped: %s", number_format_percent(get_tower_floor_skip_chance()), number_format(global.areas.tower.data.floors_skipped)), " | ", __s("Offline floors: %s per minute", number_format(get_upgrade_attribute_value(global.upgrade_attributes.offline_tower_floors))));
        },
        
        is_visible: function()
        {
            return global.areas.tower.data.highest_floor > 1;
        }
    }));
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_90), new Gui_Item(UnknownEnum.Value_54, id, 
    {
        text: function()
        {
            return sprintf(__("Borb Claw Machine | Won: %s | Played: %s | Win%: %s%"), number_format(o_game.data.stats.borb_claw_machine.won), number_format(o_game.data.stats.borb_claw_machine.played), number_format(calc_percent(o_game.data.stats.borb_claw_machine.won, o_game.data.stats.borb_claw_machine.played)));
        },
        
        is_visible: function()
        {
            return o_game.data.stats.borb_claw_machine.played > 0;
        }
    }));
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_90), new Gui_Item(UnknownEnum.Value_54, id, 
    {
        text: function()
        {
            return __s("Chests opened: %s", number_format(o_game.data.stats.chests_opened));
        },
        
        is_visible: function()
        {
            return o_game.data.stats.chests_opened > 0 || is_unlocked_chests();
        }
    }));
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_90), new Gui_Item(UnknownEnum.Value_54, id, 
    {
        text: function()
        {
            return implode(" | ", [__s("Brews: %s", number_format(o_game.data.stats.brews.regular)), __s("Crits: %s", number_format(o_game.data.stats.brews.crits)), __s("Brew multiplier: %s", number_format_percent(get_brew_multiplier())), __s("Crit chance: %s", number_format_percent(get_brew_crit_chance())), __s("Multi Crit chance: %s", number_format_percent(get_brew_crit_multi_chance()))]);
        },
        
        is_visible: function()
        {
            return o_game.data.stats.brews.regular > 0;
        }
    }));
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_90), new Gui_Item(UnknownEnum.Value_54, id, 
    {
        text: function()
        {
            var loops_total = _sum(global.converters, function(arg0)
            {
                return arg0.data.converted_loops;
            });
            var crits_total = _sum(global.converters, function(arg0)
            {
                return arg0.data.converted_crits;
            });
            return sprintf(__("Converted Loops: %s | Converted Crits: %s | Crit chance: %s | Delay: %s"), number_format(loops_total), number_format(crits_total), number_format_percent(get_converter_crit_chance()), format_time(secr(get_converter_delay()), true, true));
        }
    }));
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_90), new Gui_Item(UnknownEnum.Value_54, id, 
    {
        text: function()
        {
            return __s("Printers printed/second: %s", number_format(get_default_struct_value(global.cache, "printer_printer", 0), 2));
        }
    }));
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_90), new Gui_Item(UnknownEnum.Value_54, id, 
    {
        text: function()
        {
            return sprintf(__("Relics drop chance: %s"), number_format_percent(get_relic_drop_chance()));
        },
        
        is_visible: function()
        {
            return get_upgrade_count(global.shops.sacred.unlock_relics) > 0;
        }
    }));
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_90), new Gui_Item(UnknownEnum.Value_54, id, 
    {
        text: function()
        {
            var text = [__s("%s drop chance: %s", __("Cards"), number_format_percent(get_cards_drop_chance())), __s("Boss %s drop chance: %s", __("Cards"), number_format_percent(get_boss_cards_drop_chance())), __s("%s drop chance: %s", global.resources.card_parts.name_plural, number_format_percent(get_card_parts_drop_chance()))];
            return implode(" | ", text);
        },
        
        is_visible: function()
        {
            return is_unlocked_cards();
        }
    }));
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_90), new Gui_Item(UnknownEnum.Value_54, id, 
    {
        text: function()
        {
            var text = [__s("%s drop chance: %s", __("Dice"), number_format_percent(get_battlefield_die_drop_chance()))];
            return implode(" | ", text);
        },
        
        is_visible: function()
        {
            return is_unlocked_dice();
        }
    }));
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_90), new Gui_Item(UnknownEnum.Value_54, id, 
    {
        text: function()
        {
            var text = [__s("Pets pet: %s", number_format(o_game.data.stats.pets_pet)), __s("Borbs slapped: %s", number_format(o_game.data.stats.borb_slapped))];
            return implode(" | ", text);
        }
    }));
    _map(global.resources_array, function(arg0, arg1)
    {
        if (!get_value_ext(arg0, arg0.include_in_stats))
        {
            exit;
        }
        var menu_item = new Gui_Item(UnknownEnum.Value_54, id, 
        {
            resource: arg0,
            section: global.dialog_sections.stats.resources,
            
            text: function()
            {
                if (self.resource.data.collected_total == 0)
                {
                    return "-";
                }
                var num_dec = iif(keyboard_check(vk_shift), 4, 2);
                if (self.resource.is_prestige_resource)
                {
                    var highest_value = iif(!is_undefined(variable_struct_get(o_game.data.stats.prestige_resources_highest_history, self.resource.key)), variable_struct_get(o_game.data.stats.prestige_resources_highest_history, self.resource.key), 0);
                    var fastest_prestige = "-";
                    if (self.resource.prestige_level != 0 && variable_struct_get(o_game.data.stats.prestige_time_fastest, self.resource.prestige_level) != -1)
                    {
                        fastest_prestige = format_time(secr(variable_struct_get(o_game.data.stats.prestige_time_fastest, self.resource.prestige_level)), true);
                    }
                    var text = "%s: %s | highest: %s | prestiged: %s | fastest: %s";
                    var prestige_count = 0;
                    var offline_count = 0;
                    if (self.resource.key == global.resources.coins.key)
                    {
                        offline_count = get_offline_prestige();
                        prestige_count = o_game.data.stats.prestige;
                        text += sprintf(" | offline count/minute: %s");
                    }
                    else if (self.resource.key == global.resources.blc.key)
                    {
                        offline_count = get_offline_crunches();
                        prestige_count = o_game.data.stats.prestige_crunch;
                        text += sprintf(" | offline count/minute: %s");
                    }
                    else if (self.resource.key == global.resources.mlc.key)
                    {
                        offline_count = get_offline_mlc();
                        prestige_count = o_game.data.stats.prestige_mlc;
                        text += sprintf(" | offline count/minute: %s");
                    }
                    else if (self.resource.key == global.resources.ulc.key)
                    {
                        offline_count = get_offline_ulc();
                        prestige_count = o_game.data.stats.prestige_ulc;
                        text += sprintf(" | offline count/minute: %s");
                    }
                    return sprintf(text, self.resource.name_plural, number_format(self.resource.data.collected_total, num_dec, false), number_format(highest_value, num_dec, false), number_format(prestige_count, num_dec), fastest_prestige, offline_count);
                }
                var text_array = [sprintf("%s: %s", self.resource.name_plural, number_format(self.resource.data.collected_total, num_dec, false))];
                if (self.resource.can_trade || self.resource.is_leaf || self.resource.show_single_reward)
                {
                    var leaf_reward = get_leaf_reward(self.resource, 1, 1, false);
                    if (self.resource.key == global.resources.ancient.key)
                    {
                        variable_struct_set(leaf_reward, self.resource.key, variable_struct_get(leaf_reward, self.resource.key) * 0.01);
                    }
                    array_push(text_array, sprintf(__("single reward: %s"), number_format(variable_struct_get(leaf_reward, self.resource.key), num_dec)));
                    if (self.resource.has_seeds)
                    {
                        array_push(text_array, sprintf(__("seed value: %s"), number_format(get_seed_value(self.resource, 1), num_dec)));
                    }
                }
                if (variable_struct_get(o_game.data.stats.resources_collected_avg, self.resource.key) > 0)
                {
                    array_push(text_array, sprintf(__("max gained per second: %s"), number_format(variable_struct_get(o_game.data.stats.resources_collected_avg, self.resource.key), num_dec, false)));
                }
                if (self.resource.is_energy)
                {
                    array_push(text_array, __s(" | max storage: %s", number_format(get_max_energy_storage(self.resource), num_dec)));
                }
                if (is_same_key(self.resource.type, global.resource_types.plant) || is_same_key(self.resource.type, global.resource_types.butterfly))
                {
                    array_push(text_array, __s("Spawn chance: %s", number_format_percent(global.season_pass.nature.get_item_spawn_chance(self.resource))));
                }
                return implode(" | ", text_array);
            }
        });
        array_push(variable_struct_get(shop_items, UnknownEnum.Value_90), menu_item);
    }, false);
    var __array = global.enemies_sorted;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        array_push(variable_struct_get(shop_items, UnknownEnum.Value_90), new Gui_Item(UnknownEnum.Value_54, id, 
        {
            text: function()
            {
                if (!self.enemy.data.seen && self.enemy.data.defeated == 0)
                {
                    return "?";
                }
                var damage = get_blower_enemy_damage(global.resources.leaves.armor, 1, self.enemy);
                var slap_damage = get_blower_enemy_slap_damage(self.enemy);
                var type_text = self.enemy.damage_type.name;
                if (self.enemy.quark_level > 0)
                {
                    type_text = __("Quark");
                }
                var text = sprintf("%s | Type: %s | Defeated: %s\nBlower Damage: %s | Slap Damage: %s", self.enemy.name, type_text, self.enemy.data.defeated, number_format(damage), number_format(slap_damage));
                if (self.enemy.is_persistent)
                {
                    text += ("\n" + sprintf("%s | %s: %s/%s", __("Persistent"), __("Current HP"), number_format(self.enemy.data.hp), number_format(get_value_ext(self.enemy, self.enemy.hp_max))));
                }
                if (array_length(self.enemy.spawn_areas) > 0)
                {
                    var spawn_areas_text = self.enemy.spawn_areas_text;
                    text += ("\n" + __s("Spawns in: %s", spawn_areas_text));
                }
                return text;
            },
            
            enemy: mitem,
            sprite: mitem.sprite,
            
            sprite_color: function()
            {
                return (self.enemy.data.defeated > 0) ? 16777215 : 0;
            },
            
            section: global.dialog_sections.stats.enemies
        }));
    }
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_90), gui_inline_button(__("Calculate damage output"), function()
    {
        var output = "";
        var __array = global.upgrade_sections_array;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            output += ("---" + string(mitem) + "---" + "\n");
            var section_array = [];
            var __struct2 = variable_struct_get(global.upgrade_sections_values, mitem);
            var __prop_names2 = struct_get_names(__struct2);
            var __prop_len2 = array_length(__prop_names2);
            for (var __i2 = 0; __i2 < __prop_len2; __i2++)
            {
                var mkey2 = __prop_names2[__i2];
                var mitem2 = variable_struct_get(__struct2, mkey2);
                if (string_pos("blower_enemy_damage", mkey2) == 0)
                {
                    continue;
                }
                if (mitem2 == 0)
                {
                    continue;
                }
                array_push(section_array, 
                {
                    key: mkey2,
                    value: mitem2
                });
            }
            sort_array_by_key(section_array, true);
            var __array2 = section_array;
            __prop_len2 = array_length(__array2);
            for (var __i2 = 0; __i2 < __prop_len2; __i2++)
            {
                var mitem2 = __array2[__i2];
                output += (sprintf("%s | %s", mitem2.key, number_format(mitem2.value, 2)) + "\n");
            }
            output += "\n\n";
        }
        global.damage_output_cache = output;
    }, 
    {
        section: global.dialog_sections.stats.damage
    }));
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_90), new Gui_Item(UnknownEnum.Value_51, id, 
    {
        height: 10,
        section: global.dialog_sections.stats.damage
    }));
    array_push(variable_struct_get(shop_items, UnknownEnum.Value_90), new Gui_Item(UnknownEnum.Value_54, id, 
    {
        section: global.dialog_sections.stats.damage,
        
        text: function()
        {
            return global.damage_output_cache;
        }
    }));
    __array = global.damage_types_sorted;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        array_push(variable_struct_get(shop_items, UnknownEnum.Value_90), new Gui_Item(UnknownEnum.Value_54, id, 
        {
            damage_type: mitem,
            
            text: function()
            {
                var text = [];
                var text_heading = self.damage_type.name;
                if (!self.damage_type.craftable)
                {
                    text_heading += sprintf(" | %s", __("not craftable"));
                }
                array_push(text, text_heading);
                var __array2 = global.damage_types_sorted;
                var __prop_len2 = array_length(__array2);
                for (var __i2 = 0; __i2 < __prop_len2; __i2++)
                {
                    var mitem2 = __array2[__i2];
                    resistance = variable_struct_get(self.damage_type._resistance_types, mitem2.key);
                    var resistance_damage_single = get_damage_resistance_value_single(self.damage_type, mitem2);
                    var text_value = "-";
                    if (resistance > 0)
                    {
                        text_value = __("Strong");
                    }
                    else if (resistance <= -1)
                    {
                        text_value = __("Very weak");
                    }
                    else
                    {
                        text_value = __("Weak");
                    }
                    var text_row = sprintf("vs %s: %s", mitem2.name, text_value);
                    if (resistance_damage_single != 0)
                    {
                        text_row += sprintf(" | %s", number_format_percent(resistance_damage_single, 2, true));
                    }
                    array_push(text, text_row);
                }
                var resistance = get_damage_resistance_value(self.damage_type);
                array_push(text, __s("Additional damage to type: %s", number_format_percent(resistance, 2, true)));
                return implode("\n", text);
            },
            
            section: global.dialog_sections.stats.damage_types
        }));
    }
}

enum UnknownEnum
{
    Value_51 = 51,
    Value_54 = 54,
    Value_90 = 90
}
