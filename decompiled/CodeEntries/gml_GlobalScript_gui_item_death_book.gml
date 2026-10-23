function gui_item_death_book(arg0, arg1, arg2)
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
    var height = 0;
    var item_height = gui_col_y(3.5);
    gui_item_collectable_list(arg0, gui_y_start_items, 
    {
        button_func: function(arg0)
        {
            global.selected_death_book = undefined;
            if (!arg0.is_unlocked())
            {
                exit;
            }
            global.selected_death_book = arg0;
        },
        
        display_count: true,
        display_count_func_key: "get_db_level",
        items: global.enemies,
        items_array: global.enemies_death_book,
        columns: global.is_mobile ? 9 : 12,
        
        selected_key: function()
        {
            return get_default_struct_value(global.selected_death_book, "key", "");
        },
        
        width: gui_col_x(12)
    });
    height = draw_death_book(gui_col_x(16), arg1, global.selected_death_book, gui_col_x(12), gui_col_y(12), true);
    return height;
}
