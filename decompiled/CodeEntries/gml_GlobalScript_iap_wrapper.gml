function get_dlc_prices()
{
    if (global.is_pc)
    {
        get_steam_dlc_prices();
    }
}

function get_steam_dlc_prices()
{
    post_to_cloud("iap", "get_prices", undefined, function(arg0)
    {
        if (!is_struct(arg0) || !is_struct(struct_get_from_hash(arg0, variable_get_hash("prices"))))
        {
            exit;
        }
        var __struct = arg0.prices;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            variable_struct_set(global.dlc_prices, mitem.item_id, 
            {
                currency: "$",
                initial: mitem.price_initial / 100,
                final: mitem.price_final / 100
            });
        }
    });
    var __array = [global.is_mobile ? "borbventure_pack" : "2239260", global.is_mobile ? "cards_pack" : "2125730", global.is_mobile ? "dice_pack" : 10001, global.is_mobile ? "fishing_pack" : 10003, global.is_mobile ? "gems_pack_uncommon" : 11001, global.is_mobile ? "gems_pack_epic" : 11002, global.is_mobile ? "gems_pack_legendary" : 11003, global.is_mobile ? "materials_pack" : "1873910", global.is_mobile ? "mines_pack" : 10002, global.is_mobile ? "nature_pack" : 10000, global.is_mobile ? "premium_pack" : "1482631", global.is_mobile ? "skins_pack" : "1482632", global.is_mobile ? "supporter_pack" : "1482630"];
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (get_default_struct_value(mitem, "is_free", false))
        {
            continue;
        }
        if (get_default_struct_value(mitem, "is_iap", false))
        {
            continue;
        }
        var url = sprintf("https://store.steampowered.com/api/appdetails?appids=%s&cc=us", mitem);
        get_url_contents(url, function(arg0, arg1)
        {
            try
            {
                var result = json_parse(arg0);
                if (!is_struct(result))
                {
                    exit;
                }
                var item_id = arg1.item_id;
                var item = variable_struct_get(result, item_id);
                if (!is_struct(item.data) || !is_struct(item.data.price_overview))
                {
                    exit;
                }
                variable_struct_set(global.dlc_prices, item_id, 
                {
                    currency: item.data.price_overview.currency,
                    initial: item.data.price_overview.initial / 100,
                    final: item.data.price_overview.final / 100
                });
            }
            catch (_err)
            {
            }
        }, undefined, undefined, false, 
        {
            item_id: mitem
        });
    }
}

function handle_iap_init_response(arg0)
{
    var dlc_id = get_default_struct_value(arg0, "dlc_id", undefined);
    var res_guid = get_default_struct_value(arg0, "guid", undefined);
    var order_id = get_default_struct_value(arg0, "order_id", undefined);
    if (is_undefined(dlc_id) || is_undefined(res_guid) || is_undefined(order_id))
    {
        return notify_error(__("Invalid IAP data. Please try again later."));
    }
    variable_struct_set(o_game.data.dlc_orders, order_id, 
    {
        dlc_id: dlc_id,
        guid: res_guid,
        order_id: order_id
    });
}

function handle_steam_finalize_response(arg0)
{
    log("handle steam finalize", arg0);
    var dlc_id = get_default_struct_value(arg0, "dlc_id", undefined);
    if (is_undefined(dlc_id))
    {
        exit;
    }
    if (!is_struct(variable_struct_get(o_game.data.dlc_cache, 0)))
    {
        variable_struct_set(o_game.data.dlc_cache, 0, {});
    }
    variable_struct_set(variable_struct_get(o_game.data.dlc_cache, 0), dlc_id, true);
    variable_struct_get(global.dlc_items, dlc_id).data.count = 1;
    notify(__("Transaction successful. Thank you for your support!"), "success");
    save_game();
}

function handle_steam_iap_response(arg0)
{
    if (ds_map_find_value(arg0, "event_type") == "micro_txn_auth_response")
    {
        var order_id = ds_map_find_value(arg0, "order_id");
        var order = variable_struct_get(o_game.data.dlc_orders, order_id);
        if (!is_struct(order))
        {
            return text_dialog(__("Invalid transaction. Please try again."));
        }
        var dlc_id = order.dlc_id;
        var timeout_name = sprintf("iap_timeout_%s", dlc_id);
        variable_struct_remove(global.timeouts, timeout_name);
        if (ds_map_find_value(arg0, "success") == 0)
        {
            log("cancel iap");
            post_to_cloud("iap", "cancel_iap", 
            {
                order_id: ds_map_find_value(arg0, "order_id")
            }, undefined, undefined, undefined, undefined, false);
            return text_dialog(__("Transaction was cancelled. Please try again."), undefined, undefined, "supporter_shop");
        }
        post_to_cloud("iap", "finalize_txn", 
        {
            order_id: ds_map_find_value(arg0, "order_id")
        }, handle_steam_finalize_response, notify_error);
    }
}

function has_any_dlc_pack()
{
    return _any(global.shops.dlc, function(arg0)
    {
        if (!get_default_struct_value(arg0, "is_paid", false))
        {
            return false;
        }
        return is_dlc_purchase_valid(arg0.dlc_id);
    }, false);
}

function is_dlc_purchase_pending(arg0)
{
    if (global.is_android)
    {
        if (is_undefined(arg0))
        {
            return false;
        }
        var android_purchase_data = get_default_struct_value(o_mobile_helper.purchasesData, arg0);
        if (is_undefined(android_purchase_data))
        {
            return false;
        }
        return android_purchase_data.acknowledged == 0;
    }
    return false;
}

function is_dlc_purchase_valid(arg0)
{
    if (global.debug)
    {
        return true;
    }
    var shop_item = variable_struct_get(global.dlc_items, arg0);
    var is_free = get_default_struct_value(shop_item, "is_free", false);
    is_free = get_value_ext(shop_item, is_free);
    if (is_struct(shop_item) && is_free)
    {
        return true;
    }
    if (!is_struct(variable_struct_get(o_game.data.dlc_status, 0)))
    {
        variable_struct_set(o_game.data.dlc_status, 0, {});
    }
    var dlc_status = variable_struct_get(variable_struct_get(o_game.data.dlc_status, 0), shop_item.key);
    if (is_struct(dlc_status))
    {
        if (gdsv(dlc_status, "count", 0) > 0)
        {
            return true;
        }
    }
    if (global.is_mobile)
    {
        if (!instance_exists(o_mobile_helper))
        {
            return false;
        }
        if (!is_struct(o_mobile_helper.purchasesData))
        {
            return false;
        }
        if (global.is_android)
        {
            if (arg0 == "material_pack")
            {
                arg0 = "materials_pack";
            }
            var android_purchase_data = variable_struct_get(o_mobile_helper.purchasesData, arg0);
            if (is_undefined(android_purchase_data))
            {
                return false;
            }
            if (!is_struct(android_purchase_data))
            {
                return false;
            }
            if (is_undefined(struct_get_from_hash(android_purchase_data, variable_get_hash("acknowledged"))))
            {
                return false;
            }
            return android_purchase_data.acknowledged;
        }
        else if (global.is_ios)
        {
            var dlc_data = variable_struct_get(o_mobile_helper.purchasesData, arg0);
            if (!is_struct(dlc_data))
            {
                return false;
            }
            var purchaseState = struct_get_from_hash(dlc_data, variable_get_hash("purchaseState"));
            if (purchaseState == 23002)
            {
                return false;
            }
            return true;
        }
    }
    else if (global.is_opera)
    {
        return is_dlc_claimed(arg0);
    }
    else if (global.is_pc)
    {
        var is_iap = get_default_struct_value(shop_item, "is_iap", false);
        if (is_iap)
        {
            if (!is_struct(variable_struct_get(o_game.data.dlc_cache, 0)))
            {
                variable_struct_set(o_game.data.dlc_cache, 0, {});
            }
            var bought = get_default_struct_value(variable_struct_get(o_game.data.dlc_cache, 0), arg0, false);
            return bought;
        }
        return steam_user_owns_dlc(arg0);
    }
    return false;
}
