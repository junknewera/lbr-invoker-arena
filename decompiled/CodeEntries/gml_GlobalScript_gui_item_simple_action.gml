function gui_item_simple_action(arg0, arg1, arg2)
{
    if (!is_struct(arg2))
    {
        exit;
    }
    var item = arg2.item;
    if (!is_struct(item))
    {
        exit;
    }
    var draw_action_button = false;
    set_default_font(f_gui_default);
    var title = item.title;
    var description = get_value_ext(arg2.instance, item.description, item);
    var is_obfuscated = get_value_ext(arg2.instance, arg2._is_obfuscated, item);
    if (is_obfuscated)
    {
        draw_action = false;
        title = "?";
        description = "";
    }
    draw_text(gui_x + gui_col_x(1), gui_y, name);
    set_default_font(f_gui_small);
    draw_text_ext(gui_x + gui_col_x(1), gui_y + gui_col_y(0.9), description, global.gui_text_line_height, gui_col_x(9));
    if (get_upgrade_count(item) < item.max_count)
    {
        draw_action = true;
        draw_price = true;
    }
    if (is_obfuscated || !draw_action)
    {
        exit;
    }
    if (draw_price)
    {
        set_default_font(f_gui_default);
        draw_resources(gui_x + gui_col_x(10), gui_y, get_item_cost(item));
    }
    var can_do_action = arg2._check();
    if (item.is_static)
    {
        can_do_action = true;
    }
    if (gui_button(gui_x + gui_col_x(15), gui_y + gui_col_y(1), arg2._button_text, can_do_action, 90))
    {
        arg2._func(item);
    }
    if (arg2.buy_max && gui_button(gui_x + gui_col_x(17), gui_y + gui_col_y(1), arg2._button_text + " max", can_do_action, 100))
    {
        while (arg2._check())
        {
            arg2._func(item);
        }
    }
}
