collected = false;
item = false;
alpha = 0;
angle = random(359);
scale = 2;
image_xscale = 0;
image_yscale = 0;
direction = random(359);
speed = random_range(3, 4);
player_has_magnet = get_upgrade_count(global.shops.gems.material_magnet) > 0;
sprite = spr_placeholder;
target_speed = 0;
visible = get_option(global.options.draw_materials_option);

init = function()
{
    sprite_index = item.sprite;
    image_xscale = 32 / sprite_get_width(sprite_index);
    image_yscale = 32 / sprite_get_height(sprite_index);
};
