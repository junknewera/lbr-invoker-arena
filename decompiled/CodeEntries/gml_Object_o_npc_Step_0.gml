t++;
if (rotating)
{
    image_angle++;
}
show_tooltip = distance_to_point(mouse_x, mouse_y) <= talk_range && (!instance_exists(o_dialog) || !o_dialog.visible);
step_check_counter++;
if (step_check_counter < step_check)
{
    exit;
}
step_check_counter = 0;
