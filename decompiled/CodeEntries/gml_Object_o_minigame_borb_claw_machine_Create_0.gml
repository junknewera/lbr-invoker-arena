event_inherited();
refresh_surface = true;
surface = -1;
width = gui_col_x(21);
height = gui_col_y(5);
autoclaw = false;
borbs_start_x = x + gui_col_x(1);
borbs_start_y = y + gui_col_y(8);
borbs = [];
borbs_lose = [];
borbs_win = [];
borbs_count = 800;
win_argument = undefined;
win_distance = 18 + get_upgrade_attribute_value(global.upgrade_attributes.claw_pickup_size);
win_result = 
{
    item: false,
    resource: {},
    sprite: spr_solid,
    text: "",
    win: false
};
claw_update_counter = 0;
claw_update_delay = 1/30;
claw = 
{
    _dir: 1,
    _x: x,
    _y: y + 20,
    _xend: x + width + 20,
    _yend: borbs_start_y + height + 20,
    _xstart: x,
    _ystart: y + 20,
    _speed: random_range(1, 3),
    _catch: false,
    started: true,
    state: -1
};
global.tavern_games_playing.claw = true;
alarm[2] = sec(1);

draw_borb = function(arg0)
{
    var win_color = iif(arg0._win, 16777215, 255);
    var bx = arg0._x;
    var by = arg0._y;
    if (arg0._catch)
    {
        bx = claw._x;
        by = claw._y + 20;
    }
    if (arg0._win)
    {
        if (arg0._value == 101)
        {
            draw_sprite_contain(arg0._sprite, arg0._index, bx, by, 32, arg0._angle, 16777215, 1, 16711680);
        }
        else
        {
            var max_width = clamp(sprite_get_width(arg0._sprite), 32, 48);
            draw_sprite_contain(arg0._sprite, arg0._index, bx, by, max_width, arg0._angle, 16777215, 1, arg0._outline);
        }
    }
    else
    {
        draw_sprite_ext(arg0._sprite, arg0._index, bx, by, arg0._scale_x, arg0._scale_y, arg0._angle, c_white, 1);
        draw_sprite_ext(arg0._sprite, arg0._index, bx, by, arg0._scale_x, arg0._scale_y, arg0._angle, c_black, 0.5);
    }
};

generate_borbs = function()
{
    var borb_win;
    for (var i = 0; i < borbs_count; i++)
    {
        var scale = random_range(1.5, 1.75);
        borb_win = i >= (borbs_count - 2);
        var borb = 
        {
            _sprite: spr_borb,
            _x: irandom_range(borbs_start_x + 20, (borbs_start_x + width) - 20),
            _y: irandom_range(borbs_start_y, borbs_start_y + height),
            _scale_x: scale,
            _scale_y: scale,
            _angle: irandom_range(0, 359),
            _index: irandom_range(0, 11),
            _catch: false,
            _item: false,
            _outline: 16777215,
            _win: borb_win,
            _value: 4
        };
        array_push(borbs, borb);
        if (borb_win)
        {
            array_push(borbs_win, borb);
        }
        else
        {
            array_push(borbs_lose, borb);
        }
    }
    var item_count_min = global.game_settings.borb_claw_machine_items_min + get_upgrade_attribute_value(global.upgrade_attributes.claw_items_min);
    var item_count_max = global.game_settings.borb_claw_machine_items_max + get_upgrade_attribute_value(global.upgrade_attributes.claw_items_max);
    var item_count = irandom_range(item_count_min, item_count_max);
    var is_halloween = is_event_active(global.events.halloween);
    for (var i = 0; i < item_count; i++)
    {
        var item = undefined;
        var outline = 16777215;
        var scale = 1;
        var value = 4;
        var r = random(100);
        var sprite;
        if (percent_chance(25) && is_halloween)
        {
            value = 10000;
            sprite = spr_borb_o_lantern;
            scale = 1;
        }
        else if (percent_chance(0.1) && !in_challenge() && has_locked_items(global.community_leaves))
        {
            var comm_leaf = get_random_locked_item(global.community_leaves);
            value = 101;
            sprite = comm_leaf.sprite;
            scale = 3;
            item = comm_leaf;
            outline = 16711680;
        }
        else if (percent_chance(0.3) && !in_challenge())
        {
            var chest = get_random_chest([global.chests.rare, global.chests.uncommon, global.chests.common]);
            value = 102;
            sprite = chest.sprite;
            item = chest;
        }
        else if (percent_chance(3) && !in_challenge())
        {
            value = 3;
            sprite = spr_resource_gem;
            scale = 1.5;
        }
        else if (percent_chance(global.game_settings.borb_claw_machine_spawn_chances.curse + (get_upgrade_attribute_value(global.upgrade_attributes.borb_claw_machine_spawn_chances_curse) * 100)))
        {
            value = 1;
            sprite = spr_icon_cursed_cheese;
            scale = 0.5;
            outline = 255;
        }
        else if (percent_chance(20))
        {
            value = 5;
            sprite = spr_icon_cheese;
            scale = 1.5;
        }
        else if (percent_chance(30))
        {
            var scroll = array_random_item(global.scrolls_sorted);
            value = 100;
            sprite = scroll.sprite;
            scale = 1.5;
            item = scroll;
        }
        else if (percent_chance(40) && get_upgrade_count(global.shops.blc.unlock_materials))
        {
            var claw_item = array_random_item(global.materials_spawnable);
            value = 103;
            sprite = claw_item.sprite;
            scale = 1.5;
            item = claw_item;
            outline = 8388736;
        }
        else if (percent_chance(50) && is_unlocked_equipment())
        {
            var claw_item = get_random_droppable_equipment();
            value = 104;
            sprite = claw_item.sprite;
            scale = 1.5;
            item = claw_item;
            outline = 32768;
        }
        else
        {
            value = 6;
            sprite = spr_leaf;
            scale = 2;
        }
        var borb = 
        {
            _sprite: sprite,
            _x: irandom_range(borbs_start_x + 40, (borbs_start_x + width) - 40),
            _y: irandom_range(borbs_start_y, borbs_start_y + height),
            _scale_x: scale,
            _scale_y: scale,
            _angle: irandom_range(0, 359),
            _index: 0,
            _catch: false,
            _item: item,
            _outline: outline,
            _win: true,
            _value: value
        };
        array_push(borbs, borb);
        if (borb_win)
        {
            array_push(borbs_win, borb);
        }
        else
        {
            array_push(borbs_lose, borb);
        }
    }
};

trigger_claw = function()
{
    if (claw.state == 0)
    {
        claw.state = 1;
        claw._speed = abs(claw._speed);
    }
    else if (claw.state == 4)
    {
        if (!has_enough_resources(global.costs.borb_claw_machine))
        {
            exit;
        }
        play_borb_claw_machine(x, y, true);
    }
};

generate_borbs();
