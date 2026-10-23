function after_buy_item(arg0, arg1 = false, arg2 = 1)
{
    if (is_method(arg0.func) && !arg1)
    {
        call_method(arg0, arg0.func, [arg0.key, arg2]);
    }
    if (!is_undefined(struct_get_from_hash(arg0, variable_get_hash("buy_after"))) && is_method(arg0.buy_after))
    {
        call_method(arg0, arg0.buy_after);
    }
    if (!is_undefined(struct_get_from_hash(arg0, variable_get_hash("after_apply"))))
    {
        arg0.after_apply();
    }
    if (get_default_struct_value(arg0, "refresh_ua", false))
    {
        init_game_vars(true);
    }
    if (is_string(struct_get_from_hash(arg0, variable_get_hash("refresh_section"))))
    {
        refresh_ua_section(arg0.refresh_section);
    }
    arg0.maxed = check_shop_item_maxed(arg0);
    arg0.refresh_cost();
    arg0.refresh_parents();
    if (is_callable(struct_get_from_hash(arg0, variable_get_hash("after_apply_ua"))) && !arg1)
    {
        call_method(arg0, arg0.after_apply_ua, arg0.key);
    }
    refresh_ua_section(["shops", "shops_early", "shops_late"]);
}

function buy_item(arg0, arg1 = false, arg2 = 1)
{
    if (!is_numeric(arg2))
    {
        arg2 = 1;
    }
    if (!can_buy_item(arg0))
    {
        exit;
    }
    var buy_count = arg2;
    var max_count = arg0.get_max_count();
    if (arg2 == -1)
    {
        buy_count = max_count;
        if (max_count == 0)
        {
            buy_count = 1000;
        }
    }
    if (max_count > 0)
    {
        buy_count = max(1, min(max_count - arg0.data.count, buy_count));
    }
    var item_cost = get_item_cost(arg0, buy_count);
    if (!has_enough_resources(item_cost))
    {
        buy_count = 0;
        if (arg2 == -1)
        {
            var items_bought = false;
            var items_bought_count = 0;
            var qty = [500, 100, 25, 5, 1];
            var __array = qty;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                var item_cost_buy_count = get_item_cost(arg0, mitem);
                while (has_enough_resources(item_cost_buy_count))
                {
                    arg0.add(mitem);
                    dec_resources(item_cost_buy_count);
                    item_cost_buy_count = get_item_cost(arg0, mitem);
                    items_bought = true;
                    items_bought_count += mitem;
                }
            }
            if (items_bought)
            {
                after_buy_item(arg0, arg1, items_bought_count);
            }
            exit;
        }
        else
        {
            var __array = arg0.cost_qty_array;
            var __prop_len = array_length(__array);
            var __i = __prop_len - 1;
            while (__i >= 0)
            {
                var mitem = __array[__i];
                var __ireal = __prop_len - 1 - __i;
                if (has_enough_resources(mitem.cost))
                {
                    buy_count = mitem.qty;
                    item_cost = mitem.cost;
                    break;
                }
                __i--;
            }
        }
    }
    if (buy_count == 0)
    {
        exit;
    }
    arg0.add(buy_count);
    dec_resources(item_cost);
    after_buy_item(arg0, arg1, buy_count);
}

function buy_shop_max(arg0 = struct_get_from_hash(global.selected_inventory_item, variable_get_hash("buy_shop_max")))
{
    var force_buy = !get_option(global.options.restrictive_max_buy);
    repeat (10)
    {
        autoupgrade_items(arg0, force_buy);
    }
}

function can_buy_item(arg0)
{
    if (!can_buy_item_count(arg0))
    {
        return false;
    }
    var item_cost = get_item_cost(arg0);
    if (!has_enough_resources(item_cost))
    {
        return false;
    }
    if (get_value_ext(arg0, arg0.is_obfuscated, false))
    {
        return false;
    }
    if (!is_undefined(struct_get_from_hash(arg0, variable_get_hash("is_buyable"))) && !get_value_ext(arg0, arg0.is_buyable))
    {
        return false;
    }
    if (is_method(struct_get_from_hash(arg0, variable_get_hash("can_buy"))) && !get_value_ext(arg0, arg0.can_buy))
    {
        return false;
    }
    return true;
}

function can_buy_item_count(arg0)
{
    var count = get_upgrade_count(arg0);
    var max_count = get_shop_item_max_count(arg0);
    if (max_count != 0 && count >= max_count)
    {
        return false;
    }
    if (is_infinity(count))
    {
        return false;
    }
    return true;
}

function calculate_item_cost(arg0, arg1, arg2, arg3 = arg0.data.count, arg4 = 0)
{
    var counter = 0;
    var sum = 0;
    var item_resource_cost = variable_struct_get(arg0.cost, arg1);
    for (var i = arg3; i < (arg3 + arg2); i++)
    {
        var cost = ceil(item_resource_cost * power(arg0.cost_exp, i));
        cost *= (1 - arg4);
        if (arg2 == -2 && is_infinity(sum + cost))
        {
            return counter;
        }
        if (arg2 == -1 && is_infinity(sum + cost))
        {
            return sum;
        }
        sum += cost;
        counter++;
    }
    return sum;
}

function calculate_item_cost_lite(arg0, arg1, arg2, arg3)
{
    var sum = 0;
    for (var i = arg3; i < (arg3 + arg2); i++)
    {
        var cost = ceil(arg0 * power(arg1, i));
        sum += cost;
    }
    return sum;
}

function get_general_item_cost(arg0, arg1, arg2 = 1, arg3 = arg0.data.count, arg4 = false, arg5 = 0)
{
    if (arg4)
    {
        return calculate_item_cost(arg0, arg1, arg2, arg3, arg5);
    }
    if (arg3 == arg0.cost_qty_count && arg0.cost_cache_reduced_price_ua_count == global.shops.coins.reduce_upgrade_prices.data.count)
    {
        if (arg2 == 1)
        {
            return arg0.cost_qty_1;
        }
        if (arg2 == 5)
        {
            return arg0.cost_qty_5;
        }
        if (arg2 == 10)
        {
            return arg0.cost_qty_10;
        }
        if (arg2 == 25)
        {
            return arg0.cost_qty_25;
        }
        if (arg2 == 100)
        {
            return arg0.cost_qty_100;
        }
        if (arg2 == arg0.cost_qty_tmp_count)
        {
            return arg0.cost_qty_tmp;
        }
    }
    arg0.cost_qty_count = get_upgrade_count(arg0);
    var qty = [1, 5, 10, 25, 100];
    arg0.cost_qty_array = [];
    arg0.cost_qty_map = {};
    var __array = qty;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        var key = sprintf("cost_qty_%s", mitem);
        var cost = calculate_item_cost(arg0, arg1, mitem, arg3, arg5);
        variable_struct_set(arg0, key, cost);
        variable_struct_set(arg0.cost_qty_map, mitem, cost);
        array_push(arg0.cost_qty_array, 
        {
            qty: mitem,
            cost: build_struct(arg1, cost)
        });
    }
    arg0.cost_qty_tmp = calculate_item_cost(arg0, arg1, arg2, arg3, arg5);
    arg0.cost_qty_tmp_count = arg2;
    if (arg2 == 1)
    {
        return arg0.cost_qty_1;
    }
    if (arg2 == 5)
    {
        return arg0.cost_qty_5;
    }
    if (arg2 == 10)
    {
        return arg0.cost_qty_10;
    }
    if (arg2 == 25)
    {
        return arg0.cost_qty_25;
    }
    if (arg2 == 100)
    {
        return arg0.cost_qty_100;
    }
    return arg0.cost_qty_tmp;
}

function get_item_cost(arg0, arg1 = 1, arg2 = arg0.data.count, arg3 = false)
{
    var reduce_upgrade_prices_ua_count = global.shops.coins.reduce_upgrade_prices.data.count;
    var reduce_upgrade_prices_value = get_cache("discount_value", 0);
    if (is_struct(arg0.cost_cache_current) && arg0.cost_cache_current_count == arg2 && arg0.cost_cache_reduced_price_ua_count == reduce_upgrade_prices_ua_count && arg1 == 1)
    {
        return arg0.cost_cache_current;
    }
    var cost_tmp = {};
    var __struct = arg0.cost;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        var cost = mitem;
        if (arg0.is_static)
        {
            cost *= arg1;
        }
        else
        {
            var discount = variable_struct_get(global.resources, mkey).discountable ? reduce_upgrade_prices_value : 0;
            cost = get_general_item_cost(arg0, mkey, arg1, arg2, arg3, discount);
        }
        add_to_struct_value(cost_tmp, mkey, cost);
    }
    if (!arg3 && arg1 == 1 && arg2 == get_upgrade_count(arg0))
    {
        arg0.cost_cache_current = cost_tmp;
        arg0.cost_cache_current_count = arg2;
        arg0.cost_cache_reduced_price = reduce_upgrade_prices_value;
        arg0.cost_cache_reduced_price_ua_count = reduce_upgrade_prices_ua_count;
        __struct = cost_tmp;
        __prop_names = struct_get_names(__struct);
        __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            arg0.cost_cache_highest = max(arg0.cost_cache_highest, mitem);
        }
    }
    return cost_tmp;
}
