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
if (global.gui_editor_vars.selected_instance == id)
{
    draw_sprite_ext(spr_gui_arrow_down, -1, x, y - 30, 2, 2, 0, c_white, 1);
}
if (global.gui_editor_vars.show_pos)
{
    var pos_text = sprintf("_x+%s/_y+%s", x_to_col(x - o_dialog.gui_x_start) - 1, y_to_col(y - o_dialog.gui_y_start_items));
    if (show_width)
    {
        pos_text += sprintf("/w=%s", x_to_col(width));
    }
    draw_description(x, y - 35, pos_text);
}
