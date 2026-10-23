max_trees = 200;
refresh_surface = true;
surface = -1;
trees = 10;
trees_list = [];
update_draw_delay_timer = 0;
update_draw_delay = sec(0.1);
offset = 10;

add_tree = function()
{
    if (array_length(trees_list) > max_trees)
    {
        exit;
    }
    var edge = irandom(3);
    var tree = 
    {
        index: irandom(image_number - 1),
        rand_scale_offset: random(1),
        rand_scale_speed: random_range(1000, 3000),
        rotation: irandom(359),
        scale: random_range(3, 5.5),
        _scale: 0
    };
    tree.scale_target = tree.scale;
    var pos = 
    {
        _x: 0,
        _y: 0
    };
    if (edge == 0)
    {
        pos._x = room_width + irandom_range(-offset, offset);
        pos._y = irandom_range(-offset, room_height + offset);
    }
    else if (edge == 1)
    {
        pos._x = irandom_range(-offset, room_width + offset);
        pos._y = irandom_range(-offset, offset);
    }
    else if (edge == 2)
    {
        pos._x = irandom_range(-offset, offset);
        pos._y = irandom_range(-offset, room_height + offset);
    }
    else if (edge == 3)
    {
        pos._x = irandom_range(-offset, room_width + offset);
        pos._y = room_height + irandom_range(-offset, offset);
    }
    tree.pos = pos;
    array_push(trees_list, tree);
};

init = function()
{
    trees = min(max_trees, get_upgrade_attribute_value(global.upgrade_attributes.trees));
    for (var t = 0; t < trees; t++)
    {
        add_tree();
    }
    if (is_event_active(global.events.halloween))
    {
        sprite_index = spr_tree_cursed;
    }
};

init();
