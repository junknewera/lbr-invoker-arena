function gui_item_button(arg0, arg1, arg2, arg3 = gui_button)
{
    var can_do_action = get_value_ext(arg2.instance, arg2._check, arg2.check_args);
    var button_x = get_default_struct_value(arg2, "button_x", arg0);
    var button_y = get_default_struct_value(arg2, "button_y", arg1);
    var button_width = get_default_struct_value(arg2, "button_width", (gui_width / 4) - 20);
    var button_center = get_default_struct_value(arg2, "button_center", true);
    if (button_center)
    {
        button_x = gui_x + (gui_width / 2);
        button_y = gui_y + 16;
    }
    var y_height = 0;
    if (global.is_mobile)
    {
        arg1 += 16;
    }
    var btn_pressed;
    if (arg3 == gui_button_sprite)
    {
        var sprite = get_default_struct_value(arg2, "sprite", spr_solid);
        sprite = get_value_ext(arg2, arg2.sprite);
        btn_pressed = gui_button_sprite(button_x, button_y, sprite, can_do_action, false, arg2.button_options);
    }
    else
    {
        btn_pressed = gui_button(button_x, button_y, arg2._button_text, can_do_action, button_width, false, arg2.button_options);
    }
    var hotkey_pressed = false;
    if (arg2.hotkey && keyboard_check_pressed(arg2.hotkey))
    {
        hotkey_pressed = true;
    }
    var text_below = get_default_struct_value(arg2, "text_below", undefined);
    if (!is_undefined(text_below))
    {
        var text_below_final = get_value_ext(arg2, arg2.text_below);
        set_default_font(f_gui_small, 1);
        draw_text(arg0, arg1 + global.gui_button_height + 5, string(text_below_final));
        y_height = max(y_height, string_height(text_below_final) + 20);
    }
    var text_right = get_default_struct_value(arg2, "text_right", undefined);
    if (!is_undefined(text_right))
    {
        var text_right_final = get_value_ext(arg2, arg2.text_right);
        set_default_font(f_gui_small, 0);
        draw_text(arg0 + button_width + 20, arg1 + global.gui_button_height + 5, string(text_right_final));
        y_height = max(y_height, string_height(text_right_final) + 20);
    }
    if (visible && (btn_pressed || hotkey_pressed))
    {
        call_method(arg2, arg2._func_before, arg2.args);
        call_method(arg2, arg2._func, arg2.args);
        call_method(arg2, arg2._func_after, arg2.args);
    }
    return y_height;
}
