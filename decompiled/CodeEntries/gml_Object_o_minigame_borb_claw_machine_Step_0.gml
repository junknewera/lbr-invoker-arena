event_inherited();
if (keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_left))
{
    trigger_claw();
}
if (claw.state == 0)
{
    claw._speed = irandom_range(8, 14);
    claw._x += claw._speed * claw._dir;
    if (claw._x >= claw._xend)
    {
        claw._dir = -1;
    }
    else if (claw._x <= claw._xstart)
    {
        claw._dir = 1;
    }
}
else if (claw.state == 1)
{
    claw._y += claw._speed;
    if (claw._y >= claw._yend)
    {
        claw._speed *= -1;
        claw.state = 2;
    }
    claw_update_counter++;
    if (claw_update_counter >= claw_update_delay)
    {
        claw_update_counter = 0;
        for (var i = 0; i < array_length(borbs_win); i++)
        {
            var borb = @@array_get@@(borbs_win, i);
            var dist = abs(claw._x - borb._x) + abs(claw._y - borb._y);
            if (dist <= win_distance)
            {
                borb._catch = true;
                claw._speed *= -1;
                claw._catch = borb;
                claw.state = 2;
                refresh_surface = true;
                break;
            }
        }
    }
}
else if (claw.state == 2)
{
    claw._y += claw._speed;
    if (claw._y <= claw._ystart)
    {
        claw.state = 3;
        claw._speed = abs(claw._speed);
    }
}
else if (claw.state == 3)
{
    claw._x -= claw._speed;
    if (claw._x <= claw._xstart)
    {
        global.tavern_games_playing.claw = false;
        claw.state = 4;
        if (is_struct(claw._catch))
        {
            win_result = get_borb_win_result(claw._catch._value, claw._catch._item);
        }
    }
}
claw._x = clamp(claw._x, claw._xstart, claw._xend);
claw._y = clamp(claw._y, claw._ystart, claw._yend);
