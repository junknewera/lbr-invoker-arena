if (!global.draw_hud)
{
    exit;
}
if (!surface_exists(surface))
{
    surface = surface_create(global.gui_width, global.gui_height);
}
surface_set_target(surface);
if (refresh_surface)
{
    draw_clear_alpha(c_black, 0);
    check_resource_box_hover();
    var top_text = [];
    if (can_auto_crunch())
    {
        var autocrunch_timer_formatted = format_time(autocrunch_timer_duration - autocrunch_timer);
        array_push(top_text, sprintf(__("Auto crunch in %s"), autocrunch_timer_formatted));
    }
    if (can_auto_crunch(true) && global.shops.blc.autocrunch_bot.data.toggle)
    {
        var auto_crunch_text = iif(global.is_mobile, sprintf(__("Toggle Auto crunch in the %s"), __("BLC Shop")), sprintf(__("Toggle Auto crunch with %s"), __("Shift") + "+" + __("Ctrl") + "+" + __("C")));
        array_push(top_text, auto_crunch_text);
    }
    if (in_challenge())
    {
        array_push(top_text, sprintf(__("Active challenge: %s"), global.current_challenge.name));
    }
    else if (in_mp_challenge())
    {
        array_push(top_text, sprintf(__("Season challenge: %s"), global.current_challenge.name));
    }
    var area_info_text = o_game.area.get_hud_info_text();
    if (!is_empty(area_info_text))
    {
        array_push(top_text, area_info_text);
    }
    if (top_text != "")
    {
        set_default_font(f_gui_small, 1, 1);
        draw_text(global.gui_width / 2, 15, implode(" | ", top_text));
    }
    set_default_font(f_gui_default, 1, 1);
    if (global.game_settings.combo_enabled && get_upgrade_count(global.shops.gold.combo) > 0)
    {
        var combo_text = __s("Combo: %s/%s", rround(min(combo, combo_max)), combo_max);
        draw_text(global.gui_width / 2, 46, string(combo_text));
        draw_text(global.gui_width / 2, 75, sprintf("(x %s)", number_format(combo_multiplier, 2, false, false)));
    }
    o_game.area.draw_hud();
    if (mp_is_season())
    {
        var max_season_time = get_default_struct_value(global.game_settings, "max_time", 0);
        if (max_season_time > 0)
        {
            var time_remaining = max_season_time - o_game.data.stats.time_elapsed;
            var time_remaining_text = (time_remaining > 0) ? format_time(time_remaining, false, true) : "0";
            draw_text(global.gui_width / 2, gui_col_y(4), __s("Time remaining: %s/%s", time_remaining_text, format_time(max_season_time, false, true)));
        }
    }
    draw_nav_sidebar();
}
surface_reset_target();
draw_surface(surface, 0, 0);
refresh_surface = false;
if (resource_nav_page_index > 0)
{
    var btn_x = gui_col_x(29.75);
    var btn_y = gui_col_y(30);
    if (gui_button_sprite(btn_x, btn_y, spr_gui_arrow_up, true))
    {
        scroll(-1);
    }
}
if (resource_nav_items_remaining)
{
    var btn_x = gui_col_x(30.75);
    var btn_y = gui_col_y(30);
    if (gui_button_sprite(btn_x, btn_y, spr_gui_arrow_down, true))
    {
        scroll(1);
    }
}
if (can_draw_nav_selection())
{
    global.options.resource_draw_selection.draw(gui_col_x(30), gui_col_y(1.75), undefined, 
    {
        draw_mode: 1
    });
}
if (in_challenge() || in_mp_challenge())
{
    set_default_font(f_gui_small, 0, 1);
    var challenge_info_text = sprintf("v%s", global.game_version);
    var seed_text = is_empty(global.globalstats.challenge_seed) ? __("random") : global.globalstats.challenge_seed;
    challenge_info_text += sprintf(" | %s: %s", __("Seed"), seed_text);
    if (global.current_challenge.data.current_run_finished)
    {
        challenge_info_text += sprintf(" | %s (%s)", __s("Completed in %s", format_time(secr(global.current_challenge.data.last_finish_time_frames))), __s("%s frames", global.current_challenge.data.last_finish_time_frames));
    }
    else
    {
        challenge_info_text += sprintf(" | F: %s", o_game.data.stats.time_elapsed);
    }
    draw_text(40, 15, challenge_info_text);
}
if (can_draw_vstick)
{
    vstick_draw(0);
}
