if (!instance_exists(o_camera))
{
    exit;
}
drag_timeout = clamp(--drag_timeout, 0, drag_timeout_duration);
x = o_camera.gui_mouse_x;
y = o_camera.gui_mouse_y;
