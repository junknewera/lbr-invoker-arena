if (!can_draw)
{
    exit;
}
var _x = x;
var _y = y + sin(sec(current_time / 7500) + yoffset);
var maxrot = 10;
var rot_to = clamp((sin(current_time / 200) * maxrot * speed) / 3, -maxrot, maxrot);
if (!is_undefined(rot_to_override))
{
    rot_to = rot_to_override;
}
image_angle = lerp(image_angle, rot_to, 0.05);
draw_sprite_ext(sprite_index, image_index, _x, _y, image_xscale * scale_sign * scale_sign_x * scale, image_yscale * scale_sign * scale_sign_y * scale, image_angle, c_white, 1);
