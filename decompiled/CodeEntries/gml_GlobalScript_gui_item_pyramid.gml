function gui_item_pyramid(arg0, arg1)
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
    if (get_upgrade_count(global.shops.weapons.holy_grail) == 0 || (get_upgrade_count(global.areas.inner_pyramid) == 0 && o_blower.blower.key != global.shops.weapons.holy_grail.key))
    {
        arg1 += draw_description(arg0, arg1, __("There is a small hole inside the statue. Seems like it misses an item..."));
    }
    else if (get_upgrade_count(global.areas.inner_pyramid) == 0)
    {
        arg1 += draw_description(arg0, arg1, __("AHHH - YOU - FOUND - THE - HOLY - GRAIL\n\nMAKE - A - SACRIFICE - TO - ENTER - THE - CURSED - PYRAMID"));
        var unlock_cost = get_pyramid_unlock_cost();
        arg1 += draw_resources(arg0, arg1, unlock_cost);
        arg1 += gui_col_y(1.5);
        if (gui_button_tl(arg0, arg1, __("Sacrifice"), has_enough_resources(unlock_cost), gui_col_x(3)))
        {
            dec_resources(get_pyramid_unlock_cost());
            global.areas.inner_pyramid.data.count = 1;
            text_dialog("MMMM - MULCH - AND - CHEESE\n\nYOUR - SACRIFICE - WAS - SUCCESSFUL\n\nYOU - MAY - NOW - ENTER");
        }
    }
    else if (get_upgrade_count(global.areas.inner_pyramid) > 0)
    {
        var area = global.areas.inner_pyramid;
        var max_floor = area.get_max_floor();
        var upgrade_cost = get_pyramid_upgrade_cost();
        var can_upgrade = has_enough_resources(upgrade_cost);
        arg1 += draw_description(arg0, arg1, __("MAKE - A - SACRIFICE - TO - UNLOCK - THE - NEXT - FLOOR"));
        arg1 += gui_col_y(1);
        var row_y2 = arg1;
        if (global.areas.inner_pyramid.data.highest_floor >= max_floor)
        {
            arg1 += draw_description(arg0, arg1, __("Max floor reached"));
        }
        else
        {
            arg1 += (draw_heading(arg0, arg1, __("Unlock cost")) - gui_col_y(0.4));
            arg1 += draw_resources(arg0, arg1, upgrade_cost);
            arg1 += gui_col_y(1.5);
            if (gui_button_tl(arg0, arg1, __s("UNLOCK FLOOR %s", global.areas.inner_pyramid.data.highest_floor + 1), can_upgrade, gui_col_x(5)))
            {
                dec_resources(upgrade_cost);
                global.areas.inner_pyramid.data.highest_floor++;
                notify(__s("Floor %s unlocked.", global.areas.inner_pyramid.data.highest_floor));
            }
            if (gui_button_tl(arg0, arg1 + gui_col_y(2), __("Unlock max"), undefined, gui_col_x(3)))
            {
                var unlocked_levels;
                for (unlocked_levels = 0; can_upgrade; unlocked_levels++)
                {
                    dec_resources(upgrade_cost);
                    global.areas.inner_pyramid.data.highest_floor++;
                    upgrade_cost = get_pyramid_upgrade_cost();
                    can_upgrade = has_enough_resources(upgrade_cost) && global.areas.inner_pyramid.data.highest_floor < max_floor;
                }
                notify(__s("%s Levels unlocked.", unlocked_levels));
            }
        }
        row_y2 += draw_heading(global.gui_width / 2, row_y2, __s("%s %s %s", global.areas.inner_pyramid.name, __("level"), number_format(area.data.selected_floor)), undefined, undefined, 1);
        row_y2 += gui_col_y(0.5);
        if (gui_button(global.gui_width / 2, row_y2, string_upper(__("Enter the Pyramid")), true, gui_col_x(5)))
        {
            change_area(global.areas.inner_pyramid);
            gui_dialog_close();
        }
        if (gui_button_sprite((global.gui_width / 2) - gui_col_x(3.5), row_y2, spr_gui_arrow_left, area.data.selected_floor > 1))
        {
            var dir = -get_key_modifier();
            var highest_floor = min(max_floor, area.data.highest_floor);
            var highest_floor_max_select = highest_floor;
            area.data.selected_floor += dir;
            area.data.selected_floor = clamp(area.data.selected_floor, 1, highest_floor_max_select);
        }
        if (gui_button_sprite((global.gui_width / 2) + gui_col_x(3.5), row_y2, spr_gui_arrow_right, area.data.selected_floor < area.data.highest_floor && area.data.selected_floor < max_floor))
        {
            var dir = get_key_modifier();
            var highest_floor = min(max_floor, area.data.highest_floor);
            var highest_floor_max_select = highest_floor;
            area.data.selected_floor += dir;
            area.data.selected_floor = clamp(area.data.selected_floor, 1, highest_floor_max_select);
        }
    }
    return arg1 - y_start;
}

function gui_item_pyramid_add_draw()
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
