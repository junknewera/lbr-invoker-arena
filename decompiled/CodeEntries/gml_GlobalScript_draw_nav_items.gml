function draw_nav_items(arg0, arg1, arg2, arg3 = UnknownEnum.Value_3, arg4 = gui_col_x(10))
{
    var fixed_nav = get_option(global.options.fixed_nav);
    var click_action = false;
    var btn_margin = global.is_mobile ? gui_col_x(1.5) : gui_col_x(0.9);
    var btn_margin_y = global.is_mobile ? 3 : 2;
    var nav_items_length = array_length(arg0);
    var _xcol = 0;
    var _ycol = 0;
    var current_width = 0;
    var direction_sign = (arg3 == UnknownEnum.Value_3) ? 1 : -1;
    var dialog_visible = is_dialog_visible();
    var draw_shop_notification_enabled = get_option(global.options.draw_shop_notification);
    var single_click_nav = get_option(global.options.single_click_nav);
    for (var i = 0; i < nav_items_length; i++)
    {
        var action = arg0[i];
        if (!action.check_flag && !fixed_nav)
        {
            continue;
        }
        if (!get_default_struct_value(o_game.data.nav_items, action.key, true))
        {
            continue;
        }
        if (current_width >= arg4)
        {
            _xcol = 0;
            _ycol++;
            current_width = 0;
        }
        var btn_x = round(arg1 + (_xcol * btn_margin));
        var btn_y = round(arg2 + gui_col_y(_ycol * btn_margin_y * direction_sign));
        current_width = _xcol * btn_margin;
        if (!action.check_flag)
        {
            if (!action.fixed_nav)
            {
                continue;
            }
            gui_button_sprite(btn_x, btn_y, spr_icon_question, false);
        }
        else
        {
            var btn_bg_sprite = iif(is_dialog_visible() && o_shop.current_nav_key == action.key, spr_textbox_square_active, spr_textbox_9s);
            var opt = 
            {
                btn_bg_sprite: btn_bg_sprite,
                sprite_scale_size: global.is_mobile ? 4 : global.gui_sprite_scale
            };
            if (!dialog_visible)
            {
                opt.tooltip = action.name;
            }
            var can_click = is_unlocked_nav(action.key) || get_value_ext(action, action.check);
            if (gui_button_sprite(btn_x, btn_y, action.sprite, can_click, false, opt))
            {
                var click_over_dialog = mouse_in_gui_dialog_range();
                if (!click_over_dialog || (instance_exists(global.dialog_instance) && !global.dialog_instance.visible))
                {
                    if (single_click_nav)
                    {
                        click_action = action;
                    }
                    else if (!dialog_visible && !o_shop.click_action_alarm_set)
                    {
                        click_action = action;
                    }
                }
            }
            if (draw_shop_notification_enabled && action.has_badge)
            {
                var rx1 = btn_x + 12;
                var rx2 = btn_x + 24;
                var ry1 = btn_y - 28;
                var ry2 = btn_y - 10;
                if (global.is_mobile)
                {
                    rx1 += 13;
                    rx2 += 17;
                    ry1 -= 20;
                    ry2 -= 15;
                }
                gui_draw_sprite(rx1 + 7, ry1 + 7, spr_icon_exclamation_mark, undefined, global.is_mobile ? 2 : 1);
            }
            if (!global.is_mobile && action.hotkey != -1)
            {
                set_default_font(f_gui_small, 1);
                var hotkey_text = iif(!is_undefined(variable_struct_get(global.hotkey_map, action.hotkey)), variable_struct_get(global.hotkey_map, action.hotkey), chr(action.hotkey));
                draw_text(btn_x, btn_y + 22, hotkey_text);
            }
        }
        _xcol++;
        current_width = _xcol * btn_margin;
    }
    return click_action;
}

enum UnknownEnum
{
    Value_3 = 3
}
