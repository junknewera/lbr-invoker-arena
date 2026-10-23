set_default_font(f_gui_small, 1);
draw_text(global.gui_width / 2, global.gui_height - 30, sprintf("v%s", global.game_version));
if (gui_button_sprite(gui_col_x(30), gui_col_y(3), spr_icon_cancel, true))
{
    confirm_dialog(__("Do you want to exit the game? (Why?)"), function()
    {
        game_end();
    });
}
if (!is_dialog_visible())
{
    draw_set_alpha(0.3);
    draw_set_color(c_black);
    draw_rectangle(gui_col_x(8), gui_col_y(21), gui_col_x(24), gui_col_y(30), false);
    draw_set_alpha(1);
    set_default_font(f_gui_small);
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    var button_text_local = __("Start new game");
    if (is_struct(save_data_local))
    {
        button_text_local = __("Load local save");
    }
    draw_text(gui_col_x(12), gui_col_y(25), text_local);
    if (gui_button(gui_col_x(12), gui_col_y(23), button_text_local, true, gui_col_x(5)))
    {
        if (is_struct(save_data_local))
        {
            global.load_game_content = save_data_local;
        }
        else
        {
            global.android_new_save_slot = true;
        }
        if (is_struct(save_data_local) && save_data_local.version_int > 2229.07)
        {
            confirm_dialog(sprintf(global.texts.newer_save_warning_text_version, save_data_local.version_int, 2229.07), function()
            {
                room_goto(r_start);
            });
        }
        else
        {
            room_goto(r_start);
        }
    }
    if (global.is_pc)
    {
        set_default_font(f_gui_small, 1, 0);
        draw_text(gui_col_x(20), gui_col_y(25), text_steam);
        if (save_data_steam)
        {
            if (gui_button(gui_col_x(20), gui_col_y(23), __("Load Steam save"), true, gui_col_x(5)))
            {
                global.load_game_content = save_data_steam;
                if (is_struct(save_data_steam) && save_data_steam.version_int > 2229.07)
                {
                    confirm_dialog(sprintf(global.texts.newer_save_warning_text_version, save_data_steam.version_int, 2229.07), function()
                    {
                        room_goto(r_start);
                    });
                }
                else
                {
                    room_goto(r_start);
                }
            }
        }
    }
    else if (global.is_android)
    {
        draw_text(gui_col_x(20), gui_col_y(25), text_android);
        if (instance_exists(o_mobile_helper))
        {
            var is_signed_in = GooglePlayServices_IsSignedIn();
            if (is_signed_in)
            {
                if (gui_button(gui_col_x(20), gui_col_y(23), __("Show cloud saves"), true, 250))
                {
                    extension_stubfunc_real(__("LBR Cloud Saves"), true, true, 20);
                }
                if (gui_button(gui_col_x(20), gui_col_y(27), __s("Log out of %s", __("Google Play")), true, 300))
                {
                    notify(__("Signing out..."));
                    GooglePlayServices_SignOut();
                }
            }
            else if (gui_button(gui_col_x(20), gui_col_y(23), __s("Sign in to %s", __("Google Play")), true, 300))
            {
                GooglePlayServices_StartSignInIntent();
            }
        }
    }
    if (gui_button_sprite(gui_col_x(26), gui_col_y(23), spr_icon_humblenorth, true, undefined, 
    {
        text: "Humble North Cloud"
    }))
    {
        if (mp_is_logged_in())
        {
            open_dialog("account");
        }
        else
        {
            open_dialog("login_gateway");
        }
    }
    if (gui_button_toggle(gui_col_x(26), gui_col_y(27), global.force_exit_challenge, true, 
    {
        text: __("Force exit challenge")
    }))
    {
        global.force_exit_challenge = !global.force_exit_challenge;
    }
}
if (!instance_exists(o_dialog))
{
    if (is_loading)
    {
        draw_modal(__("Loading..."));
    }
    else if (instance_exists(o_mobile_helper) && o_mobile_helper.signing_in && !global.is_ios)
    {
        draw_modal(__("Signing in to Google Play...") + "\n\n" + __("Press back or restart the game if you are stuck on this screen.") + "\n" + __("Clearing Google Play Games cache might help, too."));
    }
}
if (global.debug)
{
    if (gui_button_tl(100, 100, "prod", undefined, gui_col_x(4)))
    {
        global.web_base_url = "https://lbr.humblenorth.de/lbr/report/router.php";
    }
}
