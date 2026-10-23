function gui_item_confirm(arg0, arg1)
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
    var button_width = gui_col_x(5);
    var button_height = global.is_mobile ? 64 : global.gui_button_height;
    arg1 += draw_description(arg0, arg1, text);
    arg1 += gui_col_y(2);
    if (gui_button(arg0 + (global.gui_settings.content_width / 2), arg1, btn_text_cancel, true, button_width, undefined, 
    {
        icon: spr_icon_cancel,
        height: button_height
    }))
    {
        call_method(id, _func_cancel, btn_args);
        call_method(id, func_cancel_after, btn_args);
    }
    arg1 += gui_col_y(3);
    if (gui_button(arg0 + (global.gui_settings.content_width / 2), arg1, btn_text_confirm, true, button_width, undefined, 
    {
        icon: spr_icon_check,
        height: button_height
    }) || keyboard_check_pressed(vk_space))
    {
        call_method(id, func_confirm, btn_args);
        call_method(id, func_confirm_after, btn_args);
    }
}
