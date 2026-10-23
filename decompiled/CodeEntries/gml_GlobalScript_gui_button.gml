function gui_button(arg0, arg1, arg2, arg3 = true, arg4 = -1, arg5 = false, arg6 = undefined)
{
    return draw_get_button(arg0, arg1, arg2, arg4, get_default_struct_value(arg6, "height", global.gui_button_height), true, arg3, arg5, arg6);
}
