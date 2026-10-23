function gui_item_pets(arg0, arg1)
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
    y_start = arg1;
    if (is_current_dialog_section(global.dialog_sections.pets.pets))
    {
        arg1 += gui_item_shop(arg0, arg1, 
        {
            show_fav: true,
            shop_items: variable_struct_get(o_shop.shop_items, UnknownEnum.Value_73),
            shop_key: "pets"
        });
    }
    else if (is_current_dialog_section(global.dialog_sections.pets.teams))
    {
        draw_heading(arg0, arg1, __("Pet Teams"));
        var size = get_pets_sets_size();
        var dcl_y_add = global.is_mobile ? 1 : 0;
        var y_padding = global.is_mobile ? 3.5 : 3.25;
        set_default_font(f_gui_small, 0);
        draw_text(arg0, arg1 + gui_col_y(1), sprintf(__("Current pet team: #%s"), o_game.data.current_pet_team + 1));
        if (gui_button_tl(arg0, arg1 + gui_col_y(2), __("Save current pet team"), true))
        {
            confirm_save_pet_team(o_game.data.current_pet_team);
        }
        draw_button_list(arg0, arg1 + gui_col_y(6), __("Load pet team #%s"), size, function(arg0)
        {
            load_pet_team(arg0);
        }, function(arg0)
        {
            return !is_undefined(variable_struct_get(o_game.data.pet_teams, arg0));
        }, y_padding);
        draw_button_list(arg0 + gui_col_x(4), arg1 + gui_col_y(6), __("Save pet team #%s"), size, function(arg0)
        {
            if (!is_undefined(variable_struct_get(o_game.data.pet_teams, arg0)))
            {
                confirm_save_pet_team(arg0);
                exit;
            }
            save_pet_team(arg0);
        }, undefined, y_padding);
        for (var i = 0; i < size; i++)
        {
            var set_ids = variable_struct_get(o_game.data.pet_teams, i);
            if (is_undefined(set_ids))
            {
                continue;
            }
            draw_item_set(arg0 + gui_col_x(8.5), arg1 + gui_col_y(7 + (i * (y_padding + dcl_y_add))), set_ids, global.pets, 
            {
                tooltip: function(arg0)
                {
                    return implode("\n", [arg0.name, arg0.get_upgrade_description()]);
                }
            });
        }
        set_default_font(f_gui_small);
        for (var i = 0; i < size; i++)
        {
            var key = string(i + 1);
            var text = variable_struct_get(o_game.data.pet_team_names, key);
            if (is_undefined(text))
            {
                continue;
            }
            draw_text(arg0, arg1 + gui_col_y(5 + (i * (y_padding + dcl_y_add))), text);
        }
        draw_button_list(arg0 + gui_col_x(20.5), arg1 + gui_col_y(6), __("Rename"), size, function(arg0)
        {
            global.selected_priority_slot = arg0 + 1;
            input_dialog(__("Pet team"), function(arg0)
            {
                variable_struct_set(o_game.data.pet_team_names, global.selected_priority_slot, arg0);
            }, sprintf(__("Rename pet team %s"), global.selected_priority_slot), 
            {
                parent_nav: o_shop.current_nav_key
            }, 
            {
                max_length: 32
            });
        }, undefined, y_padding, gui_col_x(2.5));
        return 100 + gui_col_y(6 + (size * y_padding));
    }
    return arg1 - y_start;
}

function gui_item_pets_add_draw()
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
    draw_description(add_text_base_x, add_text_base_y, __s("Active team (%s/%s)", get_active_pets_count(), get_max_active_pets_size()));
    var set = array_filter_custom(global.pets_sorted_prio, function(arg0)
    {
        return arg0.data.active;
    });
    var set_ids = pluck(set, "key");
    draw_item_set(add_button_base_x + gui_col_x(4), add_button_base_y + gui_col_y(0.8), set_ids, global.pets, 
    {
        item_click_func: function(arg0)
        {
            arg0.deactivate();
        },
        
        item_enabled_func: __return_true,
        
        tooltip: function(arg0)
        {
            return implode("\n", [arg0.name, arg0.get_upgrade_description()]);
        }
    });
    if (gui_button_tl(add_button_base_x_tl + gui_col_x(20), add_button_base_y, __("Upgrade all"), undefined, gui_col_x(3)))
    {
        confirm_dialog_current_nav(__("Do you want to upgrade all items?"), upgrade_all_pets);
    }
}

enum UnknownEnum
{
    Value_73 = 73
}
