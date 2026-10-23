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
if (mouse_check_button_released(mb_left) || mouse_check_button_released(mb_right))
{
    end_drag();
}
if (dragging)
{
    x = (o_mouse.x + drag_offset_x) - drag_diff_x;
    y = (o_mouse.y + drag_offset_y) - drag_diff_y;
    snap();
}
if (is_selected())
{
    if (keyboard_check_pressed(vk_enter))
    {
        if (keyboard_check(vk_control))
        {
            global.gui_editor_vars.selected_instance = -1;
        }
        if (keyboard_check(vk_shift))
        {
            text += "\n";
            keyboard_string += "\n";
        }
        update_editor_data();
    }
    else if (keyboard_check(vk_shift) && keyboard_check_pressed(ord("D")) && is_array(struct_get_from_hash(global.gui_editor_vars, variable_get_hash("instances"))))
    {
        remove_from_array_by_string(global.gui_editor_vars.instances, id);
        variable_struct_set(global.gui_editor_vars.data, id, undefined);
        global.gui_editor_vars.selected_instance = -1;
        instance_destroy();
    }
    else if (keyboard_check_pressed(vk_add))
    {
        width += gui_col_x(0.5);
    }
    else if (keyboard_check_pressed(vk_subtract))
    {
        width -= gui_col_x(0.5);
        width = max(gui_col_x(1), width);
    }
    else if (keyboard_check_pressed(vk_anykey))
    {
        text = keyboard_string;
    }
    if (keyboard_check(vk_up))
    {
        y -= 10;
    }
    if (keyboard_check(vk_down))
    {
        y += 10;
    }
    if (keyboard_check(vk_left))
    {
        x -= 10;
    }
    if (keyboard_check(vk_right))
    {
        x += 10;
    }
    if (keyboard_check_released(vk_up) || keyboard_check_released(vk_down) || keyboard_check_released(vk_left) || keyboard_check_released(vk_right))
    {
        snap();
    }
}
