function check_shop_item_maxed(arg0)
{
    var max_count = get_shop_item_max_count(arg0);
    if (max_count == 0)
    {
        return arg0.cost_cache_highest >= global.max_num_shop_item;
    }
    if (arg0.data.count >= max_count)
    {
        return true;
    }
    return false;
}

function get_shop_item_max_count(arg0)
{
    var max_count = arg0.max_count;
    if (!is_undefined(struct_get_from_hash(arg0, variable_get_hash("get_max_count"))))
    {
        max_count = arg0.get_max_count();
    }
    return max_count;
}

function get_shop_item_option(arg0)
{
    var options_length = array_length(arg0.options);
    if (options_length == 0)
    {
        exit;
    }
    arg0.data.slider_value = clamp(arg0.data.slider_value, 0, options_length - 1);
    return @@array_get@@(arg0.options, arg0.data.slider_value);
}

function get_shop_item_option_text(arg0)
{
    var option = get_shop_item_option(arg0);
    return get_default_struct_value(option, "text", option);
}

function get_shop_item_option_value(arg0)
{
    var option = get_shop_item_option(arg0);
    return get_default_struct_value(option, "value", option);
}

function get_shop_items_by_tag(arg0)
{
    var items = [];
    var __array = global.shops_items_array;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (mitem.tag == arg0)
        {
            array_push(items, mitem);
        }
    }
    return items;
}

function is_shop_item_enabled(arg0, arg1 = undefined)
{
    return has_bought_shop_item_safe(arg0, arg1, true);
}

function use_time_travel(arg0)
{
    if (!is_struct(arg0))
    {
        return log("no struct?");
    }
    if (!is_struct(struct_get_from_hash(global.profiles.def.shops, variable_get_hash("gems"))))
    {
        return notify(__s("Can't use this item."));
    }
    variable_struct_get(global.profiles.def.shops.gems, arg0.key).count--;
    variable_struct_get(global.profiles.def.shops.gems, arg0.key).inventory--;
    log(ptr(variable_struct_get(global.profiles.def.shops.gems, arg0.key)));
    var reward_seconds = 60 * arg0.value;
    var count = 1;
    add_game_log(sprintf("Time travel: %s", reward_seconds), "timeskip");
    add_offline_rewards(reward_seconds, __s("You travelled %s into the future. This is actually not possible, but this is an idle game so here you go.", format_time(reward_seconds)), !get_option(global.options.show_reward_dialogs), false, false, true);
    if (!get_option(global.options.show_reward_dialogs))
    {
        notify(__s("%s %s opened.", count, pluralize(count, __("item"), __("items"))));
    }
    init_game_vars();
}
