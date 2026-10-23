function gui_item_relics(arg0, arg1)
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
    if (!is_current_dialog_section(global.dialog_sections.relics.master))
    {
        arg1 += gui_item_selection(arg0, arg1, 
        {
            list_props: 
            {
                columns: 8,
                display_count: true,
                fixed_y: true,
                items: global.relics,
                items_array: global.relics_array,
                width: gui_col_x(12),
                sections_key: "relics",
                selection_key: "relics"
            },
            selection_key: "relics",
            selected_item_draw_props: 
            {
                draw_before_sprite: gui_item_selected_relic_draw_before_sprite,
                draw_below_func: gui_item_selected_relic,
                draw_use_button: false,
                name_padding_y: gui_col_y(1)
            }
        });
    }
    else
    {
        draw_heading(arg0, gui_y_start_items + gui_col_y(0.5), __("Master Relics"));
        arg1 += gui_item_selection(arg0, arg1, 
        {
            list_props: 
            {
                columns: 6,
                fixed_y: true,
                items: global.master_relics,
                items_array: global.master_relics_array,
                selection_key: "master_relic",
                width: gui_col_x(12)
            },
            selection_key: "master_relic",
            selected_item_draw_props: 
            {
                draw_before_sprite: gui_item_selected_relic_draw_before_sprite,
                draw_below_func: gui_item_selected_master_relic,
                draw_use_button: false,
                name_padding_y: gui_col_y(1)
            }
        });
        var col_y = gui_y_start_items + gui_col_y(6);
        col_y += draw_transmuter(arg0 + gui_col_x(0.25), col_y, global.transmuters.relic_fragments_to_power_fragments, false, undefined, 
        {
            below: true
        });
        col_y += draw_heading(arg0, col_y, __("Transmute Resetter"), undefined, undefined, undefined, undefined, false);
        var can_reset = has_enough(global.costs.reset_relics);
        if (gui_button_tl(arg0 + gui_col_x(8), col_y, __s("Reset"), can_reset, gui_col_x(3), undefined, 
        {
            result_mini: global.costs.reset_relics
        }))
        {
            confirm_dialog(__s("Do you want to reset all %s?", __("Relics transmute count")), reset_relics_transmute_count, undefined, undefined, 
            {
                parent_nav: "relics"
            });
        }
        col_y += draw_description(arg0, col_y, __s("Transmuting %s to %s increases their cost with each transmute. Use the %s to reset the transmute count of all Relics.", __("Leafscended leaves"), global.materials.power_fragment.name_plural, __("Transmute Resetter")), gui_col_x(7.5));
    }
    return arg1 - y_start;
}

function gui_item_selected_relic_draw_before_sprite(arg0, arg1, arg2)
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
    draw_sprite_contain(arg2.get_btn_bg_sprite(), 0, arg0, arg1 + gui_col_y(1), 144);
}

function gui_item_selected_relic(arg0, arg1, arg2)
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
    if (is_unlocked_master_relics())
    {
        arg1 += gui_col_y(0.5);
        arg1 += draw_heading(arg0, arg1, __("Transmute"), undefined, undefined, undefined, undefined, false);
        var input_count = arg2.get_transmute_power_fragments_input_count();
        draw_resource(arg0, arg1, arg2.resource, input_count, undefined, arg2.type.level, 
        {
            insufficient_indicator_base_value: arg2.get_leafscend_count(),
            insufficient_indicator_check_value: input_count,
            insufficient_indicator: true
        });
        if (gui_button_sprite_tl(arg0 + gui_col_x(2.5), arg1, spr_icon_transmute, arg2.can_transmute_power_fragments()))
        {
            arg2.transmute_power_fragments();
        }
        draw_materials(arg0 + gui_col_x(4.5), arg1, arg2.get_transmute_power_fragments_output());
        arg1 += gui_col_y(1.5);
    }
    if (is_unlocked_mirror())
    {
        arg1 += gui_col_y(1);
        arg1 += draw_upgrades_buyable(arg0, arg1, arg2, gui_col_x(11));
    }
    return arg1 - y_start;
}

function gui_item_selected_master_relic(arg0, arg1, arg2)
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
    arg1 += gui_col_y(1);
    arg1 += draw_upgrades_buyable(arg0, arg1, arg2, gui_col_x(11));
    return arg1 - y_start;
}

function gui_item_relics_add_draw()
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
    if (!is_current_dialog_section(global.dialog_sections.relics.master) && is_unlocked_mirror())
    {
        if (gui_button_tl(add_button_base_x_tl, add_button_base_y, __("Upgrade all"), undefined, gui_col_x(3)))
        {
            var upgraded_count = 0;
            var __array = global.relics_array;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                var __array2 = mitem.upgrades_array;
                var __prop_len2 = array_length(__array2);
                for (var __i2 = 0; __i2 < __prop_len2; __i2++)
                {
                    var mitem2 = __array2[__i2];
                    if (mitem.can_upgrade(mitem2.key))
                    {
                        mitem.upgrade(mitem2.key);
                        upgraded_count++;
                    }
                }
            }
            notify(__s("%s upgrades bought.", upgraded_count));
        }
        if (is_unlocked_master_relics())
        {
            if (gui_button_tl(add_button_base_x_tl + gui_col_x(6), add_button_base_y, __("Transmute all"), undefined, gui_col_x(3)))
            {
                global.selected_inventory_item.transmute_relics_rarity_key = get_current_dialog_section_key();
                confirm_dialog(__s("Do you want to transmute all leafscended leaves to %s?", global.materials.power_fragment.name), transmute_all_leafscended_leaves_to_power_fragments, undefined, undefined, 
                {
                    parent_nav: "relics"
                });
            }
            draw_option(global.options.relics_transmute_all_count, add_button_base_x_tl + gui_col_x(10), add_button_base_y);
            draw_option(global.options.relics_transmute_all_rarity, add_button_base_x_tl + gui_col_x(14), add_button_base_y);
        }
    }
}
