function gui_dialog_init()
{
    gui_width_col = global.gui_settings.dialog_width_col;
    gui_height_col = global.gui_settings.dialog_height_col;
    actions_overflow = 0;
    can_close_dialog = true;
    can_toggle = false;
    click_delay_flag = false;
    click_delay_flag_counter = 0;
    click_delay_flag_delay = sec(0.1);
    current_section = 0;
    dialog_visible = false;
    gui_width = gui_col_x(gui_width_col);
    gui_height = gui_col_y(gui_height_col);
    gui_padding = gui_col_x(0.5);
    gui_padding_footer = global.is_mobile ? gui_col_y(5.5) : gui_col_y(3.5);
    gui_content_width = gui_width;
    gui_content_height = gui_height - gui_padding_footer;
    gui_x_start = gui_col_x((global.gui_settings.col_size / 2) - (gui_width_col / 2));
    gui_y_start = gui_col_y((global.gui_settings.col_size / 2) - (gui_height_col / 2));
    gui_bg_x = gui_x_start - gui_padding;
    gui_bg_y = gui_y_start - gui_padding;
    gui_bg_width = gui_width + gui_padding;
    gui_bg_height = gui_height + gui_padding;
    gui_content_x = gui_x_start + gui_padding;
    gui_content_y = gui_y_start + gui_padding;
    gui_x = 0;
    gui_y = 0;
    gui_y_loop_item = 0;
    gui_x_center = gui_x + (gui_width / 2);
    gui_y_center = gui_y + (gui_height / 2);
    gui_y_start_items = gui_content_y + gui_padding;
    is_shop = variable_instance_exists(id, "is_shop") ? is_shop : false;
    refresh_surface = true;
    refresh_surface_counter = 0;
    refresh_surface_delay = sec(0.3);
    scroll_steps = variable_instance_exists(id, "scroll_steps") ? scroll_steps : 1;
    scroll_y = 0;
    scroll_y_max = 0;
    scroll_y_fx = 0;
    scrollbar_handle_click_offset = 0;
    scrollbar_handle_dragging = false;
    shop_resource = undefined;
    show_quantity_selection = variable_instance_exists(id, "show_quantity_selection") ? show_quantity_selection : false;
    shop_index = 0;
    shop_index_last = {};
    tab = 0;
    add_button_base_x = gui_x_start + gui_col_x(1);
    add_button_base_x_tl = gui_x_start;
    add_button_base_y = gui_content_y + gui_content_height + gui_col_y(global.is_mobile ? 1.3 : 0.8);
    add_button_base_y_tl = add_button_base_y + gui_col_y(0.5);
    add_text_base_x = gui_x_start;
    add_text_base_y = add_button_base_y + gui_col_y(0.35);
    if (global.is_mobile)
    {
    }
    if (variable_global_exists("options"))
    {
        alpha = get_option(global.options.menu_transparency) / 100;
    }
    if (!is_undefined(variable_struct_get(global.dialog_shop_index_last, dialog_id)))
    {
        scroll_y = variable_struct_get(global.dialog_shop_index_last, dialog_id);
        scroll_y_fx = scroll_y;
    }
}
