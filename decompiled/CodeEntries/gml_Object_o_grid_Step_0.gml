if (mouse_check_button_pressed(mb_right))
{
    dragging = !dragging;
    drag_x_start = o_mouse.x;
    drag_y_start = o_mouse.y;
}
if (keyboard_check_pressed(vk_up))
{
    offset_y--;
}
if (keyboard_check_pressed(vk_down))
{
    offset_y++;
}
if (keyboard_check_pressed(vk_left))
{
    offset_x++;
}
if (keyboard_check_pressed(vk_right))
{
    offset_x--;
}
