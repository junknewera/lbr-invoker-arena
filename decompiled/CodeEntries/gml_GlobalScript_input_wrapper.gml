function any_user_input(arg0 = false)
{
    if (mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_right) || mouse_check_button_released(mb_left) || mouse_check_button_released(mb_right) || mouse_wheel_up() || mouse_wheel_down())
    {
        return true;
    }
    if (arg0)
    {
        return false;
    }
    if (keyboard_check(vk_anykey))
    {
        return true;
    }
}

function get_click_dir(arg0 = false)
{
    var click_dir = (mouse_lastbutton == 1) ? 1 : -1;
    if (!arg0 && global.is_mobile)
    {
        return get_option(global.options.selection_quantity_sign);
    }
    return click_dir;
}

function get_key_modifier(arg0 = "quantity", arg1 = 1)
{
    if (global.is_mobile)
    {
        return get_option(global.options.selection_quantity) * arg1;
    }
    var ret_val = 1;
    var alt_pressed = keyboard_check(vk_alt);
    var ctrl_pressed = keyboard_check(vk_control);
    var shift_pressed = keyboard_check(vk_shift);
    if (alt_pressed)
    {
        ret_val *= 100;
    }
    if (ctrl_pressed)
    {
        ret_val *= 25;
    }
    if (shift_pressed)
    {
        ret_val *= 10;
    }
    if (arg0 == "prio")
    {
        if (alt_pressed)
        {
            ret_val = 10;
        }
        else if (ctrl_pressed)
        {
            ret_val = 2;
        }
    }
    else if (arg0 == "tower_floor")
    {
        if (ctrl_pressed && shift_pressed && alt_pressed)
        {
            ret_val = 500;
        }
        else if (ctrl_pressed && shift_pressed)
        {
            ret_val = 50;
        }
        else if (alt_pressed)
        {
            ret_val = 10;
        }
        else if (ctrl_pressed)
        {
            ret_val = 5;
        }
        else if (shift_pressed)
        {
            ret_val = 2;
        }
    }
    ret_val *= arg1;
    return ret_val;
}

function get_key_modifier_abs(arg0 = "quantity", arg1 = 1)
{
    return abs(get_key_modifier(arg0, arg1));
}

function get_key_modifier_item_count(arg0)
{
    if (!is_struct(arg0) || !is_struct(struct_get_from_hash(arg0, variable_get_hash("data"))) || !is_numeric(struct_get_from_hash(arg0.data, variable_get_hash("count"))))
    {
        return 1;
    }
    return _clamp(get_key_modifier_abs(), 1, arg0.data.count);
}

function get_key_modifier_resource(arg0)
{
    if (!is_struct(arg0))
    {
        return 1;
    }
    var ret_val = get_key_modifier();
    ret_val = abs(ret_val);
    ret_val = _clamp(ret_val, 1, min(ret_val, arg0.data.count));
    return ret_val;
}

function get_mouse_wheel_dir()
{
    if (mouse_wheel_down() || global.mouse_drag == 1)
    {
        return 1;
    }
    else if (mouse_wheel_up() || global.mouse_drag == -1)
    {
        return -1;
    }
    return 0;
}

function get_mouse_wheel_down()
{
    return get_mouse_wheel_dir() == 1;
}

function get_mouse_wheel_up()
{
    return get_mouse_wheel_dir() == -1;
}

function handle_keyboard_key(arg0)
{
    if (arg0 == 27)
    {
        if (global.is_mobile && keyboard_virtual_status())
        {
            exit;
        }
        if (!is_ingame())
        {
            if (is_dialog_visible())
            {
                gui_dialog_close();
            }
            else
            {
                game_end();
            }
            exit;
        }
        if (!global.draw_hud && !global.is_prestiging)
        {
            global.draw_hud = true;
            o_mouse.visible = true;
            exit;
        }
        var open_options = false;
        if (instance_exists(o_dialog))
        {
            if (!o_dialog.visible)
            {
                open_options = true;
                gui_dialog_close();
            }
            else if (global.is_mobile && o_shop.current_nav_key == "options" && !instance_exists(o_dialog_confirm))
            {
                confirm_dialog(__("Do you want to save and quit the game?"), function()
                {
                    global.func_after_cloud_save = game_end;
                    save_game();
                    notify(__("The game will close automatically when the save file was uploaded, please wait..."));
                });
            }
            else
            {
                gui_dialog_toggle();
            }
        }
        else
        {
            open_options = true;
        }
        if (open_options)
        {
            delay("open_options", 3, function()
            {
                open_nav("options");
            });
        }
    }
}

function mouse_click_in_gui_range(arg0, arg1, arg2, arg3, arg4 = 1, arg5 = false)
{
    var mouse_click_check_func = global.is_mobile ? mouse_check_button_released : mouse_check_button_pressed;
    var mouse_check_func = iif(arg5, mouse_check_button, mouse_click_check_func);
    var mouse_check = false;
    if (is_array(arg4))
    {
        var __array = arg4;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (mouse_check_func(mitem))
            {
                mouse_check = true;
            }
        }
    }
    else
    {
        mouse_check = mouse_check_func(arg4);
    }
    return mouse_check && mouse_in_gui_range(arg0, arg1, arg2, arg3);
}

function mouse_in_gui_range(arg0, arg1, arg2, arg3, arg4 = false)
{
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
    if (arg4 && variable_global_exists("last_click"))
    {
        mx = global.last_click.x;
        my = global.last_click.y;
    }
    return mx >= arg0 && mx <= arg2 && my >= arg1 && my <= arg3;
}

function mouse_in_range(arg0, arg1, arg2, arg3)
{
    return mouse_x >= arg0 && mouse_x <= arg2 && mouse_y >= arg1 && mouse_y <= arg3;
}
