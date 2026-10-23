var _image_index = image_index;
if (sprite_image_index != -1)
{
    _image_index = sprite_image_index;
}
draw_sprite_ext(sprite_index, _image_index, x, y, image_draw_scale, image_draw_scale, image_angle, c_white, 1);
if (can_draw_weapon)
{
    draw_sprite_ext(blower.sprite, 0, x + lengthdir_x(12, image_angle), y + lengthdir_y(12, image_angle), weapon_draw_scale, weapon_draw_scale, image_angle, c_white, 1);
}
if (global.draw_hud)
{
    if (can_draw_hp)
    {
        hp_fx = lerp(hp_fx, hp, 0.2);
        if ((hp * 1.01) < hp_max)
        {
            var hp_val = (hp_fx / hp_max) * 100;
            draw_healthbar(x - (hp_bar_width / 2), y - (hp_bar_y / 2) - 3, (x + (hp_bar_width / 2)) - 4, y - (hp_bar_y / 2) - 1, hp_val, c_black, c_red, c_red, 0, true, false);
        }
    }
    action_timeout_timer_fx = lerp(action_timeout_timer_fx, global.blower_action_timeout_timer, 0.5);
    if (global.blower_action_timeout_timer > 0)
    {
        var timeout_val = calc_percent(action_timeout_timer_fx, global.blower_action_timeout_duration);
        draw_healthbar(x - (hp_bar_width / 2), y - (hp_bar_y / 2) - 6, (x + (hp_bar_width / 2)) - 4, y - (hp_bar_y / 2) - 4, timeout_val, c_black, c_aqua, c_aqua, 0, true, false);
    }
}
