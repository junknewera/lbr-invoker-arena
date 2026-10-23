refresh_surface = true;
scroll_y = clamp(scroll_y, 0, scroll_y_max);
scroll_y_fx = scroll_y;
var alarm_timer = sec(0.5);
if (scrollbar_handle_dragging)
{
    alarm_timer = sec(0.1);
}
alarm[0] = alarm_timer;
