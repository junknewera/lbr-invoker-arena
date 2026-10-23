set_unit_state(UnknownEnum.Value_4);
image_speed = 1;
can_draw = true;
movespeed = 2;
target_x = o_blower.x;
target_y = o_blower.y;
yoffset = random(1);
base_scale_x = image_xscale;
base_scale_y = image_yscale;
pettable = true;
rot_to_override = undefined;
scale = 1;
scale_sign = 1;
scale_sign_x = 1;
scale_sign_y = 1;
sprite = spr_placeholder;
sprite_walk = spr_placeholder;

init = function()
{
    current_sprite = sprite;
    sprite_index = sprite;
    var image_scale = min(32 / sprite_get_width(sprite_index), 32 / sprite_get_height(sprite_index));
    image_xscale = image_scale;
    image_yscale = image_scale;
    base_scale_x = image_xscale;
    base_scale_y = image_yscale;
};

on_area_change = function()
{
    visible = o_game.area.player_visible;
};

check_petpet = function()
{
    if (!type.is_pettable())
    {
        exit;
    }
    var dist = distance_to_point(device_mouse_x(0), device_mouse_y(0));
    if (dist > 24)
    {
        exit;
    }
    if (instance_exists(o_dialog) && o_dialog.visible)
    {
        exit;
    }
    petpet();
};

petpet = function()
{
    if (!type.is_pettable())
    {
        exit;
    }
    type.petpet();
    alarm[1] = type.pet_timeout;
    rot_to_override = 360;
};

alarm[0] = sec(0.2);
alarm[2] = sec(1);

enum UnknownEnum
{
    Value_4 = 4
}
