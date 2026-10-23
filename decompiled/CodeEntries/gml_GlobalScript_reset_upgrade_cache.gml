function reset_upgrade_cache()
{
    var __struct = global.upgrade_sections;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(global.upgrade_sections_cache, mkey, {});
        variable_struct_set(global.upgrade_sections_cache_refresh, mkey, true);
    }
    if (variable_global_exists("upgrade_attribute_start") && is_struct(global.upgrade_attributes_start))
    {
        global.upgrade_attributes = struct_clone(global.upgrade_attributes_start);
    }
}
