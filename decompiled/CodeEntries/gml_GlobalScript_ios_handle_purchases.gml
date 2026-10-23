function ios_handle_purchases(arg0, arg1 = false)
{
    if (arg1)
    {
        exit;
    }
    logf("ios handle purchase", arg0);
    if (!is_struct(o_mobile_helper.purchasesData))
    {
        o_mobile_helper.purchasesData = {};
    }
    for (var _n = 0; _n < array_length(arg0); _n++)
    {
        var _purchase = @@array_get@@(arg0, _n);
        var _productId = _purchase.productId;
        var _purchaseState = _purchase.purchaseState;
        var _purchaseToken = _purchase.purchaseToken;
        var _responseCode = _purchase.responseCode;
        if (is_undefined(_productId))
        {
            logf("invalid purchase", _purchase);
        }
        else
        {
            variable_struct_set(o_mobile_helper.purchasesData, _productId, _purchase);
            if (_responseCode == 1)
            {
                if (variable_global_exists("shops"))
                {
                    var shop_item = variable_struct_get(global.shops.dlc, _productId);
                    if (is_struct(shop_item))
                    {
                        logf("set item data count = 1", _productId);
                        shop_item.data.count = 1;
                    }
                }
            }
            extension_stubfunc_real(_purchaseToken);
        }
    }
}
