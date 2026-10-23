function gui_dialog_has_scroll_buttons()
{
    if (!is_dialog_visible())
    {
        return false;
    }
    return o_dialog.scroll_y_max > 0;
}
