draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, target_angle, c_white, 1);
if ((is_state(UnknownEnum.Value_0) || is_state(UnknownEnum.Value_1)) && o_minigame_curse.state == UnknownEnum.Value_2)
{
    var len = 48;
    var scale = global.is_mobile ? 3 : 2;
    draw_sprite_ext(spr_gui_arrow_up, 0, x + lengthdir_x(len, target_direction), y + lengthdir_y(len, target_direction), scale, scale, target_direction - 90, c_white, 1);
}
if (is_state(UnknownEnum.Value_1))
{
    var charge_amount = (charge / charge_max) * 100;
    draw_healthbar(x - 10, y - 20, x + sprite_width + 10, y - 10, charge_amount, c_black, c_green, c_red, 0, true, false);
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2
}
