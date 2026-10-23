function get_options_filename(arg0 = global.current_profile)
{
    if (arg0 == global.profile_types.challenge)
    {
        return "options-challenge.dat";
    }
    return "options.dat";
}

function save_options(arg0 = global.current_profile)
{
    var filename_tmp = "options.tmp";
    var filename = get_options_filename(arg0);
    log("=== save options ===", filename);
    var save_data_options = {};
    var __array = global.options_sorted;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        variable_struct_set(save_data_options, mitem.key, mitem.data);
    }
    var save_data_options_string = json_stringify(save_data_options);
    save_string_to_file(save_data_options_string, filename_tmp);
    if (is_valid_json_file(filename_tmp))
    {
        file_copy(filename_tmp, filename);
        file_delete(filename_tmp);
    }
    else
    {
        notify_error(__("Unable to save options."));
    }
}
