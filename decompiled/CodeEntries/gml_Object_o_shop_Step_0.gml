if (mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_right) || mouse_check_button_released(mb_left) || mouse_check_button_released(mb_right))
{
    refresh_surface = true;
}
refresh_surface_counter++;
if (refresh_surface_counter >= refresh_surface_delay)
{
    refresh_surface_counter = 0;
    refresh_surface = true;
}
if (!global.is_awaiting_input)
{
    if (!global.is_mobile && keyboard_check_pressed(vk_escape))
    {
        handle_keyboard_key(27);
    }
    if (keyboard_check_pressed(vk_tab))
    {
        if (global.dialog_instance != -1 && o_game.state != UnknownEnum.Value_1)
        {
            if (keyboard_check(vk_control))
            {
                var dir = keyboard_check(vk_shift) ? -1 : 1;
                set_next_dialog_section(dir);
            }
            else
            {
                gui_dialog_toggle(global.dialog_instance);
            }
        }
    }
    if (get_mouse_wheel_down())
    {
        scroll(1);
    }
    else if (get_mouse_wheel_up())
    {
        scroll(-1);
    }
    if (!dialog_visible)
    {
        exit;
    }
    shop_index_max = array_length(actions) - shop_items_display;
}

enum UnknownEnum
{
    Value_1 = 1
}
