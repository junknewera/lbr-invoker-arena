function screenshake_activate(arg0, arg1)
{
    if (!instance_exists(o_camera))
    {
        exit;
    }
    with (o_camera)
    {
        screenshake_counter = 0;
        screenshake_duration = arg1;
        screenshake_type = arg0;
        screenshake_x_origin = cam_x;
        screenshake_y_origin = cam_y;
    }
}
