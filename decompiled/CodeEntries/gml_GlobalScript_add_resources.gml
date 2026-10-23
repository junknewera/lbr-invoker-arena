function add_resources(arg0, arg1 = false, arg2 = false, arg3 = false, arg4 = global.current_profile, arg5 = false, arg6 = floor, arg7 = undefined, arg8 = 1)
{
    if (!is_struct(arg0))
    {
        exit;
    }
    arg4 = get_default_value(arg4, global.current_profile);
    var _is_current_profile = arg4 == global.current_profile;
    var leafscend_level = get_default_struct_value(arg7, "leafscend_level", 0);
    var show_resource_name = get_default_struct_value(arg7, "show_resource_name", false);
    var __struct = arg0;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        if (is_undefined(variable_struct_get(global.resources, mkey)))
        {
            continue;
        }
        var _key = mkey;
        var res;
        if (_is_current_profile)
        {
            res = variable_struct_get(global.resources, _key).data;
        }
        else
        {
            res = variable_struct_get(variable_struct_get(global.profiles, arg4).resources, _key);
        }
        var add_value = mitem * arg8;
        if (is_infinity(add_value))
        {
            add_value = global.max_num;
        }
        var add_bignum = false;
        if (leafscend_level == 0)
        {
            var new_value = bignum_add_safe(res.count, add_value, arg6);
            new_value = apply_max_leaf_storage(new_value);
            res.count = new_value;
            if (!is_undefined(arg5) && arg5)
            {
                res.unlocked = true;
            }
            if (add_value < 0)
            {
                res.spent = bignum_add_safe(res.spent, abs(add_value));
            }
            if (arg2)
            {
                continue;
            }
            res.collected = bignum_add_safe(res.collected, add_value);
            if (add_value >= 0)
            {
                res.collected_total = bignum_add_safe(res.collected_total, add_value);
            }
        }
        else
        {
            var new_value = add_to_struct_value(res.leafscend_count, leafscend_level, add_value);
            if (add_value >= 0)
            {
                add_to_struct_value(res.leafscend_collected, leafscend_level, add_value);
            }
            if (add_value >= 0)
            {
                add_to_struct_value(res.leafscend_collected_total, leafscend_level, add_value);
            }
        }
    }
    if (arg1)
    {
        fx_resources(arg0, arg1, arg3, show_resource_name);
    }
}

function add_resources_cache(arg0, arg1, arg2 = false)
{
    add_to_struct_value(o_game.leaf_reward_cache, arg0.key, arg1);
    if (arg2)
    {
        add_resources_cache_avg(arg0, arg1);
    }
}

function add_resources_cache_avg(arg0, arg1)
{
    add_to_struct_value(o_game.leaf_reward_avg_cache, arg0.key, arg1);
}

function add_leaf_reward_cache()
{
    if (!instance_exists(o_game))
    {
        exit;
    }
    add_resources(o_game.leaf_reward_cache);
    add_resources_to_avg(o_game.leaf_reward_avg_cache);
    o_game.leaf_reward_cache = {};
    o_game.leaf_reward_avg_cache = {};
}
