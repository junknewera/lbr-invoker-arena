if (!mouse_in_gui_range(orig_x1, orig_y1, orig_x2, orig_y2) || get_mouse_wheel_down() || get_mouse_wheel_up() || keyboard_check_pressed(vk_shift) || keyboard_check_pressed(vk_alt) || keyboard_check_pressed(vk_control) || keyboard_check_released(vk_shift) || keyboard_check_released(vk_alt) || keyboard_check_released(vk_control))
{
    instance_destroy();
}
if (mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_right) || mouse_check_button_released(mb_left) || mouse_check_button_released(mb_right))
{
    if (get_default_struct_value(options, "tooltip_refresh", false))
    {
        instance_destroy();
    }
}
