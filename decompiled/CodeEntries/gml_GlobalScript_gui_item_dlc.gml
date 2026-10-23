function gui_item_dlc(arg0, arg1)
{
    if (live_auto_call_1())
    {
        var lac_argc = argument_count;
        var lac_args = array_create(lac_argc);
        var lac_argk = 0;
        repeat (lac_argc)
        {
            lac_args[lac_argk] = argument[lac_argk];
            lac_argk++;
        }
        if (live_auto_call_2(lac_args))
        {
            return global.live_result;
        }
    }
    var y_start = arg1;
    if (is_current_dialog_section(global.dialog_sections.shop_dlc.products))
    {
        arg1 += gui_item_shop(arg0, arg1, 
        {
            shop_items: o_shop.shop_items.dlc,
            shop_key: "dlc"
        });
    }
    return arg1;
}
