function gui_item_challenge(arg0, arg1, arg2)
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
    if (!is_struct(arg2))
    {
        return 0;
    }
    var y_start = arg1;
    var unlocked = arg2.is_unlocked();
    var col = 16777215;
    var name = arg2.get_name();
    var description = arg2.get_description();
    if (!unlocked)
    {
        col = 0;
        name = "?";
        description = __("Not unlocked yet.");
    }
    draw_sprite_stretched_ext(arg2.sprite, 0, arg0 + 8, arg1 + 8, 32, 32, col, 1);
    var row_y = arg1;
    arg1 += (draw_heading(arg0 + gui_col_x(1), arg1, name, undefined, undefined, undefined, 0) - gui_col_y(0.3));
    arg1 += draw_description(arg0 + gui_col_x(1), arg1, description, gui_col_x(12));
    draw_resources(arg0 + gui_col_x(14), row_y, arg2.get_reward(arg2.data.finished + 1));
    if (global.current_profile != global.profile_types.challenge)
    {
        var button_action = arg2._start;
        var button_text = __("Start");
        var challenge_is_active = false;
        if (arg2.data.active)
        {
            button_action = arg2._resume;
            button_text = __("Resume");
            challenge_is_active = true;
        }
        var can_do_action = call_method(arg2, arg2.can_start_challenge);
        if (gui_button(arg0 + gui_col_x(18), row_y + gui_col_y(0.5), button_text, can_do_action, gui_col_x(2)))
        {
            var btn_func = method(arg2, button_action);
            if (!challenge_is_active && is_any_challenge_active())
            {
                confirm_dialog(__("A challenge is currently in progress. Do you want to start a new challenge? You will lose your current challenge progress."), function(arg0)
                {
                    call_method(arg0.item, arg0.func);
                }, 
                {
                    item: arg2,
                    func: btn_func
                });
            }
            else
            {
                btn_func();
            }
        }
    }
    if (arg2.data.finished > 0)
    {
        gui_draw_sprite(arg0 + gui_col_x(19.5), y_start + gui_col_y(0.5), spr_icon_check);
    }
    return arg1 - y_start;
}

function gui_item_challenge_progress(arg0, arg1)
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
    if (!in_challenge())
    {
        exit;
    }
    var y_start = arg1;
    arg1 += draw_heading_description(arg0, arg1, global.current_challenge.name, global.current_challenge.description);
    arg1 += global.ui_gaps.sm;
    var text = global.current_challenge._get_progress_text();
    if (is_empty(text))
    {
        text = "-";
    }
    arg1 += draw_heading_description(arg0, arg1, __("Progress"), text);
    return y_start - arg1;
}

function gui_item_challenge_requirements(arg0, arg1, arg2)
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
    var y_start = arg1;
    if (!is_struct(global.current_challenge))
    {
        exit;
    }
    var can_upload = can_upload_season_save();
    var x2 = arg0 + gui_col_x(18);
    if (gui_button_tl(x2, arg1, __("Save"), can_upload, gui_col_x(4)))
    {
        save_game();
        notify(__("Season save is uploading..."));
        global.cloud_data.last_season_upload_manual = get_time_object();
    }
    if (gui_button_tl(x2, arg1 + gui_col_y(2), __("Save & return to main game"), can_upload, gui_col_x(4)))
    {
        global.cloud_data.last_season_upload = undefined;
        global.cloud_data.last_season_upload_manual = get_time_object();
        global.func_after_cloud_save = game_restart_adv;
        save_game();
        text_dialog(__("Please wait as your character is being uploaded to the cloud. The game will change to your main game automatically..."));
    }
    if (gui_button_tl(x2, arg1 + gui_col_y(5), __("Restart run"), !global.is_cloud_saving, gui_col_x(4)))
    {
        confirm_restart_season();
    }
    if (gui_button_tl(x2, arg1 + gui_col_y(8), __("Return to main game"), !global.is_cloud_saving, gui_col_x(4)))
    {
        confirm_dialog_current_nav(__("Do you want to return to the main game? Your progress will not be saved."), game_restart_main);
    }
    arg1 += draw_heading(arg0, arg1, global.cloud_data.season.name);
    if (o_game.data.mp_current_run_finished)
    {
        var complete_time = sprintf(__("%s (%s frames)"), format_time(secr(o_game.data.challenge_time_completed_frames)), o_game.data.challenge_time_completed_frames);
        var completion_text = [__s("Challenge %s was completed successfully in %s. Well done!", global.current_challenge.name, complete_time), "", __s("You can try again to achieve a faster time!"), ""];
        arg1 += draw_description(arg0, arg1, completion_text, gui_col_x(10));
        arg1 += gui_col_y(1);
        var sprite = spr_icon_cancel;
        var text = "";
        if (global.cloud_data.saved_after_challenge_completion)
        {
            sprite = spr_icon_check;
            text = __s("You current run has been uploaded.");
        }
        else if (global.is_cloud_saving)
        {
            sprite = spr_icon_refresh;
            text = __s("Please wait until your save is uploaded.");
        }
        else
        {
            sprite = spr_icon_cancel;
            text = __("Your run couldn't be uploaded. Please try again.");
        }
        gui_draw_sprite(arg0 + 16, arg1 + 8, sprite);
        draw_description(arg0 + gui_col_x(1), arg1, text);
        arg1 += gui_col_y(2);
    }
    var __array = global.current_challenge.quests;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        var stage_step = mitem.stage_steps[0];
        var is_fulfilled = mitem.type.is_stage_step_fulfilled(mitem, stage_step);
        var sprite = is_fulfilled ? spr_icon_check : spr_icon_cancel;
        gui_draw_sprite(arg0 + 16, arg1 + 12, sprite);
        var quest_text = mitem.type.get_description(mitem, stage_step);
        quest_text += sprintf(": %s", number_format(mitem.type.get_current_quest_value(stage_step)));
        var claim_result = 
        {
            resources: 
            {
                gems: 500
            }
        };
        var claim_text = variable_struct_get(o_game.data.season_quests_claimed, __i) ? __("Claimed") : __("Claim");
        if (gui_button_tl(arg0 + gui_col_x(8), arg1 - gui_col_y(0.25), claim_text, is_fulfilled && !variable_struct_get(o_game.data.season_quests_claimed, __i), gui_col_x(2), undefined, 
        {
            result_mini: claim_result
        }))
        {
            add_result_lite(claim_result);
            variable_struct_set(o_game.data.season_quests_claimed, __i, true);
        }
        arg1 += draw_description(arg0 + gui_col_x(1), arg1, quest_text);
        arg1 += gui_col_y(global.is_mobile ? 1.75 : 1.25);
    }
    if (is_struct(struct_get_from_hash(global.game_settings, variable_get_hash("unlocked"))))
    {
        var mechanics_text = [];
        var __struct = global.game_settings.unlocked;
        var __prop_names = struct_get_names(__struct);
        __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            array_push(mechanics_text, "- " + get_default_struct_value(global.texts_mechanics, mkey, mkey));
        }
        arg1 += draw_description(arg0, arg1, __s("Unlocked:") + "\n" + implode("\n", mechanics_text), gui_col_x(8));
    }
    if (is_struct(struct_get_from_hash(global.cloud_data, variable_get_hash("player_challenge_data"))))
    {
        var player_challenge_data = global.cloud_data.player_challenge_data;
        if (is_struct(player_challenge_data))
        {
            var row_x = arg0 + gui_col_x(11);
            var row_y = y_start;
            row_y += gui_item_profile_challenge_data(row_x, row_y, player_challenge_data);
            row_y += draw_description(row_x, row_y, [__s("Ranks are not updated in realtime."), "", __s("When the challenge has ended and the final ranks have been determined, you can claim your reward in the %s menu.", __("Claimable rewards"))], gui_col_x(6));
        }
    }
    return arg1 - y_start;
}
