if (!global.draw_hud || skip_frame)
{
    exit;
}
if (!surface_exists(surface))
{
    surface = surface_create(global.gui_width, global.gui_height);
    refresh_surface = true;
}
try
{
    var _ycol_start = 30.5;
    var _ycol_loop_item = 0;
    var btn_margin = gui_col_x(0.9);
    if (refresh_surface)
    {
        items_bl_visible = [];
        var hide_maxed_shops = get_option(global.options.hide_maxed_shops);
        var __array = nav_items_bl;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (hide_maxed_shops)
            {
                var shop = get_default_struct_value(mitem, "shop", undefined);
                if (mitem.is_shop && mitem.shop_can_hide && is_struct(shop))
                {
                    var __struct2 = shop;
                    var __prop_names2 = struct_get_names(__struct2);
                    var __prop_len2 = array_length(__prop_names2);
                    for (var __i2 = 0; __i2 < __prop_len2; __i2++)
                    {
                        var mkey2 = __prop_names2[__i2];
                        var mitem2 = variable_struct_get(__struct2, mkey2);
                        if (!mitem2.maxed)
                        {
                            array_push(items_bl_visible, mitem);
                            break;
                        }
                    }
                }
                else
                {
                    array_push(items_bl_visible, mitem);
                }
            }
            else
            {
                array_push(items_bl_visible, mitem);
            }
        }
        items_length_bl = array_length(items_bl_visible);
    }
    if (gui_button_sprite(gui_col_x(1), gui_col_y(1.75), iif(nav_tl_visible, spr_gui_arrow_left, spr_gui_arrow_right), true, false))
    {
        nav_tl_visible = !nav_tl_visible;
        refresh_surface = true;
    }
    if (items_length_bl > 0 && gui_button_sprite(gui_col_x(1), gui_col_y(30.5), iif(nav_bl_visible, spr_gui_arrow_left, spr_gui_arrow_right), true, false))
    {
        nav_bl_visible = !nav_bl_visible;
        refresh_surface = true;
    }
    if (o_game.data.stats.notifications > 0)
    {
        var notify_button_y = gui_col_y(global.is_mobile ? 28 : 28.5);
        global.options.enable_notifications.draw(gui_col_x(1), notify_button_y, undefined, undefined, 4);
    }
    surface_set_target(surface);
    if (refresh_surface)
    {
        draw_clear_alpha(c_black, 0);
        if (nav_tl_visible)
        {
            var nav_tl_y = global.is_mobile ? gui_col_y(2) : gui_col_y(1.75);
            var click_action_tmp = draw_nav_items(nav_items_tl, gui_col_x(2.5), nav_tl_y, UnknownEnum.Value_3, gui_col_x(11));
            if (is_struct(click_action_tmp))
            {
                click_action = click_action_tmp;
            }
            click_action_tmp = undefined;
        }
        if (nav_bl_visible)
        {
            var click_action_tmp = draw_nav_items(items_bl_visible, gui_col_x(2.5), gui_col_y(30.5), UnknownEnum.Value_1, gui_col_x(26));
            if (is_struct(click_action_tmp))
            {
                click_action = click_action_tmp;
            }
            click_action_tmp = undefined;
        }
        if (is_struct(global.current_challenge))
        {
            if (global.current_challenge.is_custom_challenge)
            {
                if (gui_button_sprite(gui_col_x(27), gui_col_y(1.75), spr_icon_list, undefined, undefined, 
                {
                    tooltip: __("Challenge progress")
                }))
                {
                    open_dialog(gui_item_challenge_requirements, __("Challenge progress"));
                }
            }
            else if (!is_empty(global.current_challenge._get_progress_text()))
            {
                if (gui_button_sprite(gui_col_x(27), gui_col_y(1.75), spr_icon_list, undefined, undefined, 
                {
                    tooltip: __("Challenge progress")
                }))
                {
                    open_dialog(gui_item_challenge_progress, __("Challenge progress"));
                }
            }
        }
    }
    surface_reset_target();
    draw_surface_ext(surface, 0, 0, 1, 1, 0, c_white, 1);
    refresh_surface = false;
    if (nav_bl_page > 0)
    {
        var btn_x = (nav_items_show_count + 1) * btn_margin;
        var btn_y = gui_col_y(_ycol_loop_item);
        if (gui_button_sprite(btn_x, btn_y, spr_gui_arrow_left, true))
        {
            scroll(-1);
        }
    }
    if (items_length_bl > (nav_bl_page + nav_items_show_count))
    {
        var btn_x = (nav_items_show_count + 2) * btn_margin;
        var btn_y = gui_col_y(_ycol_loop_item);
        if (gui_button_sprite(btn_x, btn_y, spr_gui_arrow_right, true))
        {
            scroll(1);
        }
    }
    if (get_option(global.options.single_click_nav))
    {
        if (is_struct(click_action))
        {
            if (!click_action_alarm_set)
            {
                click_action_alarm_set = true;
                alarm[2] = 1;
            }
        }
        else
        {
            if (mouse_check_button_pressed(mb_left) && !mouse_in_gui_dialog_range() && global.dialog_instance != -1 && instance_exists(global.dialog_instance) && global.dialog_instance.visible && !global.disable_gui_close_tmp)
            {
                click_delay_flag = true;
                if (global.dialog_instance.can_toggle)
                {
                    gui_dialog_toggle(global.dialog_instance);
                }
                else
                {
                    gui_dialog_close(global.dialog_instance);
                }
            }
            global.disable_gui_close_tmp = false;
        }
    }
    else if (mouse_check_button_pressed(mb_left) && !mouse_in_gui_dialog_range() && is_dialog_visible())
    {
        if (global.dialog_instance.can_toggle)
        {
            gui_dialog_toggle(global.dialog_instance);
        }
        else
        {
            gui_dialog_close(global.dialog_instance);
        }
        click_action = undefined;
        click_action_alarm_set = true;
        alarm[2] = global.is_mobile ? sec(0.2) : sec(0.1);
    }
    else if (is_struct(click_action) && !click_action_alarm_set)
    {
        open_nav(click_action.key);
        click_action = undefined;
        click_action_alarm_set = true;
        alarm[2] = global.is_mobile ? sec(0.2) : sec(0.1);
    }
}
catch (err)
{
    log("shop draw err", err);
}

enum UnknownEnum
{
    Value_1 = 1,
    Value_3 = 3
}
