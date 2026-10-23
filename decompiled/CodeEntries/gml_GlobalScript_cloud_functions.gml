function can_download_save_from_cloud()
{
    if (!mp_is_logged_in())
    {
        return false;
    }
    if (mp_is_season())
    {
        return false;
    }
    return true;
}

function can_upload_save()
{
    if (global.is_cloud_saving)
    {
        return false;
    }
    if (!mp_is_logged_in())
    {
        return false;
    }
    if (!global.cloud_data.is_season && !get_option(global.options.upload_save))
    {
        return false;
    }
    with (o_game)
    {
        if (!is_struct(global.cloud_data.last_season_upload))
        {
            return true;
        }
        var delay_save_time = global.cloud_data.is_season ? global.cloud_data.season_upload_delay : 300;
        if (date_second_span(get_date_from_object(global.cloud_data.last_season_upload), date_current_datetime()) < delay_save_time)
        {
            return false;
        }
        return true;
    }
}

function can_upload_season_save()
{
    if (is_undefined(global.cloud_data.last_season_upload_manual))
    {
        return true;
    }
    if (date_second_span(get_date_from_object(global.cloud_data.last_season_upload_manual), date_current_datetime()) < global.cloud_data.season_upload_delay)
    {
        return false;
    }
    return true;
}

function check_upload_save()
{
    if (!can_upload_save())
    {
        global.is_saving = false;
        global.is_cloud_saving = false;
        exit;
    }
    upload_save_to_cloud();
}

function check_upload_save_google(arg0)
{
    if (!is_google_cloud_save_enabled())
    {
        exit;
    }
    logf("Saving game to google cloud...");
    global.is_android_cloud_saving = true;
    global.save_data_string = arg0;
    extension_stubfunc_real(global.android_save_slot_name);
    delay("gplay_cloud_save_notification", sec(0.5), function()
    {
        notify(__("Saving game to Google cloud..."));
    });
}

function clear_async_actions()
{
    var __struct = global.await_async_actions;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_remove(global.await_async_actions, mkey);
        log("cleared async action", mkey);
    }
    global.is_saving = false;
}

function confirm_delete_cloud_save(arg0)
{
    global.cloud_slot_selected = arg0;
    var text = __s("Do you want to delete save #%s from the cloud server?", global.cloud_slot_selected);
    confirm_dialog(text, function()
    {
        delete_cloud_save();
        notify(__("Deleting cloud save, please wait..."));
    }, undefined, undefined, 
    {
        parent_nav: "cloud_saves"
    });
}

function confirm_load_from_cloud(arg0)
{
    global.cloud_slot_selected = arg0;
    var text = __("Do you want to load your save data from the cloud server? This will overwrite your current progress.");
    confirm_dialog(text, function()
    {
        save_options();
        load_cloud_save();
        notify(__("Loading cloud save, please wait..."));
    }, undefined, undefined, 
    {
        parent_nav: "cloud_saves"
    });
}

function confirm_save_to_cloud(arg0)
{
    global.cloud_slot_selected = arg0;
    var text = __s("Do you want to upload your save data to the cloud server? This will overwrite slot #%s.", arg0);
    confirm_dialog(text, function()
    {
        o_game.data.current_save_slot = global.cloud_slot_selected;
        save_game();
    }, undefined, undefined, 
    {
        parent_nav: "cloud_saves"
    });
}

function delete_async_response(arg0)
{
    variable_struct_set(global.await_async_actions, arg0, undefined);
}

function delete_cloud_save()
{
    var route = "delete_save";
    var post_data = 
    {
        slot: global.cloud_slot_selected
    };
    post_to_cloud("save", route, 
    {
        data: post_data
    }, function(arg0)
    {
        notify(arg0.success);
        get_cloud_save_slots_info();
    }, function(arg0)
    {
        notify_error(sprintf(__("Cloud delete slot failed, please try again later.")));
    });
}

function get_async_data(arg0)
{
    return variable_struct_get(global.await_async_actions, arg0);
}

function get_async_data_by_name(arg0)
{
    var __struct = global.await_async_actions;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        if (is_undefined(mitem))
        {
            continue;
        }
        if (mitem.action_id == arg0)
        {
            return mitem;
        }
    }
    return undefined;
}

function get_async_data_text(arg0)
{
    var action = get_async_data_by_name(arg0);
    if (is_undefined(action))
    {
        return "";
    }
    return action.text;
}

function get_cloud_save_data(arg0)
{
    if (!mp_is_logged_in())
    {
        return false;
    }
    set_async_response();
}

function get_cloud_save_slots_info()
{
    var route = "get_save_slots_info";
    global.cloud_data.save_slots_info = "";
    global.cloud_data.save_slots_info_refreshed = false;
    post_to_cloud("save", route, undefined, function(arg0)
    {
        if (is_undefined(struct_get_from_hash(arg0, variable_get_hash("info"))))
        {
            exit;
        }
        global.cloud_data.save_slots_info = arg0.info;
        global.cloud_data.save_slots_info_refreshed = true;
    });
}

function get_login_token()
{
    if (!file_exists("token.dat"))
    {
        return false;
    }
    var token = get_file_contents("token.dat");
    return token;
}

function get_url_contents(arg0, arg1 = __void, arg2 = __void, arg3 = 0, arg4 = true, arg5 = undefined)
{
    static action_id_index = 0;
    
    var action_id = ++action_id_index;
    var query_id = http_get(arg0);
    variable_struct_set(global.await_async_actions, query_id, 
    {
        action_id: action_id,
        args: arg5,
        error: arg2,
        parse_response: arg4,
        query_id: query_id,
        success: arg1,
        time: date_current_datetime()
    });
    var timeout_key = sprintf("http_timeout_%s", query_id);
    delay(timeout_key, sec(30), function()
    {
        variable_struct_set(global.await_async_actions, self.props.query_id, undefined);
    }, 
    {
        query_id: query_id
    }, true);
    if (arg3 > 0)
    {
        set_timeout(action_id, arg3);
    }
    return variable_struct_get(global.await_async_actions, query_id);
}

function has_async_data(arg0)
{
    return get_async_data_by_name(arg0) != undefined;
}

function hn_login(arg0, arg1)
{
    set_async_response_text(__("Logging in") + "...");
    post_to_cloud("user", "login", 
    {
        username_email: arg0,
        password: arg1
    }, function(arg0)
    {
        var token = arg0.token;
        set_mp_token(token);
        open_dialog("account");
        set_async_response_text("");
        global.await_async_actions.user_login = undefined;
    }, function(arg0)
    {
        set_async_response_text(arg0);
        global.await_async_actions.user_login = undefined;
    });
}

function init_cloud_data()
{
    global.cloud_data = 
    {
        challenges: undefined,
        daily_quests: undefined,
        claim_rewards: [],
        daily_reward: {},
        daily_reward_available: false,
        get_previous_seasons_info: false,
        get_season_info: false,
        guild: undefined,
        guild_search_cache: undefined,
        guild_search_random_cache: undefined,
        guild_settings: {},
        is_season: false,
        kick: false,
        last_refresh: -1,
        last_save_upload: undefined,
        last_season_upload: undefined,
        last_season_upload_manual: undefined,
        mp_token: "",
        msg: "",
        ping: 0,
        player_challenge_data: {},
        previous_seasons_info: undefined,
        profile: undefined,
        save_hash: undefined,
        save_slots_info: undefined,
        save_slots_info_refreshed: true,
        saved_after_challenge_completion: false,
        season: undefined,
        season_data: undefined,
        season_info: undefined,
        season_kick_count: 0,
        season_selected: undefined,
        season_settings: {},
        season_upload_delay: 60,
        server_time: undefined,
        user_id: 0,
        weekly_challenges: undefined
    };
}

function load_cloud_save(arg0 = global.web_base_url)
{
    var route = "load_character";
    var post_data = 
    {
        slot: global.cloud_slot_selected
    };
    post_to_cloud("save", route, 
    {
        data: post_data
    }, function(arg0)
    {
        if (is_undefined(struct_get_from_hash(arg0, variable_get_hash("save_data"))) || is_empty(struct_get_from_hash(arg0, variable_get_hash("save_data"))))
        {
            return notify_error(__("Empty cloud save data."));
        }
        if (file_exists("save.dat"))
        {
            file_copy("save.dat", "save-main.dat");
        }
        save_string_to_file(arg0.save_data, "save.tmp");
        if (!is_save_valid("save.tmp"))
        {
            notify_error(__("Invalid cloud save data."));
            file_delete("save.tmp");
            exit;
        }
        if (compare_save_game_version("save.tmp", 2229.07) == 1)
        {
            confirm_dialog(global.texts.newer_save_warning_text, function()
            {
                load_game_from_file("save.tmp");
            });
        }
        else
        {
            load_game_from_file("save.tmp");
        }
    }, function(arg0)
    {
        notify_error(sprintf(__("Cloud load failed, please try again later.")));
    });
}

function load_token()
{
    if (!file_exists("token.dat"))
    {
        exit;
    }
    global.cloud_data.mp_token = get_file_contents("token.dat");
}

function mp_get_current_save_slot()
{
    if (!instance_exists(o_game))
    {
        return 1;
    }
    if (in_challenge())
    {
        return global.profiles.def.objects.o_game.data.current_save_slot;
    }
    return o_game.data.current_save_slot;
}

function mp_is_logged_in()
{
    if (global.cloud_data.mp_token == "")
    {
        return false;
    }
    return true;
}

function mp_logout(arg0 = true)
{
    set_mp_token("");
    if (arg0)
    {
        text_dialog(sprintf(__("You were logged out of your account. Please remember to log out of your account from your browser on %s"), "https://lbr.humblenorth.de/lbr/wp2"));
    }
    if (global.cloud_data.is_season)
    {
        game_restart_adv();
        exit;
    }
}

function ping_server()
{
    log("pinging server...");
    post_to_cloud("misc", "ping", 
    {
        time: unixtime()
    }, function(arg0)
    {
        log("result = ", arg0);
    });
}

function post_to_cloud(arg0, arg1, arg2 = undefined, arg3 = __void, arg4 = __void, arg5 = "", arg6 = 0, arg7 = true)
{
    var data_array = [];
    if (is_struct(arg2))
    {
        var __struct = arg2;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            if (is_struct(mitem))
            {
                var __struct2 = mitem;
                var __prop_names2 = struct_get_names(__struct2);
                var __prop_len2 = array_length(__prop_names2);
                for (var __i2 = 0; __i2 < __prop_len2; __i2++)
                {
                    var mkey2 = __prop_names2[__i2];
                    var mitem2 = variable_struct_get(__struct2, mkey2);
                    if (is_struct(mitem2))
                    {
                        var __struct3 = mitem;
                        var __prop_names3 = struct_get_names(__struct3);
                        var __prop_len3 = array_length(__prop_names3);
                        for (var __i3 = 0; __i3 < __prop_len3; __i3++)
                        {
                            var mkey3 = __prop_names3[__i3];
                            var mitem3 = variable_struct_get(__struct3, mkey3);
                            array_push(data_array, sprintf("%s=%s", mkey3, url_encode(mitem3)));
                        }
                    }
                    else
                    {
                        array_push(data_array, sprintf("%s=%s", mkey2, url_encode(mitem2)));
                    }
                }
            }
            else
            {
                array_push(data_array, sprintf("%s=%s", mkey, url_encode(mitem)));
            }
        }
    }
    if (is_struct(global.cloud_data.season_selected))
    {
        array_push(data_array, sprintf("season_id=%s", url_encode(global.cloud_data.season_selected.id)));
    }
    var data_array_string = implode("&", data_array);
    var query_url = sprintf("action=%s&route=%s&os=%s&steam_id=%s&token=%s&version=%s&app_id=%s&%s", arg1, arg0, 0, string(get_user_steam_id()), global.cloud_data.mp_token, global.game_version, "1468260", data_array_string);
    if (global.is_ios && is_apple_signed_in())
    {
        query_url += sprintf("&apple_userid=%s", struct_get_from_hash(global.ios_account, variable_get_hash("userIdentifier")));
    }
    if (global.debug)
    {
        query_url += "&debug666=1";
    }
    var action_id = sprintf("%s_%s", arg0, arg1);
    var query_id;
    if (global.is_opera)
    {
        var map = ds_map_create();
        ds_map_add(map, "Content-Type", "application/x-www-form-urlencoded");
        query_id = http_request(global.web_base_url, "POST", map, query_url);
        ds_map_destroy(map);
    }
    else
    {
        query_id = http_post_string(global.web_base_url, query_url);
        log("HTTP", global.web_base_url + "?" + query_url);
    }
    variable_struct_set(global.await_async_actions, query_id, 
    {
        action: arg1,
        action_id: action_id,
        error: arg4,
        parse_response: arg7,
        query_id: query_id,
        route: arg0,
        success: arg3,
        text: arg5,
        time: date_current_datetime()
    });
    var timeout_key = sprintf("http_timeout_%s", query_id);
    delay(timeout_key, sec(30), function()
    {
        variable_struct_set(global.await_async_actions, self.props.query_id, undefined);
    }, 
    {
        query_id: query_id
    }, true);
    if (arg6 > 0)
    {
        set_timeout(action_id, arg6);
    }
    return variable_struct_get(global.await_async_actions, query_id);
}

function post_to_cloud_lite(arg0, arg1, arg2 = undefined)
{
    var data_array = [];
    if (is_struct(arg2))
    {
        var __struct = arg2;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            if (is_struct(mitem))
            {
                var __struct2 = mitem;
                var __prop_names2 = struct_get_names(__struct2);
                var __prop_len2 = array_length(__prop_names2);
                for (var __i2 = 0; __i2 < __prop_len2; __i2++)
                {
                    var mkey2 = __prop_names2[__i2];
                    var mitem2 = variable_struct_get(__struct2, mkey2);
                    if (is_struct(mitem2))
                    {
                        var __struct3 = mitem;
                        var __prop_names3 = struct_get_names(__struct3);
                        var __prop_len3 = array_length(__prop_names3);
                        for (var __i3 = 0; __i3 < __prop_len3; __i3++)
                        {
                            var mkey3 = __prop_names3[__i3];
                            var mitem3 = variable_struct_get(__struct3, mkey3);
                            array_push(data_array, sprintf("%s=%s", mkey3, url_encode(mitem3)));
                        }
                    }
                    else
                    {
                        array_push(data_array, sprintf("%s=%s", mkey2, url_encode(mitem2)));
                    }
                }
            }
            else
            {
                array_push(data_array, sprintf("%s=%s", mkey, url_encode(mitem)));
            }
        }
    }
    var data_array_string = implode("&", data_array);
    var query_url = sprintf("action=%s&route=%s&os=%s&steam_id=%s&version=%s&app_id=%s&%s", arg1, arg0, 0, string(steam_get_user_steam_id()), global.game_version, "1468260", data_array_string);
    if (global.debug)
    {
        query_url += "&debug666=1";
    }
    var action_id = sprintf("%s_%s", arg0, arg1);
    var query_id = http_post_string(global.web_base_url, query_url);
    log2file("post to cloud lite", query_id, query_url);
    return query_id;
}

function process_http_response()
{
    if (string_pos("cheesetor:5100", ds_map_find_value(async_load, "url")) != 0)
    {
        exit;
    }
    if (string_pos("localhost:5100", ds_map_find_value(async_load, "url")) != 0)
    {
        exit;
    }
    logdsmapstream("http");
    if (!is_undefined(ds_map_find_value(async_load, "sizeDownloaded")))
    {
        exit;
    }
    var http_status = ds_map_find_value(async_load, "http_status");
    var async_id = ds_map_find_value(async_load, "id");
    var async_id_action = get_async_data(async_id);
    var res_raw = ds_map_find_value(async_load, "result");
    if (!is_struct(async_id_action))
    {
        exit;
    }
    if (http_status != 200)
    {
        if (is_struct(async_id_action) && !is_undefined(struct_get_from_hash(async_id_action, variable_get_hash("error"))))
        {
            async_id_action.error(res_raw);
        }
        return set_async_response_text(sprintf(__("Error %s: received status code %s. Please try again later."), "#4", http_status));
    }
    if (!get_default_struct_value(async_id_action, "parse_response", true))
    {
        variable_struct_remove(global.await_async_actions, async_id);
        async_id_action.success(res_raw, struct_get_from_hash(async_id_action, variable_get_hash("args")));
        return true;
    }
    var res;
    try
    {
        res = json_parse(res_raw);
        if (!is_struct(res))
        {
            log("Error #2: invalid result.", res_raw);
            clear_async_actions();
            return notify_error(sprintf(__("Error %s: Invalid result. Please try again later."), "#2"));
        }
    }
    catch (err)
    {
        if (global.debug || global.testers)
        {
            log2file(err);
            log2file(res_raw);
        }
        log(err, res_raw);
        if (is_struct(async_id_action) && !is_undefined(struct_get_from_hash(async_id_action, variable_get_hash("error"))))
        {
            async_id_action.error(res_raw);
        }
        clear_async_actions();
        return notify_error(sprintf(__("Error %s: Invalid result. Please try again later."), "#1"));
    }
    set_async_response_text("");
    if (!is_struct(res))
    {
        exit;
    }
    if (!is_undefined(async_id_action))
    {
        if (!is_undefined(struct_get_from_hash(res, variable_get_hash("error"))))
        {
            async_id_action.error(res.error);
            set_async_response_text(res.error);
            if (mp_is_season())
            {
                if (is_struct(res.error) && is_struct(struct_get_from_hash(res.error, variable_get_hash("set_resources"))))
                {
                    var __struct = res.error.set_resources;
                    var __prop_names = struct_get_names(__struct);
                    var __prop_len = array_length(__prop_names);
                    for (var __i = 0; __i < __prop_len; __i++)
                    {
                        var mkey = __prop_names[__i];
                        var mitem = variable_struct_get(__struct, mkey);
                        var resource = variable_struct_get(global.resources, mkey);
                        if (is_undefined(resource))
                        {
                            continue;
                        }
                        apply_struct_to_struct(resource.data, mitem);
                    }
                }
            }
            variable_struct_remove(global.await_async_actions, async_id);
            exit;
        }
        if (is_undefined(struct_get_from_hash(res, variable_get_hash("success"))))
        {
            async_id_action.error(sprintf(__("Error %s: Invalid success result. Please try again later."), "#3"));
            variable_struct_remove(global.await_async_actions, async_id);
            exit;
        }
        if (!is_undefined(struct_get_from_hash(res, variable_get_hash("msg"))))
        {
            notify(res.msg, "important");
        }
        async_id_action.success(res, struct_get_from_hash(async_id_action, variable_get_hash("args")));
        if (is_struct(struct_get_from_hash(res, variable_get_hash("claim_rewards"))))
        {
            global.cloud_data.claim_rewards = get_default_struct_value(res, "claim_rewards", undefined);
        }
        if (mp_is_season())
        {
            if (async_id_action.route == "guild")
            {
                if (!is_undefined(struct_get_from_hash(res, variable_get_hash("guild"))))
                {
                    set_guild(res.guild);
                }
                if (!is_undefined(struct_get_from_hash(res, variable_get_hash("guild_settings"))))
                {
                    apply_struct_to_struct(global.cloud_data.guild_settings, res.guild_settings);
                }
            }
        }
        variable_struct_remove(global.await_async_actions, async_id);
    }
}

function process_image_response()
{
    log("--- async image ---");
    logdsmapstream("image");
    var filename = ds_map_find_value(async_load, "filename");
    var image_id = ds_map_find_value(async_load, "id");
    var status = ds_map_find_value(async_load, "status");
    if (status < 0)
    {
        log("failed to load image");
        exit;
    }
    variable_struct_set(global.image_cache_http, filename, image_id);
    log("downloaded image", filename, image_id);
}

function process_redeem_code(arg0)
{
    if (is_undefined(struct_get_from_hash(arg0, variable_get_hash("reward"))))
    {
        return text_dialog(__("No reward."));
    }
    if (is_undefined(struct_get_from_hash(arg0, variable_get_hash("code"))))
    {
        return text_dialog(__("No code."));
    }
    variable_struct_set(o_game.data.codes_redeemed, arg0.code, 1);
    add_result(arg0.reward, undefined, undefined, undefined, true);
}

function redeem_code(arg0)
{
    var redeem_post_key = iif(mp_is_season(), "redeem_code", "redeem_code_main");
    var code_trimmed = string_trim(arg0);
    if (!is_undefined(variable_struct_get(o_game.data.codes_redeemed, code_trimmed)))
    {
        set_async_response_text(__("You have already redeemed this code."));
        return notify_error(__("You have already redeemed this code."));
    }
    post_to_cloud("save", redeem_post_key, 
    {
        code: arg0,
        os: 0,
        os_device: os_device,
        os_version: os_version,
        player_id: o_game.data.player_id,
        player_steam_id: o_game.data.player_steam_id
    }, function(arg0)
    {
        process_redeem_code(arg0);
        set_async_response_text("");
        global.await_async_actions.save_redeem_code = undefined;
    });
}

function reset_cloud_save()
{
    global.func_after_cloud_save = undefined;
    global.is_saving = false;
    global.is_cloud_saving = false;
    global.cloud_data.last_season_upload = undefined;
    global.cloud_data.last_season_upload_manual = undefined;
    global.await_async_actions.save_load_season_save = undefined;
}

function set_async_response_text(arg0)
{
    global.await_async_action_text = arg0;
}

function set_mp_token(arg0)
{
    save_string_to_file(arg0, "token.dat");
    global.cloud_data.mp_token = arg0;
}

function upload_save_to_cloud(arg0 = "https://lbr.humblenorth.de/lbr/report/router.php")
{
    var action = "save_character_slot";
    if (global.cloud_data.is_season)
    {
        action = "save_season_character";
    }
    var route = "save";
    var post_data = get_file_contents(get_save_filename_custom());
    global.is_cloud_saving = true;
    post_to_cloud(route, action, 
    {
        data: post_data,
        slot: mp_get_current_save_slot()
    }, upload_save_to_cloud_success, upload_save_to_cloud_error);
    with (o_game)
    {
        data.upload_save_time = get_time_object();
    }
}

function upload_save_to_cloud_error(arg0)
{
    delay("season_reset_save_button", sec(30), function()
    {
        reset_cloud_save();
    });
    if (is_string(arg0) && !is_empty(arg0))
    {
        notify_error(arg0);
    }
    notify_error(__s("Save upload failed, please wait %s and try again.", format_time(global.cloud_data.season_upload_delay)));
}

function upload_save_to_cloud_success(arg0)
{
    global.is_saving = false;
    global.is_cloud_saving = false;
    global.cloud_data.last_season_upload = get_time_object();
    if (global.cloud_data.is_season)
    {
        global.cloud_data.daily_reward_available = get_default_struct_value(arg0, "daily_reward_available", false);
        global.cloud_data.saved_after_challenge_completion = true;
        ez_remove_timer("season_reset_save_button");
    }
    if (in_mp_challenge() && !global.cloud_data.saved_after_challenge_completion && global.current_challenge.data.fastest_finish_time_frames > 0)
    {
        global.cloud_data.saved_after_challenge_completion = true;
    }
    if (!is_undefined(global.func_after_cloud_save))
    {
        delay("func_after_cloud_save", sec(1), function()
        {
            if (global.is_android_cloud_saving)
            {
                exit;
            }
            global.func_after_cloud_save();
            global.func_after_cloud_save = undefined;
        });
    }
    notify(__("Save uploaded to cloud."));
}
