function gui_item_area(arg0, arg1, arg2)
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
    var draw_price = false;
    if (!is_struct(arg2))
    {
        return 0;
    }
    set_default_font(f_gui_default);
    var name = get_value_ext(arg2, arg2.get_name, false);
    var description = get_value_ext(arg2, arg2.get_description, arg2);
    var can_teleport = get_value_ext(arg2, arg2.can_teleport, arg2);
    var is_buyable = arg2._is_buyable();
    var area_check = get_value_ext(arg2, arg2.check);
    var has_auto_teleport = arg2.data.auto_teleport;
    if (arg2.is_obfuscated())
    {
        draw_price = is_buyable;
        name = "?";
        description = get_value_ext(arg2, arg2.description_locked, false);
    }
    draw_heading(arg0 + gui_col_x(1), arg1, name);
    var y_height = draw_description(arg0 + gui_col_x(1), arg1 + gui_col_y(0.6), description, gui_col_x(10)) + gui_col_y(0.2);
    if (is_struct(variable_struct_get(o_game.data.mirrors, arg2.key)))
    {
        gui_draw_sprite(arg0 + gui_col_x(12), arg1 + gui_col_y(0.5), spr_artifact_mirror, undefined, undefined, undefined, __("You have placed a mirror in this area."));
    }
    if (draw_price)
    {
        var item_cost = arg2.get_unlock_cost();
        set_default_font(f_gui_default);
        var draw_func = iif(is_struct(arg2.cost_materials), draw_materials, draw_resources);
        draw_func(arg0 + gui_col_x(13), arg1, item_cost, 1, 
        {
            show_tooltip: true
        });
    }
    else if (area_check)
    {
        var resources_padding = global.gui_resources_inline_padding;
        var materials_padding = global.gui_resources_inline_padding;
        var resources_count = array_length(arg2.resources);
        var materials_count = array_length(arg2.get_materials());
        if (resources_count > 0)
        {
            resources_padding = min(resources_padding, round(gui_col_x(3) / resources_count));
        }
        if (materials_count > 0)
        {
            materials_padding = min(materials_padding, round(gui_col_x(3) / materials_count));
        }
        draw_resources_array(arg0 + gui_col_x(13), arg1, arg2.resources, resources_padding);
        if (get_upgrade_count(global.shops.blc.unlock_materials) > 0)
        {
            var mats_y = global.is_mobile ? 1.25 : 0.85;
            var mats = arg2.get_materials();
            draw_resources_array(arg0 + gui_col_x(13), arg1 + gui_col_y(mats_y), mats, materials_padding);
        }
    }
    var can_do_action = get_value_ext(arg2, arg2.check_gui);
    if (is_buyable || (!is_buyable && area_check))
    {
        if (gui_button(arg0 + gui_col_x(18), arg1 + gui_col_y(0.5), arg2.get_button_text(), can_do_action, gui_col_x(3)))
        {
            arg2.func_gui();
            arg2.unlock();
            init_game_vars();
            if (get_option(global.options.close_dialog_on_teleport))
            {
                gui_dialog_close();
            }
        }
    }
    if (arg2.type.key == global.area_types.boss.key && area_check && get_upgrade_count(global.shops.gems.show_boss_area_timer) > 0 && global.shops.gems.show_boss_area_timer.data.toggle)
    {
        var boss_text = arg2.get_boss_spawn_text();
        draw_description(arg0 + gui_col_x(18), arg1 + gui_col_y(1.25), boss_text, gui_col_x(6), 1);
    }
    if (arg2.can_autoteleport && area_check)
    {
        var au_btn_enabled = true;
        var au_btn_text = iif(has_auto_teleport, "[X]", "[ ]");
        var tooltip_text = __("Auto teleport");
        var hp_drain = get_hp_drain_area(arg2);
        if (hp_drain > 0)
        {
            au_btn_enabled = false;
            tooltip_text = __("Disabled because you would take damage here. Ouch!");
        }
        var btn_opt = 
        {
            tooltip: tooltip_text
        };
        if (gui_button(arg0 + gui_col_x(21), arg1 + gui_col_y(0.5), au_btn_text, au_btn_enabled, gui_col_x(1), false, btn_opt))
        {
            clear_auto_teleport();
            arg2.data.auto_teleport = !has_auto_teleport;
        }
        if (has_auto_teleport && can_teleport && keyboard_check_pressed(vk_space))
        {
            change_area(arg2);
        }
    }
    gui_draw_fav(arg0 + gui_col_x(0.3), arg1 + gui_col_y(0.4), arg2);
    var max_floor = arg2.get_max_floor();
    if (arg2.type.key == global.area_types.tower.key && area_check)
    {
        var max_floor_select = clamp((floor((max_floor - 1) / 10) * 10) + 1, 1, max_floor);
        arg2.data.selected_floor = max(1, min(max_floor_select, arg2.data.selected_floor));
        var tower_floor_select = sprintf("%sf", number_format(arg2.data.selected_floor));
        var highest_floor = max(1, min(max_floor_select, arg2.data.highest_floor));
        var highest_floor_max_select = clamp((floor((highest_floor - 1) / 10) * 10) + 1, 1, highest_floor);
        var tooltip_text = implode("\n", [__("Tower start floor"), __s("Max floor: %s", number_format(max_floor)), __s("Current high: %s", number_format(arg2.get_highest_floor_current_run())), __s("All-time high: %s", number_format(arg2.data.highest_floor_stats))]);
        var btn_opt = 
        {
            tooltip: tooltip_text
        };
        if (gui_button(arg0 + gui_col_x(22.5), arg1 + gui_col_y(0.5), tower_floor_select, true, gui_col_x(1.7), true, btn_opt))
        {
            var dir = get_click_dir() * 10 * get_key_modifier("tower_floor");
            arg2.data.selected_floor += dir;
            arg2.data.selected_floor = clamp(arg2.data.selected_floor, 1, highest_floor_max_select);
        }
        if (gui_button(arg0 + gui_col_x(21), arg1 + gui_col_y(2) + global.gui_button_mobile_padding_y, __("Min"), true, gui_col_x(1.2), false, 
        {
            tooltip: __("Set min tower floor")
        }))
        {
            arg2.data.selected_floor = 1;
        }
        if (gui_button(arg0 + gui_col_x(22.25), arg1 + gui_col_y(2) + global.gui_button_mobile_padding_y, __("Max"), true, gui_col_x(1.2), false, 
        {
            tooltip: __("Set max tower floor")
        }))
        {
            arg2.data.selected_floor = highest_floor_max_select;
        }
    }
    else if (arg2.type.key == global.area_types.dungeon.key && area_check)
    {
        arg2.data.selected_floor = min(max_floor, arg2.data.selected_floor);
        var prefix = (arg2.key == global.areas.inner_pyramid.key) ? "-" : "";
        var tower_floor_select = sprintf("%s%sf", prefix, number_format(arg2.data.selected_floor));
        var tooltip_text = implode("\n", [__("Dungeon start floor"), __s("Max floor: %s", concatstr(prefix, number_format(max_floor))), __s("Current high: %s", concatstr(prefix, number_format(arg2.get_highest_floor_current_run()))), __s("All-time high: %s", concatstr(prefix, number_format(arg2.data.highest_floor_stats)))]);
        var btn_opt = 
        {
            tooltip: tooltip_text
        };
        if (gui_button(arg0 + gui_col_x(22.5), arg1 + gui_col_y(0.5), tower_floor_select, true, gui_col_x(1.7), false, btn_opt))
        {
            var dir = get_click_dir() * get_key_modifier();
            var highest_floor = min(max_floor, arg2.data.highest_floor);
            var highest_floor_max_select = highest_floor;
            arg2.data.selected_floor += dir;
            arg2.data.selected_floor = clamp(arg2.data.selected_floor, 1, highest_floor_max_select);
        }
    }
    if (global.is_mobile)
    {
        y_height += gui_col_y(1);
    }
    gui_draw_buy_debug(arg2, arg0, arg1);
    return y_height;
}
