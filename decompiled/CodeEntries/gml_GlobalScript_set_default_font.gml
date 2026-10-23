function set_default_font(arg0 = f_gui_small, arg1 = 0, arg2 = 0, arg3 = 16777215, arg4 = undefined)
{
    draw_set_halign(arg1);
    draw_set_valign(arg2);
    draw_set_alpha(1);
    draw_set_color(arg3);
    var font = variable_struct_get(global.current_font, arg0);
    if (is_undefined(font))
    {
        font = variable_struct_get(global.fonts.def, f_gui_small);
    }
    if (!is_undefined(arg4))
    {
        font = arg4;
    }
    draw_set_font(font);
}
