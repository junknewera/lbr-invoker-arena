function format_materials_text(arg0)
{
    var text_array = [];
    var __struct = arg0;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        var material = variable_struct_get(global.materials, mkey);
        if (is_undefined(material))
        {
            continue;
        }
        var text = sprintf("%s %s", number_format(mitem), pluralize(mitem, material.name, material.name_plural));
        array_push(text_array, text);
    }
    return implode(", ", text_array);
}
