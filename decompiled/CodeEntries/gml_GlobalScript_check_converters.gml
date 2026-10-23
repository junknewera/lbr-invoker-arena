function can_converter_convert(arg0)
{
    if (!arg0.data.started)
    {
        return false;
    }
    var resources_from_to = get_converter_input_resources(arg0);
    if (!has_enough_resources(resources_from_to.from))
    {
        return false;
    }
    if (!arg0.resource_to.data.unlocked)
    {
        return false;
    }
    if (!arg0.data.unlocked)
    {
        return false;
    }
    if (arg0.resource_to.is_energy)
    {
        var safe_count_value = 0;
        if (get_upgrade_count(global.shops.gems.converters_safe_energy_storage) > 0 && global.shops.gems.converters_safe_energy_storage.data.toggle)
        {
            safe_count_value = arg0.get_reward_value();
        }
        if ((arg0.resource_to.data.count + safe_count_value) > get_max_energy_storage(arg0.resource_to))
        {
            return false;
        }
    }
    return true;
}

function check_converters()
{
    if (!global.game_settings.converters_enabled || !is_unlocked_converters())
    {
        exit;
    }
    var __struct = global.converters;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        if (!mitem.data.unlocked)
        {
            mitem.check_unlock();
        }
        convert_resources(mitem, false, true);
    }
}

function convert_resources(arg0, arg1 = 0, arg2 = true)
{
    if (!can_converter_convert(arg0))
    {
        exit;
    }
    var crit = false;
    var resources_from_to = get_converter_input_resources(arg0);
    if (arg1 > 0)
    {
        var max_count = floor(arg0.resource_from.data.count / max(1, variable_struct_get(resources_from_to.from, arg0.resource_from.key)));
        var convert_count_real = min(max_count, arg1);
        resources_from_to.from = multiply_struct_values(resources_from_to.from, convert_count_real);
        resources_from_to.to = multiply_struct_values(resources_from_to.to, convert_count_real);
        if (arg0.resource_to.is_energy)
        {
            var limit_energy_converter = is_shop_item_enabled(global.shops.gems.converters_safe_energy_storage);
            var max_energy_storage = get_max_energy_storage(arg0.resource_to);
            var resources_to_new = arg0.resource_to.data.count + arg0.get_reward_value(arg1);
            if (limit_energy_converter && resources_to_new > max_energy_storage)
            {
                var energy_storage_diff = max_energy_storage - arg0.resource_to.data.count;
                var max_conversion_count_to = floor(energy_storage_diff / arg0.get_reward_value());
                var max_conversion_count_from = floor(arg0.resource_from.data.count / arg0.get_input_value());
                var max_conversion_count = min(max_conversion_count_from, max_conversion_count_to);
                resources_from_to = get_converter_input_resources(arg0);
                resources_from_to.from = multiply_struct_values(resources_from_to.from, max_conversion_count);
                resources_from_to.to = multiply_struct_values(resources_from_to.to, max_conversion_count);
                var __struct = resources_from_to;
                var __prop_names = struct_get_names(__struct);
                var __prop_len = array_length(__prop_names);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mkey = __prop_names[__i];
                    var mitem = variable_struct_get(__struct, mkey);
                    var __struct2 = mitem;
                    var __prop_names2 = struct_get_names(__struct2);
                    var __prop_len2 = array_length(__prop_names2);
                    for (var __i2 = 0; __i2 < __prop_len2; __i2++)
                    {
                        var mkey2 = __prop_names2[__i2];
                        var mitem2 = variable_struct_get(__struct2, mkey2);
                        variable_struct_set(__struct2, mkey2, rround(variable_struct_get(__struct2, mkey2)));
                    }
                }
            }
        }
    }
    else if (!arg0.static_resources && !arg0.fixed && percent_chance(get_converter_crit_chance() * 100))
    {
        crit = true;
        resources_from_to.to = arg0.get_crit_resources();
    }
    if (!has_enough_resources(resources_from_to.from))
    {
        exit;
    }
    if (arg2)
    {
        dec_resources(resources_from_to.from, false);
        add_resources(resources_from_to.to, false, false);
        arg0.data.converted_loops++;
        if (crit)
        {
            arg0.data.converted_crits++;
        }
        arg0.data.converted_res_from += get_resources_count_from_object(resources_from_to.from);
        arg0.data.converted_res_to += get_resources_count_from_object(resources_from_to.to);
    }
    return 
    {
        from: resources_from_to.from,
        to: resources_from_to.to
    };
}

function convert_lite(arg0, arg1, arg2 = undefined, arg3 = undefined, arg4 = 1)
{
    if (!is_struct(arg0) || !is_struct(arg1))
    {
        exit;
    }
    dec_result(arg0, arg4);
    add_result_lite(arg1, arg4);
    if (is_string(arg2) && is_numeric(arg3))
    {
        set_timeout_data(arg2, arg3);
    }
}

function get_converter_crit_chance()
{
    return global.upgrade_attributes.converter_crit_chance;
}

function get_converter_delay()
{
    var converter_delay = 1 / (1 + get_upgrade_attribute_value(global.upgrade_attributes.converter_speed));
    converter_delay = max(0.1, converter_delay);
    return sec(converter_delay);
}

function get_converter_input_resources(arg0)
{
    var count_per_batch = 1;
    if (get_option(global.options.converter_batch_enabled))
    {
        count_per_batch += global.upgrade_attributes.converter_batch_count;
    }
    var res_from_real = {};
    var res_to_real = {};
    _map(arg0.cost, function(arg0, arg1, arg2, arg3)
    {
        var value = rround((arg0 * arg3.count_per_batch * (100 - global.upgrade_attributes.converter_reduce_input_recources)) / 100);
        variable_struct_set(arg3.res_from_real, arg1, max(1, value));
        if (arg3.converter.fixed)
        {
            variable_struct_set(arg3.res_from_real, arg1, arg0);
        }
        else if (arg3.converter.static_resources)
        {
            variable_struct_set(arg3.res_from_real, arg1, arg0);
        }
    }, 
    {
        converter: arg0,
        count_per_batch: count_per_batch,
        res_from_real: res_from_real
    });
    _map(arg0.reward, function(arg0, arg1, arg2, arg3)
    {
        variable_struct_set(arg3.res_to_real, arg1, rround(arg3.count_per_batch * ((1 + variable_struct_get(global.upgrade_attributes.converter_output_add, arg1) + global.upgrade_attributes.converter_output_add_global) * (1 + global.upgrade_attributes.converter_output_multiplier_global))));
        if (arg3.converter.fixed)
        {
            variable_struct_set(arg3.res_to_real, arg1, arg0);
        }
        else if (arg3.converter.static_resources)
        {
            variable_struct_set(arg3.res_to_real, arg1, arg0 * (1 + global.upgrade_attributes.converter_output_static_multiplier_global));
        }
    }, 
    {
        converter: arg0,
        count_per_batch: count_per_batch,
        res_to_real: res_to_real
    });
    return 
    {
        from: res_from_real,
        to: res_to_real
    };
}

function start_all_converters(arg0)
{
    var __struct = global.converters;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        if (arg0 && !mitem.data.auto_start)
        {
            continue;
        }
        mitem.data.started = true;
    }
}

function stop_all_converters()
{
    _map(global.converters, function(arg0)
    {
        arg0.data.started = false;
    }, false);
}
