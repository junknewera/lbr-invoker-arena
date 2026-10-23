function gui_dialog_draw_items()
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
    gui_y = gui_y_start_items - scroll_y;
    var actions_length = array_length(actions);
    var gui_max_y = gui_height - gui_col_y(3);
    var gui_loop_y = 0;
    var items_shown = 0;
    var items_overhead = 0;
    global.is_dialog_item_button = true;
    if (!is_undefined(custom_func))
    {
        var add_y = custom_func(gui_x, gui_y);
        add_safe(gui_y, add_y);
        scroll_y_max = max(0, (gui_y - gui_content_height) + 40);
    }
    else
    {
        for (var i = 0; i < actions_length; i++)
        {
            if (i >= actions_length)
            {
                break;
            }
            var item_result = gui_add_item(i);
            if (!is_struct(item_result))
            {
                continue;
            }
            if (is_numeric(item_result.height))
            {
                gui_loop_y += item_result.height;
            }
            if (item_result.item_shown)
            {
                items_shown++;
            }
            if (i == (actions_length - 1))
            {
                scroll_y_max = max(0, (gui_loop_y - gui_content_height) + 40);
            }
        }
    }
    global.is_dialog_item_button = false;
}
