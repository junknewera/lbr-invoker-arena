function get_unlock_description(arg0, arg1 = false, arg2 = "\n")
{
    if (!is_array(arg0))
    {
        return "";
    }
    var text_array = [];
    var __array = arg0;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (!is_struct(mitem) || is_undefined(struct_get_from_hash(mitem, variable_get_hash("type"))))
        {
            continue;
        }
        if (arg1 && is_unlocked_array_type(mitem))
        {
            continue;
        }
        var text_name = get_default_struct_value(global.text_unlock_descriptions, mitem.type, mitem.type);
        var text_value = is_struct(mitem) ? struct_get_from_hash(mitem, variable_get_hash("name")) : mitem.value;
        var text = sprintf(text_name, text_value);
        array_push(text_array, text);
    }
    return implode(arg2, text_array);
}
