function gui_item_shadow_crystal(arg0, arg1)
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
    if (is_current_dialog_section(global.dialog_sections.shadow_crystal.shadow_crystal))
    {
        var hw = gui_col_x(6);
        var hh = gui_col_y(0.5);
        var row_x1 = arg0;
        var row_y1 = arg1;
        var hp = global.shadow_player.data.hp;
        var maxhp = global.shadow_player.get_max_hp();
        var stamina = global.shadow_player.get_stamina();
        var maxstamina = global.shadow_player.get_max_stamina();
        var text = __s("HP: %s/%s", number_format(hp), number_format(maxhp));
        row_y1 += (draw_heading(row_x1, row_y1, text) - gui_col_y(0.8));
        draw_healthbar(row_x1, row_y1, row_x1 + hw, row_y1 + hh, divide_safe(hp, maxhp) * 100, c_white, global.colors.red, global.colors.red, 0, true, false);
        row_y1 += gui_col_y(1.2);
        text = __s("Stamina: %s/%s", number_format(stamina), number_format(maxstamina));
        row_y1 += (draw_heading(row_x1, row_y1, text) - gui_col_y(0.8));
        draw_healthbar(row_x1, row_y1, row_x1 + hw, row_y1 + hh, divide_safe(stamina, maxstamina) * 100, c_white, global.colors.green, global.colors.green, 0, true, false);
        row_y1 += gui_col_y(1.5);
        gui_draw_sprite(row_x1 + gui_col_x(3), row_y1 + gui_col_y(3.5), o_blower.sprite_index, undefined, 12, undefined, undefined, -1);
        var row_x2 = arg0 + gui_col_x(8);
        var row_y2 = arg1;
        var current_level_defeat_count = global.shadow_crystal.data.defeat_counter;
        var can_dec_level = global.shadow_crystal.data.level > 1;
        var can_inc_level = global.shadow_crystal.data.level <= global.shadow_crystal.data.highest_defeat_level;
        if (global.shadow_crystal.data.level > 1 && gui_button_sprite_tl(row_x2, row_y2, spr_gui_arrow_left, can_dec_level))
        {
            global.shadow_crystal.change_level(-get_key_modifier_abs());
            global.shadow_crystal.data.safe_climbing = true;
            global.shadow_crystal.data.safe_level = 0;
        }
        if (global.shadow_crystal.data.level < global.shadow_crystal.get_max_level() && gui_button_sprite_tl(row_x2 + gui_col_x(6), row_y2, spr_gui_arrow_right, can_inc_level))
        {
            global.shadow_crystal.change_level(get_key_modifier_abs());
            global.shadow_crystal.data.safe_climbing = true;
            global.shadow_crystal.data.safe_level = 0;
        }
        var max_defeat_counter = global.shadow_crystal.get_max_defeat_counter();
        var defeat_counter_text = (global.shadow_crystal.data.highest_defeat_level >= global.shadow_crystal.data.level) ? max_defeat_counter : current_level_defeat_count;
        var sc_text = sprintf("[%s/%s]", defeat_counter_text, max_defeat_counter);
        var sc_text_add = (global.shadow_crystal.data.highest_defeat_level >= global.shadow_crystal.data.level && current_level_defeat_count >= max_defeat_counter) ? __("Completed") : "";
        var level_text = __s("Level: %s", number_format(global.shadow_crystal.data.level)) + "\n" + sc_text + "\n" + sc_text_add;
        var desc_text = (global.shadow_crystal.data.safe_level > 0) ? __s("Safe: %s", number_format(global.shadow_crystal.data.safe_level)) : " ";
        row_y2 += draw_heading_description(row_x2 + gui_col_x(3.5), row_y2 - gui_col_y(0.5), level_text, desc_text, gui_col_x(4.5), undefined, 1, 0);
        if (gui_button_tl(row_x2 + gui_col_x(0), row_y2, __("Attack"), global.shadow_crystal.can_attack(), gui_col_x(3), undefined, 
        {
            timeout_end: global.shadow_crystal.data.respawn_timer
        }))
        {
            global.shadow_crystal.attack();
        }
        if (global.shadow_player.data.dead)
        {
            if (gui_button_tl(row_x2 + gui_col_x(4), row_y2, __("Revive"), global.shadow_player.can_revive(), gui_col_x(3), undefined, 
            {
                timeout_end: global.shadow_player.data.revive_timer
            }))
            {
                global.shadow_player.revive();
            }
        }
        else
        {
            var rest_text_below = sprintf("+%s %s\n+%s %s", number_format(global.shadow_player.get_rest_hp_value()), __("HP"), number_format(global.shadow_player.get_rest_stamina_value()), __("Stamina"));
            if (gui_button_tl(row_x2 + gui_col_x(4), row_y2, __s("Rest"), global.shadow_player.can_rest(), gui_col_x(3), undefined, 
            {
                timeout_end: global.shadow_player.data.rest_timer,
                text_below: rest_text_below
            }))
            {
                global.shadow_player.rest();
            }
        }
        row_y2 += gui_col_y(3.5);
        var damage = global.shadow_player.get_base_damage();
        var damage_max = damage * global.shadow_player.get_attack_max_multiplier();
        var resistance = global.shadow_player.get_resistance();
        var sc_damage_min = global.shadow_crystal.get_attack_damage_min();
        var sc_damage_max = global.shadow_crystal.get_attack_damage_max();
        var sc_resistance = global.shadow_crystal.get_resistance();
        var sc_speed = global.shadow_crystal.get_speed();
        var player_attacks_first_chance = global.shadow_player.get_first_attack_chance(sc_speed);
        var final_damage_min = max(1, round(divide_safe(damage, sc_resistance)));
        var final_damage_max = max(1, round(divide_safe(damage_max, sc_resistance)));
        var sc_final_damage_min = max(1, round(divide_safe(sc_damage_min, resistance)));
        var sc_final_damage_max = max(1, round(divide_safe(sc_damage_max, resistance)));
        var stats_y1 = draw_description(row_x2, row_y2, concatstr_nl(__s("Player"), "------", __s("Damage: %s-%s", number_format(damage), number_format(damage_max)), sprintf("(%s-%s)", number_format(final_damage_min), number_format(final_damage_max)), __s("Speed: %s (%s)", number_format(global.shadow_player.get_speed()), number_format_percent(player_attacks_first_chance)), __s("Resistance: %s (%s)", number_format(resistance), number_format_percent((divide_safe(100, resistance) * (resistance - 1)) / 100))));
        var stats_y2 = draw_description(row_x2 + gui_col_x(4.5), row_y2, concatstr_nl(__s("Shadow Crystal"), "------", __s("Damage: %s-%s", number_format(global.shadow_crystal.get_attack_damage_min()), number_format(global.shadow_crystal.get_attack_damage_max())), sprintf("(%s-%s)", number_format(sc_final_damage_min), number_format(sc_final_damage_max)), __s("Speed: %s (%s)", number_format(sc_speed), number_format_percent(1 - player_attacks_first_chance)), __s("Resistance: %s (%s)", number_format(sc_resistance), number_format_percent((divide_safe(100, sc_resistance) * (sc_resistance - 1)) / 100))));
        row_y2 += max(stats_y1, stats_y2);
        row_y2 += draw_description(row_x2, row_y2, __("Reward"));
        row_y2 += draw_result(row_x2 + gui_col_x(0.1), row_y2, global.shadow_crystal.get_reward());
        var sc_log = array_reverse(global.shadow_crystal_log);
        row_y2 += (draw_description(row_x2, row_y2, sc_log, gui_col_x(8)) - gui_col_y(1));
        var sc_hp = global.shadow_crystal.get_hp();
        var sc_maxhp = global.shadow_crystal.get_max_hp();
        var row_x3 = arg0 + gui_col_x(16);
        var row_y3 = arg1;
        text = __s("HP: %s/%s", number_format(sc_hp), number_format(sc_maxhp));
        row_y3 += (draw_heading(row_x3, row_y3, text) - gui_col_y(0.8));
        var sc_bar_color = global.shadow_crystal.is_spawned() ? global.colors.purple : 8421504;
        var sc_color = global.shadow_crystal.is_spawned() ? 16777215 : 8421504;
        draw_healthbar(row_x3, row_y3, row_x3 + hw, row_y3 + hh, divide_safe(sc_hp, sc_maxhp) * 100, c_white, sc_bar_color, sc_bar_color, 0, true, false);
        gui_draw_sprite(row_x3 + gui_col_x(3), row_y3 + gui_col_y(8), spr_object_shadow_crystal, sc_color, 24);
        if (global.upgrade_attributes.shadow_crystal_blower_enemy_damage_multiplier_level > 0)
        {
            draw_description(row_x3, row_y3 + gui_col_y(15), format_upgrade_text(
            {
                blower_enemy_damage_multiplier: get_shadow_crystal_blower_damage_multiplier()
            }));
        }
        var bx = arg0 + gui_col_x(0.5);
        var by = y_start + gui_col_y(13.5);
        var y_padding = gui_col_y(1);
        draw_option(global.options.sc_auto_attack, bx, by, undefined, undefined, 5);
        draw_option(global.options.sc_auto_rest, bx + gui_col_x(4), by, undefined, undefined, 5);
        by += gui_col_y(2);
        draw_option(global.options.sc_auto_revive, bx, by, undefined, undefined, 5);
        draw_option(global.options.sc_auto_advance, bx + gui_col_x(4), by, undefined, undefined, 5);
        by += gui_col_y(2);
        draw_option(global.options.sc_auto_attack_safe, bx, by, undefined, undefined, 5);
        draw_option(global.options.sc_auto_advance_safe, bx + gui_col_x(4), by, undefined, undefined, 5);
        arg1 += (max(row_y1, row_y2, row_y3, by) - y_start);
    }
    else if (is_current_dialog_section(global.dialog_sections.shadow_crystal.shadow_tree))
    {
        if (is_undefined(struct_get_from_hash(global.selected_inventory_item, variable_get_hash("shadow_tree_scroll_x"))))
        {
            global.selected_inventory_item.shadow_tree_scroll_x = 0;
            global.selected_inventory_item.shadow_tree_scroll_y = 0;
            global.selected_inventory_item.shadow_tree_x_min = 9999999999;
            global.selected_inventory_item.shadow_tree_x_max = 0;
            global.selected_inventory_item.shadow_tree_y_min = 9999999999;
            global.selected_inventory_item.shadow_tree_y_max = 0;
        }
        var selected_node = get_default_struct_value(global.selected_inventory_item, "shadow_map");
        var padding = 80;
        var position_changed = false;
        var scroll_distance = gui_col_x(2);
        var tree_view_width = gui_col_x(12);
        var tree_view_height = gui_col_y(14);
        var tree_x = arg0 - gui_col_x(7.4) - global.selected_inventory_item.shadow_tree_scroll_x;
        var tree_y = (arg1 + gui_col_y(2.5)) - global.selected_inventory_item.shadow_tree_scroll_y;
        var clip_x = arg0 + gui_col_x(1);
        var clip_y = arg1 + gui_col_y(1.5);
        draw_rect(clip_x, clip_y, clip_x + tree_view_width, clip_y + tree_view_height, false, global.colors.content_section_background);
        var scissor_padding = 10;
        var scissor = gpu_get_scissor();
        var scroll_button_y_center = y_start + gui_col_y(8.4);
        if (gui_button_sprite_tl(arg0 + gui_col_x(0), scroll_button_y_center, spr_gui_arrow_left))
        {
            global.selected_inventory_item.shadow_tree_scroll_x -= scroll_distance;
            position_changed = true;
        }
        if (gui_button_sprite_tl(arg0 + tree_view_width + gui_col_x(1.5), scroll_button_y_center, spr_gui_arrow_right))
        {
            global.selected_inventory_item.shadow_tree_scroll_x += scroll_distance;
            position_changed = true;
        }
        if (gui_button_sprite_tl(arg0 + (tree_view_width / 2), y_start, spr_gui_arrow_up) || mouse_wheel_up())
        {
            global.selected_inventory_item.shadow_tree_scroll_y -= scroll_distance;
            position_changed = true;
        }
        if (gui_button_sprite_tl(arg0 + (tree_view_width / 2), y_start + tree_view_height + gui_col_y(2), spr_gui_arrow_down) || mouse_wheel_down())
        {
            global.selected_inventory_item.shadow_tree_scroll_y += scroll_distance;
            position_changed = true;
        }
        if (position_changed)
        {
            global.selected_inventory_item.shadow_tree_scroll_x = clamp(global.selected_inventory_item.shadow_tree_scroll_x, -global.selected_inventory_item.shadow_tree_x_min - 200, global.selected_inventory_item.shadow_tree_x_max - gui_col_x(11));
            global.selected_inventory_item.shadow_tree_scroll_y = clamp(global.selected_inventory_item.shadow_tree_scroll_y, -global.selected_inventory_item.shadow_tree_y_min - 200, global.selected_inventory_item.shadow_tree_y_max - gui_col_y(8));
        }
        if (gui_button_sprite_tl(arg0, y_start, spr_gui_center, true, undefined, 
        {
            tooltip: __("Reset view")
        }))
        {
            global.selected_inventory_item.shadow_tree_scroll_x = 0;
            global.selected_inventory_item.shadow_tree_scroll_y = 0;
        }
        gpu_set_scissor(clip_x + scissor_padding, clip_y + scissor_padding, tree_view_width - scissor_padding, tree_view_height - scissor_padding);
        var __array = global.shadow_tree.nodes;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (!mitem.has_parent_nodes)
            {
                continue;
            }
            var item_x = tree_x + (mitem.index_x * padding);
            var item_y = tree_y + (mitem.index_y * padding);
            var __array2 = mitem.parent_nodes;
            var __prop_len2 = array_length(__array2);
            for (var __i2 = 0; __i2 < __prop_len2; __i2++)
            {
                var mitem2 = __array2[__i2];
                var parent_node_x = tree_x + (mitem2.index_x * padding) + 16;
                var parent_node_y = tree_y + (mitem2.index_y * padding) + 16;
                if (item_y == parent_node_y)
                {
                    parent_node_y -= 41;
                }
                var color = (mitem2.data.level >= mitem.parent_nodes_min_level) ? global.colors.green : global.colors.gray;
                draw_line_width_color(item_x + 16, item_y + 16, parent_node_x, parent_node_y, 4, color, color);
            }
        }
        __array = global.shadow_tree.nodes;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            var item_x = tree_x + (mitem.index_x * padding);
            var item_y = tree_y + (mitem.index_y * padding);
            if (item_x < clip_x || item_x > (clip_x + tree_view_width) || item_y < clip_y || item_y > (clip_y + tree_view_height))
            {
                continue;
            }
            var can_select = !mitem.is_obfuscated();
            var sprite = can_select ? mitem.sprite : spr_icon_question;
            var tooltip = mitem.get_tooltip();
            if (gui_button_sprite_tl(item_x, item_y, sprite, can_select, undefined, 
            {
                selected: mitem == selected_node,
                is_obfuscated: !can_select,
                tooltip: tooltip
            }))
            {
                global.selected_inventory_item.shadow_map = mitem;
            }
            if (mitem.max_level > 0 && mitem.data.level >= mitem.max_level)
            {
                gui_draw_sprite(item_x + 40, item_y - 4, spr_icon_check);
            }
            global.selected_inventory_item.shadow_tree_x_min = min(global.selected_inventory_item.shadow_tree_x_min, mitem.index_x * padding);
            global.selected_inventory_item.shadow_tree_x_max = max(global.selected_inventory_item.shadow_tree_x_max, mitem.index_x * padding);
            global.selected_inventory_item.shadow_tree_y_min = min(global.selected_inventory_item.shadow_tree_y_min, mitem.index_y * padding);
            global.selected_inventory_item.shadow_tree_y_max = max(global.selected_inventory_item.shadow_tree_y_max, mitem.index_y * padding);
        }
        gpu_set_scissor(scissor);
        if (is_struct(selected_node))
        {
            var item_x = arg0 + gui_col_x(15);
            var item_y = gui_y_start_items;
            draw_selected_item(item_x, item_y, selected_node, gui_col_x(7));
            item_y += gui_col_y(5);
            draw_description(item_x, item_y, selected_node.get_description(), gui_col_x(8));
            item_y += gui_col_y(3);
            if (selected_node.data.level < selected_node.max_level)
            {
                if (gui_button_tl(item_x, item_y, __("Upgrade"), selected_node.can_upgrade(), gui_col_x(4), undefined, 
                {
                    result_mini: selected_node.get_upgrade_cost()
                }))
                {
                    selected_node.upgrade();
                }
            }
            else
            {
                item_y += draw_description(item_x, item_y, __s("Max level reached."));
            }
            if (global.debug)
            {
                item_y += gui_col_y(3);
                if (gui_button_tl(item_x, item_y, "lvl=0"))
                {
                    selected_node.data.level = 0;
                    selected_node.refresh_upgrade_attributes();
                    selected_node.skill_tree.refresh_upgrade_attributes();
                }
                if (gui_button_tl(item_x + gui_col_x(1.5), item_y, "lvl+1"))
                {
                    selected_node.upgrade();
                }
                item_y += gui_col_y(2);
                if (gui_button_tl(item_x, item_y, "max all"))
                {
                    __array = global.shadow_tree.nodes;
                    __prop_len = array_length(__array);
                    for (var __i = 0; __i < __prop_len; __i++)
                    {
                        var mitem = __array[__i];
                        mitem.data.level = mitem.max_level;
                        mitem.refresh_upgrade_attributes();
                    }
                    global.shadow_tree.refresh_upgrade_attributes();
                }
                if (gui_button_tl(item_x + gui_col_x(2), item_y, "reset all"))
                {
                    __array = global.shadow_tree.nodes;
                    __prop_len = array_length(__array);
                    for (var __i = 0; __i < __prop_len; __i++)
                    {
                        var mitem = __array[__i];
                        mitem.data.level = 0;
                        mitem.refresh_upgrade_attributes();
                    }
                    global.shadow_tree.refresh_upgrade_attributes();
                }
                if (gui_button_tl(item_x + gui_col_x(4), item_y, "sc + 100"))
                {
                    global.shadow_crystal.data.highest_defeat_level += 100;
                }
            }
        }
    }
    else if (is_current_dialog_section(global.dialog_sections.shadow_crystal.shadow_pit))
    {
        draw_sprite_ext(spr_icon_shadow_pit, 0, arg0 + gui_col_x(11.5), arg1 + gui_col_y(15.5), 16, 12, 0, c_white, 1);
        var pit_value = get_shadow_pit_value();
        var pit_ua = get_shadow_pit_ua();
        var timeout_duration = sec(60);
        gui_item_draw_invest_object(arg0, arg1, global.shadow_pit.dusk);
        draw_option(global.options.sp_auto_throw_dusk, arg0 + gui_col_x(5), arg1 + gui_col_y(2), undefined, undefined, 5);
        gui_item_draw_invest_object(arg0, arg1 + gui_col_y(4), global.shadow_pit.essence_shadow);
        draw_option(global.options.sp_auto_throw_se, arg0 + gui_col_x(5), arg1 + gui_col_y(6), undefined, undefined, 5);
        gui_item_draw_invest_object(arg0, arg1 + gui_col_y(8), global.shadow_pit.shadow_crystal);
        draw_option(global.options.sp_auto_throw_sc, arg0 + gui_col_x(5), arg1 + gui_col_y(10), undefined, undefined, 5);
        var row_x2 = arg0 + (global.gui_settings.content_width / 2);
        var row_y2 = y_start;
        row_y2 += draw_heading(row_x2, row_y2, __s("Pit Strength: %s", number_format(pit_value)), undefined, undefined, 1);
        if (gui_button_tl((arg0 + (global.gui_settings.content_width / 2)) - gui_col_x(2), row_y2, __("Ascend"), shadow_pit_can_ascend(), gui_col_x(4), undefined, 
        {
            result_mini: get_shadow_pit_ascend_cost()
        }))
        {
            shadow_pit_ascend();
        }
        row_y2 += gui_col_y(2.75);
        var text = concatstr_nl(sprintf("%s: %s/%s", __s("Next ascension"), number_format(get_shadow_pit_invest_value()), get_shadow_pit_ascend_value()), sprintf("%s: %s", __s("Ascended"), number_format(o_game.data.shadow_pit.ascend_count)));
        row_y2 += draw_description(row_x2, row_y2, text, gui_col_x(8), 1);
        var row_x3 = arg0 + gui_col_x(16);
        var row_y3 = y_start;
        row_y3 += draw_heading(row_x3, row_y3, __("Bonuses"));
        row_y3 += draw_description(row_x3, row_y3, format_upgrade_text(pit_ua.upgrade_attributes, undefined, true, undefined, "\n"));
        if (global.debug)
        {
            if (gui_button_tl(arg0 + gui_col_x(0), gui_y + gui_col_y(17), "=0", undefined, 80))
            {
                global.shadow_pit.dusk.data.invested = 
                {
                    resources: 
                    {
                        dusk: 0
                    }
                };
                global.shadow_pit.essence_shadow.data.invested = 
                {
                    materials: 
                    {
                        essence_shadow: 0
                    }
                };
                global.shadow_pit.shadow_crystal.data.invested = 
                {
                    materials: 
                    {
                        shadow_crystal: 0
                    }
                };
                global.shadow_pit.dusk.data.invest_count = 0;
                global.shadow_pit.essence_shadow.data.invest_count = 0;
                global.shadow_pit.shadow_crystal.data.invest_count = 0;
            }
            if (gui_button_tl(arg0 + 100, gui_y + gui_col_y(17), "+1", undefined, 80))
            {
                add_struct_to_struct(global.shadow_pit.dusk.data.invested, global.shadow_pit.dusk.get_invest_cost());
                add_struct_to_struct(global.shadow_pit.essence_shadow.data.invested, global.shadow_pit.essence_shadow.get_invest_cost());
                add_struct_to_struct(global.shadow_pit.shadow_crystal.data.invested, global.shadow_pit.shadow_crystal.get_invest_cost());
                global.shadow_pit.dusk.data.invest_count += 1;
                global.shadow_pit.essence_shadow.data.invest_count += 1;
                global.shadow_pit.shadow_crystal.data.invest_count += 1;
            }
            if (gui_button_tl(arg0 + 200, gui_y + gui_col_y(17), "+10", undefined, 80))
            {
                add_struct_to_struct(global.shadow_pit.dusk.data.invested, global.shadow_pit.dusk.get_invest_cost(10));
                add_struct_to_struct(global.shadow_pit.essence_shadow.data.invested, global.shadow_pit.essence_shadow.get_invest_cost(10));
                add_struct_to_struct(global.shadow_pit.shadow_crystal.data.invested, global.shadow_pit.shadow_crystal.get_invest_cost(10));
                global.shadow_pit.dusk.data.invest_count += 10;
                global.shadow_pit.essence_shadow.data.invest_count += 10;
                global.shadow_pit.shadow_crystal.data.invest_count += 10;
            }
            if (gui_button_tl(arg0 + 300, gui_y + gui_col_y(17), "clr time", undefined, 120))
            {
                global.shadow_pit.dusk.data.timeout = 0;
                global.shadow_pit.essence_shadow.data.timeout = 0;
                global.shadow_pit.shadow_crystal.data.timeout = 0;
            }
        }
    }
    else if (is_current_dialog_section(global.dialog_sections.shadow_crystal.transmute))
    {
        arg1 += draw_transmuters_section(arg0, arg1, "shadow");
    }
    return arg1 - y_start;
}

function gui_item_shadow_crystal_add_draw()
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
    draw_resources_current_amount_lite_array(add_button_base_x + gui_col_x(7), add_button_base_y + gui_col_y(0.5), [global.resources.ulc, global.resources.dusk], undefined, undefined, undefined, 4.5);
    draw_resources_current_amount_lite_array(add_button_base_x + gui_col_x(20), add_button_base_y + gui_col_y(0.5), [global.materials.essence_shadow, global.materials.shadow_crystal, global.materials.light_rod], undefined, undefined, global.materials, 4.5);
}

function gui_item_draw_invest_object(arg0, arg1, arg2)
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
    var add_modifier = arg2.get_increase_value();
    var cost = arg2.get_invest_cost();
    var pit_value = get_shadow_pit_value();
    draw_result(arg0 + gui_col_x(1.5), arg1, cost);
    if (gui_button_tl(arg0, arg1 + gui_col_y(1.3), __("Throw"), arg2.can_invest(), gui_col_x(4), undefined, 
    {
        timeout_end: arg2.data.timeout,
        text_below: (arg2.data.timeout > o_game.data.stats.time_elapsed) ? undefined : sprintf("+%s", add_modifier)
    }))
    {
        arg2.invest();
    }
}
