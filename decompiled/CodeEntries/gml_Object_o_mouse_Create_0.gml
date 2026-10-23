single_object();
dragging = false;
drag_diff_total = 0;
drag_start_y = 0;
drag_timeout = 0;
drag_timeout_duration = sec(0.1);
scale = 4;
sprite_image_index = 0;
if (global.is_mobile && true)
{
    x = room_width / 2;
    y = room_height / 2;
    visible = false;
}
xreal = x;
yreal = y;

init_skin = function()
{
    if (!instance_exists(o_game))
    {
        exit;
    }
    var skin_key = o_game.data.skins.cursor;
    var skin = variable_struct_get(global.shops.skins, skin_key);
    if (is_undefined(skin))
    {
        exit;
    }
    sprite_index = skin.sprite;
    sprite_image_index = skin.sprite_image_index;
};

init_skin();
