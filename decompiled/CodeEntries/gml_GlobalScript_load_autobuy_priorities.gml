function load_autobuy_priorities(arg0)
{
    var shops = arg0;
    if (is_numeric(arg0))
    {
        shops = variable_struct_get(global.autobuy_priorities, arg0);
    }
    if (!is_array(shops))
    {
        exit;
    }
    var __array = shops;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        var shop = variable_struct_get(global.shops, mitem.shop_key);
        if (is_undefined(shop))
        {
            continue;
        }
        var shop_item = variable_struct_get(shop, mitem.shop_item_key);
        if (is_undefined(shop_item))
        {
            continue;
        }
        var __struct2 = mitem.settings;
        var __prop_names2 = struct_get_names(__struct2);
        var __prop_len2 = array_length(__prop_names2);
        for (var __i2 = 0; __i2 < __prop_len2; __i2++)
        {
            var mkey2 = __prop_names2[__i2];
            var mitem2 = variable_struct_get(__struct2, mkey2);
            variable_struct_set(shop_item.data, mkey2, mitem2);
        }
    }
    __array = global.shops_items_array_autobuyers;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        mitem.auto_upgrade_sorted_items_cache = undefined;
    }
}
