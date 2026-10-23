function gui_item_milestones(arg0, arg1, arg2)
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
    var section = get_current_dialog_section();
    var section_key = section.key;
    var milestones = variable_struct_get(global.milestones_sorted, section_key);
    if (is_undefined(milestones))
    {
        return 0;
    }
    var y_start = arg1;
    gui_item_collectable_list(arg0, arg1 - gui_col_y(1), 
    {
        button_func: function(arg0)
        {
            global.selected_inventory_item.milestone = arg0;
        },
        
        display_count: false,
        items_array: milestones,
        columns: global.is_mobile ? 9 : 12,
        
        is_unlocked_func: function(arg0)
        {
            return arg0._is_completed();
        },
        
        selected_key: function()
        {
            return get_default_struct_value(struct_get_from_hash(global.selected_inventory_item, variable_get_hash("milestone")), "key", "");
        },
        
        width: gui_col_x(12),
        
        add_draw_list: function(arg0, arg1, arg2)
        {
            if (arg2.is_claimed())
            {
                gui_draw_sprite(arg0 + 16, arg1 - 16, spr_icon_check);
            }
            else if (arg2._is_completed())
            {
                gui_draw_sprite(arg0 + 16, arg1 - 16, spr_icon_star_small);
            }
        }
    });
    var selected_milestone = get_default_struct_value(global.selected_inventory_item, "milestone", undefined);
    if (is_struct(selected_milestone))
    {
        var mx = arg0 + gui_col_x(14);
        var my = arg1 + gui_col_y(1);
        var name = selected_milestone.get_name();
        var description = selected_milestone.get_description();
        var is_obfuscated = selected_milestone._is_obfuscated();
        my += (draw_heading(mx + gui_col_x(0), my, name, gui_col_x(10)) - gui_col_y(1));
        my += draw_description(mx, my, description, gui_col_x(8));
        my += gui_col_y(0.5);
        if (!is_obfuscated)
        {
            selected_milestone.data.shown = true;
            if (is_struct(selected_milestone.reward))
            {
                my += draw_result(mx, my, selected_milestone.reward);
                my += gui_col_y(1);
            }
            if (selected_milestone.is_claimed())
            {
                gui_draw_sprite(mx + gui_col_x(0), my + gui_col_y(0.5), spr_icon_check);
                draw_description(mx + gui_col_x(0.5), my + gui_col_y(0.2), __("Completed"));
            }
            else if (!is_undefined(selected_milestone.reward))
            {
                if (gui_button_tl(mx + gui_col_x(0), my, __("Claim"), true, gui_col_x(3)))
                {
                    selected_milestone.claim();
                }
            }
        }
    }
    return arg1 - y_start;
}
