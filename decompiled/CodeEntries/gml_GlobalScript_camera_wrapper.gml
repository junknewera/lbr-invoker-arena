function camera_init(arg0 = true)
{
    with (o_camera)
    {
        view_enabled = true;
        view_visible[0] = true;
        if (variable_instance_exists(id, "camera") && !is_undefined(camera))
        {
            camera_destroy(camera);
        }
        camera = camera_create_view(0, 0, room_width, room_height);
        view_set_camera(0, camera);
        display_width = display_get_width();
        display_height = display_get_height();
        window_width = clamp(1920, 540, display_width);
        window_height = clamp(1080, 540, display_height);
        global.window_width = window_width;
        global.window_height = window_height;
        window_width_raw = window_get_width();
        window_height_raw = window_get_height();
        var fullscreen = get_option(global.options.fullscreen);
        if (arg0 && !fullscreen && get_option(global.options.save_window_settings))
        {
            var window_data = get_option(global.options.window_data);
            var ww = get_default_struct_value(window_data, "width", -1);
            var wh = get_default_struct_value(window_data, "height", -1);
            var wx = get_default_struct_value(window_data, "x", -1);
            var wy = get_default_struct_value(window_data, "y", -1);
            if (get_option(global.options.restrain_window_settings))
            {
                wx = max(0, wx);
                wy = max(0, wy);
            }
            global.window_set_pos_tmp_x = wx;
            global.window_set_pos_tmp_y = wy;
            global.window_set_size_tmp_width = ww;
            global.window_set_size_tmp_height = wh;
            if (!global.is_opera && !global.is_mobile)
            {
                delay("window_set_size_tmp", 20, function()
                {
                    window_set_size(global.window_set_size_tmp_width, global.window_set_size_tmp_height);
                });
                delay("window_set_position_tmp", 30, function()
                {
                    window_set_position(global.window_set_pos_tmp_x, global.window_set_pos_tmp_y);
                });
            }
        }
        delay("resize_application_surface", 35, function()
        {
            surface_resize(application_surface, global.window_width, global.window_height);
        });
        var app_surf_enable = true;
        if (variable_global_exists("options"))
        {
            app_surf_enable = !get_option(global.options.disable_app_surface);
        }
        application_surface_enable(app_surf_enable);
        mouse_x_previous = device_mouse_x_to_gui(0);
        mouse_y_previous = device_mouse_y_to_gui(0);
        gui_mouse_x = mouse_x_previous;
        gui_mouse_y = mouse_y_previous;
        cam_x = camera_get_view_x(camera);
        cam_y = camera_get_view_y(camera);
        cam_width = camera_get_view_width(camera);
        cam_height = camera_get_view_height(camera);
        cam_x_start = cam_x;
        cam_y_start = cam_y;
        cam_width_start = cam_width;
        cam_height_start = cam_height;
    }
}

function get_cam_height()
{
    if (!instance_exists(o_camera))
    {
        return 0;
    }
    var cam = o_camera.camera;
    return camera_get_view_height(cam);
}

function get_cam_width()
{
    if (!instance_exists(o_camera))
    {
        return 0;
    }
    var cam = o_camera.camera;
    return camera_get_view_width(cam);
}

function update_window_settings()
{
    if (!variable_global_exists("options"))
    {
        exit;
    }
    global.options.window_data.data.value.width = window_get_width();
    global.options.window_data.data.value.height = window_get_height();
    global.options.window_data.data.value.x = window_get_x();
    global.options.window_data.data.value.y = window_get_y();
}
