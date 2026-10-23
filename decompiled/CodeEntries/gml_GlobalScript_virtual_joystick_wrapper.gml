function vstick_check(arg0)
{
    return global.vstick[arg0][6];
}

function vstick_check_pressed(arg0)
{
    return global.vstick[arg0][15];
}

function vstick_check_released(arg0)
{
    return global.vstick[arg0][16];
}

function vstick_draw(arg0)
{
    var defalph = draw_get_alpha();
    if (global.vstick[arg0][13] == -4)
    {
        draw_set_alpha(defalph / 2);
        draw_circle(global.vstick[arg0][3], global.vstick[arg0][4], global.vstick[arg0][2], 0);
    }
    else
    {
        draw_sprite_ext(global.vstick[arg0][13], 0, global.vstick[arg0][3], global.vstick[arg0][4], 1, 1, 0, c_white, defalph);
    }
    if (global.vstick[arg0][14] == -4)
    {
        draw_set_alpha((defalph / 2) + (global.vstick[arg0][6] * (defalph / 2)));
        draw_circle(global.vstick[arg0][3] + (global.vstick[arg0][11] * global.vstick[arg0][2]), global.vstick[arg0][4] + (global.vstick[arg0][12] * global.vstick[arg0][2]), global.vstick[arg0][2] * 0.3333, 0);
    }
    else
    {
        draw_sprite_ext(global.vstick[arg0][14], 0, global.vstick[arg0][3] + (global.vstick[arg0][11] * global.vstick[arg0][2]), global.vstick[arg0][4] + (global.vstick[arg0][12] * global.vstick[arg0][2]), 1, 1, 0, c_white, defalph);
    }
    draw_set_alpha(defalph);
}

function vstick_get_active(arg0)
{
    return global.vstick[arg0][5];
}

function vstick_get_backsprite(arg0)
{
    return global.vstick[arg0][13];
}

function vstick_get_deviation(arg0)
{
    return sqrt(sqr(global.vstick[arg0][11]) + sqr(global.vstick[arg0][12]));
}

function vstick_get_direction(arg0)
{
    return radtodeg(global.vstick[arg0][8]);
}

function vstick_get_frontsprite(arg0)
{
    return global.vstick[arg0][14];
}

function vstick_get_radius(arg0)
{
    return global.vstick[arg0][2];
}

function vstick_get_x(arg0)
{
    return global.vstick[arg0][3];
}

function vstick_get_xaxis(arg0)
{
    return global.vstick[arg0][0];
}

function vstick_get_y(arg0)
{
    return global.vstick[arg0][4];
}

function vstick_get_yaxis(arg0)
{
    return global.vstick[arg0][1];
}

function vstick_init(arg0, arg1, arg2, arg3, arg4, arg5, arg6)
{
    global.vstick[arg0][0] = 0;
    global.vstick[arg0][1] = 0;
    global.vstick[arg0][2] = arg3;
    global.vstick[arg0][3] = arg1;
    global.vstick[arg0][4] = arg2;
    global.vstick[arg0][5] = 1;
    global.vstick[arg0][6] = 0;
    global.vstick[arg0][7] = -1;
    global.vstick[arg0][8] = 0;
    global.vstick[arg0][10] = arg4;
    global.vstick[arg0][11] = 0;
    global.vstick[arg0][12] = 0;
    global.vstick[arg0][13] = arg5;
    global.vstick[arg0][14] = arg6;
    global.vstick[arg0][15] = 0;
    global.vstick[arg0][16] = 0;
}

function vstick_set_active(arg0, arg1)
{
    global.vstick[arg0][5] = arg1;
}

function vstick_set_backsprite(arg0, arg1)
{
    global.vstick[arg0][13] = arg1;
}

function vstick_set_frontsprite(arg0, arg1)
{
    global.vstick[arg0][14] = arg1;
}

function vstick_set_radius(arg0, arg1)
{
    global.vstick[arg0][2] = arg1;
}

function vstick_set_x(arg0, arg1)
{
    global.vstick[arg0][3] = arg1;
}

function vstick_set_y(arg0, arg1)
{
    global.vstick[arg0][4] = arg1;
}

function vstick_step(arg0)
{
    global.vstick[arg0][15] = 0;
    global.vstick[arg0][16] = 0;
    if (global.vstick[arg0][5])
    {
        for (i = 0; i <= 4; i++)
        {
            if ((device_mouse_check_button_pressed(i, mb_left) || device_mouse_check_button_pressed(i, mb_right)) && point_distance(global.vstick[arg0][3], global.vstick[arg0][4], device_mouse_x_to_gui(i), device_mouse_y_to_gui(i)) < global.vstick[arg0][2])
            {
                global.vstick[arg0][6] = true;
                global.vstick[arg0][7] = i;
                global.vstick[arg0][15] = 1;
                break;
            }
        }
        if (global.vstick[arg0][6] == true)
        {
            global.vstick[arg0][8] = degtorad(point_direction(global.vstick[arg0][3], global.vstick[arg0][4], device_mouse_x_to_gui(global.vstick[arg0][7]), device_mouse_y_to_gui(global.vstick[arg0][7])));
            global.vstick[arg0][0] = (cos(global.vstick[arg0][8]) * min(point_distance(global.vstick[arg0][3], global.vstick[arg0][4], device_mouse_x_to_gui(global.vstick[arg0][7]), device_mouse_y_to_gui(global.vstick[arg0][7])), global.vstick[arg0][2])) / global.vstick[arg0][2];
            global.vstick[arg0][1] = (-sin(global.vstick[arg0][8]) * min(point_distance(global.vstick[arg0][3], global.vstick[arg0][4], device_mouse_x_to_gui(global.vstick[arg0][7]), device_mouse_y_to_gui(global.vstick[arg0][7])), global.vstick[arg0][2])) / global.vstick[arg0][2];
            global.vstick[arg0][11] = global.vstick[arg0][0];
            global.vstick[arg0][12] = global.vstick[arg0][1];
            if (global.vstick[arg0][10])
            {
                var xunscaled, yunscaled;
                if (global.vstick[arg0][8] <= 0.7853981633974483 || global.vstick[arg0][8] >= 5.497787143782138)
                {
                    xunscaled = 1;
                    yunscaled = -tan(global.vstick[arg0][8]);
                }
                if (global.vstick[arg0][8] >= 0.7853981633974483 && global.vstick[arg0][8] <= 2.356194490192345)
                {
                    xunscaled = 1 / tan(global.vstick[arg0][8]);
                    yunscaled = -1;
                }
                if (global.vstick[arg0][8] >= 2.356194490192345 && global.vstick[arg0][8] <= 3.9269908169872414)
                {
                    xunscaled = -1;
                    yunscaled = tan(global.vstick[arg0][8]);
                }
                if (global.vstick[arg0][8] >= 3.9269908169872414 && global.vstick[arg0][8] <= 5.497787143782138)
                {
                    xunscaled = -1 / tan(global.vstick[arg0][8]);
                    yunscaled = 1;
                }
                global.vstick[arg0][0] = xunscaled * point_distance(0, 0, global.vstick[arg0][11], global.vstick[arg0][12]);
                global.vstick[arg0][1] = yunscaled * point_distance(0, 0, global.vstick[arg0][11], global.vstick[arg0][12]);
            }
            if (device_mouse_check_button_released(global.vstick[arg0][7], mb_left) || device_mouse_check_button_released(global.vstick[arg0][7], mb_right))
            {
                global.vstick[arg0][0] = 0;
                global.vstick[arg0][1] = 0;
                global.vstick[arg0][6] = false;
                global.vstick[arg0][7] = -1;
                global.vstick[arg0][11] = 0;
                global.vstick[arg0][12] = 0;
                global.vstick[arg0][16] = 1;
            }
        }
    }
    else
    {
        global.vstick[arg0][0] = 0;
        global.vstick[arg0][1] = 0;
        global.vstick[arg0][6] = false;
        global.vstick[arg0][7] = -1;
        global.vstick[arg0][11] = 0;
        global.vstick[arg0][12] = 0;
    }
}
