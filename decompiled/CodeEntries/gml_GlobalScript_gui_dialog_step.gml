function gui_dialog_step()
{
    if (!visible)
    {
        exit;
    }
    if (scroll_y_max > 0)
    {
        var move_down = false;
        var move_up = false;
        if (keyboard_check(vk_down))
        {
            move_down = true;
        }
        if (get_mouse_wheel_down())
        {
            move_down = true;
            if (instance_exists(o_gui_scrollable_items_inline) && o_gui_scrollable_items_inline.mouse_over_panel())
            {
                move_down = false;
            }
            if (instance_exists(o_gui_scrollable_text) && o_gui_scrollable_text.mouse_over_panel())
            {
                move_down = false;
            }
        }
        if (keyboard_check(vk_up))
        {
            move_up = true;
        }
        if (get_mouse_wheel_up())
        {
            move_up = true;
            if (instance_exists(o_gui_scrollable_items_inline) && o_gui_scrollable_items_inline.mouse_over_panel())
            {
                move_up = false;
            }
            if (instance_exists(o_gui_scrollable_text) && o_gui_scrollable_text.mouse_over_panel())
            {
                move_up = false;
            }
        }
        if (move_up)
        {
            refresh_surface = true;
            if (scrollbar_handle_dragging)
            {
                exit;
            }
            gui_dialog_scroll_up();
        }
        if (move_down)
        {
            refresh_surface = true;
            if (scrollbar_handle_dragging)
            {
                exit;
            }
            gui_dialog_scroll_down();
        }
    }
    check_input_refresh_surface();
    refresh_surface_counter++;
    if (refresh_surface_counter >= refresh_surface_delay)
    {
        refresh_surface_counter = 0;
        refresh_surface = true;
    }
    if (click_delay_flag)
    {
        click_delay_flag_counter++;
    }
    if (click_delay_flag_counter >= click_delay_flag_delay)
    {
        click_delay_flag_counter = 0;
        click_delay_flag = false;
    }
    scroll_y = floor(scroll_y_fx);
}
