if (!global.is_mobile)
{
    exit;
}
if (!ds_exists(async_load, ds_type_map) || !ds_map_exists(async_load, "id"))
{
    exit;
}
logdsmap("async iap");
if (global.is_android)
{
    switch (ds_map_find_value(async_load, "id"))
    {
        case 12005:
            connected_to_store = true;
            var __array = product_ids;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                extension_stubfunc_real(mitem);
            }
            updatePurchasesData();
            extension_stubfunc_real();
            logf("connected to store.");
            break;
        case 12006:
            connected_to_store = false;
            break;
        case 12001:
            var responseData = json_parse(ds_map_find_value(async_load, "response_json"));
            logf("got iap receipt", responseData);
            if (responseData.success)
            {
                var purchaseTokens = {};
                var purchases = responseData.purchases;
                var purchasesCount = array_length(purchases);
                for (var i = 0; i < purchasesCount; i++)
                {
                    var purchase = purchases[i];
                    var sku = struct_get_from_hash(purchase, variable_get_hash("productId"));
                    var token = struct_get_from_hash(purchase, variable_get_hash("purchaseToken"));
                    var signature = extension_stubfunc_string(token);
                    var purchaseJsonStr = extension_stubfunc_string(token);
                    if (extension_stubfunc_real(purchaseJsonStr, signature))
                    {
                        variable_struct_set(purchaseTokens, sku, token);
                        extension_stubfunc_real(token);
                        logf("gp billing acknowledge", token);
                    }
                }
            }
            break;
        case 12003:
            try
            {
                var result = json_parse(ds_map_find_value(async_load, "response_json"));
                logf("got data response result", result);
                if (!is_struct(result) || !is_array(struct_get_from_hash(result, variable_get_hash("skuDetails"))))
                {
                    exit;
                }
                var __array = result.skuDetails;
                var __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    variable_struct_set(global.dlc_prices, mitem.productId, 
                    {
                        currency: mitem.price_currency_code,
                        initial: mitem.price_amount_micros / 100000,
                        initial_price_f: mitem.price,
                        final: mitem.price_amount_micros / 100000
                    });
                    log("dlc price set", mitem.productId, variable_struct_get(global.dlc_prices, mitem.productId));
                }
            }
            catch (err)
            {
                logf("IAP data response error", err);
            }
            break;
        case 12009:
            show_debug_message("Event: gpb_subscription_data_response");
            break;
        case 12002:
            show_debug_message("Event: gpb_purchase_status");
            break;
        case 12007:
            updatePurchasesData();
            break;
        case 12008:
            updatePurchasesData();
            break;
        case 12010:
            var purchases = {};
            var queryJson = ds_map_find_value(async_load, "response_json");
            if (queryJson != "")
            {
                var queryData = json_parse(queryJson);
                if (queryData.success)
                {
                    var purchasesArray = queryData.purchases;
                    var purchasesCount = array_length(purchasesArray);
                    for (var i = 0; i < purchasesCount; i++)
                    {
                        var purchase = purchasesArray[i];
                        variable_struct_set(purchases, purchase.productId, purchase);
                    }
                }
            }
            purchasesData = purchases;
            logf("got purchase data", purchasesData, queryJson);
            break;
    }
}
else if (global.is_ios)
{
    switch (ds_map_find_value(async_load, "id"))
    {
        case 23004:
            updatePurchasesData();
            var _json = ds_map_find_value(async_load, "response_json");
            var _res = json_decode(_json);
            var _plist = struct_get_from_hash(_res, variable_get_hash("valid"));
            logf("got product update", _res);
            break;
        case 23005:
            logf("got receipt refresh");
            getting_purchase_data = false;
            updatePurchasesData();
            break;
    }
}
