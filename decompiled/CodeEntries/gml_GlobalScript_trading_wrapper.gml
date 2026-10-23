function can_refresh_trades()
{
    if (!has_enough_resources(global.costs.trades_refresh))
    {
        return false;
    }
    var open_trades = get_max_trades();
    var __array = global.trades;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (mitem.data.finished || mitem.data.started)
        {
            open_trades--;
        }
    }
    if (open_trades == 0)
    {
        return false;
    }
    return true;
}

function check_trades()
{
    static trade_timer = 0;
    
    trade_timer++;
    var __array = global.trades;
    var __prop_len = array_length(__array);
    var __i = __prop_len - 1;
    while (__i >= 0)
    {
        var mitem = __array[__i];
        var __ireal = __prop_len - 1 - __i;
        mitem.check();
        __i--;
    }
    var trade_auto_process_timer_duration = global.game_settings.trade_auto_process_timer_duration;
    if (trade_timer >= trade_auto_process_timer_duration)
    {
        trade_timer = 0;
        var trades_collected = 0;
        var trades_collected_max = get_upgrade_attribute_value(global.upgrade_attributes.trade_auto_collect);
        var trades_started = 0;
        var trades_started_max = get_upgrade_attribute_value(global.upgrade_attributes.trade_auto_start);
        var can_handle_gems_trade = get_upgrade_count(global.shops.gems.can_handle_gems_trade) > 0;
        var can_auto_boost = get_upgrade_count(global.shops.gems.auto_trade_boost) > 0 && global.shops.gems.auto_trade_boost.data.toggle && global.pets.bearo.is_active();
        __array = global.trades;
        __prop_len = array_length(__array);
        __i = __prop_len - 1;
        while (__i >= 0)
        {
            var mitem = __array[__i];
            var __ireal = __prop_len - 1 - __i;
            if (mitem.type.key == global.trade_types.gems.key && !can_handle_gems_trade)
            {
            }
            else if (mitem.can_collect() && trades_collected < trades_collected_max)
            {
                mitem.collect();
                trades_collected++;
            }
            else if (mitem.can_start_trade() && trades_started < trades_started_max)
            {
                mitem.start();
                trades_started++;
                if (can_auto_boost)
                {
                    mitem.boost();
                }
            }
            else
            {
            }
            __i--;
        }
    }
    var trades_refresh_date = get_date_from_object(o_game.data.stats.trades_refresh);
    var trades_refresh_diff = date_second_span_ext(date_current_datetime(), trades_refresh_date);
    if (trades_refresh_diff > 604800)
    {
        var max_trades_refresh_date = date_inc_second(date_current_datetime(), 604800);
        o_game.data.stats.trades_refresh = get_time_object_from_datetime(max_trades_refresh_date);
    }
    else if (trades_refresh_diff < 0)
    {
        trades_refresh_date = date_current_datetime();
    }
    if (date_compare_datetime(date_current_datetime(), trades_refresh_date) < 0)
    {
        exit;
    }
    if (get_option(global.options.trades_auto_refresh))
    {
        __array = global.trades;
        __prop_len = array_length(__array);
        __i = __prop_len - 1;
        while (__i >= 0)
        {
            var mitem = __array[__i];
            var __ireal = __prop_len - 1 - __i;
            if (mitem.data.started)
            {
            }
            else
            {
                delete_trade(mitem.data.id);
            }
            __i--;
        }
        generate_trades();
        o_game.data.stats.trades_refresh = get_trades_refresh_timer();
        o_game.data.stats.trades_refresh_start = get_time_object_from_datetime(date_current_datetime());
    }
}

function delete_all_trades()
{
    var __array = global.trades;
    var __prop_len = array_length(__array);
    var __i = __prop_len - 1;
    while (__i >= 0)
    {
        var mitem = __array[__i];
        var __ireal = __prop_len - 1 - __i;
        delete_trade(mitem.data.id);
        __i--;
    }
}

function delete_trade(arg0)
{
    var __array = global.trades;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (mitem.data.id == arg0)
        {
            array_delete(global.trades, __i, 1);
            break;
        }
    }
}

function generate_trade(arg0 = undefined)
{
    var trade = new Trade();
    if (is_struct(arg0))
    {
        trade.load_data(arg0);
    }
    array_push(global.trades, trade);
    return trade;
}

function generate_trade_id()
{
    var _id = o_game.data.stats.trade_id_counter;
    o_game.data.stats.trade_id_counter++;
    return _id;
}

function generate_trades(arg0 = false, arg1 = false)
{
    var max_trades = get_max_trades();
    if (arg0)
    {
        var __array = global.trades;
        var __prop_len = array_length(__array);
        var __i = __prop_len - 1;
        while (__i >= 0)
        {
            var mitem = __array[__i];
            var __ireal = __prop_len - 1 - __i;
            if (arg1 && mitem.data.started)
            {
            }
            else
            {
                array_delete(global.trades, __i, 1);
            }
            __i--;
        }
    }
    var i = array_length(global.trades);
    while (i < max_trades)
    {
        generate_trade();
        i++;
    }
}

function get_max_gems_trades_today()
{
    return get_bm_value(10000, "trade_max_gems_trades_per_day");
}

function get_max_trade_level()
{
    return 1 + global.upgrade_attributes.trade_base_level;
}

function get_max_trades()
{
    return global.game_settings.trade_start_count + global.upgrade_attributes.trade_max_count;
}

function get_min_trade_level()
{
    var max_level = get_max_trade_level();
    var min_level = 1 + global.upgrade_attributes.trade_base_level_min;
    min_level = clamp(min_level, 1, max_level);
    return min_level;
}

function get_random_trade_type()
{
    var available_trade_types = _filter(global.trade_types_array, function(arg0)
    {
        return arg0._can_generate();
    });
    return array_random_item(available_trade_types);
}

function get_trade_global_multiplier()
{
    var tgm = global.game_settings.trade_global_multiplier;
    tgm *= (1 + get_upgrade_attribute_value(global.upgrade_attributes.trade_resources_multiplier_cards));
    tgm *= (1 + get_upgrade_attribute_value(global.upgrade_attributes.trade_resources_multiplier_challenges));
    tgm *= (1 + get_upgrade_attribute_value(global.upgrade_attributes.trade_resources_multiplier_dice));
    tgm *= (1 + get_upgrade_attribute_value(global.upgrade_attributes.trade_resources_multiplier_global));
    tgm *= (1 + get_upgrade_attribute_value(global.upgrade_attributes.trade_resources_multiplier_mine));
    tgm *= (1 + get_upgrade_attribute_value(global.upgrade_attributes.trade_resources_multiplier_plants));
    tgm *= (1 + get_upgrade_attribute_value(global.upgrade_attributes.trade_resources_multiplier_scroll));
    return tgm;
}

function get_trade_refresh_duration()
{
    var refresh_duration_raw = global.game_settings.trade_refresh_duration;
    var refresh_duration = refresh_duration_raw * (1 - global.upgrade_attributes.trade_refresh_decrease_timer);
    refresh_duration = max(60, refresh_duration);
    return refresh_duration;
}

function get_trades_refresh_timer()
{
    var trade_refresh_duration = get_trade_refresh_duration();
    var next_trade_refresh_date = date_inc_second_compat(date_current_datetime(), trade_refresh_duration);
    return get_time_object_from_datetime(next_trade_refresh_date);
}

function init_trade_types()
{
    global.trade_types = 
    {
        def: new Trade_Type("def", 
        {
            name: __("Standard Delivery"),
            
            can_generate: function()
            {
                return false;
            }
        }),
        beer: new Trade_Type("beer", 
        {
            name: __("Beer Delivery"),
            reward_count_base: 0.03,
            reward_resource: global.resources.beer,
            
            can_generate: function()
            {
                return global.resources.beer.data.unlocked;
            }
        }),
        borbs: new Trade_Type("borbs", 
        {
            name: __("Borbs Borborbory"),
            reward_count_base: 500,
            reward_resource: global.resources.borbs,
            
            can_generate: function()
            {
                return !in_challenge() && global.resources.borbs.data.unlocked;
            }
        }),
        cheese: new Trade_Type("cheese", 
        {
            name: __("Cheese Delivery"),
            reward_count_base: 1,
            reward_resource: global.resources.cheese,
            
            can_generate: function()
            {
                return global.resources.cheese.data.unlocked;
            }
        }),
        cp: new Trade_Type("cp", 
        {
            name: __("CP Delivery")
        }),
        gems: new Trade_Type("gems", 
        {
            name: __("Gems Delivery"),
            reward_resource: global.resources.gems,
            
            can_generate: function()
            {
                return !in_challenge();
            }
        }),
        mulch: new Trade_Type("mulch", 
        {
            name: __("Mulch Delivery"),
            reward_count_base: 5000,
            reward_resource: global.resources.mulch,
            
            can_generate: function()
            {
                return global.resources.mulch.data.unlocked;
            }
        })
    };
    global.trade_types_array = struct_to_array(global.trade_types);
}

function init_trades()
{
    if (variable_global_exists("trades_init") && !is_undefined(global.trades_init))
    {
        exit;
    }
    global.trades_init = true;
    global.trades = [];
    generate_trades();
    o_game.data.stats.trades_refresh = get_trades_refresh_timer();
    o_game.data.stats.trades_refresh_start = get_time_object_from_datetime(date_current_datetime());
}

function refresh_trades()
{
    generate_trades(true, true);
    dec_resources(global.costs.trades_refresh);
}

function refresh_trades_refresh_timer()
{
    var trades_refresh_time = get_date_from_object(o_game.data.stats.trades_refresh);
    var trades_refresh_start = get_date_from_object(o_game.data.stats.trades_refresh_start);
    var trade_refresh_duration = get_trade_refresh_duration();
    if (is_bool(trades_refresh_time) || is_bool(trades_refresh_start))
    {
        var trade_start_date = date_inc_second_compat(date_current_datetime(), -trade_refresh_duration);
        o_game.data.stats.trades_refresh_start = get_time_object_from_datetime(trade_start_date);
        trades_refresh_start = get_date_from_object(o_game.data.stats.trades_refresh_start);
    }
    var new_refresh_time = date_inc_second_compat(trades_refresh_start, trade_refresh_duration);
    o_game.data.stats.trades_refresh = get_time_object_from_datetime(new_refresh_time);
}
