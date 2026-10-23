function gui_draw_scrollbar()
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
    if (scroll_y_max == 0 || !is_array(actions))
    {
        exit;
    }
    var scrollbar_height = gui_height - 108;
    var scrollbar_width = global.is_mobile ? 42 : 42;
    var scrollbar_x_start = (gui_x_start + gui_width) - 21;
    var scrollbar_y_start = gui_y_start + 68;
    draw_sprite_stretched(spr_textbox2_9s, 0, scrollbar_x_start, scrollbar_y_start, scrollbar_width, scrollbar_height);
    var handle_height = scrollbar_height / scroll_y_max;
    var handle_height_draw = clamp(handle_height, 60, global.gui_settings.content_height - 60);
    var scrollbar_step_y = handle_height;
    var scrollbar_y = scroll_y * scrollbar_step_y;
    if (scrollbar_handle_dragging || mouse_in_gui_range(scrollbar_x_start, scrollbar_y_start + scrollbar_y, scrollbar_x_start + scrollbar_width, scrollbar_y_start + scrollbar_y + handle_height_draw))
    {
        if (mouse_check_button_pressed(mb_left))
        {
            scrollbar_handle_dragging = true;
            scrollbar_handle_click_offset = o_camera.gui_mouse_y - scrollbar_y_start - scrollbar_y;
        }
        if (mouse_check_button(mb_left))
        {
            scrollbar_y = o_camera.gui_mouse_y - scrollbar_y_start - scrollbar_handle_click_offset;
            shop_index = floor(scrollbar_y / handle_height);
            shop_index = clamp(shop_index, 0, shop_index_max);
            scroll_y_fx = floor((scrollbar_y / scrollbar_height) * scroll_y_max);
            scroll_y_fx = clamp(scroll_y_fx, 0, scroll_y_max);
            variable_struct_set(global.dialog_shop_index_last, dialog_id, scroll_y_fx);
        }
    }
    if (!mouse_check_button(mb_left))
    {
        scrollbar_handle_dragging = false;
    }
    scrollbar_y = _clamp(scrollbar_y, 0, scrollbar_height - handle_height_draw);
    draw_sprite_stretched(spr_textbox_9s, 0, scrollbar_x_start, scrollbar_y_start + scrollbar_y, scrollbar_width, handle_height_draw);
}
