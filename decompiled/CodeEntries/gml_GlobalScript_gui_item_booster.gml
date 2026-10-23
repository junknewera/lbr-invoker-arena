function gui_item_boosters(arg0, arg1)
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
    var col_x = 0;
    var __array = global.booster_array;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        gui_item_booster(arg0 + (gui_col_x(col_x) * 8), arg1, mitem);
        col_x++;
        if (col_x >= 3)
        {
            col_x = 0;
            arg1 += gui_col_y(7);
        }
    }
    return (arg1 - y_start) + gui_col_y(6);
}

function gui_item_booster(arg0, arg1, arg2)
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
    draw_heading(arg0, arg1, arg2.name_full);
    draw_description(arg0, arg1 + gui_col_y(0.5), format_upgrade_text(arg2.upgrade_attributes));
    draw_result(arg0, arg1 + gui_col_y(1.5), arg2.cost);
    var remaining_time = format_remaining_time(arg2.data.expire, undefined, true);
    if (gui_button_tl(arg0, arg1 + gui_col_y(3), __("Boost"), arg2.can_activate(), gui_col_x(3), undefined, 
    {
        text_below: remaining_time
    }))
    {
        arg2.activate();
    }
    if (gui_button_toggle(arg0 + gui_col_x(3.75), arg1 + gui_col_y(3.6), arg2.data.auto, has_bought_shop_item(global.shops.gems.auto_boosters), 
    {
        tooltip: __("Auto boost")
    }))
    {
        arg2.data.auto = !arg2.data.auto;
    }
}

function gui_item_boosters_add_draw()
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
    draw_option(global.options.auto_boosters_enabled, add_button_base_x - gui_col_x(0.5), add_button_base_y + gui_col_y(0.75), undefined, undefined, 5, has_bought_shop_item(global.shops.gems.auto_boosters));
    if (gui_button_tl(add_button_base_x_tl + gui_col_x(20), add_button_base_y, __("Boost all"), undefined, gui_col_x(3)))
    {
        confirm_dialog_current_nav(__("Do you want to activate all boosters?"), activate_all_boosters);
    }
    if (global.debug)
    {
        if (gui_button_tl(add_button_base_x_tl + gui_col_x(4), add_button_base_y, "activate all"))
        {
            var __array = global.booster_array;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                add_result_lite(mitem.cost);
                mitem.activate();
            }
        }
        if (gui_button_tl(add_button_base_x_tl + gui_col_x(6.5), add_button_base_y, "expire all"))
        {
            var __array = global.booster_array;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                mitem.data.expire = 0;
                mitem.expire();
            }
        }
        if (gui_button_tl(add_button_base_x_tl + gui_col_x(8.5), add_button_base_y, "add res"))
        {
            var __array = global.booster_array;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                add_result_lite(mitem.cost);
            }
        }
    }
}

function gui_item_booster_game(arg0, arg1)
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
    if (is_current_dialog_section(global.dialog_sections.booster_game.game))
    {
        if (o_game.data.booster_game.status == UnknownEnum.Value_0)
        {
            draw_heading(arg0 + (global.gui_settings.content_width / 2), arg1, __("Booster Game"), undefined, undefined, 1);
            draw_sprite_ext(spr_icon_rocket, 0, arg0 + (global.gui_settings.content_width / 2), arg1 + gui_col_y(6), 12, 12, 0, c_white, 1);
            if (gui_button(arg0 + (global.gui_settings.content_width / 2), arg1 + gui_col_y(11), __("Start"), boostergame_can_play(), gui_col_x(5), undefined, 
            {
                text_below: format_remaining_time(get_timeout_data("boostergame"))
            }))
            {
                boostergame_start_game();
            }
        }
        else if (o_game.data.booster_game.status == UnknownEnum.Value_1 || o_game.data.booster_game.status == UnknownEnum.Value_2)
        {
            var hw = gui_col_x(5);
            var hh = gui_col_y(0.5);
            var row_x1 = arg0;
            var row_y1 = arg1;
            var hp = o_game.data.booster_game.hp;
            var maxhp = boostergame_get_rocket_max_hp();
            var fuel = o_game.data.booster_game.fuel;
            var maxfuel = boostergame_get_rocket_max_fuel();
            var text = sprintf("%s: %s/%s", __("HP"), number_format(hp), number_format(maxhp));
            row_y1 += (draw_heading(row_x1, row_y1, text) - gui_col_y(0.8));
            draw_healthbar(row_x1, row_y1, row_x1 + hw, row_y1 + hh, divide_safe(hp, maxhp) * 100, c_white, global.colors.red, global.colors.red, 0, true, false);
            row_y1 += gui_col_y(1.5);
            text = sprintf("%s: %s/%s", __("Fuel"), number_format(fuel), number_format(maxfuel));
            row_y1 += (draw_heading(row_x1, row_y1, text) - gui_col_y(0.8));
            draw_healthbar(row_x1, row_y1, row_x1 + hw, row_y1 + hh, divide_safe(fuel, maxfuel) * 100, c_white, global.colors.purple, global.colors.purple, 0, true, false);
            row_y1 += gui_col_y(2);
            var sprite_color = (hp > 0) ? 16777215 : 96;
            draw_sprite_ext(spr_icon_rocket, 0, row_x1 + gui_col_x(2.5), row_y1 + gui_col_y(2), 10, 10, 0, sprite_color, 1);
            var __array = o_game.data.booster_game.actions;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                var action = variable_struct_get(global.booster_game_actions, mitem);
                if (!is_struct(action))
                {
                    continue;
                }
                var item_x = arg0 + gui_col_x(2.5) + gui_col_x(__i * 7);
                var item_y = arg1 + gui_col_y(12.5);
                var risk = !is_undefined(variable_struct_get(o_game.data.booster_game.risk_fields, __i));
                var action_name = action.name;
                var action_text = boostergame_get_action_text(action);
                if (risk)
                {
                    action_name = "?";
                    action_text = "???";
                }
                if (gui_button_tl(item_x, item_y, action_name, boostergame_can_do_action(action), gui_col_x(4)))
                {
                    boostergame_action(action);
                }
                draw_description(item_x + gui_col_x(2), item_y + gui_col_y(2), action_text, gui_col_x(6), 1);
            }
            var row_x = arg0 + gui_col_x(8);
            var row_y = arg1;
            row_y += draw_heading(row_x, row_y, __s("Stats"), undefined, undefined, 0);
            set_default_font(f_gui_small);
            row_y += draw_text_icon(row_x + gui_col_x(0.1), row_y, spr_icon_metal, sprintf("%s %s", number_format(o_game.data.booster_game.metal), __("Metal")), 32);
            row_y += draw_text_icon(row_x + gui_col_x(0.1), row_y, spr_material_milk, sprintf("%s %s", number_format(global.materials.milk.data.count), __("Milk")), 32);
            row_y += gui_col_y(0.5);
            row_y += draw_description(row_x, row_y, __("Current reward"));
            row_y += draw_result(row_x, row_y, boostergame_get_reward());
            row_y += draw_description(row_x, row_y, concatstr_nl(__s("Current: %s km", number_format(o_game.data.booster_game.distance)), __s("Farthest: %s km", number_format(o_game.data.booster_game.distance_high)), __s("Last: %s km", number_format(o_game.data.booster_game.distance_last)), __s("Total: %s km", number_format(o_game.data.booster_game.distance_total))));
            draw_heading(arg0 + gui_col_x(14), arg1, __("Log"));
            draw_description(arg0 + gui_col_x(14), arg1 + gui_col_y(1), implode("\n", o_game.data.booster_game.log, true), gui_col_x(10));
            if (o_game.data.booster_game.status == UnknownEnum.Value_2)
            {
                if (gui_button(arg0 + (global.gui_settings.content_width / 2), arg1 + gui_col_y(10), __("End run"), undefined, gui_col_x(5)))
                {
                    o_game.data.booster_game.status = UnknownEnum.Value_0;
                }
            }
        }
    }
    else if (is_current_dialog_section(global.dialog_sections.booster_game.shop))
    {
        arg1 += draw_upgrades_buyable(arg0, arg1, global.booster_game_upgrades, gui_col_x(20));
    }
    else if (is_current_dialog_section(global.dialog_sections.booster_game.stats))
    {
        arg1 += draw_heading(arg0, arg1, __("Bonuses"));
        arg1 += draw_description(arg0, arg1, __("The farther you travel, the better the bonuses!"));
        var high = o_game.data.booster_game.distance_total;
        var next_stage_text = __s("All bonuses unlocked.");
        if (global.cache.boostergame_ua_stage < array_length(global.boostergame_ua_stages))
        {
            var stage = global.boostergame_ua_stages[global.cache.boostergame_ua_stage];
            var remaining_save_count = stage.stage - high;
            next_stage_text = __s("Next bonuses: %s (%s/%s)", concatstr(number_format(remaining_save_count), " ", __("km")), concatstr(number_format(high), " ", __("km")), concatstr(number_format(stage.stage), " ", __("km")));
        }
        arg1 += draw_description(arg0, arg1, next_stage_text, gui_col_x(8));
        arg1 += draw_description(arg0, arg1, get_default_struct_value(global.cache, "boostergame_upgrades_text", "-"), gui_col_x(9.5));
        var row_x2 = arg0 + gui_col_x(12);
        var row_y2 = y_start;
        row_y2 += draw_heading(row_x2, row_y2, __("Stats"));
        row_y2 += draw_description(row_x2, row_y2, concatstr_nl(__s("Current: %s km", number_format(o_game.data.booster_game.distance)), __s("Farthest: %s km", number_format(o_game.data.booster_game.distance_high)), __s("Last: %s km", number_format(o_game.data.booster_game.distance_last)), __s("Total: %s km", number_format(o_game.data.booster_game.distance_total)), __s("Rounds played: %s", number_format(o_game.data.booster_game.plays))));
    }
    return arg1 - y_start;
}

function gui_item_booster_game_add_draw()
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
    draw_option(global.options.auto_play_boostergame, add_button_base_x_tl, add_button_base_y, undefined, undefined, undefined, global.booster_game_upgrades.get_upgrade_value("boostergame_auto_play") > 0);
    if (global.debug)
    {
        if (gui_button_tl(add_button_base_x + gui_col_x(6), add_button_base_y, "+1 metal"))
        {
            o_game.data.booster_game.metal += get_key_modifier();
        }
        if (gui_button_tl(add_button_base_x + gui_col_x(8), add_button_base_y, "+1 fuel"))
        {
            o_game.data.booster_game.fuel += get_key_modifier();
        }
        if (gui_button_tl(add_button_base_x + gui_col_x(10), add_button_base_y, "+1 milk"))
        {
            global.materials.milk.data.count += get_key_modifier();
        }
        if (gui_button_tl(add_button_base_x + gui_col_x(12), add_button_base_y, "+1 hp"))
        {
            o_game.data.booster_game.hp += get_key_modifier();
        }
        if (gui_button_tl(add_button_base_x + gui_col_x(13.5), add_button_base_y, "+1 km"))
        {
            o_game.data.booster_game.distance += get_key_modifier();
            o_game.data.booster_game.distance_total += get_key_modifier();
        }
        if (gui_button_tl(add_button_base_x + gui_col_x(15), add_button_base_y, "-1 metal"))
        {
            o_game.data.booster_game.metal--;
        }
        if (gui_button_tl(add_button_base_x + gui_col_x(17), add_button_base_y, "-1 fuel"))
        {
            o_game.data.booster_game.fuel--;
        }
        if (gui_button_tl(add_button_base_x + gui_col_x(19), add_button_base_y, "-1 milk"))
        {
            global.materials.milk.data.count--;
        }
        if (gui_button_tl(add_button_base_x + gui_col_x(21), add_button_base_y, "-1 hp"))
        {
            o_game.data.booster_game.hp--;
        }
        if (gui_button_tl(add_button_base_x + gui_col_x(22.5), add_button_base_y, "-1 km"))
        {
            o_game.data.booster_game.distance -= get_key_modifier();
            o_game.data.booster_game.distance_total -= get_key_modifier();
        }
    }
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2
}
