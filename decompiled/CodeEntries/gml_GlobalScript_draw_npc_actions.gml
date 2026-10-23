function draw_npc_actions(arg0 = gui_dialog_draw_items)
{
    if (!surface_exists(surface))
    {
        surface = surface_create(global.gui_width, global.gui_height);
        surface_items = surface_create(global.gui_width, global.gui_height);
    }
    drawing_to_surface_stack = true;
    surface_set_target(surface);
    if (refresh_surface)
    {
        draw_clear_alpha(c_black, 0);
        gui_dialog_start();
        surface_reset_target();
        surface_set_target(surface_items);
        draw_clear_alpha(c_black, 0);
        arg0();
        if (destroying)
        {
            exit;
        }
        surface_reset_target();
        surface_set_target(surface);
        gui_dialog_end();
    }
    if (destroying)
    {
        exit;
    }
    surface_reset_target();
    draw_surface_ext(surface, 0, 0, 1, 1, 0, c_white, alpha);
    draw_surface_part_ext(surface_items, gui_x_start - 20, gui_y_start_items - 10, gui_content_width, gui_content_height, gui_x_start - 20, gui_y_start_items - 10, 1, 1, 16777215, alpha);
    if (is_playing_tavern_games() && !global.tavern_games_playing.crafting)
    {
        set_default_font(f_gui_medium, 1, 1);
        draw_text(global.gui_width / 2, gui_y_start - 55, __("Autosave is disabled while doing this action"));
    }
    drawing_to_surface_stack = false;
    refresh_surface = false;
}
