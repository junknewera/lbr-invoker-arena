function gui_dialog_scroll_up(arg0 = 1)
{
    if (!instance_exists(o_dialog))
    {
        exit;
    }
    with (o_dialog)
    {
        var steps = get_scroll_step() * arg0;
        shop_index -= steps;
        shop_index = clamp(shop_index, 0, shop_index_max);
        scroll_y_fx -= round(64 * steps);
        scroll_y_fx = clamp(scroll_y_fx, 0, scroll_y_max);
        variable_struct_set(global.dialog_shop_index_last, dialog_id, scroll_y_fx);
    }
}
