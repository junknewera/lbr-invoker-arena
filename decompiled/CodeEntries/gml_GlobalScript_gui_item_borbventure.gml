function gui_item_borbventure(arg0, arg1, arg2)
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
    if (is_current_dialog_section(global.dialog_sections.borbventures.borbventures))
    {
        var time_diff = global.borbventures.data.refresh_borbventures_timer_end - o_game.data.stats.time_elapsed;
        if (gui_button_tl(arg0, arg1, __("Refresh"), global.borbventures.can_refresh(), gui_col_x(2.5), undefined, 
        {
            resources_mini: global.borbventures.get_refresh_cost()
        }))
        {
            global.borbventures.refresh_borbventures();
            exit;
        }
        if (time_diff > 0)
        {
            var refresh_text = __s("Borbventures can be refreshed in %s", "\n" + format_time(secr(time_diff)));
            draw_description(arg0 + gui_col_x(2.8), arg1 + gui_col_y(0.25), refresh_text);
        }
        global.options.borbventures_detailed_info.draw(arg0 + gui_col_x(8), arg1 + gui_col_y(0));
        var detailed = get_option(global.options.borbventures_detailed_info);
        global.options.borbventure_scale_min_level.draw(arg0 + gui_col_x(13), arg1 + gui_col_y(0));
        var add_text = concatstr(__s("Levels: %s-%s", global.borbventures.get_borbventure_min_level(), global.borbventures.get_borbventure_max_level()), "\n", __s("Bonus: %s", number_format_percent(get_upgrade_attribute_value(global.upgrade_attributes.borbventure_increase_reward))));
        draw_description(arg0 + gui_col_x(23), arg1 + gui_col_y(0), add_text, gui_col_x(6), 2, 0);
        var height = gui_col_y(3.5);
        arg1 += height;
        var __array = global.borbventures.items.borbventures;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            if (__i >= array_length(__array))
            {
                break;
            }
            var mitem = __array[__i];
            var item_y = arg1;
            var loop_y = 0;
            var rect_height = detailed ? gui_col_y(2) : gui_col_y(0.5);
            var rarity_color = variable_struct_get(global.rarity_colors, mitem.data.rarity_key);
            draw_set_color(rarity_color);
            draw_rectangle(arg0, item_y - gui_col_y(0.2), arg0 + gui_col_x(0.25), item_y + rect_height, false);
            draw_set_color(c_white);
            loop_y += draw_heading(arg0 + gui_col_x(0.5), item_y, mitem.get_name());
            if (detailed)
            {
                loop_y += draw_description(arg0 + gui_col_x(0.5), item_y, mitem.get_description(), gui_col_x(7));
            }
            else
            {
                loop_y += (draw_description(arg0 + gui_col_x(0.5), item_y + gui_col_y(0.5), mitem.get_description(true), gui_col_x(7)) - gui_col_y(1));
            }
            var res_x = arg0 + gui_col_x(9);
            draw_resources(res_x, item_y, mitem.start_res_cache, undefined, 
            {
                show_tooltip: true
            });
            gui_draw_sprite(res_x + gui_col_x(2.9), item_y + gui_col_y(0.4), spr_gui_arrow_right);
            if (is_struct(struct_get_from_hash(mitem.reward_cache, variable_get_hash("resources"))))
            {
                draw_resources(res_x + gui_col_x(3.5), item_y, mitem.reward_cache.resources, undefined, 
                {
                    show_tooltip: true
                });
            }
            else if (!is_undefined(struct_get_from_hash(mitem.type, variable_get_hash("sprite"))))
            {
                var item_name = sprintf("%s %s", mitem.rarity.name, mitem.type.name);
                gui_draw_sprite(res_x + gui_col_x(3.35) + 16, item_y + 16, mitem.type.sprite, undefined, undefined, undefined, item_name, undefined, get_struct_sum(mitem.reward_cache, "", ""));
            }
            var borbventure_borbs_size = mitem.get_participants_count();
            for (var i = 0; i < borbventure_borbs_size; i++)
            {
                var selected_borb = @@array_get@@(mitem.borbs, i);
                var borb_sprite = is_undefined(selected_borb) ? spr_solid : selected_borb.sprite;
                var borb_name = is_undefined(selected_borb) ? "" : selected_borb.get_tooltip();
                var borb_x = arg0 + gui_col_x(16) + (i * gui_col_x(1.5));
                var btn_bg_color = is_undefined(selected_borb) ? global.colors.white : variable_struct_get(global.rarity_colors, selected_borb.rarity.key);
                if (gui_button_sprite(borb_x, item_y + gui_col_y(0.5), borb_sprite, !mitem.is_started(), undefined, 
                {
                    btn_bg_color: btn_bg_color,
                    tooltip: borb_name
                }))
                {
                    selected_borb = global.borbventures.get_next_available_borb(selected_borb, get_click_dir(), true, mitem.borbs);
                    mitem.change_borb(selected_borb, i);
                    instance_destroy(o_tooltip);
                }
            }
            if (!mitem.is_started())
            {
                if (gui_button_tl(arg0 + gui_col_x(19), item_y - gui_col_y(0.2), __("Start"), mitem.can_start(), gui_col_x(2)))
                {
                    mitem.start();
                }
            }
            else if (mitem.can_finish())
            {
                if (gui_button_tl(arg0 + gui_col_x(19), item_y - gui_col_y(0.2), __("Finish"), true, gui_col_x(2)))
                {
                    mitem.finish();
                    break;
                }
            }
            if (mitem.can_cancel())
            {
                if (gui_button_sprite(arg0 + gui_col_x(22.5), item_y + gui_col_y(0.5), spr_icon_cancel, true, undefined, 
                {
                    tooltip: __("Cancel")
                }))
                {
                    global.borbventure_selected = mitem;
                    confirm_dialog(__s("Do you want to cancel this %s? You will not receive any reward.", __("Borbventure")), function()
                    {
                        global.borbventure_selected.cancel();
                    }, undefined, undefined, 
                    {
                        parent_nav: o_shop.current_nav_key
                    });
                }
            }
            if (!detailed)
            {
                loop_y += gui_col_y(0.6);
            }
            arg1 += loop_y;
            height += loop_y;
        }
        return height + gui_col_y(1);
    }
    else if (is_current_dialog_section(global.dialog_sections.borbventures.borbs))
    {
        var y_height = 0;
        var detail_x = gui_col_x(18);
        var detail_y = arg1;
        if (gui_button_tl(arg0, arg1, __s("Recruit %s", "Borb"), global.borbventures.can_recruit(), gui_col_x(3), undefined, 
        {
            resources_mini: global.borbventures.get_recruit_cost()
        }))
        {
            global.borbventures.recruit();
            exit;
        }
        draw_text(arg0 + gui_col_x(4), arg1 + gui_col_y(0.25), sprintf("%s: %s/%s | %s: %s", "Borbs", array_length(global.borbventures.items.borbs), global.borbventures.get_max_borbs(), __s("Special %s chance", "Borb"), number_format_percent(global.borbventures.get_borb_special_recruit_chance())));
        if (array_length(global.borbventures.items.borbs) == 0)
        {
            draw_text(arg0, arg1 + gui_col_y(4), __("No Borbs available."));
            return 100;
        }
        arg0 += gui_col_x(0.5);
        arg1 += gui_col_y(4);
        var col_x = 0;
        var col_y = 0;
        var __array = global.borbventures.items.borbs;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            if (__i >= array_length(__array))
            {
                break;
            }
            var mitem = __array[__i];
            var item_x = arg0 + (col_x * gui_col_x(1.5));
            if (item_x >= (arg0 + gui_col_x(12)))
            {
                col_x = 0;
                col_y++;
                item_x = arg0 + (col_x * gui_col_x(1.5));
            }
            col_x++;
            var btn_bg_color = variable_struct_get(global.rarity_colors, mitem.rarity.key);
            var item_y = arg1 + (col_y * gui_col_y(3));
            var is_selected = is_struct(global.borbventures.selected_borb) ? (global.borbventures.selected_borb.data.id == mitem.data.id) : false;
            var text_below = [];
            if (mitem.can_upgrade())
            {
                array_push(text_below, "U");
            }
            if (mitem.can_ascend())
            {
                array_push(text_below, "A");
            }
            if (gui_button_sprite(item_x, item_y, mitem.sprite, undefined, undefined, 
            {
                btn_bg_color: btn_bg_color,
                selected: is_selected,
                tooltip: mitem.get_tooltip(),
                text_below: concat(text_below)
            }))
            {
                global.borbventures.selected_borb = mitem;
            }
            if (mitem.data.locked)
            {
                draw_sprite_ext(spr_icon_lock, 0, item_x + 24, item_y - 16, 2, 2, 0, c_white, 1);
            }
        }
        var i = array_length(global.borbventures.items.borbs);
        while (i < global.borbventures.get_max_borbs())
        {
            var item_x = arg0 + (col_x * gui_col_x(1.5));
            if (item_x >= (arg0 + gui_col_x(12)))
            {
                col_x = 0;
                col_y++;
                item_x = arg0 + (col_x * gui_col_x(1.5));
            }
            else
            {
                col_x++;
            }
            var item_y = arg1 + (col_y * gui_col_y(3));
            if (gui_button_sprite(item_x, item_y, spr_solid))
            {
                global.borbventures.selected_borb = undefined;
            }
            i++;
        }
        var selected_borb = global.borbventures.selected_borb;
        if (is_struct(selected_borb))
        {
            draw_heading(detail_x, detail_y, selected_borb.get_name(), gui_col_x(8));
            var count = get_key_modifier();
            count = min(count, selected_borb.get_max_level(), selected_borb.get_max_level() - selected_borb.get_level());
            count = max(1, count);
            var upgrade_text = (count > 1) ? __s("Upgrade %s", count) : __("Upgrade");
            if (gui_button_tl(detail_x, detail_y + gui_col_y(1), upgrade_text, selected_borb.can_upgrade(count), gui_col_x(2), undefined, 
            {
                resources_mini: selected_borb.get_upgrade_cost(count)
            }))
            {
                selected_borb.upgrade(count);
            }
            if (!is_undefined(selected_borb.rarity.next_rarity))
            {
                if (gui_button_tl(detail_x + gui_col_x(3.5), detail_y + gui_col_y(1), __("Ascend"), selected_borb.can_ascend(), gui_col_x(2), undefined, 
                {
                    resources_mini: selected_borb.get_ascend_cost()
                }))
                {
                    selected_borb.ascend();
                }
            }
            if (gui_button_tl(detail_x + gui_col_x(7), detail_y + gui_col_y(1), __("Dismiss"), selected_borb.can_dismiss(), gui_col_x(2)))
            {
                confirm_dialog(__s("Do you really want to dismiss %s?", selected_borb.get_name()), function()
                {
                    global.borbventures.selected_borb.dismiss();
                    global.borbventures.selected_borb = undefined;
                    if (array_length(global.borbventures.items.borbs) > 0)
                    {
                        global.borbventures.selected_borb = @@array_get@@(global.borbventures.items.borbs, 0);
                    }
                }, undefined, undefined, 
                {
                    parent_nav: o_shop.current_nav_key
                });
            }
            var lock_sprite = selected_borb.data.locked ? spr_icon_lock_open : spr_icon_lock;
            var lock_text = selected_borb.data.locked ? __("Unlock") : __("Lock");
            if (gui_button_sprite(detail_x + gui_col_x(8.5), detail_y + gui_col_y(5), lock_sprite, undefined, undefined, 
            {
                tooltip: lock_text
            }))
            {
                selected_borb.data.locked = !selected_borb.data.locked;
            }
            y_height = draw_description(detail_x, detail_y + gui_col_y(4), selected_borb.get_description(count), gui_col_x(7));
        }
        return y_height;
    }
    else if (is_current_dialog_section(global.dialog_sections.borbventures.inventory))
    {
        var detail_x = gui_col_x(18);
        var detail_y = gui_col_y(10);
        var inventory_size = global.borbventures.get_inventory_size();
        var paging_id = "borbventure_items";
        var craft_count = get_key_modifier();
        var craft_text = (craft_count > 1) ? __s("Craft %s random items", craft_count) : __("Craft random item");
        if (gui_button_tl(arg0, arg1, craft_text, global.borbventures.can_craft_item(craft_count), gui_col_x(4), undefined, 
        {
            resources_mini: global.borbventures.get_craft_item_cost(craft_count)
        }))
        {
            var item = global.borbventures.craft_item(craft_count, undefined, true, true);
            global.borbventures.craft_notify(item);
            exit;
        }
        draw_text(arg0 + gui_col_x(5), arg1 + gui_col_y(0.25), sprintf("%s: %s/%s", __("Inventory"), array_length(global.borbventures.items.inventory), inventory_size));
        var inventory_padding = get_option(global.options.borbventures_inventory_padding);
        var padding_text = get_option_text(global.options.borbventures_inventory_padding);
        if (gui_button_tl(arg0 + gui_col_x(15.5), gui_col_y(7), padding_text, undefined, gui_col_x(2), undefined, 
        {
            tooltip: __("Padding")
        }))
        {
            global.options.borbventures_inventory_padding._func();
        }
        var sort_type = get_option(global.options.borbventures_inventory_sort_type);
        var sort_dir = get_option(global.options.borbventures_inventory_sort_dir);
        var sort_type_text = get_option_text(global.options.borbventures_inventory_sort_type);
        if (gui_button_tl(arg0 + gui_col_x(18.5), gui_col_y(7), sort_type_text, undefined, gui_col_x(2), undefined, 
        {
            tooltip: __("Sort by")
        }))
        {
            global.options.borbventures_inventory_sort_type._func();
            sort_array_by(global.borbventures.items.inventory, "get_sort_value", sort_dir == "asc");
        }
        var sort_dir_sprite = (sort_dir == "asc") ? spr_gui_arrow_up : spr_gui_arrow_down;
        if (gui_button_sprite(arg0 + gui_col_x(22), gui_col_y(7) + gui_col_y(0.6), sort_dir_sprite, undefined, undefined, 
        {
            tooltip: __("Sort direction")
        }))
        {
            global.options.borbventures_inventory_sort_dir._func();
            sort_dir = get_option(global.options.borbventures_inventory_sort_dir);
            sort_array_by(global.borbventures.items.inventory, "get_sort_value", sort_dir == "asc");
        }
        arg0 += gui_col_x(0.5);
        arg1 += gui_col_y(4);
        var col_x = 0;
        var col_y = 0;
        var col_x_padding_default = 1.5;
        var col_x_padding_compact = global.is_mobile ? 1.25 : 0.85;
        var col_x_padding = gui_col_x((inventory_padding == "default") ? col_x_padding_default : col_x_padding_compact);
        arg1 += draw_inventory_items(arg0, arg1, global.borbventures.items.inventory, inventory_size, gui_col_x(12), 128, undefined, undefined, true, paging_id, 
        {
            display_count: true,
            
            func_rightclick: function(arg0)
            {
                arg0.data.locked = !arg0.data.locked;
            },
            
            padding_x: col_x_padding
        });
        var selected_item = variable_struct_get(global.selected_inventory_item, paging_id);
        if (is_struct(selected_item))
        {
            var detail_width = gui_col_x(9);
            detail_y += draw_heading(detail_x + (detail_width / 2), detail_y, selected_item.get_name(), gui_col_x(8), undefined, 1);
            detail_y += gui_col_y(1);
            gui_button_toggle_lock((detail_x + detail_width) - gui_col_x(1), detail_y, selected_item);
            gui_draw_sprite(detail_x + (detail_width / 2), detail_y, selected_item.sprite, undefined, 4);
            detail_y += gui_col_y(1.2);
            var count = get_key_modifier();
            count = min(count, selected_item.get_max_count(), selected_item.get_max_count() - selected_item.data.count);
            count = max(1, count);
            var scrap_count = get_key_modifier();
            scrap_count = _clamp(scrap_count, 1, selected_item.data.count);
            global.borbventure_scrap_count_tmp = scrap_count;
            if (selected_item.is_usable)
            {
                var use_count = get_key_modifier_item_count(selected_item);
                var use_text = (use_count > 1) ? __s("Use %s", number_format(use_count)) : __("Use");
                if (gui_button_tl(detail_x + gui_col_x(0), detail_y + gui_col_y(1), use_text, selected_item._can_activate(use_count), gui_col_x(2)))
                {
                    var result = selected_item._activate(use_count);
                    if (is_struct(result) && get_struct_length(result) > 0)
                    {
                        if (!is_undefined(struct_get_from_hash(result, variable_get_hash("key"))))
                        {
                            global.borbventures.craft_notify(result);
                        }
                        else
                        {
                            notify(__s("Crafting storage exceeded. You've received %s as compensation.", format_resources_text(result)));
                        }
                    }
                    exit;
                }
            }
            else
            {
                craft_text = (count > 1) ? __s("Craft %s", count) : __("Craft");
                if (gui_button_tl(detail_x + gui_col_x(0), detail_y + gui_col_y(1), craft_text, selected_item.can_craft(count), gui_col_x(2), undefined, 
                {
                    resources_mini: selected_item.get_craft_resources(count)
                }))
                {
                    selected_item.craft(count);
                    exit;
                }
                if (!is_undefined(selected_item.rarity.next_rarity))
                {
                    if (gui_button_tl(detail_x + gui_col_x(3.5), detail_y + gui_col_y(1), __("Ascend"), selected_item.can_ascend(), gui_col_x(2), undefined, 
                    {
                        resources_mini: selected_item.get_ascend_cost()
                    }))
                    {
                        selected_item.ascend();
                    }
                }
            }
            if (selected_item.data.count > 0)
            {
                var scrap_text = __s("Scrap %s", scrap_count);
                if (gui_button_tl(detail_x + gui_col_x(7), detail_y + gui_col_y(1), scrap_text, selected_item.can_scrap(scrap_count), gui_col_x(2), undefined, 
                {
                    resources_mini: selected_item.get_scrap_resources(scrap_count)
                }))
                {
                    confirm_dialog(__s("Do you really want to scrap %s %s?", scrap_count, selected_item.name), function()
                    {
                        (struct_get_from_hash(global.selected_inventory_item, variable_get_hash("borbventure_items"))).scrap(global.borbventure_scrap_count_tmp);
                    }, undefined, undefined, 
                    {
                        parent_nav: o_shop.current_nav_key
                    });
                    exit;
                }
            }
            else if (gui_button_tl(detail_x + gui_col_x(7), detail_y + gui_col_y(1), __("Remove"), !selected_item.data.locked, gui_col_x(2)))
            {
                if (keyboard_check(vk_shift))
                {
                    (struct_get_from_hash(global.selected_inventory_item, variable_get_hash("borbventure_items"))).remove();
                    exit;
                }
                confirm_dialog(__s("Do you really want to remove %s from your inventory?", selected_item.name), function()
                {
                    (struct_get_from_hash(global.selected_inventory_item, variable_get_hash("borbventure_items"))).remove();
                }, undefined, undefined, 
                {
                    parent_nav: o_shop.current_nav_key
                });
                exit;
            }
            detail_y += gui_col_y(3.5);
            detail_y += draw_description(detail_x, detail_y, selected_item.get_description(), gui_col_x(9));
            detail_y += gui_col_y(1.5);
            if (can_auto_craft_bv_items())
            {
                if (!selected_item.is_usable && gui_button_toggle(detail_x + gui_col_x(0.5), detail_y, selected_item.data.auto_craft, undefined, 
                {
                    text: __("Auto craft")
                }))
                {
                    selected_item.data.auto_craft = !selected_item.data.auto_craft;
                }
            }
        }
        if (global.debug)
        {
            arg1 += gui_col_y(2);
            if (gui_button_tl(arg0, arg1, __("Craft all")))
            {
                global.borbventures.items.inventory = [];
                repeat (10)
                {
                    __struct = global.borbventures.borbventure_levels;
                    __prop_names = struct_get_names(__struct);
                    __prop_len = array_length(__prop_names);
                    for (var __i = 0; __i < __prop_len; __i++)
                    {
                        var mkey = __prop_names[__i];
                        var mitem = variable_struct_get(__struct, mkey);
                        global.borbventures.add_item("backpack", 100, mitem);
                    }
                    init_game_vars(true);
                }
                var __struct = global.borbventures.borbventure_levels;
                var __prop_names = struct_get_names(__struct);
                var __prop_len = array_length(__prop_names);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mkey = __prop_names[__i];
                    var mitem = variable_struct_get(__struct, mkey);
                    var __struct2 = global.borbventures.borbventure_items;
                    var __prop_names2 = struct_get_names(__struct2);
                    var __prop_len2 = array_length(__prop_names2);
                    for (var __i2 = 0; __i2 < __prop_len2; __i2++)
                    {
                        var mkey2 = __prop_names2[__i2];
                        var mitem2 = variable_struct_get(__struct2, mkey2);
                        if (array_length(global.borbventures.items.inventory) >= global.borbventures.get_inventory_size())
                        {
                            break;
                        }
                        global.borbventures.add_item(mitem2.key, 100, mitem);
                    }
                }
            }
            if (gui_button_tl(arg0 + gui_col_x(3), arg1, __("=1")))
            {
                var __array = global.borbventures.items.inventory;
                var __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    mitem.data.count = 1;
                }
                init_game_vars(true);
            }
        }
        return arg1 - y_start;
    }
    else if (is_current_dialog_section(global.dialog_sections.borbventures.shop))
    {
        return gui_item_shop(arg0, arg1, 
        {
            shop_items: global.shops_items_gui.borbventure,
            shop_key: "borbventure"
        });
    }
    else if (is_current_dialog_section(global.dialog_sections.borbventures.packs))
    {
        var pack_width = gui_col_x(6);
        var pack_height = gui_col_y(12);
        var __array = global.borbventures.borb_packs_array;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            var pack_x = arg0 + gui_col_x(1) + ((pack_width + gui_col_x(1)) * __i);
            var pack_y = arg1;
            draw_sprite_stretched(mitem.sprite, 0, pack_x, pack_y, pack_width, pack_height);
            set_default_font(f_gui_small, 1, 0);
            draw_text(pack_x + (pack_width / 2), pack_y + (pack_height * 0.18), mitem.name);
            var guarantee_text = [__s("Items: %s", mitem.items_count), "", sprintf("- %s - ", __("Guaranteed"))];
            var __array2 = global.borbventures.borb_levels_array;
            var __prop_len2 = array_length(__array2);
            for (var __i2 = 0; __i2 < __prop_len2; __i2++)
            {
                var mitem2 = __array2[__i2];
                if (is_undefined(variable_struct_get(mitem.items_guarantee, mitem2.key)))
                {
                    continue;
                }
                var text = sprintf("%s: %sx", mitem2.name, variable_struct_get(mitem.items_guarantee, mitem2.key));
                array_push(guarantee_text, text);
            }
            draw_set_valign(fa_middle);
            draw_text(pack_x + (pack_width / 2), pack_y + (pack_height * 0.5), implode("\n", guarantee_text));
            draw_set_valign(fa_top);
            draw_text(pack_x + (pack_width / 2), pack_y + (pack_height * 0.78), sprintf("%sx", number_format(mitem.data.count)));
            var pack_open_count = clamp(get_key_modifier(undefined, get_option(global.options.borbventure_packs_open_multiplier)), 1, max(1, mitem.data.count));
            if (gui_button(pack_x + (pack_width / 2), pack_y + pack_height + gui_col_y(0.5), __s("Open %s", number_format(pack_open_count)), mitem.can_open(), gui_col_x(2.5)))
            {
                global.borbventures.selected_pack = mitem;
                global.borbventures.selected_pack_open_count = pack_open_count;
                mitem.open(pack_open_count);
            }
            var daily_data = get_daily_data_today();
            var buy_count = max(1, get_key_modifier(undefined, get_option(global.options.borbventure_packs_buy_multiplier)));
            var buy_count_gems = clamp(buy_count, 1, global.game_settings.cards_packs_gem_purchases_per_day - get_default_struct_value(daily_data.data, "borbventure_packs_bought", 0));
            var cost_gems = multiply_struct_values(mitem.cost, buy_count_gems, true);
            var cost_parts = multiply_struct_values(mitem.cost_parts, buy_count, true);
            var buy_packs_text = iif(buy_count > 1, __s("Buy %s", number_format(buy_count)), __s("Buy"));
            if (gui_button((pack_x + (pack_width / 3)) - gui_col_x(0.3), pack_y + pack_height + gui_col_y(3.5), buy_packs_text, mitem.can_buy(cost_parts, false, buy_count), gui_col_x(2.5), undefined, 
            {
                resources_mini: cost_parts
            }))
            {
                mitem.buy(cost_parts, false, buy_count);
            }
            if (gui_button(pack_x + ((pack_width / 3) * 2) + gui_col_x(0.3), pack_y + pack_height + gui_col_y(3.5), __s("Buy %s", buy_count_gems), mitem.can_buy(cost_gems, true, buy_count_gems), gui_col_x(2), undefined, 
            {
                resources_mini: cost_gems
            }))
            {
                mitem.buy(cost_gems, true, buy_count_gems);
            }
        }
        if (gui_button(gui_col_x(26), arg1 + gui_col_y(3), __("Odds"), undefined, gui_col_x(2)))
        {
            var text = [__("Pack drop rates"), ""];
            __array = global.borbventures.borb_packs_array;
            __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                array_push(text, mitem.name);
                array_push(text, "----------");
                var __array2 = mitem.items_rarity;
                var __prop_len2 = array_length(__array2);
                for (var __i2 = 0; __i2 < __prop_len2; __i2++)
                {
                    var mitem2 = __array2[__i2];
                    array_push(text, sprintf("%s: %s%", mitem2.rarity.name, mitem2.chance));
                }
                array_push(text, "");
                array_push(text, "");
            }
            text_dialog(implode("\n", text), 
            {
                title: __("Pack Odds")
            }, 
            {
                parent_nav: "borbventures"
            });
        }
        var can_open_all = get_struct_sum(global.borbventures.borbventure_packs) > 0;
        if (gui_button_tl(gui_col_x(25), arg1 + gui_col_y(5.5), __("Open all"), can_open_all, gui_col_x(2)))
        {
            confirm_dialog_current_nav(__("Do you want to open all packs? Note: Opening many packs at once might lead to inaccuracies. Only the last pack type will be shown."), open_all_borbventure_packs);
        }
        global.options.borbventure_packs_open_multiplier.draw(gui_col_x(25), arg1 + gui_col_y(9), undefined, 
        {
            name_position: "top"
        });
        global.options.borbventure_packs_buy_multiplier.draw(gui_col_x(25), arg1 + gui_col_y(11.5), undefined, 
        {
            name_position: "top"
        });
    }
    else if (is_current_dialog_section(global.dialog_sections.borbventures.codex))
    {
        var selection_key = "borbventure_codex";
        arg1 += gui_item_selection(arg0, arg1, 
        {
            list_props: 
            {
                columns: global.is_mobile ? 9 : 12,
                
                is_unlocked_func: function(arg0)
                {
                    return !is_undefined(variable_struct_get(o_game.data.borbventure_types_seen, arg0.key));
                },
                
                items_array: global.borbventures.borbventure_items_array,
                selection_key: selection_key,
                width: gui_col_x(14)
            },
            selection_key: selection_key,
            selected_item_draw_props: 
            {
                draw_use_button: false,
                draw_below_func: gui_item_borbventure_codex_selected
            },
            
            selected_item_is_unlocked_func: function(arg0)
            {
                return !is_undefined(variable_struct_get(o_game.data.borbventure_types_seen, arg0.key));
            }
        });
    }
    else if (is_current_dialog_section(global.dialog_sections.borbventures.settings))
    {
        var tags = [
        {
            tag: "event",
            name: __s("Enable %s", __("Event resources"))
        }, 
        {
            tag: "dice",
            name: __s("Enable %s", __("Dice")),
            
            is_obfuscated: function()
            {
                return !is_unlocked_dice();
            }
        }, 
        {
            tag: "quarks",
            name: __s("Enable %s", __("Quarks")),
            
            is_obfuscated: function()
            {
                return !has_bought_shop_item_safe(global.shops.quark_structure.quark_resources_enabled_in_bv);
            }
        }];
        arg1 += gui_col_y(0.5);
        arg1 += draw_heading(arg0, arg1, __("Borbventure settings"));
        var __array = tags;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            var is_obfuscated = false;
            if (!is_undefined(struct_get_from_hash(mitem, variable_get_hash("is_obfuscated"))))
            {
                is_obfuscated = mitem.is_obfuscated();
            }
            var tag_value = get_default_struct_value(o_game.data.borbventure_generation_disabled_tags, mitem.tag, false);
            var btn_text = tag_value ? __("Off") : __("On");
            if (gui_button_toggle(arg0 + gui_col_x(0.4), arg1 + gui_col_y(0.5), tag_value, !is_obfuscated))
            {
                variable_struct_set(o_game.data.borbventure_generation_disabled_tags, mitem.tag, !tag_value);
            }
            var name = is_obfuscated ? "?" : mitem.name;
            arg1 += (draw_description(arg0 + gui_col_x(1.15), arg1 + gui_col_y(0.25), name, gui_col_x(18)) + gui_col_y(1));
        }
        arg1 += gui_col_y(0.6);
        arg1 += global.options.borbventures_auto_salvage.draw(arg0 + gui_col_x(0.4), arg1, undefined, 
        {
            add_description: true,
            width: gui_col_x(8)
        }, 5);
        if (can_auto_craft_bv_items())
        {
            arg1 += gui_col_y(2);
            arg1 += global.options.auto_craft_bv_items.draw(arg0 + gui_col_x(0.4), arg1, undefined, 
            {
                add_description: true,
                width: gui_col_x(8)
            }, 5);
            arg1 += gui_col_y(0.6);
            if (gui_button_tl(arg0, arg1, __("Enable auto craft all"), undefined, gui_col_x(4)))
            {
                __array = global.borbventures.items.inventory;
                __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    if (mitem.is_usable)
                    {
                        continue;
                    }
                    mitem.data.auto_craft = true;
                }
            }
            if (gui_button_tl(arg0 + gui_col_x(5), arg1, __("Disable auto craft all"), undefined, gui_col_x(4)))
            {
                __array = global.borbventures.items.inventory;
                __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    if (mitem.is_usable)
                    {
                        continue;
                    }
                    mitem.data.auto_craft = false;
                }
            }
            arg1 += gui_col_y(2);
        }
        if (global.debug)
        {
            arg1 += gui_col_y(1);
            if (gui_button_tl(arg0, arg1, "clear generation times"))
            {
                o_game.data.borbventure_generation_time = {};
            }
        }
    }
    return arg1 - y_start;
}

function gui_item_borbventure_add_draw()
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
    if (is_current_dialog_section(global.dialog_sections.borbventures.borbventures))
    {
        global.options.borbventures_auto_start.draw(gui_x_start + gui_col_x(0.5), add_button_base_y, undefined, undefined, undefined, has_bought_shop_item_safe(global.shops.gems.borbventure_auto_start));
        global.options.borbventures_auto_start_min_chance.draw(gui_x_start + gui_col_x(5.5), add_button_base_y, undefined, undefined, undefined, has_bought_shop_item_safe(global.shops.gems.borbventure_auto_start));
        global.options.borbventures_auto_finish.draw(gui_x_start + gui_col_x(13.5), add_button_base_y, undefined, undefined, undefined, has_bought_shop_item_safe(global.shops.gems.borbventure_auto_finish));
        if (gui_button_tl(gui_x_start + gui_col_x(19), add_button_base_y, __("Finish all"), undefined, gui_col_x(2)))
        {
            var __array = global.borbventures.items.borbventures;
            var __prop_len = array_length(__array);
            var __i = __prop_len - 1;
            while (__i >= 0)
            {
                var mitem = __array[__i];
                var __ireal = __prop_len - 1 - __i;
                if (mitem.can_finish())
                {
                    mitem.finish();
                }
                __i--;
            }
        }
    }
    else if (is_current_dialog_section(global.dialog_sections.borbventures.packs))
    {
        var daily_data = get_daily_data_today();
        var packs_left_today = global.game_settings.cards_packs_gem_purchases_per_day - get_default_struct_value(daily_data.data, "borbventure_packs_bought", 0);
        var text = __s("Gem Packs left today: %s/%s", packs_left_today, global.game_settings.cards_packs_gem_purchases_per_day);
        draw_description(add_text_base_x + gui_col_x(0), add_text_base_y + gui_col_y(0.25), text);
    }
    else if (is_current_dialog_section(global.dialog_sections.borbventures.shop))
    {
        gui_draw_buy_max(add_button_base_x_tl, add_button_base_y_tl, global.shops_sorted.borbventure);
    }
    if (!is_current_dialog_section(global.dialog_sections.borbventures.borbventures))
    {
        draw_resources_current_amount_lite_array(add_text_base_x + gui_col_x(21), add_text_base_y, [global.resources.borb_juice, global.resources.borb_ascension_juice, global.resources.borb_token, global.resources.borb_rune, global.resources.borb_ascension_rune], false);
    }
}

function gui_item_borbventure_codex_selected(arg0, arg1, arg2)
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
    if (!arg2.is_usable)
    {
        if (has_bought_shop_item_safe(global.shops.borbventure.borbventure_craft_from_codex))
        {
            var count = 1;
            var cost = 
            {
                resources: 
                {
                    borb_rune: 39
                }
            };
            var existing_item = global.borbventures.find_item(arg2.key, global.borbventures.borbventure_levels.common.key);
            var can_craft_add = true;
            if (is_struct(existing_item))
            {
                can_craft_add = false;
            }
            else
            {
                can_craft_add = array_length(global.borbventures.items.inventory) < global.borbventures.get_inventory_size();
            }
            var can_craft = has_enough(cost) && can_craft_add;
            var craft_text = (count > 1) ? __s("Craft %s", count) : __("Craft");
            if (gui_button_tl(arg0 + gui_col_x(0), arg1 + gui_col_y(1), craft_text, can_craft, gui_col_x(2), undefined, 
            {
                result_mini: cost
            }))
            {
                dec_result(cost);
                var crafted_item = global.borbventures.add_item(arg2.key, 1, global.borbventures.borb_levels.common, true);
                notify(__s("%s %s crafted.", concatstr(count, "x"), crafted_item.get_name(false)));
            }
            arg1 += gui_col_y(4);
        }
        arg1 += draw_heading(arg0, arg1, __("Upgrades"), undefined, undefined, undefined, undefined, false);
        arg1 += draw_description(arg0, arg1, arg2.upgrade_cache_text, gui_col_x(8));
    }
    return arg1 - y_start;
}
