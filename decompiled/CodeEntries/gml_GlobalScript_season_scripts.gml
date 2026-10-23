function claim_reward(arg0, arg1, arg2)
{
    if (!is_undefined(variable_struct_get(o_game.data.stats, arg0)))
    {
        return notify_error(__("You have already claimed this reward."));
    }
    if (has_async_data("save_claim_reward"))
    {
        return notify(__("Already claiming reward, please wait..."), "important");
    }
    global.tmp_claim_reward_id = arg0;
    global.tmp_claim_reward_name = arg1;
    global.tmp_claim_reward_result = arg2;
    post_to_cloud("save", "claim_reward", 
    {
        reward_id: arg0
    }, function(arg0)
    {
        log("claim reward", arg0);
        variable_struct_set(o_game.data.stats, global.tmp_claim_reward_id, 1);
        add_result_lite(global.tmp_claim_reward_result);
        if (!mp_is_season())
        {
            save_game();
        }
        notify(__s("Claimed reward %s", global.tmp_claim_reward_name), "important");
    });
}

function claim_season_rewards(arg0)
{
    if (is_undefined(struct_get_from_hash(arg0, variable_get_hash("season_claim_rewards"))))
    {
        return text_dialog(__("Invalid result. Please try again later."));
    }
    if (is_undefined(struct_get_from_hash(arg0, variable_get_hash("season"))))
    {
        return text_dialog(__("Invalid season. Please try again later."));
    }
    if (in_array(arg0.season, o_game.data.stats.claimed_seasons))
    {
        return text_dialog(__("You have already claimed your season reward."));
    }
    array_push(o_game.data.stats.claimed_seasons, arg0.season);
    add_result(arg0.season_claim_rewards, sprintf(__("You were ranked %s.") + " ", arg0.rank));
}

function confirm_logout()
{
    confirm_dialog(__("Do you really want to log out of your account?"), logout);
}

function confirm_restart_season()
{
    confirm_dialog_nav(__("Do you want to start a new run?"), function()
    {
        notify(__("Restarting run..."));
        set_timeout("season_restart_run", sec(20));
        post_to_cloud("save", "delete_season_save", undefined, function(arg0)
        {
            load_season_character_data();
        }, text_dialog);
    }, "seasons");
}

function delete_account(arg0)
{
    notify(__("Deleting account..."));
    post_to_cloud("user", "delete_account", 
    {
        password: arg0
    }, function(arg0)
    {
        text_dialog(__s("Your account has been deleted. Bye!"));
        mp_logout(false);
    }, function(arg0)
    {
        notify_error(__s("Failed to delete account. Please check your password or contact support."));
    });
}

function load_season_character()
{
    save_game();
    text_dialog(__("Loading season character..."));
    load_season_character_data();
}

function load_season_character_data()
{
    post_to_cloud("save", "load_season_save", undefined, function(arg0)
    {
        log("got result loading", arg0);
        var o = instance_create_layer(0, 0, global.layers.control, o_season_helper);
        o.area_settings = get_default_struct_value(arg0, "area_settings");
        o.challenge_data = get_default_struct_value(arg0, "challenge_data");
        if (!is_struct(o.challenge_data))
        {
            o.challenge_data = {};
        }
        o.challenge_key = get_default_struct_value(arg0, "challenge_key", "");
        o.daily_reward = get_default_struct_value(arg0, "daily_reward", {});
        o.daily_reward_available = get_default_struct_value(arg0, "daily_reward_available", false);
        o.game_settings = get_default_struct_value(arg0, "game_settings", {});
        o.guild = get_default_struct_value(arg0, "guild");
        o.guild_settings = get_default_struct_value(arg0, "guild_settings");
        o.is_challenge = get_default_struct_value(arg0, "is_challenge", false);
        o.load_game_content = get_default_struct_value(arg0, "save_data", "");
        o.msg = get_default_struct_value(arg0, "msg", "");
        o.player_challenge_data = get_default_struct_value(arg0, "player_challenge_data", "");
        o.player_id = get_default_struct_value(arg0, "player_id", "");
        o.season_data = arg0;
        o.season_selected = global.cloud_data.season_selected;
        o.season_settings = get_default_struct_value(arg0, "season_settings", {});
        o.season_shop_item_settings = get_default_struct_value(arg0, "season_shop_item_settings", {});
        o.shop_data = get_default_struct_value(arg0, "shop_data", {});
        o.user_id = get_default_struct_value(arg0, "user_id", 0);
        if (is_struct(o.challenge_data) && !is_empty(struct_get_from_hash(o.challenge_data, variable_get_hash("challenge_seed"))))
        {
            o.challenge_seed = o.challenge_data.challenge_seed;
        }
        global.load_game_content = undefined;
        room_goto(r_init);
    }, text_dialog);
}

function logout()
{
    text_dialog(__("You will be logged out. Please wait..."));
    if (global.cloud_data.is_season)
    {
        global.func_after_cloud_save = mp_logout;
        save_game();
        text_dialog(__("Please wait as your character is being uploaded to the cloud. The game will change to your main game automatically..."));
        exit;
    }
    mp_logout();
}

function mp_can_get_claimable_rewards()
{
    return !has_timeout("save_get_claim_rewards");
}

function mp_get_claimable_rewards()
{
    global.cloud_data.claim_rewards = undefined;
    post_to_cloud("save", "get_claim_rewards", undefined, function(arg0)
    {
        global.cloud_data.claim_rewards = get_default_struct_value(arg0, "claim_rewards");
    });
    set_timeout("save_get_claim_rewards", sec(10));
}

function mp_get_profile()
{
    post_to_cloud("save", "get_profile", undefined, function(arg0)
    {
        if (is_undefined(struct_get_from_hash(arg0, variable_get_hash("profile"))))
        {
            return notify_error(__s("Something went wrong. Please try again later."));
        }
        global.cloud_data.profile = arg0.profile;
    }, function(arg0)
    {
        notify_error(__s("Something went wrong. Please try again later."));
    });
}

function mp_get_season_info()
{
    global.cloud_data.get_season_info = true;
    global.cloud_data.season_info = undefined;
    post_to_cloud("save", "get_season_info", undefined, function(arg0)
    {
        if (is_undefined(struct_get_from_hash(arg0, variable_get_hash("season_info"))))
        {
            return notify_error(__("Invalid seasons data. Please try again later."));
        }
        global.cloud_data.get_season_info = false;
        global.cloud_data.season_info = arg0.season_info;
    }, function(arg0)
    {
        global.cloud_data.get_season_info = false;
        notify_error(__("Unable to get seasons info. Please try again later."));
    });
}

function mp_get_previous_seasons_info()
{
    global.cloud_data.get_previous_seasons_info = true;
    global.cloud_data.previous_seasons_info = undefined;
    post_to_cloud("save", "get_previous_seasons_info", undefined, function(arg0)
    {
        if (is_undefined(struct_get_from_hash(arg0, variable_get_hash("seasons"))))
        {
            return notify_error(__("Invalid seasons data. Please try again later."));
        }
        global.cloud_data.get_previous_seasons_info = false;
        global.cloud_data.previous_seasons_info = arg0;
    }, function(arg0)
    {
        global.cloud_data.get_previous_seasons_info = false;
        notify_error(__("Unable to get seasons info. Please try again later."));
    });
}

function mp_is_season()
{
    if (!mp_is_logged_in())
    {
        return false;
    }
    return global.cloud_data.is_season;
}

function mp_season_kick(arg0 = "")
{
    if (global.cloud_data.kick)
    {
        exit;
    }
    global.cloud_data.kick = true;
    notify_error(arg0, "error_persist");
    delay("season_kick", sec(305), function()
    {
        game_restart_adv();
    });
}

function mp_track_game()
{
    if (o_game.data.mp_current_run_finished)
    {
        exit;
    }
    var row = 
    {
        dbg: global.debug,
        gems: global.resources.gems.data.count,
        te: o_game.data.stats.time_elapsed
    };
    array_push(o_game.data.mp_tracker, row);
    limit_log(o_game.data.mp_tracker, 100);
}

function salvage_season(arg0)
{
    if (is_undefined(struct_get_from_hash(arg0, variable_get_hash("salvage_rewards"))))
    {
        return text_dialog(__("Invalid result. Please try again later."));
    }
    if (is_undefined(struct_get_from_hash(arg0, variable_get_hash("season"))))
    {
        return text_dialog(__("Invalid season. Please try again later."));
    }
    if (in_array(arg0.season, o_game.data.stats.salvaged_seasons))
    {
        return text_dialog(__("You have already salvaged this season character."));
    }
    array_push(o_game.data.stats.salvaged_seasons, arg0.season);
    global.is_season_salvage = true;
    add_result(arg0.salvage_rewards);
    global.is_season_salvage = false;
}

function season_handler_check()
{
    if (!mp_is_season())
    {
        exit;
    }
    post_to_cloud("season", "check", undefined, function(arg0)
    {
        global.cloud_data.season_kick_count = 0;
        global.cloud_data.server_time = arg0.server_time;
        if (!is_undefined(struct_get_from_hash(arg0, variable_get_hash("kick"))))
        {
            var kick_text = get_default_struct_value(arg0, "kick_text", __("Force kick in 5 minutes..."));
            mp_season_kick(kick_text);
        }
        if (is_struct(struct_get_from_hash(arg0, variable_get_hash("guild"))))
        {
            set_guild(arg0.guild);
        }
        if (is_struct(global.cloud_data.guild) && !is_struct(struct_get_from_hash(arg0, variable_get_hash("guild"))))
        {
            global.cloud_data.guild = undefined;
            notify(__("You were kicked from the guild."), "important");
        }
    }, function()
    {
        global.cloud_data.season_kick_count++;
        if (global.cloud_data.season_kick_count >= 30)
        {
            mp_season_kick(sprintf(__("Unable to contact season server after %s tries. Your game will restart in 5 minutes..."), 5));
        }
    });
}

function season_handler_game()
{
    if (!mp_is_season())
    {
        exit;
    }
    var max_season_time = get_default_struct_value(global.game_settings, "max_time", 0);
    if (max_season_time != 0 && o_game.data.stats.time_elapsed >= max_season_time)
    {
        o_game.can_elapse_time = false;
    }
}
