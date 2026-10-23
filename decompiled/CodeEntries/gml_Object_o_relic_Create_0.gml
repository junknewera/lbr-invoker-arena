event_inherited();
outline_color = undefined;
player_has_magnet = get_upgrade_count(global.shops.gems.relics_magnet) > 0;
visible = get_option(global.options.draw_other_items);

collect = function()
{
    item.collect();
};

before_draw = function()
{
    draw_sprite_contain(item.type.btn_bg_sprite, image_index, x, y, 48, image_angle, 16777215, image_alpha);
};
