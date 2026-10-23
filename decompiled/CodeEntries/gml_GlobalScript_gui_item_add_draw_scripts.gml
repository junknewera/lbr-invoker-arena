function gui_item_add_draw_scripts()
{
}

function gui_item_add_draw_artifacts()
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
    if (get_upgrade_count(global.shops.mlc.auto_use_artifacts) > 0)
    {
        var next_autouse_formatted = __("Disabled");
        var autouse_delay = get_artifact_autouse_timer_delay();
        if (global.shops.mlc.auto_use_artifacts.data.toggle)
        {
            next_autouse_formatted = format_time(autouse_delay - o_game.artifact_autouse_timer, false, false);
        }
        set_default_font(f_gui_small, 0, 0);
        draw_text(add_text_base_x, add_text_base_y, __s("Delay: %s | Next autouse: %s", format_time(autouse_delay, true, true), next_autouse_formatted));
    }
    global.options.artifact_list_padding.draw(add_button_base_x + gui_col_x(19), add_button_base_y);
}
