function format_upgrade_text(arg0, arg1 = 1, arg2 = false, arg3 = undefined, arg4 = ", ", arg5 = true, arg6 = undefined, arg7 = false, arg8 = undefined, arg9 = false, arg10 = undefined)
{
    if (!is_struct(arg0))
    {
        return "";
    }
    var item_is_struct = is_struct(arg3);
    var text = [];
    if (arg9)
    {
        arg2 = false;
    }
    var __struct = arg0;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        if (is_array(arg8) && in_array(mkey, arg8))
        {
            continue;
        }
        if (is_struct(mitem))
        {
            var upgrade_text_root_final = is_undefined(arg6) ? mkey : arg6;
            var upgrade_text = format_upgrade_text(mitem, arg1, arg2, arg3, arg4, arg5, upgrade_text_root_final, arg7, arg8, arg9, arg10);
            if (is_array(upgrade_text))
            {
                array_push(text, implode("\n", upgrade_text));
            }
            else if (is_string(upgrade_text) && !is_empty(upgrade_text))
            {
                array_push(text, upgrade_text);
            }
        }
        else
        {
            var value = get_value_ext(-1, mitem);
            if (!is_numeric(value))
            {
                value = 0;
            }
            if (arg2 && value == 0)
            {
            }
            else
            {
                var multiplier_final = arg1;
                if (item_is_struct && !is_undefined(struct_get_from_hash(arg3, variable_get_hash("upgrade_count_max"))) && !is_undefined(variable_struct_get(arg3.upgrade_count_max, mkey)))
                {
                    multiplier_final = min(multiplier_final, get_value_ext(arg3, variable_struct_get(arg3.upgrade_count_max, mkey), multiplier_final));
                }
                var upgrade_value_final = value * multiplier_final;
                if (item_is_struct && !is_undefined(struct_get_from_hash(arg3, variable_get_hash("upgrade_attributes_max"))) && !is_undefined(variable_struct_get(arg3.upgrade_attributes_max, mkey)))
                {
                    upgrade_value_final = min(upgrade_value_final, get_value_ext(arg3, variable_struct_get(arg3.upgrade_attributes_max, mkey), upgrade_value_final));
                }
                if (item_is_struct && !is_undefined(struct_get_from_hash(arg3, variable_get_hash("upgrade_override_value"))) && !is_undefined(variable_struct_get(arg3.upgrade_override_value, mkey)))
                {
                    upgrade_value_final = get_value_ext(arg3, variable_struct_get(arg3.upgrade_override_value, mkey));
                }
                var text_final = get_upgrade_text(mkey, upgrade_value_final, undefined, undefined, arg7);
                if (!is_undefined(arg6))
                {
                    text_final = get_upgrade_text(arg6, upgrade_value_final, mkey, undefined, arg7);
                }
                var upgrade_text_item = variable_struct_get(global.texts_upgrade_attributes, mkey);
                if (is_struct(upgrade_text_item) && upgrade_text_item.text_only)
                {
                    return text_final;
                }
                if (arg9)
                {
                    if (!is_undefined(arg6))
                    {
                        var modifier_value = get_upgrade_text(arg6, variable_struct_get(arg10, mkey), mkey, undefined, arg7, true);
                        if (!is_empty(modifier_value))
                        {
                            text_final += sprintf(" (%s)", modifier_value);
                        }
                    }
                    else
                    {
                        var modifier_value = get_upgrade_text(mkey, variable_struct_get(arg10, mkey), undefined, undefined, arg7, true);
                        if (!is_empty(modifier_value))
                        {
                            text_final += sprintf(" (%s)", modifier_value);
                        }
                    }
                }
                array_push(text, text_final);
            }
        }
    }
    if (arg5)
    {
        quicksort(text, true);
    }
    return implode(arg4, text);
}

function format_upgrade_text_names_only(arg0, arg1 = ", ", arg2 = true)
{
    if (!is_struct(arg0))
    {
        return "";
    }
    var text_array = [];
    var __struct = arg0;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        var text;
        if (is_struct(mitem) && !is_undefined(struct_get_from_hash(mitem, variable_get_hash("__resource_key"))))
        {
            text = get_upgrade_text(mkey, variable_struct_get(mitem, mitem.__resource_key), mitem.__resource_key, true);
        }
        else if (is_struct(mitem) && !is_undefined(struct_get_from_hash(mitem, variable_get_hash("__collection_key"))))
        {
            text = get_upgrade_text(mkey, variable_struct_get(mitem, mitem.__collection_key), mitem.__collection_key, true);
        }
        else
        {
            text = get_upgrade_text(mkey, mitem, undefined, true);
        }
        array_push(text_array, text);
    }
    if (arg2)
    {
        quicksort(text_array, true);
    }
    return implode(arg1, text_array);
}
