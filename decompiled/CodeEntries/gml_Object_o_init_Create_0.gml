if (single_object())
{
    exit;
}
var instances_create_startup = [o_options, o_timers, o_camera, o_http];
init_start();
init_layers();
if (!global.debug && false)
{
    show_message_async("LIVE CALL ENABLED IN PROD!");
}
var __array = instances_create_startup;
var __prop_len = array_length(__array);
for (var __i = 0; __i < __prop_len; __i++)
{
    var mitem = __array[__i];
    instance_create_layer(mouse_x, mouse_y, global.layers.control, mitem);
}
instance_create_layer(mouse_x, mouse_y, global.layers.mouse, o_mouse);
if (global.debug)
{
    instance_create_layer(0, 0, global.layers.control, o_debug);
}
is_loading = false;
newer_save_warning_text = __("You are trying to load a save file of a newer version. This may break your save file. It is recommended to update the game to the current version.") + "\n" + "\n" + __("Do you wish to load this save file?") + "\n" + "\n" + __("Current version: %s") + "\n" + __("Save version: %s");
read_data_steam = false;
read_data_local = false;
save_data_steam = false;
save_data_local = false;
text_android = "";
text_steam = __s("No %s save file found.", "Steam");
text_local = __s("No %s save file found.", __("local"));
time_played_steam = 0;
time_played_local = 0;
time_saved_steam = 0;
time_saved_local = 0;
version_local = 0;
version_steam = 0;
version = 0;

init = function()
{
    try
    {
        if (instance_exists(o_season_helper))
        {
            global.cloud_data.is_season = true;
            global.load_game_content = o_season_helper.load_game_content;
            if (!is_empty(global.load_game_content))
            {
                var save_data_season = parse_save_data(global.load_game_content);
                if (is_struct(save_data_season))
                {
                    global.load_game_content = get_compat_save_data(save_data_season);
                }
            }
            room_goto(r_start);
            exit;
        }
        if (global.is_pc)
        {
            if (steam_is_cloud_enabled_for_account() && steam_is_cloud_enabled_for_app() && steam_file_exists("save.dat"))
            {
                read_data_steam = steam_file_read("save.dat");
                save_data_steam = parse_save_data(read_data_steam);
                if (is_struct(save_data_steam))
                {
                    var save_data_steam_old = save_data_steam;
                    save_data_steam = get_compat_save_data(save_data_steam);
                    version_steam = save_data_steam.version_int;
                    if (version_steam < 200)
                    {
                        save_string_to_file(read_data_steam, "save-v1-steam.dat");
                    }
                    time_saved_steam = get_date_from_object(save_data_steam.time);
                    if (is_undefined(struct_get_from_hash(save_data_steam, variable_get_hash("current_profile"))))
                    {
                        time_played_steam = save_data_steam.objects.o_game.data.stats.time_elapsed;
                    }
                    else
                    {
                        time_played_steam = save_data_steam.profiles.def.objects.o_game.data.stats.time_elapsed;
                    }
                    text_steam = concatstr(__s("Local save file: %s", save_data_steam.version), "\n", date_datetime_string(time_saved_steam), "\n", __s("Playtime: %s", format_time(secr(time_played_steam), false, true)));
                }
                else
                {
                    text_steam = __("File is corrupt.");
                }
            }
        }
        if (file_exists("save.dat"))
        {
            read_data_local = get_file_contents("save.dat");
            save_data_local = parse_save_data(read_data_local);
            if (is_struct(save_data_local))
            {
                var save_data_local_old = save_data_local;
                save_data_local = get_compat_save_data(save_data_local);
                version_local = save_data_local.version_int;
                if (version_local < 200)
                {
                    file_copy("save.dat", "save-v1.dat");
                }
                time_saved_local = get_date_from_object(save_data_local.time);
                if (is_undefined(struct_get_from_hash(save_data_local, variable_get_hash("current_profile"))))
                {
                    time_played_local = save_data_local.objects.o_game.data.stats.time_elapsed;
                }
                else
                {
                    time_played_local = save_data_local.profiles.def.objects.o_game.data.stats.time_elapsed;
                }
                text_local = concatstr(__s("Local save file: %s", save_data_local.version), "\n", date_datetime_string(time_saved_local), "\n", __s("Playtime: %s", format_time(secr(time_played_local), false, true)));
            }
            else
            {
                text_local = __("File is corrupt.");
            }
        }
        else
        {
            text_local = __("Start new game");
        }
    }
    catch (e)
    {
        logfd();
        logf("read error", e);
        logfd();
        text_local = __("File may be corrupt.");
        text_steam = __("File may be corrupt.");
        log(e);
    }
    var skip_to_start = false;
    if (is_bool(save_data_local) && !save_data_local && is_bool(save_data_steam) && !save_data_steam)
    {
        skip_to_start = true;
    }
    else if (time_played_steam != 0 && (time_saved_steam == time_saved_local || !save_data_local))
    {
        skip_to_start = true;
        global.load_game_content = save_data_steam;
    }
    else if (time_played_local != 0 && !save_data_steam)
    {
        skip_to_start = true;
        global.load_game_content = save_data_local;
    }
    if (variable_global_exists("changing_profile") && is_bool(global.changing_profile) && global.changing_profile && is_struct(save_data_local))
    {
        global.changing_profile = false;
        global.load_game_content = save_data_local;
        room_goto(r_start);
        exit;
    }
    if (global.force_skip_to_start)
    {
        global.force_skip_to_start = false;
        room_goto(r_start);
        exit;
    }
    if (!get_option(global.options.skip_to_start))
    {
        skip_to_start = false;
    }
    if ((is_struct(save_data_local) && save_data_local.version_int > 2229.07) || (is_struct(save_data_steam) && save_data_steam.version_int > 2229.07))
    {
        skip_to_start = false;
    }
    if (skip_to_start && !global.is_mobile && !global.disable_init_skip_to_start)
    {
        global.disable_init_skip_to_start = false;
        room_goto(r_start);
        exit;
    }
    if (time_played_steam != 0 && time_played_local != 0)
    {
        if (time_played_steam > time_played_local)
        {
            text_steam += sprintf("\n\n%s", __("More playtime"));
        }
        else if (time_played_local > time_played_steam)
        {
            text_local += sprintf("\n\n%s", __("More playtime"));
        }
    }
    if (time_saved_steam != 0 && time_saved_local != 0)
    {
        var date_diff = date_compare_datetime(time_saved_steam, time_saved_local);
        if (date_diff == 1)
        {
            text_steam += sprintf("\n\n%s", __("Played more recently"));
        }
        else if (date_diff == -1)
        {
            text_local += sprintf("\n\n%s", __("Played more recently"));
        }
    }
};

init();
