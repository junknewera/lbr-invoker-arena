function gui_item_quests(arg0, arg1, arg2 = undefined, arg3 = undefined, arg4 = false)
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
    var sort_key = get_default_struct_value(arg2, "sort_key", "difficulty");
    var quests = arg3;
    if (is_struct(arg3))
    {
        quests = arg3;
    }
    else if (is_struct(arg2) && is_struct(struct_get_from_hash(arg2, variable_get_hash("quests"))))
    {
        quests = arg2.quests;
    }
    if (is_undefined(quests))
    {
        return 0;
    }
    var quests_sorted = quests;
    if (is_struct(quests))
    {
        if (arg4)
        {
            quests_sorted = struct_to_sorted_array(quests);
        }
        else
        {
            quests_sorted = struct_to_sorted_array_by(quests, sort_key);
        }
    }
    var item_height = gui_col_y(4);
    var y_height = 0;
    var __array = quests_sorted;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (!mitem._is_visible())
        {
            continue;
        }
        var quest_item_height = 0;
        var name = mitem.get_name();
        var description = mitem.get_description();
        quest_item_height += draw_heading_description(arg0, arg1, name, description, undefined, undefined, undefined, 0);
        if (mitem.type.display_resources)
        {
            draw_resources(arg0 + gui_col_x(8), arg1, mitem.get_display_resources(), 1, 
            {
                insufficient_indicator: true
            }, true);
        }
        if (mitem.type.display_materials)
        {
            draw_materials(arg0 + gui_col_x(10), arg1, mitem.get_display_materials(), 1, 
            {
                insufficient_indicator: true
            }, true);
        }
        var reward = mitem.get_reward();
        var draw_reward_arrow = false;
        if (is_struct(reward))
        {
            if (is_struct(struct_get_from_hash(reward, variable_get_hash("resources"))))
            {
                draw_reward_arrow = true;
                draw_resources(arg0 + gui_col_x(13), arg1, mitem.reward.resources, undefined, undefined, true);
            }
            if (is_struct(struct_get_from_hash(reward, variable_get_hash("materials"))))
            {
                draw_reward_arrow = true;
                draw_materials(arg0 + gui_col_x(15), arg1, mitem.reward.materials, 1, undefined, true);
            }
        }
        if (draw_reward_arrow)
        {
            gui_draw_sprite(arg0 + gui_col_x(12.5), arg1 + gui_col_y(0.5), spr_gui_arrow_right);
        }
        if (mitem._can_start())
        {
            if (gui_button_tl(arg0 + gui_col_x(17), arg1, __("Start"), true, gui_col_x(2.75), false, 
            {
                icon: spr_gui_arrow_right
            }))
            {
                mitem.start();
            }
        }
        if (mitem._can_finish())
        {
            if (gui_button_tl(arg0 + gui_col_x(17), arg1, __("Complete"), true, gui_col_x(2.75), false, 
            {
                icon: spr_icon_check
            }))
            {
                mitem.finish();
            }
        }
        if (mitem._can_cancel())
        {
            if (gui_button_tl(arg0 + gui_col_x(20.5), arg1, __("Cancel"), true, gui_col_x(2.75), false, 
            {
                icon: spr_icon_cancel
            }))
            {
                mitem.cancel();
            }
        }
        if (mitem._can_refresh())
        {
            if (gui_button_tl(arg0 + gui_col_x(20.5), arg1, __("Refresh"), true, gui_col_x(2.75), false, 
            {
                icon: spr_icon_refresh
            }))
            {
                mitem.refresh();
            }
        }
        if (mitem.data.finished && !mitem.repeatable && !mitem.refreshable)
        {
            gui_draw_sprite(arg0 + gui_col_x(20.5), arg1 + gui_col_y(0.5), spr_icon_check);
        }
        quest_item_height = max(item_height, quest_item_height) + global.ui_gaps.sm;
        arg1 += quest_item_height;
        y_height += quest_item_height;
    }
    return y_height;
}
