function gui_item_guide(arg0, arg1, arg2)
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
    var button_x = 0;
    var button_y = 0;
    var padding_y = global.is_mobile ? 2 : 1.5;
    var text_x = arg0 + gui_col_x(10);
    var text_y = arg1;
    var current_guide_page = get_default_struct_value(global.guide_page, "main", 0);
    var page_length = global.is_mobile ? 7 : 10;
    var items = [];
    array_copy(items, 0, arg2.guide, current_guide_page * page_length, page_length);
    var __array = items;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (!is_undefined(struct_get_from_hash(mitem, variable_get_hash("is_visible"))) && !get_default_struct_value_ext(mitem, "is_visible", true))
        {
            continue;
        }
        button_x = arg0;
        button_y = arg1 + (__i * gui_col_y(padding_y));
        var button_enabled = true;
        var button_text = get_value_ext(mitem, mitem.name, false);
        var obfuscated_func = get_default_struct_value(mitem, "is_obfuscated", undefined);
        if (!is_undefined(obfuscated_func) && mitem.is_obfuscated())
        {
            button_enabled = false;
            button_text = "?";
        }
        if (gui_button_tl(button_x, button_y, button_text, button_enabled, gui_col_x(4), undefined, 
        {
            selected: o_game.data.current_guide_key == mitem.key
        }))
        {
            o_game.data.current_guide_key = mitem.key;
            o_game.data.current_guide_sub_key = "";
            global.guide_page.sub = 0;
            instance_destroy(o_gui_scrollable_text_lore);
        }
        if (o_game.data.current_guide_key == mitem.key)
        {
            var current_guide_sub_page = max(0, get_default_struct_value(global.guide_page, "sub", 0));
            var sub_items = [];
            array_copy(sub_items, 0, mitem.items, current_guide_sub_page * page_length, page_length);
            var button_x2 = 0;
            var button_y2 = 0;
            var __array2 = sub_items;
            var __prop_len2 = array_length(__array2);
            for (var __i2 = 0; __i2 < __prop_len2; __i2++)
            {
                var mitem2 = __array2[__i2];
                if (!is_undefined(struct_get_from_hash(mitem2, variable_get_hash("is_visible"))) && !get_default_struct_value_ext(mitem2, "is_visible", true))
                {
                    continue;
                }
                button_x2 = arg0 + gui_col_x(4.5);
                button_y2 = arg1 + (__i2 * gui_col_y(padding_y));
                var button_enabled2 = true;
                var button_text2 = get_value_ext(mitem2, mitem2.name, false);
                var text = "";
                var obfuscated_func2 = get_default_struct_value(mitem2, "is_obfuscated", undefined);
                if (!is_undefined(obfuscated_func2) && mitem2.is_obfuscated())
                {
                    button_enabled2 = false;
                    button_text2 = "?";
                    text = "?";
                }
                var is_selected = o_game.data.current_guide_sub_key == mitem2.key || (o_game.data.current_guide_sub_key == "" && __i2 == 0 && current_guide_sub_page == 0);
                if (gui_button_tl(button_x2, button_y2, button_text2, button_enabled2, gui_col_x(4), undefined, 
                {
                    selected: is_selected
                }))
                {
                    o_game.data.current_guide_sub_key = mitem2.key;
                    instance_destroy(o_gui_scrollable_text_lore);
                }
                if (is_selected)
                {
                    if (dialog_visible && !instance_exists(o_gui_scrollable_text_lore))
                    {
                        var title = sprintf("%s - %s", button_text, button_text2);
                        text = get_value_ext(mitem2, mitem2.text, false);
                        var o = instance_create_layer(text_x, text_y, global.layers.gui, o_gui_scrollable_text_lore);
                        o.width = gui_col_x(13);
                        o.height = gui_col_y(14);
                        o.title = title;
                        o.set_text(text);
                    }
                }
            }
            if (array_length(mitem.items) > page_length)
            {
                var paging_y = arg1 + (page_length * gui_col_y(padding_y)) + gui_col_y(padding_y);
                if (current_guide_sub_page > 0)
                {
                    if (gui_button_sprite(button_x2 + gui_col_x(0.5), paging_y, spr_gui_arrow_left))
                    {
                        global.guide_page.sub = current_guide_sub_page - 1;
                    }
                }
                if (((current_guide_sub_page * page_length) + page_length) < array_length(mitem.items))
                {
                    if (gui_button_sprite(button_x2 + gui_col_x(3.5), paging_y, spr_gui_arrow_right))
                    {
                        global.guide_page.sub = current_guide_sub_page + 1;
                    }
                }
                set_default_font(f_gui_small, 1);
                var sub_pages_count = floor((array_length(mitem.items) + 1) / page_length);
                var paging_text = sprintf("%s/%s", current_guide_sub_page + 1, sub_pages_count + 1);
                draw_text(button_x2 + gui_col_x(2), paging_y - gui_col_y(0.25), paging_text);
            }
        }
    }
    if (array_length(arg2.guide) > page_length)
    {
        var paging_y = arg1 + (page_length * gui_col_y(padding_y)) + gui_col_y(padding_y);
        if (current_guide_page > 0)
        {
            if (gui_button_sprite(button_x + gui_col_x(0.5), paging_y, spr_gui_arrow_left))
            {
                global.guide_page.main = current_guide_page - 1;
            }
        }
        if (((current_guide_page * page_length) + page_length) < array_length(arg2.guide))
        {
            if (gui_button_sprite(button_x + gui_col_x(3.5), paging_y, spr_gui_arrow_right))
            {
                global.guide_page.main = current_guide_page + 1;
            }
        }
        set_default_font(f_gui_small, 1);
        var sub_pages_count = floor((array_length(arg2.guide) + 1) / page_length);
        var paging_text = sprintf("%s/%s", current_guide_page + 1, sub_pages_count + 1);
        draw_text(button_x + gui_col_x(2), paging_y - gui_col_y(0.25), paging_text);
    }
    return global.is_mobile ? 36 : 24;
}
