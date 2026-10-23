function gui_dialog_end()
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
    gui_draw_scrollbar();
    if (variable_instance_exists(id, "add_draw"))
    {
        call_method(id, add_draw);
    }
    if (draw_bottom_result)
    {
        draw_result(add_text_base_x + gui_col_x(25), add_text_base_y, result_bottom, undefined, 
        {
            inline: true,
            inline_dir: -1
        });
    }
    if (variable_instance_exists(id, "shop_resource_key") && !is_undefined(shop_resource_key))
    {
        if (is_array(shop_resource_key))
        {
            draw_resources_current_amount(add_text_base_x + gui_col_x(20), add_text_base_y, shop_resource_key);
        }
        else
        {
            var current_shop_items = variable_struct_get(global.shops_sorted, shop_resource_key);
            if (is_array(shop_items_array))
            {
                current_shop_items = shop_items_array;
            }
            if (is_array(current_shop_items))
            {
                gui_draw_buy_max(add_button_base_x, add_button_base_y, current_shop_items);
            }
            var shop_resource = variable_struct_get(global.resources, shop_resource_key);
            if (is_struct(shop_resource))
            {
                set_default_font(f_gui_small, 2);
                draw_text(add_text_base_x + gui_col_x(19.8), add_text_base_y, shop_resource.name_plural);
                draw_set_halign(fa_left);
                draw_text_icon(add_text_base_x + gui_col_x(20), add_text_base_y, shop_resource.sprite, number_format(shop_resource.data.count), 32);
            }
        }
    }
    if (variable_instance_exists(id, "shop_key") && is_string(shop_key))
    {
        gui_draw_buy_max(add_button_base_x, add_button_base_y, variable_struct_get(global.shops_sorted, shop_key));
    }
}
