function gui_dialog_scroll_down(arg0 = 1)
{
    if (!instance_exists(o_dialog))
    {
        exit;
    }
    with (o_dialog)
    {
        var steps = get_scroll_step() * arg0;
        var shop_index_new = shop_index + steps;
        if (shop_index_new > (shop_index_max + 1))
        {
            shop_index_new = shop_index_max;
        }
        shop_index = clamp(shop_index_new, 0, shop_index_max);
        variable_struct_set(global.dialog_shop_index_last, dialog_id, scroll_y);
        scroll_y_fx += round(64 * steps);
        scroll_y_fx = clamp(scroll_y_fx, 0, scroll_y_max);
    }
}
