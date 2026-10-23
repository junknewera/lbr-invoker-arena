function get_autobuy_priorities()
{
    var priorities = [];
    var __struct = global.shops;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        var __struct2 = mitem;
        var __prop_names2 = struct_get_names(__struct2);
        var __prop_len2 = array_length(__prop_names2);
        for (var __i2 = 0; __i2 < __prop_len2; __i2++)
        {
            var mkey2 = __prop_names2[__i2];
            var mitem2 = variable_struct_get(__struct2, mkey2);
            if (mitem2.has_auto_upgrade)
            {
                var autobuy_item = 
                {
                    shop_key: mkey,
                    shop_item_key: mkey2,
                    settings: 
                    {
                        auto_upgrade_enabled: mitem2.data.auto_upgrade_enabled,
                        auto_upgrade_prio_user: mitem2.data.auto_upgrade_prio_user,
                        max_buy_user: mitem2.data.max_buy_user,
                        slider_value: mitem2.data.slider_value,
                        toggle: mitem2.data.toggle
                    }
                };
                array_push(priorities, autobuy_item);
            }
        }
    }
    return priorities;
}
