function fx_resources(arg0, arg1, arg2 = false, arg3 = false)
{
    if (!get_option(global.options.draw_resource_text_rewards))
    {
        exit;
    }
    if ((is_undefined(arg1) || arg1 < 2) && ds_list_size(o_game.pool_fx_text_active) > global.max_resource_reward_texts && !arg2)
    {
        exit;
    }
    var can_draw_leaf_reward_text = get_option(global.options.draw_resource_text_rewards_leaf);
    var __struct = arg0;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        var resource = variable_struct_get(global.resources, mkey);
        if (resource.is_leaf && !can_draw_leaf_reward_text)
        {
            continue;
        }
        var nf_places = 2;
        if (mitem < 1000)
        {
            nf_places = 0;
        }
        var num_sign_char = iif(mitem >= 0, "+", "-");
        var text = sprintf("%s%s", num_sign_char, number_format(mitem, nf_places, false));
        if (arg3)
        {
            text += sprintf(" %s", pluralize(mitem, resource.name_single, resource.name_plural));
        }
        var o = fx_text(x, y, text);
        if (is_undefined(o) || !instance_exists(o))
        {
            continue;
        }
        o.sprite_index = resource.sprite;
        o.resource = resource;
        o.value = mitem;
    }
}

function fx_resources_single(arg0, arg1, arg2 = 0, arg3 = false, arg4 = false, arg5 = global.layers.fx)
{
    if (!is_struct(arg0))
    {
        exit;
    }
    if (!get_option(global.options.draw_resource_text_rewards))
    {
        exit;
    }
    if ((is_undefined(arg2) || arg2 < 2) && ds_list_size(o_game.pool_fx_text_active) > global.max_resource_reward_texts && !arg3)
    {
        exit;
    }
    var can_draw_leaf_reward_text = get_option(global.options.draw_resource_text_rewards_leaf);
    if (arg0.is_leaf && !can_draw_leaf_reward_text)
    {
        exit;
    }
    var nf_places = 2;
    if (arg1 < 1000)
    {
        nf_places = 0;
    }
    var num_sign_char = iif(arg1 >= 0, "+", "-");
    var text = $"{num_sign_char}{number_format(arg1, nf_places, false)}";
    if (arg4)
    {
        text += sprintf(" %s", pluralize(arg1, arg0.name_single, arg0.name_plural));
    }
    var o = fx_text(x, y, text, undefined, undefined, arg5);
    if (is_undefined(o) || !instance_exists(o))
    {
        exit;
    }
    o.sprite_index = arg0.sprite;
    o.resource = arg0;
    o.value = arg1;
}
