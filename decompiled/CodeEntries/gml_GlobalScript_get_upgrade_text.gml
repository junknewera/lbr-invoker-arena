function get_upgrade_text(arg0, arg1, arg2 = undefined, arg3 = false, arg4 = true, arg5 = false)
{
    if (is_undefined(arg1))
    {
        return "";
    }
    var upgrade = variable_struct_get(global.texts_upgrade_attributes, arg0);
    var places = undefined;
    var value = arg1;
    if (arg1 < 1 && value > 0)
    {
        places = ceil(abs(log10(value)));
        places = clamp(places, 0, 5);
    }
    var desc = arg0;
    var usign = (arg1 >= 0) ? "+" : "";
    if (is_struct(upgrade))
    {
        desc = upgrade.text;
        if (is_struct(upgrade.text) && !is_undefined(arg2) && !is_undefined(variable_struct_get(upgrade.text, arg2)))
        {
            desc = variable_struct_get(upgrade.text, arg2);
        }
        var obfuscated = false;
        if (is_array(upgrade.is_visible) && !upgrade.is_visible[0]())
        {
            obfuscated = true;
        }
        if (is_struct(upgrade.parent) && is_array(upgrade.parent.is_visible) && !upgrade.parent.is_visible[0]())
        {
            obfuscated = true;
        }
        if (obfuscated && arg4)
        {
            desc = "???";
        }
        if (upgrade.usign == -1)
        {
            usign = (arg1 >= 0) ? "-" : "+";
        }
        if (arg1 == 0)
        {
            usign = "";
        }
        if (upgrade.text_only)
        {
            arg3 = true;
        }
        if (is_struct(upgrade.collection_format_exceptions) && is_struct(variable_struct_get(upgrade.collection_format_exceptions, arg2)))
        {
            arg1 *= variable_struct_get(upgrade.collection_format_exceptions, arg2).value;
        }
        if (!is_undefined(upgrade.decimal_numbers))
        {
            places = upgrade.decimal_numbers;
        }
        if (upgrade.is_pct)
        {
            value = number_format(arg1 * 100);
        }
        else
        {
            value = number_format(arg1, places);
        }
    }
    else
    {
        value = number_format(arg1, places);
    }
    if (arg3)
    {
        return desc;
    }
    var text = sprintf("%s: %s%s", desc, usign, value);
    var text_final = text;
    if (is_struct(upgrade))
    {
        text_final = sprintf("%s%s%s", upgrade.prefix, text, upgrade.suffix);
    }
    if (arg5)
    {
        if (is_struct(upgrade))
        {
            return sprintf("%s%s%s%s", usign, upgrade.prefix, value, upgrade.suffix);
        }
        else
        {
            return sprintf("%s%s", usign, value);
        }
    }
    return text_final;
}
