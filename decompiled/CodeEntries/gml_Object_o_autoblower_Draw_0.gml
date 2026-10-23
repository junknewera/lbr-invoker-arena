if (!can_draw)
{
    exit;
}
draw_set_alpha(alpha);
var _image_index = image_index;
if (sprite_image_index != -1)
{
    _image_index = sprite_image_index;
}
draw_sprite_ext(sprite_index, _image_index, x, y, draw_scale_x * scale_sign, draw_scale_y * scale_sign, image_angle, c_white, alpha);
draw_sprite_ext(sprite_above, _image_index, x, y - 8, draw_scale_x * scale_sign, draw_scale_y * scale_sign, image_angle, c_white, alpha);
if (get_option(global.options.draw_alb_tool))
{
    var xscale = max(0.5, image_xscale * weapon_draw_scale * 0.75);
    var yscale = max(0.5, image_yscale * weapon_draw_scale * 0.75);
    draw_sprite_ext(blower.sprite, 0, x + lengthdir_x(12, image_angle), y + lengthdir_y(12, image_angle), xscale, yscale, image_angle, c_white, alpha);
}
if (state == UnknownEnum.Value_2)
{
    var charge_amount = (battery_charge / battery_charge_max) * 100;
    var col = 16115756;
    draw_healthbar(x - (scale_base / 2), y - (scale_base / 2) - 3, (x + (scale_base / 2)) - 4, y - (scale_base / 2) - 1, charge_amount, c_black, col, col, 0, true, false);
}
draw_set_alpha(1);

enum UnknownEnum
{
    Value_2 = 2
}
