function gui_item_lore_wrapper(arg0, arg1)
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
    draw_button_list_items(arg0, arg1, global.lore_sorted, 
    {
        items_per_page: global.is_mobile ? 7 : 10,
        selected_item_name: "lore",
        on_select: set_lore_item,
        
        add_draw: function(arg0, arg1, arg2)
        {
            if (!arg2.data.shown && !arg2.is_obfuscated())
            {
                gui_draw_sprite(arg0 + 5, arg1 + 5, spr_icon_exclamation_mark, undefined, global.is_mobile ? 2 : 1);
            }
        }
    });
    if (!instance_exists(o_gui_scrollable_text_lore))
    {
        set_lore_item(struct_get_from_hash(global.selected_inventory_item, variable_get_hash("lore")));
    }
    return arg1 - y_start;
}

function set_lore_item(arg0)
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
    if (!is_struct(arg0))
    {
        exit;
    }
    o_game.data.current_lore_key = arg0.key;
    o_game.data.current_lore_page = 0;
    arg0.data.shown = true;
    instance_destroy(o_gui_scrollable_text_lore);
    var text = get_value_ext(arg0, arg0.description, false);
    var o = instance_create_layer(o_dialog.gui_x + gui_col_x(5), o_dialog.gui_y_start + gui_col_y(1), global.layers.gui, o_gui_scrollable_text_lore);
    o.width = gui_col_x(18);
    o.height = gui_col_y(18);
    o.title = get_value_ext(arg0, arg0.name, false);
    o.set_text(text);
}

function gui_item_lore(arg0, arg1, arg2)
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
    var text_x = gui_x + gui_col_x(5);
    var text_y = gui_y_start + gui_col_y(1);
    var button_enabled = true;
    var button_text = get_value_ext(arg2, arg2.name, false);
    var text = "";
    if (arg2.is_obfuscated())
    {
        button_enabled = false;
        button_text = "?";
        text = "?";
    }
    if (gui_button_tl(gui_x, gui_y, button_text, button_enabled, gui_col_x(4)))
    {
        o_game.data.current_lore_key = arg2.key;
        o_game.data.current_lore_page = 0;
        arg2.data.shown = true;
        instance_destroy(o_gui_scrollable_text_lore);
    }
    if (o_game.data.current_lore_key == arg2.key)
    {
        if (dialog_visible && !instance_exists(o_gui_scrollable_text_lore))
        {
            text = get_value_ext(arg2, arg2.description, false);
            var o = instance_create_layer(text_x, text_y, global.layers.gui, o_gui_scrollable_text_lore);
            o.width = gui_col_x(18);
            o.height = gui_col_y(18);
            o.title = button_text;
            o.set_text(text);
        }
    }
    if (!arg2.data.shown && !arg2.is_obfuscated())
    {
        draw_set_color(c_red);
        draw_rectangle(gui_x - 5, gui_y - 4, gui_x + 4, gui_y + 16, false);
        set_default_font(f_gui_small);
        draw_set_color(c_white);
        draw_text(gui_x - 2, gui_y - 3, "!");
    }
    return global.is_mobile ? 36 : 24;
}
