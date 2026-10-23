function format_resources_text(arg0, arg1 = false)
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
        var resource = variable_struct_get(global.resources, mkey);
        if (arg1 && mitem == 0)
        {
            continue;
        }
        var text = sprintf("%s %s", number_format(mitem), pluralize(mitem, resource.name_single, resource.name_plural));
        array_push(text_array, text);
    }
    return implode(", ", text_array);
}
