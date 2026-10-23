function limit_max_count(arg0)
{
    if (!is_struct(arg0) || !is_struct(struct_get_from_hash(arg0, variable_get_hash("data"))))
    {
        exit;
    }
    var max_count = arg0.get_max_count();
    if (max_count == 0)
    {
        exit;
    }
    arg0.data.count = min(arg0.data.count, max_count);
}

function limit_resource_numbers()
{
    var __struct = global.resources;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        if (mitem.is_prestige_resource)
        {
            mitem.data.count = apply_max_number(mitem.data.count);
        }
        else
        {
            mitem.data.count = apply_max_leaf_storage(mitem.data.count);
        }
        mitem.data.collected = apply_max_number(mitem.data.collected);
        mitem.data.collected_total = apply_max_number(mitem.data.collected_total);
    }
    __struct = o_game.data.stats.resources_collected_avg;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(__struct, mkey, apply_max_number(mitem));
    }
    __struct = o_game.data.stats.resources_collected_count;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(__struct, mkey, apply_max_number(mitem));
    }
}

function apply_max_leaf_storage(arg0)
{
    var max_leaf_storage = get_max_leaf_storage();
    if (is_infinity(arg0) || is_string(arg0))
    {
        arg0 = global.max_num;
    }
    return min(max_leaf_storage, arg0);
}

function get_max_leaf_storage()
{
    var upgrade_level = global.upgrade_attributes.max_leaf_storage;
    if (global.max_leaf_storage_cache_level != upgrade_level)
    {
        global.max_leaf_storage_cache = power(10, 30 + upgrade_level);
        global.max_leaf_storage_cache_level = upgrade_level;
    }
    return global.max_leaf_storage_cache;
}
