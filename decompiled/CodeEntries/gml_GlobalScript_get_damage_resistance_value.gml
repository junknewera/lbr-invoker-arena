function get_damage_resistance_value(arg0)
{
    if (!is_struct(arg0))
    {
        return 0;
    }
    var resistance_final = 0;
    var __struct = global.damage_types;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        var resistance_type_value = get_damage_resistance_value_single(mitem, arg0);
        resistance_final += resistance_type_value;
    }
    return resistance_final;
}

function get_damage_resistance_value_single(arg0, arg1)
{
    if (!is_struct(arg0) || !is_struct(arg1))
    {
        return 0;
    }
    var resistance_type_value = arg0.get_resistance(arg1);
    resistance_type_value *= get_upgrade_attribute_value(variable_struct_get(global.upgrade_attributes.damage_types, arg0.key));
    return resistance_type_value;
}
