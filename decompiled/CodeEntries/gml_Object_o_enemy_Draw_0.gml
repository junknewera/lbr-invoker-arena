if (!can_draw)
{
    exit;
}
if (dead)
{
    draw_self();
    exit;
}
draw_set_alpha(image_alpha);
var _x = x;
var _y = y + sin(sec(current_time / 20000) + yoffset);
var hit_col = (hit_fx > 0) ? enemy_hit_color : blend_color;
if (soul_boost)
{
    draw_sprite_outlined_ext(sprite_index, image_index, _x, _y, image_xscale, image_yscale, image_angle, hit_col, global.colors.blue);
}
else if (quark_boost)
{
    draw_sprite_outlined_ext(sprite_index, image_index, _x, _y, image_xscale, image_yscale, image_angle, hit_col, global.colors.magenta);
}
else
{
    draw_sprite_ext(sprite_index, image_index, _x, _y, image_xscale, image_yscale, image_angle, hit_col, 1);
}
var charge_amount = 100 - ((expire_timer / expire_duration) * 100);
var col = 16115756;
draw_healthbar(x - (sprite_width / 2), y - (sprite_height / 2) - 6, (x + (sprite_width / 2)) - 4, y - (sprite_height / 2) - 4, charge_amount, c_black, col, col, 180, true, false);
var hp_val = (hp / hp_max) * 100;
draw_healthbar(x - (sprite_width / 2), y - (sprite_height / 2) - 3, (x + (sprite_width / 2)) - 4, y - (sprite_height / 2) - 1, hp_val, c_black, c_red, c_red, 0, true, false);
if (has_quark_shield)
{
    var quark_val = (quark_shield / quark_shield_max) * 100;
    draw_healthbar(x - (sprite_width / 2), y - (sprite_height / 2) - 0, (x + (sprite_width / 2)) - 4, (y - (sprite_height / 2)) + 2, quark_val, c_black, global.colors.purple, global.colors.purple, 0, true, false);
}
draw_set_alpha(1);
if (global.debug && o_debug.debug_draw)
{
    set_default_font(f_game_small, 1);
    draw_description(x, y - 20, concatstr_nl(sprintf("HP: %s/%s", number_format(hp), number_format(hp_max)), sprintf("Q: %s/%s", number_format(quark_shield), number_format(quark_shield_max)), sprintf("C: %s", collisions)));
}
