if (instance_exists(o_dialog) && o_dialog.scrollbar_handle_dragging)
{
    exit;
}
var drag_y = ds_map_find_value(event_data, "rawdiffY");
if (is_numeric(drag_y))
{
    drag_diff_total += drag_y;
}
if (abs(drag_diff_total) < 15)
{
    global.mouse_drag = 0;
    exit;
}
dragging = true;
drag_diff_total = 0;
var diff_y = drag_y > 0;
global.mouse_drag = (diff_y == 1) ? -1 : 1;
alarm[1] = 1;
