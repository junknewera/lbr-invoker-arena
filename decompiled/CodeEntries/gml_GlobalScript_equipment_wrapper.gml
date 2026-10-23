function can_spawn_equipment()
{
    return instance_number(o_equipment_item) < 30;
}

function check_drop_equipment(arg0, arg1)
{
    if (!can_spawn_equipment())
    {
        return false;
    }
    var r = 0.1;
    if (is_current_area(global.areas.tower))
    {
        r = 0.1 + (global.current_tower_floor / 30) + global.upgrade_attributes.item_drop_chance;
    }
    if (!percent_chance(r))
    {
        exit;
    }
    var equipment_drop_count = floor(1 + get_upgrade_attribute_value(global.upgrade_attributes.item_drop_count));
    var equipment_collect_count = floor(1 + get_upgrade_attribute_value(global.upgrade_attributes.item_collect_count));
    repeat (equipment_drop_count)
    {
        drop_random_equipment_area(arg0, arg1, equipment_collect_count);
    }
}

function drop_random_equipment(arg0, arg1, arg2 = 1)
{
    var drop_item = get_random_droppable_equipment();
    if (!is_struct(drop_item))
    {
        exit;
    }
    return spawn_equipment_item(arg0, arg1, drop_item, arg2);
}

function drop_random_equipment_area(arg0, arg1, arg2 = 1)
{
    var drop_item = get_random_droppable_equipment(o_game.area.equipment_droppable);
    if (!is_struct(drop_item))
    {
        exit;
    }
    return spawn_equipment_item(arg0, arg1, drop_item, arg2);
}

function get_droppable_equipment()
{
    var drop_array = [];
    var __struct = global.equipment;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        if (mitem._can_drop())
        {
            array_push(drop_array, mitem);
        }
    }
    return drop_array;
}

function get_random_droppable_equipment(arg0 = get_droppable_equipment())
{
    if (array_length(arg0) == 0)
    {
        return false;
    }
    var drop_item = array_random_item_check_max_count(arg0);
    return drop_item;
}

function spawn_equipment_item(arg0, arg1, arg2, arg3 = 1)
{
    var o = instance_create_layer(arg0, arg1, global.layers.equipment, o_equipment_item);
    o.item = arg2;
    o.count = arg3;
    with (o)
    {
        init();
    }
    return o;
}

function upgrade_all_equipment()
{
    var __array = global.equipment_array;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        mitem.upgrade(mitem.get_max_upgrade_level());
    }
}
