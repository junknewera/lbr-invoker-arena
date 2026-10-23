function spawn_seed(arg0, arg1 = undefined, arg2 = undefined)
{
    if (!global.game_settings.seeds_enabled)
    {
        exit;
    }
    arg1 = is_undefined(arg1) ? random_range(20, room_width - 20) : arg1;
    arg2 = is_undefined(arg2) ? random_range(20, room_height - 20) : arg2;
    if (instance_exists(o_enemy) && position_meeting(arg1, arg2, o_enemy))
    {
        arg1 += ((o_enemy.sprite_width + irandom_range(100, 300)) * choose(1, -1));
        arg2 += ((o_enemy.sprite_height + irandom_range(100, 300)) * choose(1, -1));
    }
    var o = instance_create_layer(arg1, arg2, global.layers.leaves, o_seed);
    o.resource = arg0.resource;
    o.sprite_index = arg0.sprite;
    return o;
}
