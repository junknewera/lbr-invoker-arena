global.blower_action_timeout_timer -= global.dtf;
global.blower_action_timeout_timer = max(0, global.blower_action_timeout_timer);
if (global.blower_action_timeout_timer <= 0 && state != UnknownEnum.Value_4)
{
    set_unit_state(UnknownEnum.Value_4);
}
dir = 0;
if (!get_option(global.options.move_player))
{
    x = room_width / 2;
    y = room_height / 2;
}
else if (!global.player_locked)
{
    var player_controls = get_option(global.options.player_controls);
    if (player_controls == global.player_controls.keyboard.value)
    {
        target_x = x + (movespeed * keyboard_dir_x);
        target_y = y + (movespeed * keyboard_dir_y);
    }
    else if (player_controls == global.player_controls.dpad.value)
    {
        target_x = x + (vstick_sens * global.vstick[0][11]);
        target_y = y + (vstick_sens * global.vstick[0][12]);
    }
    else
    {
        target_x = mouse_x;
        target_y = mouse_y;
    }
    if (!is_autoblower)
    {
        var oldx = x;
        var oldy = y;
        x = lerp(x, target_x, 0.3);
        y = lerp(y, target_y, 0.3);
        var dist = abs(oldx - x) + abs(oldy - y);
        walked += dist;
    }
    dir = point_direction(x, y, target_x, target_y);
}
restrict_position_to_room();
if (x != xprevious && y != yprevious)
{
    image_angle += (sin(degtorad(dir - image_angle)) * 10);
}
keyboard_dir_x = 0;
keyboard_dir_y = 0;
if (keyboard_check(vk_up))
{
    keyboard_dir_y = -1;
}
if (keyboard_check(vk_down))
{
    keyboard_dir_y = 1;
}
if (keyboard_check(vk_left))
{
    keyboard_dir_x = -1;
}
if (keyboard_check(vk_right))
{
    keyboard_dir_x = 1;
}
if (o_game.data.stats.time_elapsed >= dig_timer)
{
    if (blower.can_dig && get_upgrade_attribute_value(global.upgrade_attributes.dig_auto) > 0 && global.shops.gems.dig_auto.data.toggle && is_state(UnknownEnum.Value_4))
    {
        dig_ground();
        set_blower_action_timeout(get_upgrade_attribute_value(global.upgrade_attributes.dig_reduce_timeout));
    }
    dig_timer = o_game.data.stats.time_elapsed + max(1, sec(global.game_settings.dig_auto_delay_duration) - sec(get_upgrade_attribute_value(global.upgrade_attributes.dig_auto_decrease_delay)));
}
if (o_game.data.stats.time_elapsed >= slap_timer)
{
    if (blower.can_damage_enemy && get_upgrade_attribute_value(global.upgrade_attributes.auto_slap) > 0 && global.shops.gems.auto_slap.data.toggle && is_state(UnknownEnum.Value_4))
    {
        slap(get_default_instance_value(o_blower, "x", 0), get_default_instance_value(o_blower, "y", 0));
        set_blower_action_timeout(get_upgrade_attribute_value(global.upgrade_attributes.auto_slap_reduce_timeout));
    }
    slap_timer = o_game.data.stats.time_elapsed + get_slap_delay();
}

enum UnknownEnum
{
    Value_4 = 4
}
