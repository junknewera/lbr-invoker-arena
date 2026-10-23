if (connected_to_store)
{
    updatePurchasesData();
}
else if (global.is_android)
{
    extension_stubfunc_real();
}
else if (global.is_ios)
{
    connected_to_store = extension_stubfunc_real();
}
var timer_value = (got_purchase_data && connected_to_store) ? 30 : 10;
alarm[0] = sec(timer_value);
if (global.is_ios && connected_to_store)
{
    if (!products_added_ios)
    {
        var __array = product_ids;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            variable_struct_set(product_map, mitem, {});
            var res = extension_stubfunc_real(mitem);
            logf("add product", mitem, res);
        }
        extension_stubfunc_real();
        products_added_ios = true;
    }
    if (!is_struct(purchasesData) && !getting_purchase_data)
    {
        getting_purchase_data = true;
        restore_dlc_purchases();
    }
}
