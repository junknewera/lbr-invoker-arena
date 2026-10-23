function init_quark_types()
{
    global.quarks = 
    {
        basic: new Quark(
        {
            name: __("Basic"),
            index: 10
        }),
        gold: new Quark(
        {
            name: __("Gold"),
            index: 20
        }),
        strange: new Quark(
        {
            name: __("Strange"),
            index: 30
        }),
        plasma: new Quark(
        {
            name: __("Plasma"),
            index: 40
        }),
        soul: new Quark(
        {
            name: __("Soul"),
            index: 50
        }),
        cursed: new Quark(
        {
            name: __("Cursed"),
            index: 60
        })
    };
    add_keys_to_struct(global.quarks);
    global.quarks_array = struct_to_sorted_array(global.quarks);
}

function init_quarks_late()
{
    call_struct(global.quarks, "init_late");
    if (o_game.data.quarks.quark_seed == -1)
    {
        o_game.data.quarks.quark_seed = irandom_range(1, 9999);
    }
}

function check_quarks()
{
    if (!is_unlocked_quarks())
    {
        exit;
    }
    var quark_reactor_inc_count = get_default_struct_value(global.cache, "quark_reactor_inc_count", 0.01);
    add_quark_reactor_count(quark_reactor_inc_count);
    if (has_bought_shop_item_safe(global.shops.gems.quark_reactor_auto_quarkstige) && get_option(global.options.quark_reactor_auto_quarkstige) && can_quarkstige())
    {
        quarkstige();
    }
    if (is_unlocked_quarks_structure())
    {
        var qs_add_value = get_quark_qs_value();
        add_energy(global.resources.energy_quark, qs_add_value);
        if (has_bought_shop_item_safe(global.shops.gems.quark_auto_funnel) && get_option(global.options.quark_auto_funnel) && quark_can_funnel())
        {
            quark_funnel();
        }
        var structurize_threshold_value = 0;
        var structurize_threshold_value_option = get_option(global.options.quark_auto_structurize_value);
        if (structurize_threshold_value_option == "full")
        {
            structurize_threshold_value = get_max_energy_storage(global.resources.energy_quark);
        }
        else if (structurize_threshold_value_option == "asap")
        {
            structurize_threshold_value = 1;
        }
        else
        {
            structurize_threshold_value = get_max_energy_storage(global.resources.energy_quark) * structurize_threshold_value_option;
        }
        if (has_bought_shop_item_safe(global.shops.gems.quark_auto_structurize) && get_option(global.options.quark_auto_structurize) && quark_can_structurize() && global.resources.energy_quark.data.count >= structurize_threshold_value)
        {
            quark_structurize();
        }
        if (has_bought_shop_item_safe(global.shops.gems.quark_auto_quantify) && get_option(global.options.quark_auto_quantify) && quark_can_quantify())
        {
            quark_quantify();
        }
        if (has_bought_shop_item_safe(global.shops.gems.quark_auto_leaftonify) && get_option(global.options.quark_auto_leaftonify) && quark_can_leaftonify())
        {
            quark_leaftonify();
        }
    }
}

function add_quark_reactor_count(arg0 = 0.01, arg1 = true)
{
    var reactor_size = get_default_struct_value(global.cache, "quark_reactor_size", 1);
    o_game.data.quarks.reactor.count += arg0;
    if (get_option(global.options.quark_reactor_auto_add) && has_bought_shop_item_safe("gems", "quark_reactor_auto_add"))
    {
        var has_quark_optimizer = has_bought_shop_item_safe(global.shops.gems.quark_reactor_auto_add_optimizer);
        var resort_quarks = true;
        reactor_size = get_cache("quark_reactor_size", 1);
        var n = 0;
        var threshold = get_option(global.options.quark_reactor_auto_add_settings);
        var quarks_available = _filter(global.quarks_array, function(arg0)
        {
            return has_enough(arg0.get_add_cost());
        });
        while (++n < 500)
        {
            if (array_length(quarks_available) == 0)
            {
                break;
            }
            var quark;
            if (has_quark_optimizer)
            {
                if (resort_quarks)
                {
                    sort_array_by_data_count(quarks_available, true);
                }
                quark = quarks_available[0];
            }
            else
            {
                quark = array_random_item(quarks_available);
            }
            var threshold_flag = true;
            if (threshold == "full")
            {
                if (o_game.data.quarks.reactor.count < reactor_size)
                {
                    threshold_flag = false;
                }
            }
            else if (o_game.data.quarks.reactor.count < reactor_size)
            {
                if (quark.get_add_chance() < threshold)
                {
                    threshold_flag = false;
                }
            }
            if (!threshold_flag)
            {
                remove_from_array_by_key(quarks_available, quark.key);
                continue;
            }
            if (!quark.can_add())
            {
                quarks_available = _filter(global.quarks_array, function(arg0)
                {
                    return has_enough(arg0.get_add_cost());
                });
                continue;
            }
            quark.add_by_chance(undefined, arg1);
            resort_quarks = true;
        }
    }
    o_game.data.quarks.reactor.count = clamp(o_game.data.quarks.reactor.count, 0, reactor_size);
}

function get_quark_damage()
{
    var value = get_bm_value(0, "quark_damage", "quark_damage_multiplier", undefined, true);
    value *= (1 + (o_game.data.quarks.quarkstige_count * get_upgrade_attribute_value(global.upgrade_attributes.quarkstige_damage_multiplier)));
    value *= (1 + global.resources.quantum_blob.data.count);
    return value;
}

function get_quark_reactor_inc_count()
{
    var base_value = 0.01 * o_game.data.quarks.reactor.level;
    var value = get_bm_value(base_value, "quark_reactor_inc_count", "quark_reactor_inc_count_multiplier", undefined, true);
    return value;
}

function get_quark_reactor_size()
{
    var value = get_bm_value(1, "quark_reactor_size", "quark_reactor_size_multiplier", undefined, true);
    return value;
}

function can_quarkstige()
{
    var reduce_count = get_quarkstige_reduce_count();
    var __array = global.quarks_array;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (mitem.data.count < reduce_count)
        {
            return false;
        }
    }
    if (!has_enough(get_quarkstige_cost()))
    {
        return false;
    }
    return true;
}

function get_quarkstige_cost()
{
    var count = 250000 * (1 + o_game.data.quarks.quarkstige_count);
    var cost = 
    {
        resources: 
        {
            quark: count
        }
    };
    return cost;
}

function get_quarkstige_quantum_blob_add()
{
    var value = 1;
    return value;
}

function get_quarkstige_reduce_count()
{
    var value = 50 + (25 * o_game.data.quarks.quarkstige_count);
    value = rround(value);
    return value;
}

function quarkstige()
{
    var reduce_count = get_quarkstige_reduce_count();
    var __array = global.quarks_array;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        mitem.data.count -= reduce_count;
        mitem.data.count = max(0, mitem.data.count);
    }
    dec_result(get_quarkstige_cost());
    o_game.data.quarks.quarkstige_count++;
    var count = 1;
    var result = 
    {
        resources: 
        {
            quantum_blob: count
        }
    };
    add_result(result, undefined, undefined, true, true);
    refresh_ua_section("quarks");
}

function get_quantum_upgrade_attributes()
{
    var ua = {};
    return ua;
}

function quark_funnel_get_input(arg0 = 1)
{
    var input = 
    {
        resources: 
        {
            quark: quark_funnel_get_input_value(arg0)
        }
    };
    return input;
}

function quark_funnel_get_input_value(arg0 = 1)
{
    return 10000 * arg0;
}

function quark_funnel_get_output(arg0 = 1)
{
    var output = 
    {
        resources: 
        {
            quark_blob: 1 * arg0
        }
    };
    return output;
}

function quark_can_funnel(arg0 = 1)
{
    var can_funnel = has_enough(quark_funnel_get_input(arg0)) && !has_timeout_data("quark_funnel");
    return can_funnel;
}

function quark_funnel(arg0 = 1)
{
    var timeout_duration = get_quark_funnel_timeout_duration();
    var funnel_input = quark_funnel_get_input(arg0);
    var funnel_output = quark_funnel_get_output(arg0);
    var can_funnel = quark_can_funnel(arg0);
    set_timeout_data("quark_funnel", timeout_duration);
    dec_result(funnel_input);
    add_result(funnel_output, undefined, undefined, true, true);
}

function get_quark_funnel_timeout_duration()
{
    var base_value = sec(60);
    var value = base_value * (1 - get_upgrade_attribute_value(global.upgrade_attributes.quark_funnel_time_reduction_multiplier));
    value = max(sec(1), value);
    return value;
}

function get_quark_qs_value(arg0 = 1)
{
    var base_value = sqrt(global.resources.quark_blob.data.count) * 0.05;
    var value = get_bm_value(base_value, undefined, "quark_energy_charge_multiplier", undefined, true);
    value *= arg0;
    return value;
}

function quark_structurize()
{
    var res = get_quark_structurize_result();
    add_result(res, undefined, undefined, true, true);
    global.resources.energy_quark.data.count -= floor(global.resources.energy_quark.data.count);
    return res;
}

function quark_can_structurize()
{
    return get_quark_structurize_result_value() >= 1;
}

function get_quark_structurize_result()
{
    var res = 
    {
        resources: 
        {
            quark_structure: get_quark_structurize_result_value()
        }
    };
    return res;
}

function get_quark_structurize_result_value()
{
    var base_value = power(floor(global.resources.energy_quark.data.count), 1.05);
    var value = get_bm_value(base_value, undefined, "quark_structurize_multiplier", undefined, true);
    return value;
}

function quark_quantify_get_input(arg0 = 1)
{
    var input = 
    {
        resources: 
        {
            quark_structure: quark_quantify_get_input_value(arg0)
        }
    };
    return input;
}

function quark_quantify_get_input_value(arg0 = 1)
{
    return 1000 * arg0;
}

function quark_quantify_get_output(arg0 = 1)
{
    var output = 
    {
        resources: 
        {
            quantum_blob: 1 * arg0
        }
    };
    return output;
}

function quark_can_quantify(arg0 = 1)
{
    var can_funnel = has_enough(quark_quantify_get_input(arg0)) && !has_timeout_data("quark_quantify");
    return can_funnel;
}

function quark_quantify(arg0 = 1)
{
    var funnel_input = quark_quantify_get_input(arg0);
    var funnel_output = quark_quantify_get_output(arg0);
    var can_funnel = quark_can_quantify(arg0);
    set_timeout_data("quark_quantify", get_quantify_timeout_duration(arg0));
    dec_result(funnel_input);
    add_result(funnel_output, undefined, undefined, true, true);
}

function get_quantify_timeout_duration(arg0 = 1)
{
    var base_value = sec(300);
    var value = base_value * (1 - get_upgrade_attribute_value(global.upgrade_attributes.quark_quantify_time_reduction_multiplier));
    value = max(sec(1), value);
    return value;
}

function quark_leaftonify_get_input(arg0 = 1)
{
    var input = 
    {
        resources: 
        {
            leafton: quark_leaftonify_get_input_value(arg0)
        }
    };
    return input;
}

function quark_leaftonify_get_input_value(arg0 = 1)
{
    return 200 * arg0;
}

function quark_leaftonify_get_output(arg0 = 1)
{
    var output = 
    {
        resources: 
        {
            quantum_blob: 5 * arg0
        }
    };
    return output;
}

function quark_can_leaftonify(arg0 = 1)
{
    var can_funnel = has_enough(quark_leaftonify_get_input(arg0)) && !has_timeout_data("quark_leaftonify");
    return can_funnel;
}

function quark_leaftonify(arg0 = 1)
{
    var funnel_input = quark_leaftonify_get_input(arg0);
    var funnel_output = quark_leaftonify_get_output(arg0);
    var can_funnel = quark_can_leaftonify(arg0);
    set_timeout_data("quark_leaftonify", get_leaftonify_timeout_duration(arg0));
    dec_result(funnel_input);
    add_result(funnel_output, undefined, undefined, true, true);
}

function get_leaftonify_timeout_duration(arg0 = 1)
{
    var base_value = sec(300);
    var value = base_value * (1 - get_upgrade_attribute_value(global.upgrade_attributes.quark_leaftonify_time_reduction_multiplier));
    value = max(sec(1), value);
    return value;
}
