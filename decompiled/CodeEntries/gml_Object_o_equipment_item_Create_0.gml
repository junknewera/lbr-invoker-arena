event_inherited();
collected = false;
count = 1;
item = false;
alb_can_collect = get_upgrade_count(global.shops.gold_token.alb_can_collect_equipment) > 0;
angle = random(359);
scale = 2;
image_xscale = 0;
image_yscale = 0;
direction = random(359);
speed = random_range(3, 4);
player_has_magnet = false;
sprite = spr_placeholder;
target_speed = 0;
visible = get_option(global.options.draw_equipment);

init = function()
{
    sprite_index = item.sprite;
    image_xscale = 32 / sprite_get_width(sprite_index);
    image_yscale = 32 / sprite_get_height(sprite_index);
    item_text = item.name;
    if (count > 1)
    {
        item_text = sprintf("%sx %s", number_format(count), item.name);
    }
};

collect = function()
{
    item.collect(count);
};
