function check_leaf_printer()
{
    if (!is_unlocked_printers())
    {
        exit;
    }
    var resources_collect = {};
    var max_printers = get_max_printer_storage();
    var printer_add_value = get_cache("printer_printer", 0);
    var __struct = global.shops.printers;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        if (!variable_struct_get(global.resources, mitem.resource.key).data.unlocked || variable_struct_get(global.resources, mitem.resource.key).data.collected_total == 0)
        {
            continue;
        }
        var print_value = get_printer_value(mitem);
        variable_struct_set(resources_collect, mitem.resource.key, print_value);
        o_game.data.stats.prints_total += print_value;
        variable_struct_set(o_game.data.stats.prints, mitem.resource.key, variable_struct_get(o_game.data.stats.prints, mitem.resource.key) + print_value);
        add_to_struct_value(o_game.data.stats.prints_total_type, mitem.resource.key, print_value);
        mitem.data.count += printer_add_value;
        mitem.data.count = min(mitem.data.count, max_printers);
    }
    add_resources(resources_collect, false, false);
}
