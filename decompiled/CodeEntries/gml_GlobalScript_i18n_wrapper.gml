function __(arg0)
{
    if (is_empty(arg0))
    {
        return arg0;
    }
    if (!is_undefined(variable_struct_get(global.i18n, arg0)))
    {
        return variable_struct_get(global.i18n, arg0);
    }
    return arg0;
}

function __s()
{
    if (argument_count == 0)
    {
        exit;
    }
    var str = __(argument[0]);
    var i = 1;
    while (string_pos("%s", str) != 0 && i < argument_count)
    {
        str = string_replace(str, "%s", string(argument[i++]));
    }
    return str;
}

function load_i18n(arg0 = "en")
{
    global.i18n = {};
    try
    {
        var custom_lang_filename = working_directory + "lang.txt";
        if (file_exists(custom_lang_filename))
        {
            log("use custom lang", arg0, custom_lang_filename);
            global.i18n = read_json_file(custom_lang_filename);
            exit;
        }
        if (arg0 == "en" || !is_string(arg0))
        {
            exit;
        }
        var filename = working_directory + "lang/" + arg0 + ".txt";
        if (!file_exists(filename))
        {
            return log("No translation file found", arg0, filename);
        }
        global.i18n = read_json_file(filename);
        var __struct = global.i18n;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            if (string_pos("\\n", mkey) != 0)
            {
                var sanitized = string_replace_all(mkey, "\\n", "\n");
                variable_struct_set(global.i18n, sanitized, mitem);
            }
        }
    }
    catch (err)
    {
        log(err);
        notify_error(__s("Unable to load language file: %s", arg0));
    }
}

function pluralize(arg0, arg1, arg2)
{
    return (arg0 == 1 || arg0 == -1) ? arg1 : arg2;
}

function refresh_options_i18n()
{
    var __struct = global.player_controls;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        mitem.value = __(mitem.value);
    }
    __struct = global.number_notation;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        mitem.value = __(mitem.value);
    }
    __struct = global.options;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        mitem.name = __(mitem.name);
        mitem.description = __(mitem.description);
        if (is_array(mitem.options) && array_length(mitem.options) > 0)
        {
            var __array2 = mitem.options;
            var __prop_len2 = array_length(__array2);
            for (var __i2 = 0; __i2 < __prop_len2; __i2++)
            {
                var mitem2 = __array2[__i2];
                if (!is_struct(mitem2))
                {
                    continue;
                }
                if (is_string(struct_get_from_hash(mitem2, variable_get_hash("text"))))
                {
                    mitem2.text = __(mitem2.text);
                }
            }
        }
        if (is_string(struct_get_from_hash(mitem, variable_get_hash("checkbox_text"))))
        {
            mitem.checkbox_text = __(mitem.checkbox_text);
        }
    }
}
