function gui_item_dice(arg0, arg1)
{
    if (live_auto_call_1())
    {
        var lac_argc = argument_count;
        var lac_args = array_create(lac_argc);
        var lac_argk = 0;
        repeat (lac_argc)
        {
            lac_args[lac_argk] = argument[lac_argk];
            lac_argk++;
        }
        if (live_auto_call_2(lac_args))
        {
            return global.live_result;
        }
    }
    var y_start = arg1;
    var dice_count = get_dice();
    var dice_sides = get_dice_sides();
    var res = [global.resources.dice.key];
    if (is_unlocked_resource(global.resources.azurite))
    {
        array_push(res, global.resources.azurite.key);
    }
    if (is_unlocked_resource(global.resources.niobium))
    {
        array_push(res, global.resources.niobium.key);
    }
    if (is_current_dialog_section(global.dialog_sections.dice.dice))
    {
        var min_roll = dice_count;
        var max_roll = dice_count * dice_sides;
        var padding_y = gui_col_x(1.5);
        var backpack_size = get_dice_backpack_size();
        var inventory_size = get_dice_inventory_size();
        var paging_id = "dice";
        var paging_id_backpack = "dice_backpack";
        arg1 += gui_col_y(0.5);
        arg1 += (draw_heading(arg0, arg1, sprintf("%s [%s/%s]", __("Dice Bag"), array_length(global.dice_inventory), inventory_size)) - gui_col_y(0.3));
        var sort_dir = get_option(global.options.borbventures_inventory_sort_dir);
        var sort_type_text = get_option_text(global.options.borbventures_inventory_sort_type);
        if (gui_button_tl(arg0 + gui_col_x(8), y_start + gui_col_y(0), sort_type_text, undefined, gui_col_x(2), undefined, 
        {
            tooltip: __("Sort by")
        }))
        {
            global.options.borbventures_inventory_sort_type._func();
            sort_array_by(global.dice_backpack, "get_sort_value", sort_dir == "asc");
            sort_array_by(global.dice_inventory, "get_sort_value", sort_dir == "asc");
        }
        var sort_dir_sprite = (sort_dir == "asc") ? spr_gui_arrow_up : spr_gui_arrow_down;
        if (gui_button_sprite(arg0 + gui_col_x(11), y_start + gui_col_y(0.75), sort_dir_sprite, undefined, undefined, 
        {
            tooltip: __("Sort direction")
        }))
        {
            global.options.borbventures_inventory_sort_dir._func();
            sort_dir = get_option(global.options.borbventures_inventory_sort_dir);
            sort_array_by(global.dice_backpack, "get_sort_value", sort_dir == "asc");
            sort_array_by(global.dice_inventory, "get_sort_value", sort_dir == "asc");
        }
        var paging_y = undefined;
        if (global.is_mobile)
        {
            paging_y = arg1 - gui_col_y(1.7);
            arg1 += gui_col_y(0.5);
        }
        var display_item_count = get_option(global.options.dice_inventory_show_count);
        var items_per_page = global.is_mobile ? 27 : 39;
        var items_per_page_bp = global.is_mobile ? 9 : 13;
        var row_y1 = arg1;
        if (!display_item_count)
        {
            items_per_page += (global.is_mobile ? 9 : 13);
            items_per_page_bp += (global.is_mobile ? 9 : 13);
        }
        row_y1 += draw_inventory_items(arg0, row_y1, global.dice_inventory, inventory_size, gui_col_x(10), items_per_page, undefined, move_die_from_inventory, true, paging_id, 
        {
            bg_sprite: spr_icon_die_blank,
            display_count: display_item_count,
            override_inventory_size: true,
            paging_x: arg0 + gui_col_x(5),
            paging_y: paging_y,
            func_salvage: true
        });
        row_y1 += gui_col_y(4);
        var paging_y_bp = undefined;
        if (global.is_mobile)
        {
            paging_y_bp = row_y1 - gui_col_y(0.7);
        }
        row_y1 += (draw_heading(arg0, row_y1, sprintf("%s [%s/%s]", __("Dice Backpack"), array_length(global.dice_backpack), backpack_size)) - gui_col_y(0.3));
        row_y1 += draw_inventory_items(arg0, row_y1, global.dice_backpack, backpack_size, gui_col_x(10), items_per_page_bp, undefined, move_die_from_backpack, true, paging_id_backpack, 
        {
            bg_sprite: spr_icon_die_blank,
            display_count: display_item_count,
            override_inventory_size: true,
            paging_x: arg0 + gui_col_x(6),
            paging_y: paging_y_bp,
            paging_id_selected: paging_id,
            func_salvage: true
        });
        var row_y2 = 0;
        if (is_struct(variable_struct_get(global.selected_inventory_item, paging_id)))
        {
            row_y2 = gui_item_selected_dice(arg0 + gui_col_x(12), y_start, variable_struct_get(global.selected_inventory_item, paging_id));
        }
        else if (array_length(global.dice_inventory) == 0)
        {
            row_y2 = draw_description(arg0 + gui_col_x(12), y_start + gui_col_y(2), __("Your dice bag is empty. Find some dice in the battlefield!"), gui_col_x(10));
        }
        arg1 += max_safe(row_y1, row_y2);
        if (global.debug)
        {
            var dy = y_start + gui_col_y(17);
            if (gui_button_tl(arg0, dy, "Clear dice"))
            {
                global.dice_inventory = [];
                global.dice_backpack = [];
            }
            if (gui_button_tl(arg0 + gui_col_x(3), dy, "Add die lvl1"))
            {
                create_battlefield_die(1);
            }
            if (gui_button_tl(arg0 + gui_col_x(6), dy - gui_col_y(1.5), "Add shadow dice"))
            {
                var __array = global.dice_rarity_sorted;
                var __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    create_die(global.dice_types.shadow_strength, mitem, true);
                    create_die(global.dice_types.shadow_health, mitem, true);
                }
            }
            if (gui_button_tl(arg0 + gui_col_x(6), dy, "Add blow dice"))
            {
                var __array = global.dice_rarity_sorted;
                var __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    create_die(global.dice_types.blower, mitem, true);
                }
            }
            if (gui_button_tl(arg0 + gui_col_x(9), dy, "Add relic dice"))
            {
                var __array = global.dice_rarity_sorted;
                var __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    create_die(global.dice_types.relic, mitem, true);
                }
            }
            if (gui_button_tl(arg0 + gui_col_x(12), dy, "Add trout dice"))
            {
                var __array = global.dice_rarity_sorted;
                var __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    create_die(global.dice_types.trout, mitem, true);
                }
            }
            if (gui_button_tl(arg0 + gui_col_x(15), dy, "Roll all"))
            {
                var __array = global.dice_inventory;
                var __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    mitem.roll();
                }
            }
            if (gui_button_tl(arg0 + gui_col_x(17), dy, "PRoll all"))
            {
                var __array = global.dice_inventory;
                var __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    mitem.power_roll();
                }
            }
            if (gui_button_tl(arg0 + gui_col_x(20), dy, "Max all"))
            {
                var __array = global.dice_inventory;
                var __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    mitem.data.sides = 10;
                    mitem.data.dice = 10;
                    mitem.data.count = 1000;
                }
            }
            if (gui_button_tl(arg0 + gui_col_x(22), dy, "DMG"))
            {
                global.dice_inventory = [];
                var __array = global.dice_rarity_sorted;
                var __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    create_die(global.dice_types.blower, mitem, true);
                    create_die(global.dice_types.energy, mitem, true);
                    create_die(global.dice_types.relic, mitem, true);
                    create_die(global.dice_types.trout, mitem, true);
                    create_die(global.dice_types.nature, mitem, true);
                }
                __array = global.dice_inventory;
                __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    mitem.data.avg = 1000;
                    mitem.data.rolls = [1000, 1000, 1000, 1000, 1000];
                    mitem.data.roll_count = 10;
                    mitem.roll();
                }
                init_game_vars(true);
            }
        }
        return y_start - arg1;
    }
    else if (is_current_dialog_section(global.dialog_sections.dice.battlefield))
    {
        var enemy = get_current_dice_battlefield_enemy();
        if (is_struct(enemy))
        {
            enemy.data.seen = true;
            var base_level = enemy.base_level;
            var level = enemy.level;
            var resource_unlocked = true;
            var name = resource_unlocked ? enemy.name : "?";
            arg1 += draw_heading(arg0 + gui_col_x(11), arg1, name, undefined, undefined, 1);
            arg1 += gui_col_y(1);
            var sprite_color = resource_unlocked ? 16777215 : 0;
            draw_sprite_contain(enemy.sprite, 0, arg0 + gui_col_x(11), arg1, 64, undefined, sprite_color);
            arg1 += gui_col_y(1.5);
            var hp_pct = calc_percent(enemy.data.hp, enemy.hp_max);
            draw_healthbar(arg0 + gui_col_x(10), arg1, arg0 + gui_col_x(12), arg1 + 8, hp_pct, c_white, c_green, c_green, 0, true, false);
            arg1 += gui_col_y(1);
            arg1 += (draw_heading(arg0 + gui_col_x(11), arg1, __s("HP: %s/%s", number_format(enemy.data.hp), number_format(enemy.hp_max)), undefined, undefined, 1) - gui_col_y(0.5));
            arg1 += draw_heading(arg0 + gui_col_x(11), arg1, __s("Last roll: %s", number_format(o_game.data.dice.battlefield_last_roll)), undefined, undefined, 1);
            arg1 += gui_col_y(0.5);
            var can_roll = can_roll_dice_battlefield();
            var timeout_f = format_remaining_time(o_game.data.dice.battlefield_roll_delay, undefined, true);
            if (gui_button(arg0 + gui_col_x(11), arg1, __("Roll"), can_roll, gui_col_x(3), undefined, 
            {
                text_below: timeout_f
            }))
            {
                roll_dice_battlefield();
            }
            arg1 += gui_col_y(1.75);
            var section_y = arg1;
            var next_enemy_diff = enemy.get_unlock_next_enemy_count() - enemy.data.defeated;
            var next_enemy_diff_text = (next_enemy_diff >= 0) ? next_enemy_diff : "-";
            var next_difficulty_diff = enemy.get_unlock_next_difficulty_count() - enemy.data.defeated;
            var next_difficulty_diff_text = (next_difficulty_diff > 0) ? next_difficulty_diff : "-";
            arg1 += draw_description(arg0 + gui_col_x(6), section_y, [__s("Level: %s", enemy.enemy_level), __s("Difficulty: %s", base_level), __s("Defeated: %s", number_format(enemy.data.defeated)), __s("Next enemy: %s", next_enemy_diff_text), __s("Next difficulty: %s", next_difficulty_diff_text), "", __s("Bonus (%s/%s): %s", min(enemy.data.defeated, enemy.get_max_upgrade_multiplier()), enemy.upgrade_multiplier_max, "\n" + enemy.upgrade_attributes_text)], undefined, 1);
            arg1 += gui_col_y(0.2);
            draw_description(arg0 + gui_col_x(11), section_y, [__s("Damage: %s", sprintf("%s-%s", number_format(get_cache("dice_battlefield_min_damage")), number_format(get_cache("dice_battlefield_max_damage"))))], gui_col_x(6), 1);
            draw_description(arg0 + gui_col_x(16), section_y, [__s("Reward") + ":"], undefined, 1);
            draw_result(arg0 + gui_col_x(15.7), section_y + gui_col_y(1), enemy.reward);
            var key_modifier = get_key_modifier();
            var prev_level = max(1, base_level - key_modifier);
            var next_level_max = max(1, o_game.data.dice.battlefield_level_max + 1);
            var next_level = min(base_level + key_modifier, next_level_max, global.dice_enemies_length);
            if (is_struct(enemy.previous_enemy_level))
            {
                if (gui_button_sprite(arg0 + gui_col_x(6), y_start + gui_col_y(3), spr_gui_arrow_left, undefined, undefined, 
                {
                    text_below: number_format(enemy.previous_enemy_level.loop_level)
                }))
                {
                    o_game.data.dice.battlefield_level = enemy.previous_enemy_level.loop_level;
                    if (is_struct(enemy.previous_enemy_level) && !enemy.previous_enemy_level.is_unlocked("rarity"))
                    {
                        o_game.data.dice.battlefield_rarity = "normal";
                    }
                }
            }
            if (is_struct(enemy.next_enemy_level) && enemy.next_enemy_level.is_unlocked("level"))
            {
                if (gui_button_sprite(arg0 + gui_col_x(16), y_start + gui_col_y(3), spr_gui_arrow_right, undefined, undefined, 
                {
                    text_below: number_format(enemy.next_enemy_level.loop_level)
                }))
                {
                    o_game.data.dice.battlefield_level = enemy.next_enemy_level.loop_level;
                    if (is_struct(enemy.next_enemy_level) && !enemy.next_enemy_level.is_unlocked("rarity"))
                    {
                        o_game.data.dice.battlefield_rarity = "normal";
                    }
                }
            }
            if (is_undefined(o_game.data.dice.battlefield_rarity))
            {
                o_game.data.dice.battlefield_rarity = "normal";
            }
            if (is_struct(enemy.previous_enemy_rarity))
            {
                if (gui_button_sprite(arg0 + gui_col_x(6), y_start + gui_col_y(6), spr_gui_arrow_left, undefined, undefined, 
                {
                    text_below: enemy.previous_enemy_rarity.rarity.name
                }))
                {
                    o_game.data.dice.battlefield_rarity = enemy.previous_enemy_rarity.rarity.key;
                }
            }
            if (is_struct(enemy.next_enemy_rarity) && enemy.next_enemy_rarity.is_unlocked("rarity"))
            {
                if (gui_button_sprite(arg0 + gui_col_x(16), y_start + gui_col_y(6), spr_gui_arrow_right, undefined, undefined, 
                {
                    text_below: enemy.next_enemy_rarity.rarity.name
                }))
                {
                    o_game.data.dice.battlefield_rarity = enemy.next_enemy_rarity.rarity.key;
                }
            }
            global.options.dice_battlefield_auto_roll.draw(arg0 + gui_col_x(19), y_start + gui_col_y(1), undefined, undefined, 5, has_bought_shop_item_safe("gems", "dice_battlefield_auto_roll"));
            global.options.dice_battlefield_auto_progress.draw(arg0 + gui_col_x(19), y_start + gui_col_y(3.5), undefined, undefined, 5, has_bought_shop_item_safe("gems", "dice_battlefield_auto_progress"));
            global.options.dice_battlefield_auto_progress_type.draw(arg0 + gui_col_x(19), y_start + gui_col_y(5.25), undefined, undefined, undefined, has_bought_shop_item_safe("gems", "dice_battlefield_auto_progress"));
        }
    }
    else if (is_current_dialog_section(global.dialog_sections.dice.cursed))
    {
        var diff_text = number_format(o_game.data.dice.cursed_count_current - o_game.data.dice.cursed_count_max_saved, 0, true);
        if (o_game.data.dice.cursed_count_current == 0)
        {
            diff_text = "-";
        }
        arg1 += gui_col_y(0.5);
        var sprite = (o_game.data.dice.cursed_last_roll == 0) ? spr_icon_die_blank : spr_icon_die_number;
        var sprite_color = (o_game.data.dice.cursed_last_roll == 6) ? 255 : 16777215;
        var _image_index = (o_game.data.dice.cursed_last_roll == 0) ? 0 : (o_game.data.dice.cursed_last_roll - 1);
        var add_text = "";
        if (o_game.data.dice.cursed_last_roll > 0)
        {
            add_text = sprintf("+%s -> %s", o_game.data.dice.cursed_last_roll, o_game.data.dice.cursed_count_current) + "\n" + "\n";
            if (o_game.data.dice.cursed_crit)
            {
                add_text = sprintf("%s + %s = %s -> %s", o_game.data.dice.cursed_last_roll_raw, o_game.data.dice.cursed_last_crit_value, o_game.data.dice.cursed_last_roll, o_game.data.dice.cursed_count_current) + "\n" + "\n" + __("CRITICAL") + "! ";
            }
            if (o_game.data.dice.cursed_last_roll == 6)
            {
                add_text += (__("CURSED") + "!");
            }
            else
            {
                add_text += sprintf("(%s)", diff_text);
            }
        }
        gui_draw_sprite(arg0 + (global.gui_settings.content_width / 2), arg1 + gui_col_y(1), sprite, sprite_color, 5, undefined, undefined, _image_index);
        if (o_game.data.dice.cursed_last_roll == 6)
        {
            gui_draw_sprite((arg0 + (global.gui_settings.content_width / 2)) - gui_col_x(3.5), arg1 + gui_col_y(1), spr_icon_cursed_cheese, 16777215, 6);
            gui_draw_sprite(arg0 + (global.gui_settings.content_width / 2) + gui_col_x(3.5), arg1 + gui_col_y(1), spr_icon_cursed_cheese, 16777215, 6);
        }
        if (o_game.data.dice.cursed_crit)
        {
            gui_draw_sprite((arg0 + (global.gui_settings.content_width / 2)) - gui_col_x(5.5), arg1 + gui_col_y(1), spr_icon_crit, 16777215, 6);
            gui_draw_sprite(arg0 + (global.gui_settings.content_width / 2) + gui_col_x(5.5), arg1 + gui_col_y(1), spr_icon_crit, 16777215, 6);
        }
        arg1 += gui_col_y(2.5);
        draw_heading(arg0 + (global.gui_settings.content_width / 2), arg1, add_text, undefined, undefined, 1, 0);
        arg1 += gui_col_y(3);
        var can_roll = can_roll_dice_cursed();
        if (gui_button((arg0 + (global.gui_settings.content_width / 2)) - gui_col_x(2.75), arg1, __("Roll"), can_roll, gui_col_x(3), undefined, 
        {
            text_below: format_remaining_time(o_game.data.dice.cursed_roll_timeout, undefined, true)
        }))
        {
            roll_dice_cursed();
        }
        var can_save = can_save_cursed_dice();
        if (gui_button(arg0 + (global.gui_settings.content_width / 2) + gui_col_x(2.75), arg1, __("Save"), can_save, gui_col_x(3), undefined, 
        {
            text_below: format_remaining_time(o_game.data.dice.cursed_reward_next_save_time, undefined, true)
        }))
        {
            save_dice_cursed();
        }
        arg1 += gui_col_y(2.75);
        var row_x1 = arg0 + gui_col_x(0.5);
        var row_x2 = arg0 + gui_col_x(8);
        var row_x3 = arg0 + gui_col_x(18);
        var row_y1 = arg1;
        var row_y2 = arg1;
        var row_y3 = arg1;
        row_y1 += draw_heading(row_x1, row_y1, __("Stats"), undefined, undefined, undefined, undefined, false);
        row_y1 += draw_description(row_x1, row_y1, [__s("Current count: %s (%s)", number_format(o_game.data.dice.cursed_count_current), diff_text), __s("Highest saved: %s", o_game.data.dice.cursed_count_max_saved), __s("Total: %s", number_format(o_game.data.dice.cursed_count_total)), __s("Total saved: %s", number_format(o_game.data.dice.cursed_count_total_saved)), "", __s("Last run: %s", global.dice_log.cursed_last_run), __s("Roll count: %s (%s)", array_length(o_game.data.dice.cursed_last_rolls), number_format(o_game.data.dice.cursed_rolls_total)), __s("Cursed dice count: %s", number_format(o_game.data.dice.cursed_curses_total)), __s("Critical chance: %s", number_format_percent(get_default_struct_value(global.cache, "cursed_critical_chance", 0) / 100)), __s("Critical multiplier: %s", number_format_percent(get_dice_cursed_critical_multiplier())), "", __s("Last rolls: %s", implode(", ", o_game.data.dice.cursed_last_rolls, true)), ""], gui_col_x(6));
        row_y2 += draw_heading(row_x2, row_y2, __("Bonuses"), undefined, undefined, undefined, undefined, false);
        var next_stage_text = __s("All bonuses unlocked.");
        if (global.cache.cursed_dice_ua_stage < array_length(global.cursed_dice_ua_stages))
        {
            var stage = global.cursed_dice_ua_stages[global.cache.cursed_dice_ua_stage];
            var remaining_save_count = stage.stage - o_game.data.dice.cursed_count_total_saved;
            next_stage_text = __s("Next bonuses: %s (%s/%s)", number_format(remaining_save_count), number_format(o_game.data.dice.cursed_count_total_saved), number_format(stage.stage));
        }
        row_y2 += draw_description(row_x2, row_y2, next_stage_text, gui_col_x(8));
        row_y2 += draw_description(row_x2, row_y2, get_default_struct_value(global.cache, "cursed_dice_upgrades_text", "-"), gui_col_x(9.5));
        row_y3 += draw_heading(row_x3, row_y3, __("Save Reward"));
        row_y3 += draw_result(row_x3 + gui_col_x(1), row_y3, o_game.data.dice.cursed_reward);
        row_y3 += gui_col_y(1);
        global.options.dice_cursed_auto_roll.draw(arg0 + gui_col_x(19), y_start + gui_col_y(1), undefined, undefined, 5, has_bought_shop_item_safe("gems", "dice_cursed_auto_roll"));
        global.options.dice_cursed_auto_save.draw(arg0 + gui_col_x(19), y_start + gui_col_y(3.5), undefined, undefined, 5, has_bought_shop_item_safe("gems", "dice_cursed_auto_save"));
        global.options.dice_cursed_auto_save_value.draw(arg0 + gui_col_x(18.5), y_start + gui_col_y(5), undefined, undefined, 6, has_bought_shop_item_safe("gems", "dice_cursed_auto_save"));
        arg1 = max(arg1, row_y1, row_y2, row_y3);
    }
    else if (is_current_dialog_section(global.dialog_sections.dice.shop))
    {
        return gui_item_shop(arg0, arg1, 
        {
            shop_items: o_shop.shop_items.dice,
            shop_key: "dice"
        });
    }
    else if (is_current_dialog_section(global.dialog_sections.dice.dice_codex))
    {
        arg1 += draw_description(arg0, gui_y_start_items + gui_col_y(0.8), global.dice_rarity_drop_level_text, gui_col_x(14));
        arg1 += gui_item_selection(arg0, arg1, 
        {
            list_props: 
            {
                columns: global.is_mobile ? 9 : 12,
                
                is_unlocked_func: function(arg0)
                {
                    return !is_undefined(variable_struct_get(o_game.data.dice.types_seen, arg0.key));
                },
                
                items: global.dice_types,
                items_array: global.dice_types_sorted,
                width: gui_col_x(14),
                
                button_func: function(arg0)
                {
                    global.selected_inventory_item.dice_codex = arg0;
                }
            },
            
            selected_item: function()
            {
                return struct_get_from_hash(global.selected_inventory_item, variable_get_hash("dice_codex"));
            },
            
            selected_item_draw_props: 
            {
                draw_use_button: false,
                draw_below_func: gui_item_selected_codex_item
            },
            
            selected_item_is_unlocked_func: function(arg0)
            {
                return !is_undefined(variable_struct_get(o_game.data.dice.types_seen, arg0.key));
            }
        });
    }
    else if (is_current_dialog_section(global.dialog_sections.dice.enemies))
    {
        arg1 += gui_item_selection(arg0, arg1, 
        {
            list_props: 
            {
                columns: global.is_mobile ? 9 : 12,
                items: global.dice_enemies_struct_flat,
                items_array: global.dice_enemies_rarity_sorted_flat,
                width: gui_col_x(14),
                
                button_func: function(arg0)
                {
                    global.selected_inventory_item.dice_enemy = arg0;
                },
                
                is_unlocked_func: function(arg0)
                {
                    return call_method(arg0, arg0.is_unlocked_gui);
                },
                
                add_draw_list: function(arg0, arg1, arg2)
                {
                    if (arg2.data.defeated >= arg2.upgrade_multiplier_max)
                    {
                        gui_draw_sprite(arg0 + 16, arg1 - 16, spr_icon_check);
                    }
                }
            },
            
            selected_item: function()
            {
                return struct_get_from_hash(global.selected_inventory_item, variable_get_hash("dice_enemy"));
            },
            
            selected_item_draw_props: 
            {
                use_button_text: __("Set enemy"),
                use_button_width: gui_col_x(3),
                draw_below_func: gui_item_dice_selected_battlefield_enemy
            },
            
            selected_item_is_unlocked_func: function(arg0)
            {
                return call_method(arg0, arg0.is_unlocked_gui);
            },
            
            selected_item_use_func: function(arg0)
            {
                o_game.data.dice.battlefield_level = arg0.loop_level;
                o_game.data.dice.battlefield_rarity = arg0.rarity.key;
                set_dialog_section(global.dialog_sections.dice.battlefield, true);
            }
        });
    }
    else if (is_current_dialog_section(global.dialog_sections.dice.options))
    {
        var bx = arg0 + gui_col_x(0.5);
        var y_padding = gui_col_y(1);
        arg1 += draw_description(arg0, arg1, __s("Next auto roll: %s", format_remaining_time(o_game.data.dice.auto_roll_timer, undefined, true, "-")));
        arg1 += gui_col_y(1);
        arg1 += (draw_option(global.options.auto_roll, bx, arg1, undefined, undefined, 5) + y_padding);
        arg1 += (draw_option(global.options.auto_power_roll, bx, arg1, undefined, undefined, 5) + y_padding);
        arg1 += y_padding;
        arg1 += (draw_option(global.options.auto_roll_inventory, bx, arg1, undefined, undefined, 5) + y_padding);
        arg1 += (draw_option(global.options.auto_roll_backpack, bx, arg1, undefined, undefined, 5) + y_padding);
    }
    return arg1 - y_start;
}

function gui_item_dice_selected_battlefield_enemy(arg0, arg1, arg2, arg3, arg4)
{
    if (live_auto_call_1())
    {
        var lac_argc = argument_count;
        var lac_args = array_create(lac_argc);
        var lac_argk = 0;
        repeat (lac_argc)
        {
            lac_args[lac_argk] = argument[lac_argk];
            lac_argk++;
        }
        if (live_auto_call_2(lac_args))
        {
            return global.live_result;
        }
    }
    arg0 += gui_col_x(0.5);
    arg1 += draw_description(arg0, arg1, [__s("Level: %s", arg2.enemy_level), __s("Difficulty: %s", arg2.base_level), __s("Defeated: %s", number_format(arg2.data.defeated)), "", __s("Bonus (%s/%s): %s", min(arg2.data.defeated, arg2.get_max_upgrade_multiplier()), arg2.upgrade_multiplier_max, "\n" + arg2.upgrade_attributes_text)]);
    arg1 += gui_col_y(0.2);
    arg1 += draw_description(arg0, arg1, [__s("Reward") + ":"]);
    draw_result(arg0 + gui_col_x(0.25), arg1, arg2.reward);
}

function gui_item_dice_add_draw()
{
    if (live_auto_call_1())
    {
        var lac_argc = argument_count;
        var lac_args = array_create(lac_argc);
        var lac_argk = 0;
        repeat (lac_argc)
        {
            lac_args[lac_argk] = argument[lac_argk];
            lac_argk++;
        }
        if (live_auto_call_2(lac_args))
        {
            return global.live_result;
        }
    }
    if (is_current_dialog_section(global.dialog_sections.dice.dice))
    {
        draw_option(global.options.dice_inventory_show_count, add_button_base_x - gui_col_x(0.5), add_button_base_y);
        if (is_struct(struct_get_from_hash(global.selected_inventory_item, variable_get_hash("dice_swap"))) && gui_button_sprite_tl(add_button_base_x + gui_col_x(5), add_button_base_y, spr_icon_swap_cancel, undefined, undefined, 
        {
            tooltip: __s("Cancel %s", __("swap"))
        }))
        {
            global.selected_inventory_item.dice_swap = undefined;
        }
    }
    else if (is_current_dialog_section(global.dialog_sections.dice.shop))
    {
        gui_draw_buy_max(add_button_base_x_tl, add_button_base_y_tl, global.shops_sorted.dice);
    }
    draw_resources_current_amount_lite_array(add_text_base_x + gui_col_x(21), add_text_base_y, [global.resources.dice, global.resources.power_dice, global.resources.azurite, global.resources.niobium], false);
}

function gui_item_selected_dice(arg0, arg1, arg2)
{
    if (live_auto_call_1())
    {
        var lac_argc = argument_count;
        var lac_args = array_create(lac_argc);
        var lac_argk = 0;
        repeat (lac_argc)
        {
            lac_args[lac_argk] = argument[lac_argk];
            lac_argk++;
        }
        if (live_auto_call_2(lac_args))
        {
            return global.live_result;
        }
    }
    var y_start = arg1;
    if (arg2.bag == "backpack")
    {
        if (gui_button_tl(arg0 + gui_col_x(9), arg1 + gui_col_y(0), __("Equip"), !is_dice_inventory_full(), gui_col_x(2)))
        {
            move_die_from_backpack(arg2);
        }
    }
    else if (arg2.bag == "inventory")
    {
        if (gui_button_tl(arg0 + gui_col_x(9), arg1 + gui_col_y(0), __("Unequip"), !is_dice_backpack_full(), gui_col_x(2)))
        {
            move_die_from_inventory(arg2);
        }
    }
    var name = sprintf("%sx %s", number_format(arg2.data.count), arg2.get_name());
    arg1 += draw_heading(arg0, arg1, name);
    arg1 += draw_description(arg0, arg1 - gui_col_y(0.3), __s("Last Rolls: %s", arg2.rolls_cache) + "\n" + __s("Current average: %s", number_format(arg2.data.avg)));
    var timeout_formatted = arg2.get_timeout_formatted();
    if (gui_button_tl(arg0, arg1, __("Roll"), arg2.can_roll(), gui_col_x(3), undefined, 
    {
        text_below: timeout_formatted,
        result_mini: arg2.get_roll_cost()
    }))
    {
        arg2.roll();
    }
    var power_roll_text = sprintf("%s/%s", arg2.data.count - 1, 1);
    if (gui_button_tl(arg0 + gui_col_x(4), arg1, __("Power Roll"), arg2.can_power_roll(), gui_col_x(3), undefined, 
    {
        text_below: power_roll_text,
        result_mini: arg2.get_power_roll_cost(),
        tooltip: __s("Rolls %s dice at once.", get_power_roll_count())
    }))
    {
        arg2.power_roll();
    }
    var swap_enabled = true;
    var swap_item = struct_get_from_hash(global.selected_inventory_item, variable_get_hash("dice_swap"));
    if (is_struct(swap_item) && swap_item.bag == arg2.bag)
    {
        swap_enabled = false;
    }
    var swap_sprite = is_struct(swap_item) ? spr_icon_swap_active : spr_icon_swap;
    if (gui_button_sprite(arg0 + gui_col_x(8.5), arg1 + gui_col_y(0.6), swap_sprite, swap_enabled, undefined, 
    {
        tooltip: __("Swap")
    }))
    {
        if (is_struct(swap_item))
        {
            if (swap_item.bag == "inventory")
            {
                if (swap_array_items(global.dice_inventory, global.dice_backpack, swap_item, arg2))
                {
                    swap_item.bag = "backpack";
                    arg2.bag = "inventory";
                }
            }
            else if (swap_array_items(global.dice_backpack, global.dice_inventory, swap_item, arg2))
            {
                swap_item.bag = "inventory";
                arg2.bag = "backpack";
            }
            refresh_ua_section("dice");
            global.selected_inventory_item.dice_swap = undefined;
        }
        else
        {
            global.selected_inventory_item.dice_swap = arg2;
        }
    }
    var salvage_count = arg2.get_salvage_count();
    gui_button_salvage(arg0 + gui_col_x(10), arg1 + gui_col_y(0.6), arg2, undefined, salvage_count, undefined, arg2.can_salvage(), 
    {
        result_mini: arg2.get_salvage_resources(salvage_count),
        text_below: sprintf("%sx", salvage_count)
    });
    arg1 += gui_col_y(4);
    gui_button_toggle_lock(arg0 + gui_col_x(10.75), arg1 + gui_col_y(0.5), arg2, "locked", undefined, 
    {
        tooltip: arg2.data.locked ? __("Unlock") : __("Lock")
    });
    var sub_section = get_default_struct_value(global.selected_inventory_item, "dice_bag_sub_section", "bonuses");
    var sub_sections = [
    {
        key: "bonuses",
        text: __("Bonuses")
    }, 
    {
        key: "enhancements",
        text: __("Enhancements")
    }, 
    {
        key: "stats",
        text: __("Stats")
    }];
    arg1 += draw_button_sections(arg0, arg1, sub_sections, function(arg0)
    {
        global.selected_inventory_item.dice_bag_sub_section = arg0.key;
    }, gui_col_x(10), sub_section);
    switch (sub_section)
    {
        case "bonuses":
            arg1 += draw_description(arg0, arg1, arg2.upgrade_attributes_text, gui_col_x(10));
            break;
        case "enhancements":
            var upgrade_name = "dice";
            var header_desc = __s("Increases %s count for this die by %s.", __("dice"), 1);
            arg1 += draw_upgrade_buyable(arg0, arg1, gui_col_x(12), "", header_desc, 
            {
                cost_result: true,
                count_key_modifier: false,
                item: arg2,
                upgrade_name: upgrade_name
            });
            upgrade_name = "sides";
            header_desc = __s("Increases %s count for this die by %s.", __("sides"), 1);
            arg1 += draw_upgrade_buyable(arg0, arg1, gui_col_x(12), "", header_desc, 
            {
                cost_result: true,
                count_key_modifier: false,
                item: arg2,
                upgrade_name: upgrade_name
            });
            break;
        case "stats":
            arg1 += draw_description(arg0, arg1, implode("\n", [__s("Average current/high: %s/%s", number_format(arg2.data.avg), number_format(arg2.data.avg_high)), __s("Highest roll: %s", number_format(arg2.data.roll_high)), __s("Count: %s", number_format(arg2.data.roll_count)), __s("Timeout: %s", format_time(secr(arg2.get_timeout_duration()), true, true))]), gui_col_x(10));
            break;
    }
    return arg1 - y_start;
}
