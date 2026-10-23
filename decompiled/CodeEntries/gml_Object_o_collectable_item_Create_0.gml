direction = random(359);
speed = random_range(3, 4);
alb_can_collect = false;
angle = random(359);
collected = false;
item = false;
item_text = "";
outline_color = 16711680;
persist_area = false;
pickup_distance = 32;
player_has_magnet = false;
resources_fx_options = undefined;
scale = 2;
show_pickup_fx = true;
sprite = spr_placeholder;
target_speed = 0;

init = function()
{
    if (is_struct(item))
    {
        sprite_index = get_default_struct_value(item, "sprite", sprite_index);
        if (is_empty(item_text))
        {
            item_text = get_default_struct_value(item, "name", "");
        }
    }
    init_after();
};

init_after = function()
{
};

collect = function()
{
};

before_draw = __void;

draw = function()
{
    draw_sprite_contain(sprite_index, 0, x, y, 32, image_angle, 16777215, image_alpha, outline_color);
};

after_draw = __void;

destroy = function(arg0 = false)
{
    if (persist_area && !arg0)
    {
        exit;
    }
    instance_destroy();
};
