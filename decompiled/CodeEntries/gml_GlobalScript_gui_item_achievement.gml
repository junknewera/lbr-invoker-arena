function gui_item_achievements(arg0, arg1)
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
    var section = get_current_dialog_section();
    var section_key = section.key;
    if (section_key == "rank")
    {
        var achievements_total = array_length(global.achievements_sorted);
        var achievements_completed = get_completed_achievements_count();
        var achievements_pct = number_format_percent(achievements_completed / achievements_total);
        arg1 += gui_col_y(0.5);
        var scale = 5;
        var __array = global.achievement_ranks_sorted;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            var is_obfuscated = achievements_completed < mitem.min_value;
            var item_x = arg0 + gui_col_x(2) + (gui_col_x(3.7) * __i);
            var item_y = arg1;
            var final_scale = scale + get_default_struct_value(mitem, "add_scale", 0);
            item_y += (draw_heading(item_x, item_y, is_obfuscated ? "?" : mitem.name, undefined, undefined, 1) - gui_col_y(0.6));
            item_y += draw_description(item_x, item_y, sprintf("%s+", mitem.min_value), undefined, 1);
            item_y += gui_col_y(1);
            draw_sprite_ext(mitem.sprite, 0, item_x, item_y + gui_col_y(3), final_scale, final_scale, 0, is_obfuscated ? c_black : c_white, 1);
            if (!is_obfuscated)
            {
                if (is_undefined(variable_struct_get(o_game.data.achievement_rank_claimed, mitem.key)))
                {
                    if (gui_button_tl(item_x - gui_col_x(1.5), item_y + gui_col_y(7), __("Claim"), undefined, gui_col_x(3), undefined, 
                    {
                        result_mini: mitem.reward
                    }))
                    {
                        add_result_lite(mitem.reward);
                        variable_struct_set(o_game.data.achievement_rank_claimed, mitem.key, true);
                    }
                }
                else
                {
                    draw_description(item_x, item_y + gui_col_y(7.2), __("Claimed"), undefined, 1);
                }
            }
        }
    }
    else
    {
        var items = variable_struct_get(global.achievements_sections, section_key);
        gui_item_collectable_list(arg0, arg1 - gui_col_y(1), 
        {
            button_func: function(arg0)
            {
                global.selected_inventory_item.achievement = arg0;
            },
            
            display_count: true,
            
            is_visible_in_list: function(arg0)
            {
                return (get_option(global.options.hide_completed_achievements) && arg0.is_completed()) ? false : true;
            },
            
            items_array: items,
            columns: global.is_mobile ? 9 : 12,
            
            is_unlocked_func: function(arg0)
            {
                return !arg0.is_obfuscated();
            },
            
            selected_key: function()
            {
                return get_default_struct_value(struct_get_from_hash(global.selected_inventory_item, variable_get_hash("achievement")), "key", "");
            },
            
            width: gui_col_x(12),
            
            add_draw_list: function(arg0, arg1, arg2)
            {
                if (arg2.is_completed())
                {
                    gui_draw_sprite(arg0 + 16, arg1 - 16, spr_icon_check);
                }
                else if (arg2.data.claimed < arg2.levels_count && arg2.check())
                {
                    gui_draw_sprite(arg0 + 16, arg1 - 16, spr_icon_exclamation_mark, undefined, 1);
                }
            }
        });
        if (instance_exists(o_gui_scrollable_items_inline) && o_gui_scrollable_items_inline.items_drawn == 0)
        {
            draw_description(arg0, arg1, __("All achievements completed."));
        }
        var selected_item = get_default_struct_value(global.selected_inventory_item, "achievement");
        if (is_struct(selected_item))
        {
            var mx = arg0 + gui_col_x(14);
            var my = arg1 + gui_col_y(1);
            gui_draw_sprite(mx + gui_col_x(4), my + gui_col_y(1), selected_item.sprite, undefined, undefined, undefined, undefined, undefined, undefined, undefined, 96);
            my += gui_col_y(4);
            var name = selected_item.get_name();
            var description = selected_item.get_description();
            var is_obfuscated = selected_item.is_obfuscated();
            my += (draw_heading(mx + gui_col_x(0), my, name, gui_col_x(10)) - gui_col_y(1));
            my += draw_description(mx, my, description, gui_col_x(8));
            my += gui_col_y(0.5);
            if (!is_obfuscated)
            {
                selected_item.data.shown = true;
                if (is_struct(selected_item.reward))
                {
                    my += draw_result(mx, my, selected_item.reward);
                    my += gui_col_y(1);
                }
                if (selected_item.is_completed())
                {
                    gui_draw_sprite(mx + gui_col_x(0), my + gui_col_y(0.5), spr_icon_check);
                    draw_description(mx + gui_col_x(0.5), my + gui_col_y(0.2), __("Completed"));
                }
                else if (selected_item.check() && !is_undefined(selected_item.claim_resources))
                {
                    if (gui_button_tl(mx + gui_col_x(0), my, __("Claim"), true, gui_col_x(3)))
                    {
                        selected_item.func();
                    }
                }
            }
        }
    }
}

function gui_item_achievements_add_draw()
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
    var achievements_total = array_length(global.achievements_sorted);
    var achievements_completed = get_completed_achievements_count();
    var achievements_pct = number_format_percent(achievements_completed / achievements_total);
    draw_description(add_text_base_x, add_text_base_y, sprintf("%s/%s (%s)", achievements_completed, achievements_total, achievements_pct));
    if (gui_button_tl(add_button_base_x + gui_col_x(2), add_button_base_y, __("Claim all"), true, gui_col_x(3)))
    {
        _map(global.achievements, function(arg0)
        {
            while (arg0.check())
            {
                arg0.func();
            }
        }, false);
    }
    draw_option(global.options.hide_completed_achievements, add_button_base_x_tl + gui_col_x(11), add_button_base_y_tl, undefined, undefined, 5);
}
