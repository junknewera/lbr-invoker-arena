function gui_dialog_start()
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
    gui_x = gui_x_start;
    gui_y = gui_y_start;
    actions_overflow = array_length(actions) - shop_items_display;
    button_inline_counter = 0;
    res_inline_counter = 0;
    if (get_option(global.options.dark_dialog_bg))
    {
        draw_set_alpha(0.7);
        draw_set_color(global.colors.black);
        draw_rectangle(0, 0, global.gui_width, global.gui_height, false);
        draw_set_alpha(1);
    }
    draw_sprite_stretched(spr_gui_bg_default, 0, gui_bg_x, gui_bg_y, gui_bg_width, gui_bg_height);
    set_default_font(f_gui_default);
    var show_back_button = false;
    if (!is_undefined(parent_nav) || !is_undefined(back_button))
    {
        show_back_button = true;
    }
    if (!is_undefined(back_button))
    {
        show_back_button = true;
    }
    if (show_back_button)
    {
        if (gui_button_sprite(gui_x - 32, gui_y - 24, spr_gui_arrow_left, true, false))
        {
            if (!is_undefined(back_button))
            {
                open_nav_delay(back_button);
            }
            else if (!is_undefined(parent_nav))
            {
                open_nav_delay(parent_nav);
            }
        }
    }
    if (gui_button_sprite(gui_x + gui_width, gui_y - 24, spr_icon_close, true, false))
    {
        gui_dialog_close(id);
    }
    if (!is_undefined(help_button_text))
    {
        var help_button_x = global.is_mobile ? 1.5 : 1;
        if (gui_button_sprite((gui_x_start + gui_width) - gui_col_x(help_button_x), gui_y_start - 24, spr_icon_help, true, false, help_button_text_options))
        {
            if (global.is_mobile)
            {
                delay("help_button", 1, function()
                {
                    text_dialog(help_button_text, titles, 
                    {
                        parent_nav: get_current_shop_nav_key()
                    });
                }, 
                {
                    instance: id
                });
            }
        }
    }
    if (variable_instance_exists(id, "titles") && is_struct(titles))
    {
        var fancy_titles = get_option(global.options.fancy_titles);
        if (!is_empty(struct_get_from_hash(titles, variable_get_hash("title"))))
        {
            if (fancy_titles)
            {
                draw_fancy_title(gui_x, gui_y, titles.title);
            }
            else
            {
                draw_heading(gui_x, gui_y - 18, titles.title, undefined, undefined, undefined, 0);
            }
        }
        gui_y += 32;
        if (!global.is_mobile && !is_empty(struct_get_from_hash(titles, variable_get_hash("subtitle"))))
        {
            if (fancy_titles)
            {
                gui_y += draw_description(gui_x, gui_y - 18, struct_get_from_hash(titles, variable_get_hash("subtitle")), gui_content_width - gui_col_x(0.7));
            }
            else
            {
                gui_y += draw_description(gui_x, gui_y - 20, struct_get_from_hash(titles, variable_get_hash("subtitle")), gui_content_width - gui_col_x(0.7));
            }
        }
    }
    if (global.is_mobile && show_quantity_selection)
    {
        var quantity_selection_x_start = gui_col_x(18.25);
        set_default_font(f_gui_small, 2);
        draw_text(gui_x_start + quantity_selection_x_start, gui_y_start - gui_col_y(0.75), __("Quantity"));
        global.options.selection_quantity_sign.draw(gui_x_start + quantity_selection_x_start + gui_col_x(0.75), gui_y_start - gui_col_y(0.5), gui_button);
        global.options.selection_quantity.draw(gui_x_start + quantity_selection_x_start + gui_col_x(2.25), gui_y_start - gui_col_y(0.5), gui_button);
    }
    gui_dialog_draw_sections();
}
