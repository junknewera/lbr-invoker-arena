function init_item_upgrades(arg0)
{
    if (!is_struct(arg0) || !is_struct(struct_get_from_hash(arg0, variable_get_hash("upgrades"))))
    {
        exit;
    }
    var upgrade_max_level = get_default_struct_value(arg0, "upgrade_max_level", 10);
    var __struct = arg0.upgrades;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_get(__struct, mkey).max_level = get_default_struct_value(mitem, "max_level", upgrade_max_level);
    }
}
