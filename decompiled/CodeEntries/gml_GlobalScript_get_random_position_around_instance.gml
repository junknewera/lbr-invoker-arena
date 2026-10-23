function get_random_position_around_instance(arg0, arg1 = 60)
{
    if (instance_exists(arg0))
    {
        _x = arg0.x + lengthdir_x(arg1, random(360));
        _y = arg0.y + lengthdir_y(arg1, random(360));
    }
    else
    {
        _x = irandom_range(20, room_width - 20);
        _y = irandom_range(20, room_height - 20);
    }
    var _x = clamp(_x, 20, room_width - 20);
    var _y = clamp(_y, 20, room_height - 20);
    return 
    {
        x: _x,
        y: _y
    };
}
