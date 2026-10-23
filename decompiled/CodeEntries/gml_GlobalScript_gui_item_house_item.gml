function gui_item_house_item(arg0, arg1)
{
    if (dialog_visible && !instance_exists(o_gui_scrollable_items_inline))
    {
        var o = instance_create_layer(arg0, arg1 + gui_col_y(2), global.layers.gui, o_gui_scrollable_items_inline);
        o.width = gui_col_x(17);
        o.height = gui_content_height - 140;
        o.columns = global.is_mobile ? 12 : 16;
        o.display_resources = false;
        o.items = global.house_items_sorted;
        o.button_text = __("Build");
        
        o.button_func = function(arg0)
        {
            global.selected_house_item = arg0;
        };
        
        with (o)
        {
            init();
        }
    }
    set_default_font(f_gui_small);
    draw_resources(gui_x_start + 20, (gui_y_start + gui_height) - 40, global.costs.house_item, 1, 
    {
        prefix: sprintf("%s: ", __("Cost"))
    });
    if (!is_undefined(global.selected_house_item))
    {
        draw_house_item(arg0 + gui_col_x(18), arg1 + gui_col_y(2), global.selected_house_item);
    }
}
