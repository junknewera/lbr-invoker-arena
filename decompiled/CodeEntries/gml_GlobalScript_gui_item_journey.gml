function gui_item_journey(arg0, arg1, arg2)
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
    var can_finish = arg2.can_finish();
    var current_level = arg2.data.level;
    var current_page = get_default_struct_value(global.selected_inventory_item, arg2.page_key, 0);
    var has_premium = arg2.has_premium();
    var levels_per_page = 20;
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
    desc_text += (" | " + __s("Finished: %s", arg2.data.finished));
    var items_padding_x = gui_col_x(1.15);
    var items_x = arg0 + gui_col_x(0.5);
    if (arg2.tiers > 1)
    {
        items_padding_x = gui_col_x(1.5);
        items_x += gui_col_x(3.5);
    }
    if (global.is_mobile)
    {
    }
    if (has_bought_shop_item_safe(global.shops.gems.auto_journey_finish))
    {
        draw_option(global.options.auto_journey_finish, arg0 + gui_col_x(14), arg1 + gui_col_y(0.5), undefined, undefined, 5);
    }
    if (max_pages > 1)
    {
        draw_description(arg0 + gui_col_x(21.6), arg1 + gui_col_y(1.5), sprintf("%s/%s", current_page + 1, max_pages), undefined, 1);
        if (gui_button_sprite(arg0 + gui_col_x(21), arg1 + gui_col_y(0.5), spr_gui_arrow_left, current_page > 0))
        {
            add_to_struct_value(global.selected_inventory_item, arg2.page_key, -1);
        }
        if (gui_button_sprite(arg0 + gui_col_x(22.2), arg1 + gui_col_y(0.5), spr_gui_arrow_right, current_page < (max_pages - 1)))
        {
            add_to_struct_value(global.selected_inventory_item, arg2.page_key, 1);
        }
    }
    arg1 += (draw_heading(arg0, arg1, arg2.name) - gui_col_y(0.5));
    arg1 += (draw_description(arg0, arg1, desc_text, gui_col_x(14)) + gui_col_y(1));
    for (var i = 0; i < levels_per_page; i++)
    {
        set_default_font(f_gui_small, 1);
        var loop_x = items_x + (i * items_padding_x);
        if (loop_x >= ((arg0 + gui_content_width) - gui_col_x(1)))
        {
            break;
        }
        var level = (current_page * levels_per_page) + i + 1;
        var level_f = string(level);
        if (level == current_level)
        {
            level_f = sprintf("[%s]", level_f);
        }
        draw_text(loop_x, arg1, level_f);
        for (var tier = 1; tier <= arg2.tiers; tier++)
        {
            var loop_y = arg1 + (gui_col_y(2) * tier);
            var is_obfuscated = true;
            if (global.debug && keyboard_check(vk_shift))
            {
                is_obfuscated = false;
            }
            if ((current_level >= level && tier <= arg2.data.tier) || tier < arg2.data.tier)
            {
                is_obfuscated = false;
            }
            if (arg2.tiers > 1)
            {
                draw_heading(arg0 + gui_col_x(0.5), loop_y, __s("Tier %s", tier));
            }
            var reward = variable_struct_get(variable_struct_get(arg2.items, tier), level);
            if (is_struct(reward))
            {
                var is_claimed = arg2.is_claimed(reward);
                var selected = is_struct(variable_struct_get(global.selected_inventory_item, arg2.selection_key)) ? (variable_struct_get(global.selected_inventory_item, arg2.selection_key).id == reward.id) : false;
                if (is_obfuscated)
                {
                    gui_button_sprite(loop_x, loop_y, spr_icon_question, false);
                }
                else
                {
                    var btn_bg_color = is_string(struct_get_from_hash(reward, variable_get_hash("rarity_key"))) ? variable_struct_get(global.rarity_colors_button, reward.rarity_key) : 16777215;
                    if (gui_button_sprite(loop_x, loop_y, reward.sprite, true, undefined, 
                    {
                        btn_bg_color: btn_bg_color,
                        selected: selected
                    }))
                    {
                        variable_struct_set(global.selected_inventory_item, arg2.selection_key, reward);
                    }
                    if (is_claimed)
                    {
                        gui_draw_sprite(loop_x + 20, loop_y + 18, spr_icon_check);
                    }
                }
            }
            else
            {
                gui_button_sprite(loop_x, loop_y, spr_solid, false);
            }
            if (i == (levels_per_page - 1) && tier == arg2.data.tier && arg2.data.tier < arg2.tiers)
            {
                if (gui_button_tl(loop_x + gui_col_x(1.5), loop_y - gui_col_y(0.55), __("Ascend"), arg2.can_ascend_tier(), gui_col_x(3)))
                {
                    arg2.ascend_tier();
                    variable_struct_set(global.selected_inventory_item, arg2.selection_key, undefined);
                }
            }
        }
    }
    arg1 += gui_col_y(4);
    var row_y0 = arg1;
    var can_claim_all = true;
    if (gui_button_tl(arg0 + gui_col_x(0), row_y0, __("Claim all"), can_claim_all, gui_col_x(3)))
    {
        var __array = arg2.items_array;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (arg2._can_claim(mitem))
            {
                arg2.claim(mitem);
            }
        }
    }
    row_y0 += global.ui_gaps.button_y_lg;
    var selected_item = variable_struct_get(global.selected_inventory_item, arg2.selection_key);
    if (is_struct(selected_item))
    {
        var row_y1 = row_y0;
        row_y1 += draw_heading(arg0, row_y1, __s("Level: %s", selected_item.level), undefined, undefined, undefined, 0);
        if (!is_empty(struct_get_from_hash(selected_item, variable_get_hash("description"))))
        {
            row_y1 += draw_description(arg0, row_y1, struct_get_from_hash(selected_item, variable_get_hash("description")));
        }
        var can_claim = !arg2.is_claimed(selected_item);
        if (can_claim)
        {
            if (gui_button_tl(arg0, row_y1, __("Claim"), undefined, gui_col_x(3)))
            {
                arg2.claim(selected_item);
            }
        }
        else
        {
            draw_description(arg0, row_y1, __("You have already claimed this reward."), gui_col_x(7));
        }
        row_y1 += gui_col_y(2);
        if (is_struct(struct_get_from_hash(selected_item, variable_get_hash("result"))))
        {
            row_y1 += draw_result(arg0, row_y1, selected_item.result, undefined, 
            {
                show_resource_name: true
            });
            row_y1 += gui_col_y(0.5);
        }
        if (is_struct(struct_get_from_hash(selected_item, variable_get_hash("upgrade_attributes"))))
        {
            var ua_text = __s("Upgrades: %s", "\n" + format_upgrade_text(struct_get_from_hash(selected_item, variable_get_hash("upgrade_attributes"))));
            row_y1 += draw_description(arg0, row_y1, ua_text);
        }
    }
    if (can_finish)
    {
        var row_x2 = arg0 + gui_col_x(8);
        var row_y2 = arg1;
        row_y2 += draw_heading_description(row_x2, row_y2, __("Journey cleared!"), __("Restart this journey to earn rewards and gain permanent bonuses."), gui_col_x(8), undefined, undefined, 0);
        if (gui_button_tl(row_x2, row_y2, __("Finish Journey"), undefined, gui_col_x(4)))
        {
            arg2.finish();
            variable_struct_set(global.selected_inventory_item, arg2.selection_key, undefined);
        }
    }
    if (arg2.data.finished > 0)
    {
        var row_x3 = arg0 + gui_col_x(16);
        var row_y3 = arg1;
        draw_heading_description(row_x3, row_y3, __("Bonuses"), arg2.upgrade_text_cache, gui_col_x(8), undefined, undefined, 0);
    }
    if (global.debug)
    {
        var i = 0;
        if (gui_button_tl(900 + (i++ * 100), 800, __("Add 10 XP")))
        {
            arg2.add_xp(10);
        }
        if (gui_button_tl(900 + (i++ * 100), 800, __("Add 100 XP")))
        {
            arg2.add_xp(100);
        }
        if (gui_button_tl(900 + (i++ * 100), 800, __("Add 1000 XP")))
        {
            arg2.add_xp(100);
        }
        if (gui_button_tl(900 + (i++ * 100), 800, __("Add inf XP")))
        {
            arg2.add_xp(999999999999999999);
        }
        if (gui_button_tl(900 + (i++ * 100), 800, __("Finish")))
        {
            arg2.finish();
        }
    }
    return arg1 - y_start;
}
