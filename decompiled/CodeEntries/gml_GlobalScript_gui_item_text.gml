function gui_item_text(arg0, arg1, arg2)
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
    var padding = global.gui_items_padding;
    var text = get_value_ext(arg2, arg2._text);
    var width = get_default_struct_value(arg2, "width", gui_content_width - 50);
    var y_height = global.gui_items_default_height;
    if (is_struct(arg2.text_args))
    {
        var halign = 0;
        if (get_default_struct_value(arg2.text_args, "center", false))
        {
            arg0 = gui_x_center;
            halign = 1;
        }
        set_default_font(get_default_struct_value(arg2.text_args, "font", undefined), get_default_struct_value(arg2.text_args, "halign", halign), get_default_struct_value(arg2.text_args, "valign", undefined));
    }
    if (is_struct(arg2.resource))
    {
        var sprite_color = iif(arg2.resource.data.collected_total == 0, 0, 16777215);
        gui_draw_sprite(arg0 + 8, arg1 + 8, arg2.resource.sprite, sprite_color);
        arg0 += 32;
    }
    if (!is_undefined(struct_get_from_hash(arg2, variable_get_hash("sprite"))))
    {
        var sprite_color = get_default_struct_value(arg2, "sprite_color", 16777215);
        sprite_color = get_value_ext(arg2, sprite_color);
        gui_draw_sprite(arg0 + 8, arg1 + 8, arg2.sprite, sprite_color);
        arg0 += 32;
    }
    var text_height = draw_description(arg0, arg1, text, width);
    y_height = max(y_height, text_height + padding);
    if (!is_empty(arg2.link))
    {
        var link_add_y = global.is_mobile ? 30 : 20;
        var link_x1 = arg0;
        var link_y1 = arg1 + link_add_y;
        var link_x2 = arg0 + string_width_ext(text, global.gui_text_line_height, gui_content_width);
        var link_y2 = arg1 + link_add_y;
        draw_line_width(link_x1, link_y1, link_x2, link_y2, 2);
        if (mouse_click_in_gui_range(arg0, arg1, link_x2, link_y2, 1))
        {
            url_open(arg2.link);
        }
    }
    return y_height;
}
