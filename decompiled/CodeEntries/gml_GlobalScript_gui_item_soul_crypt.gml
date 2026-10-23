function gui_item_soul_crypt(arg0, arg1)
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
    var area = global.areas.soul_crypt;
    var max_floor = global.areas.soul_crypt.get_max_floor();
    var upgrade_cost = global.areas.soul_crypt.get_upgrade_cost();
    arg1 += draw_description(arg0, arg1, __s("The %s is now available! Clear a level to get %s and %s.", global.areas.soul_crypt.name, global.resources.soul_keys.name_plural, global.resources.soul_particles.name_plural));
    arg1 += gui_col_y(1);
    var row_y1 = arg1;
    if (global.areas.soul_crypt.data.highest_floor < max_floor)
    {
        row_y1 += (draw_heading(arg0, row_y1, __("Unlock cost")) - gui_col_y(1));
        row_y1 += draw_result(arg0, row_y1 + gui_col_y(1), upgrade_cost);
        row_y1 += gui_col_y(1.5);
        button_text = __s("Unlock level %s", sprintf("%s/%s", global.areas.soul_crypt.data.highest_floor + 1, max_floor));
        var can_unlock = has_enough(upgrade_cost) && global.areas.soul_crypt.data.highest_floor < max_floor;
        if (gui_button_tl(arg0, row_y1, button_text, can_unlock, gui_col_x(5)))
        {
            dec_result(upgrade_cost);
            global.areas.soul_crypt.data.highest_floor++;
            notify(__s("Level %s unlocked.", global.areas.soul_crypt.data.highest_floor));
        }
        row_y1 += gui_col_y(2);
        if (gui_button_tl(arg0, row_y1, __("Unlock max"), undefined, gui_col_x(3)))
        {
            var unlocked_levels;
            for (unlocked_levels = 0; can_unlock; unlocked_levels++)
            {
                dec_result(upgrade_cost);
                global.areas.soul_crypt.data.highest_floor++;
                upgrade_cost = global.areas.soul_crypt.get_upgrade_cost();
                can_unlock = has_enough(upgrade_cost) && global.areas.soul_crypt.data.highest_floor < max_floor;
            }
            notify(__s("%s Levels unlocked.", unlocked_levels));
        }
        row_y1 += gui_col_y(1);
    }
    else
    {
        row_y1 += draw_description(arg0, row_y1, __("Max floor reached"));
    }
    var row_y2 = arg1;
    row_y2 += draw_heading(global.gui_width / 2, row_y2, __s("%s %s %s", global.areas.soul_crypt.name, __("level"), number_format(global.areas.soul_crypt.data.selected_floor)), undefined, undefined, 1);
    row_y2 += gui_col_y(0.5);
    var button_text = __s("Enter", global.areas.soul_crypt.name, global.areas.soul_crypt.data.selected_floor);
    if (gui_button(global.gui_width / 2, row_y2, button_text, undefined, gui_col_x(5)))
    {
        change_area(global.areas.soul_crypt);
        gui_dialog_close();
    }
    if (gui_button_sprite((global.gui_width / 2) - gui_col_x(3.5), row_y2, spr_gui_arrow_left, global.areas.soul_crypt.data.selected_floor > 1))
    {
        global.areas.soul_crypt.data.selected_floor -= get_key_modifier();
    }
    if (gui_button_sprite((global.gui_width / 2) + gui_col_x(3.5), row_y2, spr_gui_arrow_right, global.areas.soul_crypt.data.selected_floor < global.areas.soul_crypt.data.highest_floor))
    {
        global.areas.soul_crypt.data.selected_floor += get_key_modifier();
    }
    var row_x3 = arg0 + gui_col_x(18);
    var row_y3 = arg1;
    var reward = dungeon_get_reward(global.areas.soul_crypt, global.areas.soul_crypt.data.selected_floor, false);
    var bonus_reward = global.areas.soul_crypt.get_bonus_reward(global.areas.soul_crypt.data.selected_floor);
    var bonus_reward_chance = global.areas.soul_crypt.get_bonus_reward_chance(global.areas.soul_crypt.data.selected_floor);
    set_default_font(f_gui_small);
    row_y3 += draw_description(row_x3, row_y3, __s("Reward for level %s", global.areas.soul_crypt.data.selected_floor));
    row_y3 += draw_resources(row_x3, row_y3, struct_get_from_hash(reward, variable_get_hash("resources")));
    row_y3 += gui_col_y(1.5);
    row_y3 += draw_description(row_x3, row_y3, __s("Bonus reward chance for level %s: %s", global.areas.soul_crypt.data.selected_floor, number_format_percent(bonus_reward_chance / 100)), gui_col_x(5));
    if (bonus_reward_chance > 0)
    {
        draw_result(row_x3, row_y3, bonus_reward);
    }
    global.areas.soul_crypt.data.selected_floor = clamp(global.areas.soul_crypt.data.selected_floor, 1, min(global.areas.soul_crypt.data.highest_floor, global.areas.soul_crypt.get_max_floor()));
    arg1 = max(row_y1, row_y2, row_y3);
    return arg1 - y_start;
}

function gui_item_soul_crypt_add_draw()
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
}
