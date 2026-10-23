function can_spawn_unique_leaf()
{
    if (get_upgrade_count(global.shops.blc.unlock_unique_leaves) == 0)
    {
        return false;
    }
    return instance_number(o_leaf_unique) == 0;
}

function check_spawn_unique_leaf()
{
    if (!can_spawn_unique_leaf())
    {
        exit;
    }
    var __struct = global.unique_leaves;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        var _uleaf = mitem;
        if (o_game.area.key != _uleaf.spawn_area.key)
        {
            continue;
        }
        if (!_uleaf.check())
        {
            continue;
        }
        if (get_upgrade_count(_uleaf) > 0)
        {
            continue;
        }
        spawn_unique_leaf(_uleaf);
    }
}

function deactivate_all_unique_leaves()
{
    var __struct = global.unique_leaves;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        mitem.deactivate();
    }
}

function get_max_concurrent_unique_leaves()
{
    return 1 + global.upgrade_attributes.max_unique_leaves;
}

function spawn_unique_leaf(arg0)
{
    var _x = room_width / 2;
    var _y = room_height / 2;
    if (instance_exists(o_enemy) && position_meeting(_x, _y, o_enemy))
    {
        with (instance_position(_x, _y, o_enemy))
        {
            instance_destroy();
        }
    }
    var o = instance_create_layer(_x, _y, global.layers.leaves, o_leaf_unique);
    o.unique = arg0;
    o.sprite_index = arg0.sprite;
    o.armor = arg0.armor;
    with (o)
    {
        init();
    }
}

function upgrade_all_unique_leaves()
{
    var __array = global.unique_leaves_sorted;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        mitem.upgrade(mitem.get_max_upgrade_level());
    }
}
