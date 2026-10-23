function prepare_text(arg0)
{
    var text_parts = explode("<@", arg0);
    var text_parts_length = array_length(text_parts);
    if (text_parts_length <= 1)
    {
        return arg0;
    }
    var __array = text_parts;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        var tmp_array = explode(">", mitem);
        if (array_length(tmp_array) <= 1)
        {
            return log("Invalid color text syntax", mitem);
        }
        var tmp_color = @@array_get@@(tmp_array, 1);
        asset_get_index(tmp_color);
        arg0 = string_replace(arg0, "<@" + tmp_color + ">", "");
    }
    return arg0;
}
