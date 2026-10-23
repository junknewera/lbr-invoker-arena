event_inherited();
outline_color = undefined;
player_has_magnet = get_upgrade_count(global.shops.gems.cards_magnet) > 0;
visible = get_option(global.options.draw_cards);

collect = function()
{
    item.collect();
    if (get_option(global.options.enable_card_notifications))
    {
        notify(__s("Collected %s card.", item.name_full));
    }
};

before_draw = function()
{
    draw_sprite_ext(item.type.sprite, 0, x, y, 1.2, 1.2, image_angle, c_white, image_alpha);
};

draw = function()
{
    draw_sprite_contain(sprite_index, 0, x, y, 32, image_angle, 16777215, image_alpha);
};
