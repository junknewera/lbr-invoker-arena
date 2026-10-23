function get_option(arg0)
{
    if (is_undefined(arg0) || !is_struct(arg0))
    {
        exit;
    }
    if (arg0.has_options)
    {
        if (is_string(arg0.data.value))
        {
            var __array = arg0.options;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                if (is_struct(mitem) && mitem.value == arg0.data.value)
                {
                    arg0.value_cache = __i;
                    return __i;
                }
            }
            arg0.value_cache = 0;
            return 0;
        }
        if (arg0.data.value >= arg0.options_length)
        {
            arg0.data.value = 0;
        }
        var option_value = arg0.options[arg0.data.value];
        if (is_struct(option_value))
        {
            arg0.value_cache = option_value.value;
        }
        else
        {
            arg0.value_cache = arg0.options[arg0.data.value];
        }
    }
    else
    {
        arg0.value_cache = arg0.data.value;
    }
    return arg0.value_cache;
}

function get_option_row(arg0)
{
    if (!is_struct(arg0))
    {
        exit;
    }
    if (!arg0.has_options)
    {
        exit;
    }
    if (!between(arg0.data.value, 0, array_length(arg0.options) - 1))
    {
        exit;
    }
    var option_struct = arg0.options[arg0.data.value];
    return option_struct;
}

function get_option_text(arg0)
{
    if (!is_struct(arg0))
    {
        exit;
    }
    var value = get_option(arg0);
    if (arg0.has_options)
    {
        var option_struct = arg0.options[arg0.data.value];
        return get_default_struct_value(option_struct, "text", "");
    }
    return value;
}
