function gui_item_quarks(arg0, arg1, arg2)
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
    if (is_current_dialog_section(global.dialog_sections.quarks.quarks))
    {
        var reactor_size = get_default_struct_value(global.cache, "quark_reactor_size", 1);
        arg1 += draw_heading(arg0, arg1, __("Reactor"));
        draw_healthbar(arg0, arg1, arg0 + gui_col_x(23), arg1 + gui_col_y(0.5), calc_percent(o_game.data.quarks.reactor.count, reactor_size), c_white, global.colors.purple, global.colors.purple, 0, true, false);
        gui_draw_sprite(arg0 + gui_col_x(0.2), arg1 + gui_col_y(0.2), spr_icon_quark_reactor);
        gui_draw_sprite(arg0 + gui_col_x(23), arg1 + gui_col_y(0.2), spr_icon_quark_reactor);
        arg1 += gui_col_y(1);
        arg1 += draw_description(arg0, arg1, sprintf("%s/%s (%s/s)", number_format(o_game.data.quarks.reactor.count), number_format(reactor_size), get_cache("quark_reactor_inc_count", 0.01)));
        arg1 += gui_col_y(0.3);
        var xcol = 0;
        var ycol = 0;
        var __array = global.quarks_array;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if ((xcol % 3) == 0 && xcol > 0)
            {
                xcol = 0;
                ycol++;
            }
            var qx = arg0 + gui_col_x(0.5) + (gui_col_x(xcol) * 5);
            var qy = arg1 + (gui_col_y(ycol) * 6.5);
            draw_description(qx + gui_col_x(1.25), qy, mitem.name_full, undefined, 1);
            draw_heading(qx + gui_col_x(1.25), qy + gui_col_y(1.3), number_format(mitem.data.count), undefined, undefined, 1);
            var can_add_quark = mitem.can_add();
            var text_below = number_format_percent(mitem.get_add_chance());
            if (gui_button_tl(qx + gui_col_x(0.1), qy + gui_col_y(2.3), __("Add"), can_add_quark, gui_col_x(2.5), undefined, 
            {
                result_mini: mitem.get_add_cost(),
                text_below: text_below
            }))
            {
                mitem.add_by_chance();
            }
            xcol++;
        }
        var row_x = arg0 + gui_col_x(17);
        var row_y = y_start + gui_col_y(3.5);
        var upgrade_text = format_upgrade_text(
        {
            quark_damage: get_default_struct_value(global.cache, "quark_damage", undefined)
        });
        upgrade_text += ("\n" + format_resources_text(
        {
            quantum_blob: global.resources.quantum_blob.data.count
        }));
        upgrade_text += ("\n" + __s("Quarkstiges: %s", number_format(o_game.data.quarks.quarkstige_count)));
        row_y += draw_description(row_x, row_y, upgrade_text, gui_col_x(6));
        row_y += gui_col_y(0.5);
        var quarkstige_reduce_count = get_quarkstige_reduce_count();
        var quarkstige_quantum_blob_add = get_quarkstige_quantum_blob_add();
        var quarkstige_tooltip = concat([__s("Removes %s of all %s to get %s %s.", number_format(quarkstige_reduce_count), __("Quarks"), number_format(quarkstige_quantum_blob_add), pluralize(quarkstige_quantum_blob_add, global.resources.quantum_blob.name_single, global.resources.quantum_blob.name_plural)), __s("Each %s multiplies %s by %s.", global.resources.quantum_blob.name_single, __("Quark Damage"), number_format_percent(1)), __s("Each %s multiplies %s by %s.", global.resources.quantum_blob.name_single, __("Quark add chance"), number_format_percent(global.game_settings.quark_quantum_blob_add_chance))]);
        if (gui_button_tl(row_x, row_y, __("Quarkstige"), can_quarkstige(), gui_col_x(4), undefined, 
        {
            result_mini: get_quarkstige_cost(),
            tooltip: quarkstige_tooltip
        }))
        {
            if (keyboard_check(vk_control))
            {
                quarkstige();
                instance_destroy(o_tooltip);
            }
            else
            {
                confirm_dialog(__s("Do you want to %s?", __("Quarkstige")), quarkstige, undefined, undefined, 
                {
                    parent_nav: o_shop.current_nav_key
                });
            }
        }
        row_y += gui_col_y(3.5);
        global.options.quark_reactor_auto_add.draw(row_x + gui_col_x(0.5), row_y, undefined, undefined, 5, has_bought_shop_item_safe(global.shops.gems.quark_reactor_auto_add));
        row_y += gui_col_y(2);
        global.options.quark_reactor_auto_quarkstige.draw(row_x + gui_col_x(0.5), row_y, undefined, undefined, 5, has_bought_shop_item_safe(global.shops.gems.quark_reactor_auto_quarkstige));
        row_y += gui_col_y(2.2);
        var daily_data = get_daily_data_today();
        var max_add_safe_today = 5;
        var add_safe_cost = 
        {
            resources: 
            {
                gems: 250
            }
        };
        var add_safe_today_count = get_default_struct_value(daily_data.data, "reactor_add_safe_count", 0);
        var can_add_safe = add_safe_today_count < max_add_safe_today && has_enough(add_safe_cost);
        var add_safe_text = sprintf("%s/%s", add_safe_today_count, max_add_safe_today);
        var force_add_quark_count = 100;
        if (gui_button_tl(row_x, row_y, __s("Buy %s %s", 100, __("Quarks")), can_add_safe, gui_col_x(4), undefined, 
        {
            result_mini: add_safe_cost,
            text_below: add_safe_text,
            tooltip: __s("Adds %s %s randomly.", force_add_quark_count, pluralize(force_add_quark_count, __("Quark"), __("Quarks")))
        }))
        {
            var quark = array_random_item(global.quarks_array);
            quark.add(force_add_quark_count);
            dec_result(add_safe_cost);
            add_to_struct_value(daily_data.data, "reactor_add_safe_count", 1);
            add_to_struct_value(o_game.data.stats, "quarks_bought_gems", 1);
        }
    }
    else if (is_current_dialog_section(global.dialog_sections.quarks.shop))
    {
        return gui_item_shop(arg0, arg1, 
        {
            shop_items: o_shop.shop_items.quark,
            shop_key: "quarks"
        });
    }
    else if (is_current_dialog_section(global.dialog_sections.quarks.structure))
    {
        arg1 += draw_heading_description(arg0, arg1, __("Funnel"), __s("Funnel %s to get %s.", global.resources.quark.name_plural, global.resources.quark_blob.name_plural));
        var timeout_key = "quark_funnel";
        var funnel_count = 1;
        var funnel_button_text = (funnel_count > 1) ? __s("Funnel %s", funnel_count) : __("Funnel");
        draw_converter_lite(arg0, arg1, quark_funnel_get_input(funnel_count), quark_funnel_get_output(funnel_count), funnel_button_text, quark_can_funnel(funnel_count), quark_funnel, funnel_count, undefined, 
        {
            timeout_end: get_timeout_data(timeout_key)
        });
        draw_resources_current_amount(arg0 + gui_col_x(13), arg1, global.resources.quark_blob);
        global.options.quark_auto_funnel.draw(arg0 + gui_col_x(17), arg1 + gui_col_y(0.5), undefined, undefined, 5, has_bought_shop_item_safe(global.shops.gems.quark_auto_funnel));
        arg1 += gui_col_y(3);
        arg1 += draw_heading_description(arg0, arg1, __("Quark Energy"), __s("%s charge %s every second.", global.resources.quark_blob.name_plural, global.resources.energy_quark.name));
        var y_row = arg1;
        var quark_energy_storage = get_max_energy_storage(global.resources.energy_quark);
        var qss = get_quark_qs_value();
        var full_storage_text = (qss > 0) ? __s("Storage full in: %s", format_time((quark_energy_storage - global.resources.energy_quark.data.count) / qss, false, true, "-")) : "";
        draw_resources_current_amount(arg0, arg1, global.resources.energy_quark, 
        {
            suffix_resource_text: sprintf("/%s (%s/s)", number_format(quark_energy_storage), number_format(qss, 2, true))
        }, 2);
        draw_description(arg0, arg1 + gui_col_y(1.25), full_storage_text);
        var can_structurize = quark_can_structurize();
        if (gui_button_tl(arg0 + gui_col_x(7), arg1, __("Structurize"), can_structurize, gui_col_x(3), undefined, 
        {
            result_mini: get_quark_structurize_result()
        }))
        {
            quark_structurize();
        }
        draw_resources_current_amount(arg0 + gui_col_x(13), y_row, global.resources.quark_structure);
        global.options.quark_auto_structurize.draw(arg0 + gui_col_x(17), arg1 + gui_col_y(0.5), undefined, undefined, 5, has_bought_shop_item_safe(global.shops.gems.quark_auto_structurize));
        global.options.quark_auto_structurize_value.draw(arg0 + gui_col_x(16.5), arg1 + gui_col_y(1.75), undefined, undefined, undefined, has_bought_shop_item_safe(global.shops.gems.quark_auto_structurize));
        arg1 += gui_col_y(3.5);
        arg1 += draw_heading_description(arg0, arg1, __("Quantify"), __s("Convert %s to %s.", global.resources.quark_structure.name_plural, global.resources.quantum_blob.name_plural));
        y_row = arg1;
        draw_converter_lite(arg0, arg1, quark_quantify_get_input(funnel_count), quark_quantify_get_output(funnel_count), __("Quantify"), quark_can_quantify(funnel_count), quark_quantify, 1, undefined, 
        {
            timeout_end: get_timeout_data("quark_quantify")
        });
        draw_resources_current_amount(arg0 + gui_col_x(13), y_row, global.resources.quantum_blob);
        global.options.quark_auto_quantify.draw(arg0 + gui_col_x(17), arg1 + gui_col_y(0.5), undefined, undefined, 5, has_bought_shop_item_safe(global.shops.gems.quark_auto_quantify));
        arg1 += gui_col_y(3);
        if (is_unlocked_leafton())
        {
            arg1 += draw_heading_description(arg0, arg1, __("Leaftonify"), __s("Convert %s to %s.", global.resources.leafton.name_plural, global.resources.quantum_blob.name_plural));
            y_row = arg1;
            draw_converter_lite(arg0, arg1, quark_leaftonify_get_input(funnel_count), quark_leaftonify_get_output(funnel_count), __("Leaftonify"), quark_can_leaftonify(funnel_count), quark_leaftonify, 1, undefined, 
            {
                timeout_end: get_timeout_data("quark_leaftonify")
            });
            draw_resources_current_amount(arg0 + gui_col_x(13), y_row, global.resources.quantum_blob);
            global.options.quark_auto_leaftonify.draw(arg0 + gui_col_x(17), arg1 + gui_col_y(0.5), undefined, undefined, 5, has_bought_shop_item_safe(global.shops.gems.quark_auto_leaftonify));
            arg1 += gui_col_y(3);
        }
        else
        {
            arg1 += draw_heading_description(arg0, arg1, __("?"), __("This converter is locked."));
        }
        return arg1 - y_start;
    }
    else if (is_current_dialog_section(global.dialog_sections.quarks.structure_shop))
    {
        return gui_item_shop(arg0, arg1, 
        {
            shop_items: o_shop.shop_items.quark_structure_shop,
            shop_key: "quark_structure_shop"
        });
    }
    else if (is_current_dialog_section(global.dialog_sections.quarks.leafton))
    {
        var leafton_pit = global.areas.leafton_pit;
        arg1 += draw_description(arg0, arg1, __s("Enter %s to battle hordes of enemies. Higher floors yield better rewards.", leafton_pit.name));
        arg1 += gui_col_y(1);
        var entry_cost = leafton_pit.get_entry_cost(leafton_pit.data.selected_floor);
        var row_y1 = arg1;
        var row_y2 = arg1;
        var row_x1 = arg0 + gui_col_x(6.5);
        var row_x2 = arg0 + gui_col_x(16);
        var can_enter = has_enough(entry_cost) && !is_current_area(global.areas.leafton_pit);
        if (gui_button(row_x1, row_y1, __s("Start level %s", leafton_pit.data.selected_floor), can_enter, gui_col_x(4)))
        {
            dec_result(entry_cost);
            change_area(global.areas.leafton_pit);
            gui_dialog_toggle();
        }
        if (gui_button_sprite(row_x1 - gui_col_x(3), row_y1, spr_gui_minus, leafton_pit.data.selected_floor > 1))
        {
            leafton_pit.data.selected_floor -= get_key_modifier();
        }
        if (gui_button_sprite(row_x1 + gui_col_x(3), row_y1, spr_gui_plus, leafton_pit.data.selected_floor < (leafton_pit.data.floors_bought + 1)))
        {
            leafton_pit.data.selected_floor += get_key_modifier();
        }
        leafton_pit.data.selected_floor = clamp(leafton_pit.data.selected_floor, 1, leafton_pit.data.floors_bought + 1);
        row_y1 += gui_col_y(2);
        draw_result(row_x1 - gui_col_x(1.5), row_y1, entry_cost, undefined, 
        {
            text_above: __("Entry cost"),
            show_current_collection_count: true,
            insufficient_indicator: true
        });
        if (is_struct(leafton_pit.last_horde_result))
        {
            row_y1 += gui_col_y(5);
            row_y1 += draw_result(row_x1 - gui_col_x(1.5), row_y1, leafton_pit.last_horde_result, undefined, 
            {
                text_above: __("Last reward"),
                skip_zero: true
            });
        }
        var upgrade_cost = 
        {
            resources: 
            {
                leafton: round(power(2 + leafton_pit.data.floors_bought, 4))
            }
        };
        if ((leafton_pit.data.floors_bought + 1) < leafton_pit.get_max_floor())
        {
            var can_unlock = has_enough(upgrade_cost);
            if (gui_button(row_x2, row_y2, __s("Unlock floor %s", 2 + leafton_pit.data.floors_bought), can_unlock, gui_col_x(4)))
            {
                dec_result(upgrade_cost);
                leafton_pit.data.floors_bought += 1;
            }
            row_y2 += gui_col_y(2);
            row_y2 += draw_result(row_x2 - gui_col_x(0.8), row_y2, upgrade_cost, undefined, 
            {
                text_above: __("Unlock cost"),
                show_current_collection_count: true,
                insufficient_indicator: true
            });
            row_y2 += gui_col_y(3);
        }
        var horde_stats = leafton_pit.get_horde_stats(leafton_pit.data.selected_floor);
        row_y2 += draw_description(row_x2 - gui_col_x(2), row_y2, [__("Stats"), __s("Total runs: %s", horde_stats.runs), __s("Most enemies defeated on floor %s: %s", leafton_pit.data.selected_floor, number_format(horde_stats.max)), __s("Total enemies defeated: %s", horde_stats.total)]);
        if (is_struct(leafton_pit.last_horde_result))
        {
            row_y2 += gui_col_y(1);
            row_y2 += draw_description(row_x2 - gui_col_x(2), row_y2, [__("Last run"), __s("Floor: %s", leafton_pit.last_horde_run.floor_entered), __s("Enemies defeated: %s", leafton_pit.last_horde_run.defeat_counter), __s("Reward counter: %s", leafton_pit.last_horde_run.reward_counter)]);
        }
    }
    else if (is_current_dialog_section(global.dialog_sections.quarks.leafton_shop))
    {
        return gui_item_shop(arg0, arg1, 
        {
            shop_items: o_shop.shop_items.leafton_shop,
            shop_key: "leafton_shop"
        });
    }
}

function gui_item_quarks_add_draw()
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
    if (is_current_dialog_section(global.dialog_sections.quarks.quarks))
    {
        if (has_bought_shop_item_safe(global.shops.gems.quark_reactor_auto_add))
        {
            global.options.quark_reactor_auto_add_settings.draw(add_button_base_x, add_button_base_y);
        }
    }
    else if (is_current_dialog_section(global.dialog_sections.quarks.shop))
    {
        gui_draw_buy_max(add_button_base_x_tl, add_button_base_y_tl, global.shops_sorted.quark);
    }
    else if (is_current_dialog_section(global.dialog_sections.quarks.leafton_shop))
    {
        gui_draw_buy_max(add_button_base_x_tl, add_button_base_y_tl, global.shops_sorted.leafton);
    }
    draw_resources_current_amount_lite_array(add_text_base_x + gui_col_x(21), add_text_base_y, [global.resources.quark, global.resources.quantum_blob, global.resources.quark_blob, global.resources.quark_structure, global.resources.leafton], false);
}
