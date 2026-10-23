function gui_item_season_pass(arg0, arg1, arg2)
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
    var y_height = 0;
    var season_pass = arg2.season_pass;
    if (is_current_dialog_section(global.dialog_sections.season_pass.general))
    {
        gui_item_season_pass_journey(arg0, arg1, season_pass);
    }
    else if (is_current_dialog_section(global.dialog_sections.season_pass.quests))
    {
        y_height = gui_item_quests(arg0, arg1, 
        {
            quests: global.quests.nature,
            sort_key: "index"
        });
        return y_height;
    }
    return arg1 - y_start;
}

function gui_item_season_pass_journey(arg0, arg1, arg2)
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
    var current_level = arg2.data.level;
    var has_premium = arg2.has_premium();
    var levels_per_page = 10;
    var max_level = arg2.max_level;
    var max_pages = ceil(max_level / levels_per_page);
    var next_xp = arg2.get_next_xp(arg2.data.level);
    var desc_text = __s("Level: %s", current_level) + " | ";
    if (current_level >= arg2.max_level)
    {
        desc_text += __s("Max level reached.");
    }
    else
    {
        desc_text += __s("Exp: %s/%s", arg2.data.xp, next_xp);
    }
    if (gui_button_tl(arg0 + gui_col_x(19), arg1, __("Claim all"), true, gui_col_x(3)))
    {
        var __struct = arg2.items_final_f2p;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            if (!arg2._can_claim(mitem))
            {
                continue;
            }
            arg2.claim(mitem);
        }
        __struct = arg2.items_final_premium;
        __prop_names = struct_get_names(__struct);
        __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            if (!arg2._can_claim(mitem))
            {
                continue;
            }
            arg2.claim(mitem);
        }
    }
    arg1 += (draw_heading(arg0, arg1, arg2.name) - gui_col_y(0.5));
    arg1 += (draw_description(arg0, arg1, desc_text) + gui_col_y(1));
    gui_draw_sprite(arg0 + gui_col_x(0.4), arg1 + gui_col_y(2), spr_icon_trophy_silver, undefined, undefined, undefined, __("Free"), undefined, undefined, 1);
    gui_draw_sprite(arg0 + gui_col_x(0.4), arg1 + gui_col_y(4), spr_icon_trophy, undefined, undefined, undefined, __("Premium"), undefined, undefined, 1);
    var levels_drawn = 0;
    for (var i = 0; i < levels_per_page; i++)
    {
        set_default_font(f_gui_small, 1);
        var loop_x = arg0 + gui_col_x(3.4) + (i * gui_col_x(1.9));
        var button_y_f2p = arg1 + gui_col_y(2);
        var button_y_premium = arg1 + gui_col_y(4);
        if (loop_x >= ((arg0 + gui_content_width) - gui_col_x(2)))
        {
            break;
        }
        var level = (global.season_pass_page * levels_per_page) + i + 1;
        var level_f = string(level);
        if (level == current_level)
        {
            level_f = sprintf("[%s]", level_f);
        }
        draw_text(loop_x, arg1, level_f);
        var f2p_reward = variable_struct_get(arg2.items_final_f2p, level);
        var premium_reward = variable_struct_get(arg2.items_final_premium, level);
        var is_obfuscated = true;
        if (current_level >= level)
        {
            is_obfuscated = false;
        }
        if (is_struct(f2p_reward))
        {
            var is_claimed = arg2.is_claimed(f2p_reward);
            var selected = is_struct(global.selected_season_pass_item) ? (global.selected_season_pass_item.id == f2p_reward.id) : false;
            if (is_obfuscated)
            {
                gui_button_sprite(loop_x, button_y_f2p, spr_icon_question, false);
            }
            else
            {
                if (gui_button_sprite(loop_x, button_y_f2p, f2p_reward.sprite, true, undefined, 
                {
                    selected: selected
                }))
                {
                    global.selected_season_pass_item = f2p_reward;
                }
                if (is_claimed)
                {
                    gui_draw_sprite(loop_x + 20, button_y_f2p + 18, spr_icon_check);
                }
            }
        }
        else
        {
            gui_button_sprite(loop_x, button_y_f2p, spr_solid, false);
        }
        if (is_struct(premium_reward))
        {
            var is_claimed = arg2.is_claimed(premium_reward);
            var selected = is_struct(global.selected_season_pass_item) ? (global.selected_season_pass_item.id == premium_reward.id) : false;
            if (is_obfuscated)
            {
                gui_button_sprite(loop_x, button_y_premium, spr_icon_question, false);
            }
            else
            {
                if (gui_button_sprite(loop_x, button_y_premium, premium_reward.sprite, true, undefined, 
                {
                    selected: selected
                }))
                {
                    global.selected_season_pass_item = premium_reward;
                }
                if (is_claimed)
                {
                    gui_draw_sprite(loop_x + 20, button_y_premium + 18, spr_icon_check);
                }
            }
        }
        else
        {
            gui_button_sprite(loop_x, button_y_premium, spr_solid, false);
        }
        levels_drawn++;
    }
    draw_text(arg0 + gui_col_x(22.2), arg1, sprintf("%s/%s", global.season_pass_page + 1, max_pages));
    if (global.season_pass_page > 0)
    {
        if (gui_button_sprite(arg0 + gui_col_x(1.9), arg1 + gui_col_y(3), spr_gui_arrow_left))
        {
            global.season_pass_page--;
        }
    }
    if (global.season_pass_page < (max_pages - 1))
    {
        if (gui_button_sprite(arg0 + gui_col_x(22.2), arg1 + gui_col_y(3), spr_gui_arrow_right))
        {
            global.season_pass_page++;
        }
    }
    arg1 += gui_col_y(7);
    if (is_struct(global.selected_season_pass_item))
    {
        var type_name = (global.selected_season_pass_item.type == "f2p") ? __("Free") : __("Premium");
        var selected_header_text = sprintf("%s | %s", __s("Level: %s", global.selected_season_pass_item.level), type_name);
        arg1 += draw_heading(arg0, arg1, selected_header_text);
        var can_claim = !arg2.is_claimed(global.selected_season_pass_item);
        if (can_claim)
        {
            var can_claim_reward = can_claim;
            if (global.selected_season_pass_item.type == "premium" && !has_premium)
            {
                can_claim_reward = false;
            }
            if (gui_button_tl(arg0, arg1, __("Claim"), can_claim_reward, gui_col_x(3)))
            {
                arg2.claim(global.selected_season_pass_item);
            }
            if (!can_claim_reward)
            {
                draw_description(arg0 + gui_col_x(4), arg1 + gui_col_y(0.2), __s("Purchase %s to unlock this reward.", __("Nature Pack")));
            }
        }
        else
        {
            draw_description(arg0, arg1, __("You have already claimed this reward."));
        }
        arg1 += gui_col_y(2);
        if (is_struct(struct_get_from_hash(global.selected_season_pass_item, variable_get_hash("result"))))
        {
            arg1 += draw_result(arg0, arg1, global.selected_season_pass_item.result, undefined, 
            {
                show_resource_name: true
            });
            arg1 += gui_col_y(0.5);
        }
        if (is_struct(struct_get_from_hash(global.selected_season_pass_item, variable_get_hash("upgrade_attributes"))))
        {
            var ua_text = __s("Upgrades: %s", "\n" + format_upgrade_text(struct_get_from_hash(global.selected_season_pass_item, variable_get_hash("upgrade_attributes"))));
            arg1 += draw_description(arg0, arg1, ua_text);
        }
    }
    return arg1 - y_start;
}
