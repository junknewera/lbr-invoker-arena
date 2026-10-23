event_inherited();
target_angle = lerp(target_angle, target_angle + (speed * 3), 0.1);
if (is_state(UnknownEnum.Value_0) && o_minigame_curse.state == UnknownEnum.Value_2)
{
    target_direction += target_speed;
    if (keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_left))
    {
        state = UnknownEnum.Value_1;
    }
}
else if (is_state(UnknownEnum.Value_1))
{
    charge += (charge_speed * charge_direction);
    if (charge > charge_max || charge < charge_min)
    {
        charge_direction *= -1;
    }
    charge = clamp(charge, charge_min, charge_max);
    if (keyboard_check_released(vk_space) || mouse_check_button_released(mb_left))
    {
        direction = target_direction;
        speed = 5 + ((charge / 100) * 25);
        charge = 0;
        target_direction = irandom_range(0, 359);
        state = UnknownEnum.Value_2;
        o_minigame_curse.current_stats.hit++;
        array_push(o_minigame_curse.replay_data, 
        {
            instance: "ball",
            type: "shoot",
            timer: o_minigame_curse.level_timer,
            timer_real: get_timer(),
            direction: direction,
            speed: speed,
            x: x,
            y: y
        });
    }
}
else if (is_state(UnknownEnum.Value_2) && speed == 0)
{
    state = UnknownEnum.Value_0;
    array_push(o_minigame_curse.replay_data, 
    {
        instance: "ball",
        type: "stop",
        timer: o_minigame_curse.level_timer,
        timer_real: get_timer(),
        x: x,
        y: y
    });
}
x = clamp(x, xmin + 6, xmax - 6);
y = clamp(y, ymin + 6, ymax - 6);
set_center_vars();
if (global.debug && keyboard_check_pressed(vk_shift) && instance_exists(o_minigame_curse_goal))
{
    x = o_minigame_curse_goal.x;
    y = o_minigame_curse_goal.y;
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2
}
