function autoupgrade_exec()
{
    var bench_enabled = false;
    var __benchmark_t, __benchmark_total;
    if (bench_enabled)
    {
        __benchmark_total = 0;
        __benchmark_t = current_time;
    }
    if (!get_option(global.options.enable_autobuy) || !global.game_settings.autobuy_enabled)
    {
        exit;
    }
    global.autobuy_loop_active = false;
    global.autobuy_loop_endtime = get_timer() + 500;
    global.autobuy_shop_items_bought = 0;
    var autobuy_resource_threshold = get_option(global.options.autobuy_resource_threshold);
    var __array = global.resources_array;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        mitem.autobuy_threshold = (mitem.data.count * autobuy_resource_threshold) / 100;
    }
    __array = global.shops_items_array_autobuyers;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (!mitem.data.toggle)
        {
            continue;
        }
        if (!get_value_ext(mitem, mitem.is_buyable))
        {
            continue;
        }
        if (!is_array(mitem.auto_upgrade_item_cache) || mitem.data.count == 0)
        {
            continue;
        }
        var resource = struct_get_from_hash(mitem, variable_get_hash("resource"));
        if (is_struct(resource) && variable_struct_get(global.resources, resource.key).data.collected == 0)
        {
            continue;
        }
        if (!mitem.auto_upgrade_check())
        {
            continue;
        }
        if (is_undefined(mitem.auto_upgrade_sorted_items_cache))
        {
            mitem.sort_items();
        }
        autoupgrade_items(mitem.auto_upgrade_sorted_items_cache);
    }
    global.autobuy_loop_active = false;
    if (bench_enabled)
    {
        logf("Benchmark ended", current_time - __benchmark_t);
        __benchmark_total += (current_time - __benchmark_t);
    }
}

function autoupgrade_items(arg0, arg1 = false)
{
    if (!is_array(arg0))
    {
        exit;
    }
    var loop_item = arg0[0];
    var item_cost = get_item_cost(loop_item);
    var cost_key = loop_item.cost_resource_key;
    var cost_resource = variable_struct_get(global.resources, cost_key);
    var loop_counter = 0;
    var max_loop_count = get_option(global.options.autoupgrade_count);
    var has_autobuy_priority = get_upgrade_count(global.shops.blc.autobuy_priority) > 0;
    var __array = arg0;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (loop_counter >= max_loop_count)
        {
            break;
        }
        if (!arg1)
        {
            if (mitem.data.auto_upgrade_prio_user == 0)
            {
                continue;
            }
            if (mitem.data.max_buy_user == 0)
            {
                continue;
            }
            if (mitem.data.max_buy_user > 0 && get_upgrade_count(mitem) >= mitem.data.max_buy_user)
            {
                continue;
            }
        }
        if (!can_buy_item(mitem))
        {
            continue;
        }
        item_cost = get_item_cost(mitem);
        if (has_autobuy_priority && variable_struct_get(item_cost, cost_key) > cost_resource.autobuy_threshold && !arg1)
        {
            continue;
        }
        var buy_count = 100;
        if (mitem.data.max_buy_user > 0 && !arg1)
        {
            buy_count = max(0, mitem.data.max_buy_user - mitem.data.count);
        }
        if (buy_count > 0)
        {
            buy_item(mitem, false, buy_count);
        }
        loop_counter++;
    }
}
