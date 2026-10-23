_is_visible = get_value_ext(id, is_visible) && is_dialog_visible();
if (_is_visible && !is_dialog_button && !skip_visible_check && y < (o_dialog.gui_y_start_items - 10))
{
    _is_visible = false;
}
visible = _is_visible;
alarm[1] = sec(0.1);
