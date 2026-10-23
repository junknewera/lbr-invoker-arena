function gui_item_harbor(arg0, arg1)
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
    var harbor = o_game.data.harbor;
    if (is_current_dialog_section(global.dialog_sections.harbor.overview))
    {
        arg1 += gui_draw_harbor_overview(arg0, arg1);
    }
    else if (is_current_dialog_section(global.dialog_sections.harbor.ships))
    {
        arg1 += gui_draw_harbor_ships(arg0, arg1);
    }
    else if (is_current_dialog_section(global.dialog_sections.harbor.shop))
    {
        arg1 += gui_draw_harbor_shop(arg0, arg1);
    }
    else if (is_current_dialog_section(global.dialog_sections.harbor.inventory))
    {
        arg1 += gui_draw_harbor_inventory(arg0, arg1);
    }
    else if (is_current_dialog_section(global.dialog_sections.harbor.journey))
    {
        arg1 += gui_item_journey(arg0, arg1, global.journeys.harbor);
    }
    else if (is_current_dialog_section(global.dialog_sections.harbor.codex))
    {
        arg1 += gui_item_harbor_codex(arg0, arg1);
    }
    return arg1 - y_start;
}

function gui_draw_harbor_overview(arg0, arg1)
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
    var x1 = arg0 + gui_col_x(2.75);
    var y1 = arg1 + gui_col_y(0);
    y1 += draw_heading(x1, y1, __("Container"), undefined, undefined, 1);
    y1 += global.ui_gaps.xs;
    gui_draw_sprite(x1, y1, spr_icon_container, undefined, 5);
    y1 += global.ui_gaps.lg;
    y1 += draw_heading(x1, y1, sprintf("%s/%s", number_format(global.harbor.container.data.count), number_format(global.harbor.container.get_max_storage())), undefined, undefined, 1, undefined, false);
    if (global.upgrade_attributes.harbor_container_auto_add_count > 0)
    {
        y1 += draw_description(x1, y1, __s("Auto: %s/s", number_format(global.upgrade_attributes.harbor_container_auto_add_count, 3)), undefined, 1);
    }
    if (is_unlocked_harbor_diver())
    {
        y1 += global.ui_gaps.md;
        y1 += draw_heading(x1, y1, __("Diver"), undefined, undefined, 1);
        y1 += global.ui_gaps.xs;
        gui_draw_sprite(x1, y1, spr_icon_diver, undefined, 5);
        y1 += global.ui_gaps.lg;
        y1 += draw_result(x1 - gui_col_x(0.5), y1, o_game.data.harbor.diver_result);
        y1 -= global.ui_gaps.xs;
        var diver_chance_text = __s("Chance/s: %s", number_format_percent(get_diver_find_water_crystal_chance())) + "\n";
        diver_chance_text += __s("Count: %s", number_format(get_diver_find_water_crystal_count()));
        y1 += draw_description(x1, y1, diver_chance_text, undefined, 1);
        y1 += global.ui_gaps.xs;
        var can_claim = false;
        if (is_struct(o_game.data.harbor.diver_result) && o_game.data.harbor.diver_result.resources.water_crystal > 0)
        {
            can_claim = true;
        }
        if (gui_button(x1, y1, __("Claim"), can_claim, gui_col_x(3)))
        {
            add_result_lite(o_game.data.harbor.diver_result);
            o_game.data.harbor.diver_result.resources.water_crystal = 0;
        }
        y1 += global.ui_gaps.md;
    }
    if (is_unlocked_harbor_ships())
    {
        y1 += global.ui_gaps.md;
        y1 += draw_heading(x1, y1, __("Pending Rewards"), undefined, undefined, 1);
        y1 += global.ui_gaps.xs;
        gui_draw_sprite(x1, y1, spr_icon_backpack, undefined, 5);
        y1 += global.ui_gaps.lg;
        var can_claim_pending_rewards = false;
        if (get_struct_length(o_game.data.harbor.pending_inventory_result) > 0)
        {
            y1 += draw_result(x1 - gui_col_x(0.5), y1, o_game.data.harbor.pending_inventory_result);
            can_claim_pending_rewards = true;
        }
        else
        {
            y1 += draw_description(x1, y1, "-");
        }
        y1 += global.ui_gaps.xs;
        if (gui_button(x1, y1, __("Claim"), can_claim_pending_rewards, gui_col_x(3)))
        {
            add_result_lite(o_game.data.harbor.pending_inventory_result);
            o_game.data.harbor.pending_inventory_result = {};
        }
    }
    if (gui_button_tl(arg0 + gui_col_x(17), arg1, __("Claim all"), undefined, gui_col_x(3)))
    {
        __array = global.harbor.jobs;
        __prop_len = array_length(__array);
        var __i = __prop_len - 1;
        while (__i >= 0)
        {
            var mitem = __array[__i];
            var __ireal = __prop_len - 1 - __i;
            if (mitem.can_claim())
            {
                mitem.claim();
            }
            __i--;
        }
    }
    var rx = arg0 + gui_col_x(8);
    var ry = arg1;
    var jbx = rx + gui_col_x(8.5);
    var max_harbor_refresh_count = get_max_harbor_refresh_count();
    var text_below = sprintf("%s/%s", o_game.data.harbor.job_refresh_count, max_harbor_refresh_count);
    var text_before = (o_game.data.harbor.job_refresh_count < max_harbor_refresh_count) ? format_remaining_time(o_game.data.harbor.job_refresh_time_end, undefined, true) : "";
    if (gui_button_sprite_tl(rx + gui_col_x(14), ry - gui_col_y(0.1), spr_icon_refresh, can_refresh_harbor_jobs(), undefined, 
    {
        tooltip: __("Refresh jobs"),
        text_before: text_before,
        text_below: text_below
    }))
    {
        refresh_harbor_jobs();
    }
    ry += draw_heading(rx, ry, sprintf("%s (%s/%s)", __("Delivery Jobs"), array_length(global.harbor.jobs), get_max_harbor_jobs()));
    ry += global.ui_gaps.md;
    if (array_length(global.harbor.jobs) == 0)
    {
        ry += draw_description(rx, ry, __("No jobs available. Refresh jobs to find new ones!"));
    }
    var __array = global.harbor.jobs;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        if (__i >= array_length(__array))
        {
            break;
        }
        var mitem = __array[__i];
        gui_draw_sprite(rx, ry + gui_col_y(0.2), spr_icon_container, undefined, 3);
        draw_heading_description(rx + gui_col_x(1), ry, number_format(mitem.data.input_count), sprintf("%s (%s)", number_format(mitem.data.count), number_format_percent(calc_percent(mitem.data.count, mitem.data.input_count) / 100, 0)));
        gui_draw_sprite(rx + gui_col_x(3), ry + gui_col_y(0.2), spr_gui_arrow_right, undefined, 2);
        var result_y = is_undefined(struct_get_from_hash(mitem.data.output, variable_get_hash("harbor_items_rarity"))) ? ry : (ry - gui_col_y(0.75));
        draw_result(rx + gui_col_x(4), result_y - gui_col_y(0.25), mitem.data.output);
        if (!mitem.data.started)
        {
            var container_max_count = global.harbor.container.get_max_storage();
            var add_count = max(0, min(global.harbor.container.data.count, mitem.data.input_count - mitem.data.count));
            var can_add = global.harbor.container.data.count > 0 && mitem.data.count < mitem.data.input_count;
            if (gui_button_sprite_tl(jbx, ry - gui_col_y(0.25), spr_gui_plus, can_add, undefined, 
            {
                text_below: number_format(add_count),
                tooltip: __("Add leaves to container")
            }))
            {
                mitem.add(add_count);
            }
            var remove_count = min(container_max_count - global.harbor.container.data.count, mitem.data.count);
            var can_decrease = mitem.data.count > 0 && global.harbor.container.data.count < container_max_count;
            if (gui_button_sprite_tl(jbx + gui_col_x(1.5), ry - gui_col_y(0.25), spr_gui_minus, can_decrease, undefined, 
            {
                text_below: number_format(remove_count),
                tooltip: __("Remove leaves from job")
            }))
            {
                mitem.decrease(remove_count);
            }
            if (gui_button_sprite_tl(jbx + gui_col_x(3), ry - gui_col_y(0.25), spr_icon_truck, mitem.can_start(), undefined, 
            {
                tooltip: __("Deliver")
            }))
            {
                mitem.start();
            }
            var lock_sprite = mitem.data.locked ? spr_icon_lock : spr_icon_lock_open;
            if (gui_button_sprite_tl(jbx + gui_col_x(4.5), ry - gui_col_y(0.25), lock_sprite, undefined, undefined, 
            {
                tooltip: __("Locked jobs will not be refreshed.")
            }))
            {
                mitem.data.locked = !mitem.data.locked;
            }
        }
        else if (mitem.data.started)
        {
            if (gui_button_tl(jbx, ry - gui_col_y(0.25), __("Claim"), mitem.can_claim(), gui_col_x(3), undefined, 
            {
                text_below: format_remaining_time(mitem.data.time_end, undefined, true)
            }))
            {
                mitem.claim();
            }
        }
        else if (gui_button_tl(jbx, ry - gui_col_y(0.25), __("Start"), mitem.can_start(), gui_col_x(3)))
        {
            mitem.start();
        }
        ry += (global.ui_gaps.xl * 1.3);
    }
    return max(arg1, y1, ry) - y_start;
}

function gui_draw_harbor_inventory(arg0, arg1)
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
    var detail_x = gui_col_x(18);
    var detail_y = gui_col_y(10);
    var inventory = global.harbor_inventory.inventory;
    var inventory_size = global.harbor_inventory.get_inventory_size();
    var paging_id = "harbor_items";
    var craft_count = get_key_modifier();
    var craft_text = (craft_count > 1) ? __s("Craft %s random items", craft_count) : __("Craft random item");
    arg1 += draw_heading(arg0, arg1, sprintf("%s: %s/%s", __("Inventory"), array_length(inventory), inventory_size));
    var col_x = 0;
    var col_y = 0;
    var col_x_padding_default = 1.5;
    var col_x_padding_compact = global.is_mobile ? 1.25 : 0.85;
    var col_x_padding = gui_col_x(col_x_padding_compact);
    arg1 += draw_inventory_items(arg0, arg1, inventory, inventory_size, gui_col_x(11), 28, undefined, undefined, true, paging_id, 
    {
        backpack: global.harbor_inventory.backpack,
        backpack_size: global.harbor_inventory.get_backpack_size(),
        display_count: true,
        func_salvage: true,
        override_inventory_size: true,
        paging_x: arg0 + gui_col_x(5),
        show_sorting: true
    });
    gui_draw_harbor_selected_item(arg0 + gui_col_x(13), y_start, variable_struct_get(global.selected_inventory_item, paging_id));
    if (global.debug)
    {
        if (gui_button_tl(arg0 + gui_col_x(0), y_start + gui_col_y(17), "add random item"))
        {
            var item = global.harbor_inventory.add_random_item();
            if (is_struct(item))
            {
                log(item.key);
            }
        }
        if (gui_button_tl(arg0 + gui_col_x(3), y_start + gui_col_y(17), "add all"))
        {
            var __struct = global.harbor_inventory.items;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                global.harbor_inventory.add_item(mitem, 99);
            }
        }
        if (gui_button_tl(arg0 + gui_col_x(6), y_start + gui_col_y(17), "clear inv"))
        {
            var __array = global.harbor_inventory.inventory;
            var __prop_len = array_length(__array);
            var __i = __prop_len - 1;
            while (__i >= 0)
            {
                var mitem = __array[__i];
                var __ireal = __prop_len - 1 - __i;
                global.harbor_inventory.remove_item(mitem);
                __i--;
            }
            __array = global.harbor_inventory.backpack;
            __prop_len = array_length(__array);
            __i = __prop_len - 1;
            while (__i >= 0)
            {
                var mitem = __array[__i];
                var __ireal = __prop_len - 1 - __i;
                global.harbor_inventory.remove_item(mitem);
                __i--;
            }
        }
    }
    return arg1 - y_start;
}

function gui_draw_harbor_ships(arg0, arg1)
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
    if (gui_button_tl(arg0 + gui_col_x(20), arg1, __("Claim all"), undefined, gui_col_x(3)))
    {
        __array = global.harbor.ships;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (mitem.can_claim())
            {
                mitem.claim();
            }
        }
    }
    arg1 += draw_heading(arg0, arg1, __("Ships"));
    arg1 += global.ui_gaps.sm;
    var __array = global.harbor.ships;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        var selected_route = mitem.get_selected_route();
        var selected_route_type = mitem.get_selected_route_type();
        var has_selected_route = is_struct(selected_route);
        gui_draw_sprite(arg0 + gui_col_x(0.3), arg1, spr_icon_ship, undefined, 3);
        var count = 0;
        var max_count = 1;
        var pct = calc_percent(count, max_count) / 100;
        var heading_text = sprintf("%s #%s", __("Ship"), __i + 1);
        var status_text = "";
        switch (mitem.data.status)
        {
            case UnknownEnum.Value_0:
                status_text = __("Idle") + "\n";
                if (has_selected_route)
                {
                    status_text += __s("Route: %s (%s)", selected_route_type.name, format_time(secr(selected_route.duration), undefined, true));
                }
                else
                {
                    status_text += __("No route");
                }
                break;
            case UnknownEnum.Value_1:
                selected_route_type = variable_struct_get(global.harbor_route_types, selected_route.type_key);
                status_text = __("Delivering") + "\n";
                status_text += __s("Route: %s (%s)", selected_route_type.name, format_remaining_time(mitem.data.time_end, undefined, true, __("Finished")));
                break;
            case UnknownEnum.Value_2:
                status_text = __("Finished");
                break;
        }
        draw_heading_description(arg0 + gui_col_x(1), arg1, heading_text, status_text, gui_col_x(7));
        var ax = arg0 + gui_col_x(12);
        if (mitem.data.status == UnknownEnum.Value_0)
        {
            if (gui_button_tl(ax, arg1, __("Choose route"), true, gui_col_x(3)))
            {
                if (is_struct(struct_get_from_hash(global.selected_inventory_item, variable_get_hash("harbor_ship_route"))))
                {
                    global.selected_inventory_item.harbor_ship_route = undefined;
                }
                else
                {
                    global.selected_inventory_item.harbor_ship_route = mitem;
                }
            }
            var result_mini = has_selected_route ? selected_route.fuel : undefined;
            if (gui_button_tl(ax + gui_col_x(4), arg1, __("Embark"), mitem.can_embark(), gui_col_x(3), undefined, 
            {
                result_mini: result_mini
            }))
            {
                mitem.embark();
                global.selected_inventory_item.harbor_ship_route = undefined;
            }
        }
        else if (mitem.data.status == UnknownEnum.Value_1 || mitem.data.status == UnknownEnum.Value_2)
        {
            if (gui_button_tl(ax, arg1, __("Cancel"), mitem.can_cancel(), gui_col_x(3), undefined, 
            {
                text_below: __("No refunds")
            }))
            {
                confirm_dialog_item_func(global.texts.cancel_dialog, mitem.reset);
            }
            if (gui_button_tl(ax + gui_col_x(4), arg1, __("Claim"), mitem.can_claim(), gui_col_x(3)))
            {
                mitem.claim();
            }
        }
        if (is_struct(mitem.last_reward))
        {
            gui_button_sprite_tl(arg0 + gui_col_x(21), arg1, spr_icon_question, undefined, undefined, 
            {
                tooltip: __("Last reward"),
                result: mitem.last_reward
            });
        }
        arg1 += gui_col_y(2.75);
        var can_refresh_routes = global.debug;
        if (get_default_struct_value(global.selected_inventory_item, "harbor_ship_route") == mitem && mitem.data.status == UnknownEnum.Value_0)
        {
            var box_height = global.is_mobile ? gui_col_y(15) : gui_col_y(12);
            draw_rect(arg0, arg1, arg0 + gui_col_x(23.5), arg1 + box_height, undefined, global.colors.content_section_background);
            var last_cy = 0;
            var __array2 = mitem.data.routes;
            var __prop_len2 = array_length(__array2);
            for (var __i2 = 0; __i2 < __prop_len2; __i2++)
            {
                var mitem2 = __array2[__i2];
                var cx = arg0 + gui_col_x(0.5) + (__i2 * gui_col_x(6));
                var cy = arg1 + gui_col_y(1);
                var type = variable_struct_get(global.harbor_route_types, mitem2.type_key);
                cy += draw_heading(cx, cy, type.name, undefined, undefined, undefined, undefined, false);
                var description = __s("Duration: %s", format_time(secr(mitem2.duration), false, true));
                description += "\n";
                description += __s("Item chance: %s", number_format_percent(mitem2.item_chance));
                cy += draw_description(cx, cy, description);
                var is_selected = mitem.data.route_index == __i2;
                var select_text = is_selected ? __("Selected") : __("Select");
                if (gui_button_tl(cx, cy, select_text, !is_selected, gui_col_x(3), undefined))
                {
                    mitem.select_route(__i2);
                    global.selected_inventory_item.harbor_ship_route = undefined;
                }
                cy += global.ui_gaps.button_y;
                cy += draw_description(cx, cy, __("Reward"));
                cy += draw_result(cx, cy, mitem2.reward);
                cy += draw_description(cx, cy, __("Cost"));
                cy += draw_result(cx, cy, mitem2.fuel, undefined, 
                {
                    insufficient_indicator: true
                });
                last_cy = cy;
            }
            if (can_refresh_routes)
            {
                var refresh_cost = global.costs.refresh_harbor_jobs;
                if (gui_button_sprite_tl(arg0 + gui_col_x(22.4), arg1 + gui_col_y(0.7), spr_gui_refresh, has_enough(refresh_cost), undefined, 
                {
                    result_mini: refresh_cost,
                    tooltip: __("Refresh routes")
                }))
                {
                    mitem.generate_routes();
                    dec_result(refresh_cost);
                }
            }
            arg1 = last_cy;
            arg1 += gui_col_y(6);
        }
    }
    return arg1 - y_start;
}

function gui_draw_harbor_shop(arg0, arg1)
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
    arg1 += gui_item_shop(arg0, arg1, 
    {
        shop_items: o_shop.shop_items.harbor,
        shop_key: "harbor"
    });
    return arg1 - y_start;
}

function gui_draw_harbor_selected_item(arg0, arg1, arg2)
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
    var y_start = arg1;
    if (arg2.data.bag == "backpack")
    {
        if (gui_button_tl(arg0 + gui_col_x(8), arg1 + gui_col_y(0), __("Equip"), !global.harbor_inventory.is_inventory_full(), gui_col_x(2)))
        {
            global.harbor_inventory.move_item(arg2);
        }
    }
    else if (arg2.data.bag == "inventory")
    {
        if (gui_button_tl(arg0 + gui_col_x(8), arg1 + gui_col_y(0), __("Unequip"), !global.harbor_inventory.is_backpack_full(), gui_col_x(2)))
        {
            global.harbor_inventory.move_item(arg2);
        }
    }
    var swap_enabled = true;
    var swap_item = struct_get_from_hash(global.selected_inventory_item, variable_get_hash("harbor_item_swap"));
    if (is_struct(swap_item) && swap_item.data.bag == arg2.data.bag)
    {
        swap_enabled = false;
    }
    var swap_sprite = is_struct(swap_item) ? spr_icon_swap_active : spr_icon_swap;
    if (gui_button_sprite(arg0 + gui_col_x(6.5), arg1 + gui_col_y(0.6), swap_sprite, swap_enabled, undefined, 
    {
        tooltip: __("Swap")
    }))
    {
        if (is_struct(swap_item))
        {
            if (swap_item.data.bag == "inventory")
            {
                if (swap_array_items(global.harbor_inventory.inventory, global.harbor_inventory.backpack, swap_item, arg2))
                {
                    swap_item.data.bag = "backpack";
                    arg2.data.bag = "inventory";
                }
            }
            else if (swap_array_items(global.harbor_inventory.backpack, global.harbor_inventory.inventory, swap_item, arg2))
            {
                swap_item.data.bag = "inventory";
                arg2.data.bag = "backpack";
            }
            refresh_ua_section("harbor");
            global.selected_inventory_item.harbor_item_swap = undefined;
        }
        else
        {
            global.selected_inventory_item.harbor_item_swap = arg2;
        }
    }
    var name = sprintf("[%s/%s]\n%s", number_format(arg2.data.count), number_format(arg2.get_max_count()), arg2.get_name());
    arg1 += draw_heading(arg0, arg1, name, gui_col_x(6), undefined, undefined, 0);
    arg1 += global.ui_gaps.md;
    gui_button_toggle_lock(arg0 + gui_col_x(8), arg1 + gui_col_y(0.5), arg2, "locked", undefined, 
    {
        tooltip: arg2.data.locked ? __("Unlock") : __("Lock")
    });
    var salvage_count = arg2.get_salvage_count();
    gui_button_salvage(arg0 + gui_col_x(10), arg1 + gui_col_y(0.6), arg2, undefined, salvage_count, undefined, arg2.can_salvage(), 
    {
        result_mini: arg2.get_salvage_result(salvage_count),
        text_below: sprintf("%sx", salvage_count)
    });
    arg1 += draw_description(arg0, arg1, arg2.ua_text, gui_col_x(6));
    return arg1 - y_start;
}

function gui_item_harbor_codex(arg0, arg1)
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
    arg1 += draw_heading_description(arg0, gui_y_start_items, __("Codex"), __s("Upgrade calculation: %s", sprintf("[%s] * [%s]", __("sqrt(count)"), __("rarity multiplier"))));
    arg1 -= gui_col_y(1);
    arg1 += gui_item_selection(arg0, arg1, 
    {
        list_props: 
        {
            columns: global.is_mobile ? 9 : 12,
            is_unlocked_func: global.harbor_inventory.is_item_unlocked,
            items: global.harbor_item_types,
            items_array: global.harbor_item_types_sorted,
            width: gui_col_x(14)
        },
        selected_item_draw_props: 
        {
            draw_use_button: false,
            draw_below_func: gui_item_selected_codex_item
        },
        selected_item_is_unlocked_func: global.harbor_inventory.is_item_unlocked,
        selection_key: "harbor_codex"
    });
    return arg1 - y_start;
}

function gui_item_harbor_add_draw(arg0, arg1)
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
    var opt_x = add_button_base_x_tl + gui_col_x(0.5);
    var opt_y = add_button_base_y_tl;
    if (is_current_dialog_section(global.dialog_sections.harbor.overview))
    {
        if (has_bought_shop_item_safe(global.shops.harbor.harbor_container_auto_add_job_leaves))
        {
            draw_option(global.options.harbor_container_auto_add_job_leaves, opt_x, opt_y, undefined, undefined, 5);
        }
        if (has_bought_shop_item_safe(global.shops.harbor.harbor_jobs_auto_start))
        {
            draw_option(global.options.harbor_jobs_auto_start, opt_x + gui_col_x(5), opt_y, undefined, undefined, 5);
        }
        if (has_bought_shop_item_safe(global.shops.harbor.harbor_jobs_auto_claim))
        {
            draw_option(global.options.harbor_jobs_auto_claim, opt_x + gui_col_x(10), opt_y, undefined, undefined, 5);
        }
        if (has_bought_shop_item_safe(global.shops.harbor.harbor_jobs_auto_refresh))
        {
            draw_option(global.options.harbor_jobs_auto_refresh, opt_x + gui_col_x(15), opt_y, undefined, undefined, 5);
        }
    }
    else if (is_current_dialog_section(global.dialog_sections.harbor.shop))
    {
        gui_draw_buy_max(add_button_base_x, add_button_base_y, global.shops_sorted.harbor);
    }
    else if (is_current_dialog_section(global.dialog_sections.harbor.ships))
    {
        if (has_bought_shop_item_safe(global.shops.harbor.harbor_ships_auto_embark))
        {
            draw_option(global.options.harbor_ships_auto_embark, opt_x, opt_y, undefined, undefined, 5);
        }
        if (has_bought_shop_item_safe(global.shops.harbor.harbor_ships_auto_claim))
        {
            draw_option(global.options.harbor_ships_auto_claim, opt_x + gui_col_x(5), opt_y, undefined, undefined, 5);
        }
    }
    draw_resources_current_amount_lite_array(add_text_base_x + gui_col_x(21), add_text_base_y, [global.resources.water_crystal, global.resources.ship_fuel], false);
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2
}
