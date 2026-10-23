function fx_instance_init()
{
    direction = 90;
    image_alpha = 0;
    speed = random_range(0.3, 0.6);
    x = clamp(x, 30, room_width - 30);
    y = clamp(y, 30, room_height - 30);
    var xsign = (x > (room_width / 2)) ? -1 : 1;
    var ysign = (y > (room_height / 2)) ? -1 : 1;
    x += (random_range(-5, 25) * xsign);
    y += (random_range(-5, 25) * ysign);
    if (y < 100)
    {
        direction = 270;
    }
    direction = random_value_range(direction, 20);
}
