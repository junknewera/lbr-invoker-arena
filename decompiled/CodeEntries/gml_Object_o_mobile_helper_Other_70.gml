logdsmap("*** social async ***");
if (global.is_android)
{
    if (!ds_exists(async_load, ds_type_map) || !ds_map_exists(async_load, "type"))
    {
        exit;
    }
    switch (ds_map_find_value(async_load, "type"))
    {
        case "onPause":
            break;
        case "GooglePlayServices_SavedGames_ShowSavedGamesUI_OnNew":
            global.load_game_content = "";
            global.android_save_slot_name = guid();
            extension_stubfunc_real(global.android_save_slot_name, __("New Leaf Blower Revolution Save"), "", "leaf.png");
            if (instance_exists(o_init))
            {
                o_init.is_loading = true;
            }
            break;
        case "GooglePlayServices_SavedGames_ShowSavedGamesUI_OnOpen":
            global.android_new_save_slot = false;
            var snapshotMeta = json_parse(ds_map_find_value(async_load, "snapshotMetadata"));
            global.android_save_slot_name = snapshotMeta.uniqueName;
            global.is_android_cloud_loading = true;
            if (instance_exists(o_init))
            {
                o_init.is_loading = true;
            }
            extension_stubfunc_real(global.android_save_slot_name);
            break;
        case "GooglePlayServices_SavedGames_ShowSavedGamesUI_OnExit":
            extension_stubfunc_real(true);
            break;
        case "GooglePlayServices_SavedGames_CommitAndClose":
            var save_success = ds_map_find_value(async_load, "success");
            global.is_android_cloud_saving = false;
            if (!save_success)
            {
                return notify_error(__("Unable to save file to cloud. Please check your internet connection and try again."));
            }
            logf("Saved game to Google cloud.");
            notify(__("Saved game to Google cloud."));
            global.last_save_upload_google = o_game.data.stats.time_elapsed;
            if (!is_undefined(global.func_after_cloud_save))
            {
                delay("func_after_cloud_save_google", sec(1), function()
                {
                    if (global.is_cloud_saving)
                    {
                        exit;
                    }
                    global.func_after_cloud_save();
                    global.func_after_cloud_save = undefined;
                });
            }
            break;
        case "GooglePlayServices_SavedGames_CommitNew":
            if (!ds_map_find_value(async_load, "success"))
            {
                if (variable_global_exists("globalstats"))
                {
                    global.globalstats.android_save_slot_name = "0";
                }
                exit;
            }
            global.load_game_content = "";
            if (room == r_init && file_exists("save.dat"))
            {
                confirm_dialog(__("Do you want to overwrite your current save?"), function()
                {
                    room_goto(r_start);
                }, undefined, undefined, undefined, function()
                {
                    o_init.is_loading = false;
                    o_init.text_android = "";
                });
                exit;
            }
            if (room == r_init)
            {
                room_goto(r_start);
            }
            break;
        case "GooglePlayServices_SavedGames_Delete":
            if (!ds_map_find_value(async_load, "success"))
            {
                exit;
            }
            extension_stubfunc_real(true);
            break;
        case "GooglePlayServices_SavedGames_DiscardAndClose":
            if (!ds_map_find_value(async_load, "success"))
            {
                exit;
            }
            extension_stubfunc_real(true);
            break;
        case "GooglePlayServices_SignIn":
        case "GooglePlayServices_IsAuthenticated":
            signing_in = false;
            if (ds_map_find_value(async_load, "success"))
            {
                global.google_signed_in = true;
                if (global.android_sign_in_notification_shown)
                {
                    exit;
                }
                get_gplay_account_info();
                extension_stubfunc_real(true);
                notify(__("Logged in to Google Play"));
                global.android_sign_in_notification_shown = true;
            }
            else
            {
                notify(__("Unable to log in to Google Play, retrying..."));
                signing_in = false;
                reset_gplay_account();
            }
            break;
        case "GooglePlayServices_RevokeAccess":
        case "GooglePlayServices_SignOut":
            reset_gplay_account();
            break;
        case "GooglePlayServices_SavedGames_Load":
            global.is_android_cloud_loading = false;
            global.is_android_cloud_saving = false;
            global.android_save_slots = [];
            if (!ds_map_find_value(async_load, "success"))
            {
                exit;
            }
            var snapshots = json_parse(ds_map_find_value(async_load, "snapshots"));
            global.android_save_slots = snapshots;
            if (instance_exists(o_init))
            {
                with (o_init)
                {
                    init();
                }
            }
            break;
        case "GooglePlayServices_SavedGames_Open":
            if (!ds_map_find_value(async_load, "success"))
            {
                extension_stubfunc_real(true);
                if (instance_exists(o_init))
                {
                    o_init.is_loading = false;
                    o_init.text_android = "";
                }
                if (global.is_android_cloud_saving)
                {
                    notify_error(__("Unable to upload save game to the Google cloud. Please check your internet connection and try again later."));
                }
                global.is_android_cloud_loading = false;
                global.is_android_cloud_saving = false;
                global.func_after_cloud_save = undefined;
                exit;
            }
            if (global.is_android_cloud_loading)
            {
                global.is_android_cloud_loading = false;
                var data = ds_map_find_value(async_load, "data");
                logf("loading...", global.android_save_slot_name);
                try
                {
                    if (data != "")
                    {
                        var save_data = parse_save_data(data);
                        if (!is_struct(save_data))
                        {
                            if (instance_exists(o_init))
                            {
                                o_init.is_loading = false;
                                o_init.text_android = "Corrupt save data.";
                            }
                            logf("Corrupt save data.");
                            exit;
                        }
                        save_string_to_file(data, "save-android.dat");
                        global.load_game_content = get_compat_save_data(save_data);
                    }
                    else
                    {
                        global.load_game_content = "";
                    }
                    if (compare_save_game_version(global.load_game_content) == 1)
                    {
                        confirm_dialog(global.texts.newer_save_warning_text, function()
                        {
                            check_overwrite_current_save();
                        }, undefined, undefined, undefined, function()
                        {
                            if (instance_exists(o_init))
                            {
                                o_init.is_loading = false;
                                o_init.text_android = "";
                            }
                        });
                        exit;
                    }
                    check_overwrite_current_save();
                    exit;
                }
                catch (e)
                {
                    logf("error", e);
                    notify_error("Error loading save data.");
                }
            }
            else if (global.is_android_cloud_saving)
            {
                logf("saving...", global.android_save_slot_name);
                var screen_sprite_tmp = sprite_create_from_surface(application_surface, 0, 0, global.gui_width, global.gui_height, false, false, 0, 0);
                sprite_save(screen_sprite_tmp, 0, "leaf.png");
                sprite_delete(screen_sprite_tmp);
                var gameplay_time = o_game.data.stats.time_elapsed;
                if (in_challenge())
                {
                    try
                    {
                        gameplay_time = global.profiles.def.objects.o_game.data.stats.time_elapsed;
                    }
                    catch (err)
                    {
                    }
                }
                var save_cloud_name = sprintf("v%s | %s", global.game_version, format_time(secr(gameplay_time), false, true));
                extension_stubfunc_real(global.android_save_slot_name, save_cloud_name, global.save_data_string, "leaf.png");
            }
            break;
    }
}
else if (global.is_ios)
{
    if (!ds_exists(async_load, ds_type_map) || !ds_map_exists(async_load, "id"))
    {
        exit;
    }
    switch (ds_map_find_value(async_load, "id"))
    {
        case 1:
            var responseJson = ds_map_find_value(async_load, "response_json");
            if (responseJson != "")
            {
                ParseAppleSignInResponse(responseJson);
            }
            break;
        case 2:
            var responseJson = ds_map_find_value(async_load, "response_json");
            if (responseJson != "")
            {
                ParseAppleCredentialResponse(responseJson);
            }
            break;
    }
}
