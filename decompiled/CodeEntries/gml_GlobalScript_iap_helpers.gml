function iap_helpers()
{
}

function add_iap_order(arg0 = 0, arg1, arg2, arg3)
{
    if (is_undefined(variable_struct_get(o_game.data.dlc_orders, arg0)))
    {
        variable_struct_set(o_game.data.dlc_orders, arg0, {});
    }
    if (is_undefined(variable_struct_get(o_game.data.dlc_cache, arg0)))
    {
        variable_struct_set(o_game.data.dlc_cache, arg0, {});
    }
    variable_struct_set(variable_struct_get(o_game.data.dlc_orders, arg0), arg1, 
    {
        dlc_id: arg1,
        guid: arg2,
        order_id: arg3
    });
    variable_struct_set(variable_struct_get(o_game.data.dlc_cache, arg0), arg1, true);
}

function restore_dlc_purchases(arg0 = false)
{
    if (global.is_mobile)
    {
        if (!instance_exists(o_mobile_helper))
        {
            exit;
        }
        if (global.is_ios)
        {
            extension_stubfunc_real();
        }
        with (o_mobile_helper)
        {
            updatePurchasesData();
        }
        exit;
    }
    if (global.is_pc && arg0)
    {
        post_to_cloud("iap", "verify", 
        {
            player_orders: json_stringify(o_game.data.dlc_orders)
        }, function(arg0)
        {
            if (!is_array(struct_get_from_hash(arg0, variable_get_hash("orders"))))
            {
                exit;
            }
            variable_struct_set(o_game.data.dlc_cache, 0, {});
            variable_struct_set(o_game.data.dlc_orders, 0, {});
            var restore_count = 0;
            var __array = arg0.orders;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                var order_row = mitem;
                if (!is_struct(order_row))
                {
                    continue;
                }
                var order_id = order_row.order_id;
                var dlc_id = order_row.dlc_id;
                variable_struct_set(variable_struct_get(o_game.data.dlc_cache, 0), dlc_id, true);
                add_iap_order(0, dlc_id, get_default_struct_value(order_row, "guid", ""), order_id);
                restore_count++;
            }
            if (restore_count > 0)
            {
                notify(__s("%s %s restored.", restore_count, pluralize(restore_count, __("item"), __("items"))), "success");
                restore_dlc_purchases();
            }
        });
    }
    var __struct = global.shops.dlc;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        if (get_upgrade_count(mitem) >= 1)
        {
            continue;
        }
        if (!is_dlc_purchase_valid(mitem.dlc_id))
        {
            log("User doesn't own DLC", mitem.name);
        }
        else
        {
            mitem.data.count = 1;
        }
    }
}
