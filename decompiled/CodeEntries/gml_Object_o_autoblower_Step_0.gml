bounce_room_edges();
bump_startup_delay--;
pathing_timer += round(global.dtf);
slap_timer += round(global.dtf);
if (state == UnknownEnum.Value_2)
{
    image_speed = 0;
    speed = lerp(speed, 0, 0.05);
    autoblower_charge(battery_charging_rate);
    exit;
}
else if (state == UnknownEnum.Value_5)
{
    knockback_power = lerp(knockback_power, 0, 0.075);
    x += lengthdir_x(knockback_power, knockback_dir);
    y += lengthdir_y(knockback_power, knockback_dir);
    speed = lerp(speed, 0, 0.1);
    if (position_meeting(x, y, o_enemy))
    {
        knockback_power = 6;
    }
    if (knockback_power <= 0.3)
    {
        set_unit_state(UnknownEnum.Value_6);
    }
    exit;
}
else if (state == UnknownEnum.Value_6)
{
    battery_charge--;
    image_speed = image_speed_base;
    if (battery_charge <= 0 && need_charge)
    {
        set_unit_state(UnknownEnum.Value_2);
        exit;
    }
}
speed = lerp(speed, movespeed, 0.05);
if (spinning)
{
    image_angle += (3 * movespeed);
}
else
{
    image_angle += (sin(degtorad(direction - image_angle)) * 10);
}
if (current_time > 0)
{
    switch (pathing)
    {
        case UnknownEnum.Value_1:
            direction -= 2;
            break;
        case UnknownEnum.Value_3:
            direction += 2;
            break;
        case UnknownEnum.Value_7:
            direction += (floor(sin(current_time / 600) / 45) * 45);
            break;
        case UnknownEnum.Value_12:
            var t = pathing_timer >= 45;
            if (t)
            {
                if (pathing_tmp == 0)
                {
                    direction += 60;
                    pathing_tmp = 1;
                }
                else
                {
                    direction -= 60;
                    pathing_tmp = 0;
                }
                pathing_timer = 0;
            }
            break;
        case UnknownEnum.Value_6:
            direction += sin(current_time / 600);
            break;
        case UnknownEnum.Value_2:
            direction += cos(current_time / 600);
            break;
        case UnknownEnum.Value_8:
            direction += tan(current_time / 600);
            break;
        case UnknownEnum.Value_4:
            var sinval = abs(sin(current_time / 600));
            if (sinval > 0)
            {
                direction += log2(sinval);
            }
            break;
        case UnknownEnum.Value_9:
            if (pathing_timer >= 360)
            {
                direction = point_direction(x, y, room_width / 2, room_height / 2);
                pathing_timer = 0;
            }
            break;
        case UnknownEnum.Value_10:
            var t = pathing_timer >= 360;
            if (t)
            {
                if (pathing_tmp == 0)
                {
                    direction = point_direction(x, y, 0, 0);
                    pathing_tmp++;
                }
                else if (pathing_tmp == 1)
                {
                    direction = point_direction(x, y, room_width, 0);
                    pathing_tmp++;
                }
                else if (pathing_tmp == 2)
                {
                    direction = point_direction(x, y, room_width, room_height);
                    pathing_tmp++;
                }
                else if (pathing_tmp == 3)
                {
                    direction = point_direction(x, y, 0, room_height);
                    pathing_tmp = 0;
                }
                pathing_timer = 0;
            }
            break;
        case UnknownEnum.Value_11:
            if (instance_exists(o_blower))
            {
                if (pathing_timer >= 360)
                {
                    direction = point_direction(x, y, o_blower.x, o_blower.y);
                    pathing_timer = 0;
                }
            }
            break;
        case UnknownEnum.Value_13:
            if (pathing_timer >= 360)
            {
                direction = point_direction(x, y, o_blower.x, o_blower.y);
            }
            break;
    }
}
if (slap_timer >= slap_timer_max && blower.type == global.weapon_types.trouts && blower.is_alb_equippable())
{
    slap();
    slap_timer = 0;
    slap_timer_max = get_slap_delay() * 2;
}
restrict_position_to_room();

enum UnknownEnum
{
    Value_1 = 1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_6,
    Value_7,
    Value_8,
    Value_9,
    Value_10,
    Value_11,
    Value_12,
    Value_13
}
