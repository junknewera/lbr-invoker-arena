function gui_dialog_open(arg0, arg1)
{
    o_game.is_dialog_open = true;
    with (arg0)
    {
        dialog_visible = true;
        tab = arg1;
        refresh_surface = true;
    }
}
