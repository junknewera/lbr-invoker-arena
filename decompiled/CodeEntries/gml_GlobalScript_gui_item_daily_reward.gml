function gui_item_daily_reward(arg0, arg1)
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
    if (is_current_dialog_section(global.dialog_sections.daily_rewards.reward))
    {
        var daily_reward = get_daily_reward_resources();
        var daily_reward_add_text = format_result_text(daily_reward);
        var claim_btn_text = __("Claim daily reward");
        if (global.cloud_data.is_season && !is_undefined(struct_get_from_hash(global.await_async_actions, variable_get_hash("save_claim_daily_reward"))))
        {
            claim_btn_text = __("Claiming...");
        }
        var can_claim = !daily_reward_claimed();
        if (global.cloud_data.is_season && !is_undefined(struct_get_from_hash(global.await_async_actions, variable_get_hash("save_claim_daily_reward"))))
        {
            can_claim = false;
        }
        var info_text = [];
        if (global.is_mobile)
        {
            if (instance_exists(o_mobile_helper) && !o_mobile_helper.got_purchase_data)
            {
                array_push(info_text, __("Purchase data not retrieved yet, please wait and refresh the daily reward dialog. You might be missing out your pack bonuses."));
            }
            __struct = global.shops.dlc;
            __prop_names = struct_get_names(__struct);
            __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                if (mitem.data.count == 1 && is_undefined(variable_struct_get(mitem.data.claimed_os, 0)))
                {
                    array_push(info_text, __("You have unclaimed packs! Go to the Supporter Shop and claim your items to receive all supporter rewards."));
                    break;
                }
            }
        }
        else if (global.is_pc && !global.is_steam_initialised)
        {
            array_push(info_text, __("Steam offline, please launch the game from Steam to receive pack bonuses."));
        }
        var show_supporter_shop_text = false;
        var __struct = global.shops.dlc;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            if (!is_dlc_purchase_valid(mitem.dlc_id))
            {
                show_supporter_shop_text = true;
                break;
            }
        }
        if (show_supporter_shop_text)
        {
            array_push(info_text, __s("Receive more daily rewards with supporter packs! By purchasing DLC packs, not only will you gain access to a range of exciting in-game perks and bonuses, but you'll also be supporting the ongoing development and improvement of %s.", "Leaf Blower Revolution"));
        }
        arg1 += draw_description(arg0, arg1, info_text);
        arg1 += gui_col_y(0.5);
        if (gui_button_tl(arg0, arg1, __("Claim daily reward"), !daily_reward_claimed(), gui_col_x(5)))
        {
            claim_daily_reward();
        }
        if (show_supporter_shop_text)
        {
            if (gui_button_tl(arg0 + gui_col_x(7), arg1, __("Open Supporter Shop"), undefined, gui_col_x(5)))
            {
                open_nav("supporter_shop");
            }
        }
        arg1 += gui_col_y(2.5);
        arg1 += draw_result(arg0, arg1, daily_reward, undefined, 
        {
            inline: true,
            show_titles: true,
            skip_zero: true
        });
    }
    else if (is_current_dialog_section(global.dialog_sections.daily_rewards.daily_quests))
    {
        if (in_challenge() || mp_is_season())
        {
            draw_description(arg0, arg1, __("Daily quests unavailable in this game mode."));
            return 0;
        }
        if (!is_struct(global.quests.daily) || get_struct_length(global.quests.daily) == 0)
        {
            exit;
        }
        var completed = _sum(global.quests.daily, function(arg0)
        {
            return arg0.data.finished ? 1 : 0;
        });
        var streak = o_game.data.daily_streak;
        var today_finished = o_game.data.daily_last_completed_day == get_daily_data_today_key();
        var items_per_page = 10;
        var max_rank = global.game_settings.daily_quests_max_bounty_rank;
        var max_pages = ceil(max_rank / items_per_page);
        var current_page = get_default_struct_value(global.selected_inventory_item, "daily_bounty_page", 0);
        current_page = clamp(current_page, 0, max_pages - 1);
        var y_paging = arg1;
        arg1 += draw_heading_description(arg0, arg1, __s("Quests: %s/%s", completed, get_daily_quests_count()) + " | " + __s("Bounty Rank: %s", o_game.data.daily_streak), __s("Complete %s daily quests to increase your Bounty Rank and earn better rewards! Bounty Rank resets after reaching rank %s. You can level up once per day.", global.game_settings.daily_quests_bounty_finish_threshold, global.game_settings.daily_quests_max_bounty_rank), gui_col_x(24));
        if (max_pages > 1)
        {
            if (gui_button_sprite(arg0 + gui_col_x(0.5), arg1 + gui_col_y(2), spr_gui_arrow_left, current_page > 0))
            {
                current_page--;
            }
            if (gui_button_sprite(arg0 + gui_col_x(22.5), arg1 + gui_col_y(2), spr_gui_arrow_right, current_page < (max_pages - 1)))
            {
                current_page++;
            }
            global.selected_inventory_item.daily_bounty_page = current_page;
        }
        var base_days = current_page * items_per_page;
        var items_padding_x = gui_col_x(2.1);
        var items_x = arg0 + gui_col_x(2);
        var boxes_y = arg1 + gui_col_y(2);
        for (var i = 1; i <= items_per_page; i++)
        {
            var day_total = base_days + i;
            if (day_total > max_rank)
            {
                break;
            }
            var box_x = items_x + ((i - 1) * items_padding_x);
            var is_completed = day_total <= streak;
            var reward = get_daily_streak_reward(day_total);
            var is_milestone = (day_total % global.game_settings.daily_quests_bounty_milestone) == 0;
            draw_description(box_x, boxes_y - 60, __s("#%s", day_total), undefined, 1);
            var selected = day_total == (streak + (today_finished ? 0 : 1));
            gui_button_sprite(box_x, boxes_y, spr_resource_gem, true, undefined, 
            {
                selected: selected,
                text_below: string(reward.resources.gems),
                btn_bg_color: is_milestone ? global.colors.yellow : 16777215
            });
            if (is_completed)
            {
                gui_draw_sprite(box_x + 16, boxes_y - 16, spr_icon_check);
            }
        }
        arg1 += gui_col_y(5);
        var daily_quests = struct_to_sorted_array_by(global.quests.daily, "sort_index", true);
        arg1 += gui_item_quests(arg0, arg1, undefined, daily_quests, true);
    }
    return arg1 - y_start;
}

function gui_item_daily_reward_add_draw()
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
    if (is_current_dialog_section(global.dialog_sections.daily_rewards.daily_quests))
    {
        if (has_bought_shop_item_safe(global.shops.gems.daily_quest_auto_claim))
        {
            global.options.daily_quest_auto_claim.draw(add_button_base_x_tl + gui_col_x(0.5), add_button_base_y_tl, undefined, undefined, 5);
        }
    }
}
