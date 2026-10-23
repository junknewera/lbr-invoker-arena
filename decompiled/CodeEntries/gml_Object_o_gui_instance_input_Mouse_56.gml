if (disable_release_click)
{
    disable_release_click = false;
    exit;
}
var in_range = mouse_in_gui_range(box_x1, box_y1, box_x2, box_y2);
if (has_focus && !in_range)
{
    release();
}
