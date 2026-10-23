function gui_item_cloud_saves(arg0, arg1)
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
    if (gui_button_tl(arg0 + gui_col_x(0), arg1 + gui_col_y(0), __("Back"), undefined, gui_col_x(3)))
    {
        open_dialog("account", true);
        exit;
    }
    var cloud_refresh_key = "refresh_cloud_saves";
    if (!is_array(global.cloud_data.save_slots_info) && !has_timeout(cloud_refresh_key))
    {
        set_timeout(cloud_refresh_key, sec(60));
        get_cloud_save_slots_info();
    }
    var can_refresh = !has_timeout(cloud_refresh_key);
    if (global.debug)
    {
        can_refresh = true;
    }
    if (gui_button_sprite_tl(arg0 + gui_col_x(22), arg1, spr_icon_refresh, can_refresh, undefined, 
    {
        tooltip: __("Refresh")
    }))
    {
        set_timeout(cloud_refresh_key, sec(15));
        get_cloud_save_slots_info();
    }
    if (!is_array(global.cloud_data.save_slots_info) && global.cloud_data.save_slots_info_refreshed)
    {
        draw_description(arg0 + gui_col_x(5), arg1, __("Retrieving cloud saves..."));
    }
    arg1 += gui_col_y(2);
    if (instance_exists(o_game))
    {
        var text = [__s("Current save slot: %s.", mp_get_current_save_slot())];
        var last_cloud_upload = is_struct(o_game.data.upload_save_time) ? format_time_ext(o_game.data.upload_save_time, undefined, undefined, true) : "-";
        array_push(text, __s("Last cloud upload: %s ago.", last_cloud_upload));
        if (get_option(global.options.upload_save) && mp_is_logged_in() && is_struct(o_game.data.upload_save_time))
        {
            if (can_upload_save())
            {
                array_push(text, __("Cloud upload available now."));
            }
            else
            {
                var next_upload_time = 300 - date_second_span(get_date_from_object(o_game.data.upload_save_time), date_current_datetime());
                array_push(text, __s("Cloud upload available in %s.", format_time(next_upload_time)));
            }
        }
        array_push(text, __("Please note that slot #1 is the default save slot and saving new games may overwrite the progress of this slot."));
        arg1 += draw_description(arg0, arg1, text, undefined, undefined, undefined, undefined, " ");
        arg1 += gui_col_y(1);
    }
    for (var i = 0; i < 3; i++)
    {
        arg1 += draw_cloud_save(arg0, arg1, i);
    }
}

function draw_cloud_save(arg0, arg1, arg2)
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
    var slot_title = arg2 + 1;
    var has_slot_info = is_array(global.cloud_data.save_slots_info) && array_length(global.cloud_data.save_slots_info) > arg2 && is_string(global.cloud_data.save_slots_info[arg2]);
    var is_current_save_slot = slot_title == mp_get_current_save_slot();
    var text_heading = __s("Slot %s", concatstr("#", slot_title));
    if (is_current_save_slot)
    {
        text_heading += sprintf(" (%s)", __("active"));
    }
    draw_heading(arg0, arg1, text_heading);
    var info_text = "-";
    if (has_slot_info)
    {
        info_text = global.cloud_data.save_slots_info[arg2];
    }
    draw_description(arg0, arg1 + gui_col_y(1), info_text);
    if (is_ingame())
    {
        if (gui_button_tl(arg0 + gui_col_x(5), arg1 - gui_col_y(0.5), __s("Save to cloud slot %s", concatstr("#", slot_title)), can_upload_save(), gui_col_x(4)))
        {
            confirm_save_to_cloud(slot_title);
        }
    }
    if (gui_button_tl(arg0 + gui_col_x(11), arg1 - gui_col_y(0.5), __s("Load from cloud slot %s", concatstr("#", slot_title)), has_slot_info && can_download_save_from_cloud(), gui_col_x(4)))
    {
        confirm_load_from_cloud(slot_title);
    }
    if (gui_button_tl(arg0 + gui_col_x(17), arg1 - gui_col_y(0.5), __s("Delete cloud slot %s", concatstr("#", slot_title)), has_slot_info && can_download_save_from_cloud(), gui_col_x(4)))
    {
        confirm_delete_cloud_save(slot_title);
    }
    arg1 += gui_col_y(5);
    return arg1 - y_start;
}
