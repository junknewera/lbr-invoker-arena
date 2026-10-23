function apply_upgrade_attributes(arg0, arg1 = false, arg2 = "general", arg3 = undefined, arg4 = undefined, arg5 = undefined)
{
    if (!is_struct(arg0))
    {
        exit;
    }
    var global_upgrade_attributes = global.upgrade_attributes;
    var upgrade_count = 1;
    var upgrade_multiplier = 1;
    var bonus_upgrade_multiplier = 1;
    if (is_undefined(arg5))
    {
        arg5 = arg2;
    }
    var current_section = variable_struct_get(global.upgrade_sections_values, arg5);
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("data"))) && !is_undefined(struct_get_from_hash(arg0.data, variable_get_hash("count"))))
    {
        upgrade_count = get_upgrade_count(arg0);
    }
    if (arg1)
    {
        upgrade_count = 1;
    }
    if (!is_undefined(arg4))
    {
        upgrade_count = get_value_ext(arg0, arg4);
    }
    if (upgrade_count == 0 && !arg1)
    {
        exit;
    }
    if (is_undefined(struct_get_from_hash(arg0, variable_get_hash("upgrade_attributes"))) && is_undefined(struct_get_from_hash(arg0, variable_get_hash("get_upgrade_attributes"))))
    {
        exit;
    }
    var section_multiplier = variable_struct_get(global_upgrade_attributes.upgrade_section_multiplier, arg2);
    if (!is_undefined(section_multiplier))
    {
        upgrade_multiplier += section_multiplier;
    }
    if (get_default_struct_value(arg0, "add_upgrade_multiplier", false))
    {
        upgrade_multiplier += arg0.get_upgrade_multiplier();
    }
    if (get_default_struct_value(arg0, "add_bonus_upgrade_multiplier", false))
    {
        bonus_upgrade_multiplier += arg0.get_bonus_upgrade_multiplier();
    }
    var item_upgrade_attributes_var = arg0.upgrade_attributes;
    if (!is_undefined(struct_get_from_hash(arg0, variable_get_hash("get_upgrade_attributes"))))
    {
        item_upgrade_attributes_var = arg0.get_upgrade_attributes();
    }
    if (is_struct(arg3))
    {
        item_upgrade_attributes_var = arg3;
    }
    var upgrade_attributes_parts = [item_upgrade_attributes_var];
    if (!is_undefined(struct_get_from_hash(arg0, variable_get_hash("get_bonus_upgrade_attributes"))))
    {
        array_push(upgrade_attributes_parts, arg0.get_bonus_upgrade_attributes());
    }
    var i = 0;
    var len = array_length(upgrade_attributes_parts);
    while (i < len)
    {
        var ua_struct = upgrade_attributes_parts[i];
        if (!is_struct(ua_struct))
        {
        }
        else
        {
            var upgrade_count_final, upgrade_multiplier_type;
            if (i == 0)
            {
                upgrade_multiplier_type = upgrade_multiplier;
                upgrade_count_final = upgrade_count;
            }
            else if (i == 1)
            {
                upgrade_multiplier_type = 1;
                upgrade_count_final = arg0.get_upgrade_level();
            }
            var upgrade_count_final_base = upgrade_count_final;
            var __struct = ua_struct;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                var _upgrade_value = mitem;
                var _upgrade_key = mkey;
                if (is_struct(_upgrade_value) && !is_method(_upgrade_value))
                {
                    var __struct2 = _upgrade_value;
                    var __prop_names2 = struct_get_names(__struct2);
                    var __prop_len2 = array_length(__prop_names2);
                    for (var __i2 = 0; __i2 < __prop_len2; __i2++)
                    {
                        var mkey2 = __prop_names2[__i2];
                        var mitem2 = variable_struct_get(__struct2, mkey2);
                        var _upgrade_res_value = mitem2;
                        var _upgrade_res_key = mkey2;
                        if (is_undefined(variable_struct_get(global_upgrade_attributes, _upgrade_key)))
                        {
                            set_struct_value(global_upgrade_attributes, _upgrade_key, 0);
                        }
                        var upgrade_value_real = get_value_ext(arg0, _upgrade_res_value, 0);
                        if (!is_numeric(upgrade_value_real))
                        {
                            continue;
                        }
                        upgrade_count_final = upgrade_count_final_base;
                        if (!is_undefined(struct_get_from_hash(arg0, variable_get_hash("upgrade_count_max"))) && !is_undefined(variable_struct_get(arg0.upgrade_count_max, _upgrade_key)) && !is_undefined(variable_struct_get(variable_struct_get(arg0.upgrade_count_max, _upgrade_key), _upgrade_res_key)))
                        {
                            upgrade_count_final = min(upgrade_count_final, get_value_ext(arg0, variable_struct_get(variable_struct_get(arg0.upgrade_count_max, _upgrade_key), _upgrade_res_key), upgrade_count_final));
                        }
                        if (!is_numeric(upgrade_count_final) || !is_numeric(upgrade_multiplier_type))
                        {
                            continue;
                        }
                        var upgrade_value_final = upgrade_value_real * upgrade_count_final * upgrade_multiplier_type;
                        if (!is_undefined(struct_get_from_hash(arg0, variable_get_hash("upgrade_override_value"))) && !is_undefined(variable_struct_get(arg0.upgrade_override_value, _upgrade_key)) && !is_undefined(variable_struct_get(variable_struct_get(arg0.upgrade_override_value, _upgrade_key), _upgrade_res_key)))
                        {
                            upgrade_value_final = get_value_ext(arg0, variable_struct_get(variable_struct_get(arg0.upgrade_override_value, _upgrade_key), _upgrade_res_key));
                        }
                        add_to_struct_value(variable_struct_get(global_upgrade_attributes, _upgrade_key), _upgrade_res_key, upgrade_value_final);
                        if (is_undefined(variable_struct_get(current_section, _upgrade_key)))
                        {
                            variable_struct_set(current_section, _upgrade_key, {});
                        }
                        if (is_undefined(variable_struct_get(variable_struct_get(current_section, _upgrade_key), _upgrade_res_key)))
                        {
                            set_struct_value(variable_struct_get(current_section, _upgrade_key), _upgrade_res_key, 0);
                        }
                        add_to_struct_value(variable_struct_get(current_section, _upgrade_key), _upgrade_res_key, upgrade_value_final);
                    }
                }
                else
                {
                    if (is_undefined(variable_struct_get(global_upgrade_attributes, _upgrade_key)))
                    {
                        set_struct_value(global_upgrade_attributes, _upgrade_key, 0);
                    }
                    var upgrade_value_real = get_value_ext(arg0, _upgrade_value, 0);
                    if (!is_numeric(upgrade_value_real))
                    {
                    }
                    else
                    {
                        upgrade_count_final = upgrade_count_final_base;
                        if (!is_undefined(struct_get_from_hash(arg0, variable_get_hash("upgrade_count_max"))) && !is_undefined(variable_struct_get(arg0.upgrade_count_max, _upgrade_key)))
                        {
                            upgrade_count_final = min(upgrade_count_final, get_value_ext(arg0, variable_struct_get(arg0.upgrade_count_max, _upgrade_key), upgrade_count_final));
                        }
                        if (!is_numeric(upgrade_count_final) || !is_numeric(upgrade_multiplier_type))
                        {
                        }
                        else
                        {
                            var upgrade_value_final = upgrade_value_real * upgrade_count_final * upgrade_multiplier_type;
                            if (!is_undefined(struct_get_from_hash(arg0, variable_get_hash("upgrade_override_value"))) && !is_undefined(variable_struct_get(arg0.upgrade_override_value, _upgrade_key)))
                            {
                                upgrade_value_final = get_value_ext(arg0, variable_struct_get(arg0.upgrade_override_value, _upgrade_key));
                            }
                            variable_struct_set(global_upgrade_attributes, _upgrade_key, variable_struct_get(global_upgrade_attributes, _upgrade_key) + upgrade_value_final);
                            if (is_undefined(variable_struct_get(current_section, _upgrade_key)))
                            {
                                set_struct_value(current_section, _upgrade_key, 0);
                            }
                            variable_struct_set(current_section, _upgrade_key, variable_struct_get(current_section, _upgrade_key) + upgrade_value_final);
                        }
                    }
                }
            }
        }
        i++;
    }
}
