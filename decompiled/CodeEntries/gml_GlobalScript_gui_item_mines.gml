function gui_item_mines(arg0, arg1)
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
    var cave_padding_x = global.is_mobile ? 1.5 : 1;
    var cave_padding_y = global.is_mobile ? 2.5 : 2;
    if (is_current_dialog_section(global.dialog_sections.mines.coal_vein))
    {
        var enhance_value = 0.2;
        var vein_count = array_length(o_game.data.mines.veins);
        arg1 += draw_heading(arg0, arg1, sprintf("%s (%s/%s) - %s", __("Coal Vein"), array_length(o_game.data.mines.veins), get_max_veins(), __s("Level %s", o_game.data.mines.veins_level + 1)), undefined, undefined, undefined, undefined, true);
        if (gui_button_tl(arg0, arg1, __s("Search %s", __("Vein")), can_search_vein(), gui_col_x(3), undefined, 
        {
            text_below: format_remaining_time(get_timeout_data("mines_search_vein"), undefined, true)
        }))
        {
            search_vein();
        }
        var max_veins_level = 99;
        if (o_game.data.mines.veins_level < max_veins_level)
        {
            var upgrade_cost = get_mine_vein_upgrade_cost();
            var can_upgrade = has_enough(upgrade_cost);
            if (gui_button_tl(arg0 + gui_col_x(4), arg1, __s("Upgrade"), can_upgrade, gui_col_x(3), undefined, 
            {
                result_mini: upgrade_cost
            }))
            {
                upgrade_mine_veins();
            }
        }
        var has_auto_vein_pack = has_bought_shop_item_safe(global.shops.gems.mines_auto_vein);
        var opt_args = 
        {
            width: gui_col_x(2)
        };
        global.options.mines_auto_mine_vein.draw(arg0 + gui_col_x(15), y_start + gui_col_y(0.5), undefined, opt_args, 5, has_auto_vein_pack);
        global.options.mines_auto_search_vein.draw(arg0 + gui_col_x(15), y_start + gui_col_y(2.25), undefined, opt_args, 5, has_auto_vein_pack);
        global.options.mines_auto_remove_vein.draw(arg0 + gui_col_x(19), y_start + gui_col_y(0.5), undefined, opt_args, 5, has_auto_vein_pack);
        global.options.mines_auto_enhance_vein.draw(arg0 + gui_col_x(19), y_start + gui_col_y(2.25), undefined, opt_args, 5, has_auto_vein_pack && has_bought_shop_item_safe(global.shops.mines.mines_enhance));
        arg1 += gui_col_y(3.5);
        var padding_x = gui_col_x(12);
        var padding_y = gui_col_y(global.is_mobile ? 4.5 : 3.5);
        var column_break_count = 2;
        var col_x = 0;
        var col_y = 0;
        var y_max = 0;
        var mine_vein_max_count = get_mine_vein_max_mine_count();
        var __array = o_game.data.mines.veins;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (col_x >= column_break_count)
            {
                col_y++;
                col_x = 0;
            }
            var rarity = variable_struct_get(global.mine_vein_rarity, mitem.rarity_key);
            var row_x = arg0 + gui_col_x(1) + (col_x * padding_x);
            var row_y = arg1 + (col_y * padding_y);
            var enhance_cost = get_mine_vein_enhance_cost(mitem);
            var rect_height = gui_col_y(global.is_mobile ? 3 : 2.25);
            draw_rect(row_x, row_y, row_x + gui_col_x(0.25), row_y + rect_height, false, rarity.color);
            var text = sprintf("%s - %s: %s", format_text_numbers(rarity.name, mitem.mine_count, mine_vein_max_count), __("Quality"), number_format_percent(mitem.quality, 0));
            row_y += draw_description(row_x + gui_col_x(0.5), row_y, text);
            gui_draw_sprite(row_x + gui_col_x(0.85), row_y + 16, spr_icon_mine_vein, undefined, 3);
            var timeout_key = sprintf("mines_coal_vein_%s", mitem.id);
            var can_mine = can_mine_vein(mitem);
            if (gui_button_tl(row_x + gui_col_x(1.65), row_y, __("Mine"), can_mine, gui_col_x(3), undefined, 
            {
                text_below: format_remaining_time(mitem.timeout, undefined, true)
            }))
            {
                mine_vein(mitem);
            }
            draw_result(row_x + gui_col_x(5.3), row_y + gui_col_y(0.15), mitem.result);
            var show_enhance = has_bought_shop_item_safe(global.shops.mines.mines_enhance) && mitem.quality < 1 && mitem.mine_count < mine_vein_max_count;
            if (show_enhance)
            {
                var can_enhance = can_enhance_vein(mitem);
                var enhance_value_vein = _clamp(enhance_value, 0, 1 - mitem.quality);
                if (gui_button_sprite(row_x + gui_col_x(8), row_y + gui_col_y(0.6), spr_icon_enhance, can_enhance, undefined, 
                {
                    result_mini: enhance_cost,
                    tooltip: sprintf("%s (+%s)", __("Enhance"), number_format_percent(enhance_value_vein))
                }))
                {
                    enhance_vein(mitem);
                }
            }
            var vein_max_mined = mitem.mine_count >= mine_vein_max_count;
            var remove_icon = vein_max_mined ? spr_icon_check : spr_icon_cancel;
            if (gui_button_sprite(row_x + gui_col_x(9.5), row_y + gui_col_y(0.6), remove_icon, undefined, undefined, 
            {
                tooltip: __("Remove")
            }))
            {
                confirm_remove_item(mitem, "vein", remove_vein);
                __prop_len = array_length(__array);
            }
            col_x++;
            y_max = row_y;
        }
        if (global.debug)
        {
            if (gui_button_tl(arg0, y_start + gui_col_y(16), "Add vein"))
            {
                add_mine_vein();
            }
            if (gui_button_tl(arg0 + gui_col_x(2), y_start + gui_col_y(16), "Refresh all"))
            {
                o_game.data.mines.veins = [];
                repeat (get_max_veins())
                {
                    add_mine_vein();
                }
            }
            if (gui_button_tl(arg0 + gui_col_x(4), y_start + gui_col_y(16), "Clear veins"))
            {
                o_game.data.mines.veins = [];
            }
            if (gui_button_tl(arg0 + gui_col_x(6), y_start + gui_col_y(16), "Clear timeouts"))
            {
                set_timeout_data("mines_search_vein", 0);
                __array = o_game.data.mines.veins;
                __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    mitem.timeout = 0;
                }
            }
            if (gui_button_tl(arg0 + gui_col_x(6), y_start + gui_col_y(17.25), "all mined"))
            {
                __array = o_game.data.mines.veins;
                __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    mitem.mine_count = mine_vein_max_count;
                }
            }
            if (gui_button_tl(arg0 + gui_col_x(9), y_start + gui_col_y(16), "Vein lvl=0"))
            {
                o_game.data.mines.veins_level = 0;
            }
            if (gui_button_tl(arg0 + gui_col_x(11), y_start + gui_col_y(16), "Vein lvl-1"))
            {
                o_game.data.mines.veins_level -= 1;
            }
            if (gui_button_tl(arg0 + gui_col_x(13), y_start + gui_col_y(16), "Vein lvl+1"))
            {
                o_game.data.mines.veins_level += 1;
            }
            if (gui_button_tl(arg0 + gui_col_x(15), y_start + gui_col_y(16), "Vein lvl+5"))
            {
                o_game.data.mines.veins_level += 5;
            }
            if (gui_button_tl(arg0 + gui_col_x(18), y_start + gui_col_y(16), "Coal Bar+5000"))
            {
                global.materials.bar_coal.data.count += 5000;
            }
        }
        return (y_max - y_start) + gui_col_y(2);
    }
    else if (is_current_dialog_section(global.dialog_sections.mines.mines))
    {
        draw_heading(arg0, gui_y_start_items, sprintf("%s (%s/%s)", __("Mines"), array_length(global.mines), get_max_mines()));
        var can_search = can_search_mine();
        if (gui_button_tl(arg0, gui_y_start_items + gui_col_y(1.25), __("Search"), can_search, gui_col_x(4), undefined, 
        {
            result_mini: get_search_mines_cost(),
            timeout_end: get_timeout_data("mines_search_mine")
        }))
        {
            search_mine();
        }
        var content_x = arg0 + gui_col_x(5.5);
        var caves_width = gui_col_x(10);
        draw_button_list_items(arg0, gui_y_start_items + gui_col_y(4.5), global.mines, 
        {
            items_per_page: global.is_mobile ? 5 : 7,
            selected_item_name: "mine",
            
            on_select: function(arg0)
            {
                global.selected_inventory_item.mine_cave = arg0.selected_cave;
            }
        });
        var has_auto_cave_pack = has_bought_shop_item_safe("gems", "mines_auto_cave");
        draw_option(global.options.mines_auto_search_mine, arg0 + gui_col_x(5.9), y_start + gui_col_y(0.5), undefined, undefined, 5, has_auto_cave_pack);
        draw_option(global.options.mines_auto_mine_cave, arg0 + gui_col_x(9.5), y_start + gui_col_y(0.5), undefined, undefined, 5, has_auto_cave_pack);
        draw_option(global.options.mines_auto_claim_cave, arg0 + gui_col_x(13), y_start + gui_col_y(0.5), undefined, undefined, 5, has_auto_cave_pack);
        draw_option(global.options.mines_auto_start_drill, arg0 + gui_col_x(17), y_start + gui_col_y(0.5), undefined, undefined, 5, has_auto_cave_pack);
        draw_option(global.options.mines_auto_remove_cave, arg0 + gui_col_x(20.5), y_start + gui_col_y(0.5), undefined, undefined, 5, has_auto_cave_pack);
        var bx = content_x;
        var by = arg1 + gui_col_y(3);
        var mine = get_default_struct_value(global.selected_inventory_item, "mine", undefined);
        var selected_cave = get_default_struct_value(global.selected_inventory_item, "mine_cave", undefined);
        if (is_struct(mine))
        {
            by += draw_heading(bx, by, mine.name);
            var can_mine_all = mine.can_mine_all();
            if (gui_button_tl(bx, by, __("Mine all"), can_mine_all, gui_col_x(3)))
            {
                mine.mine_all_caves();
            }
            var can_claim_all = mine.can_claim_all();
            if (gui_button_tl(bx + gui_col_x(3.5), by, __("Claim all"), can_claim_all, gui_col_x(3)))
            {
                mine.claim_all_caves();
            }
            gui_button_toggle_lock(bx + gui_col_x(15), by + gui_col_y(0.5), mine, undefined, undefined, 
            {
                tooltip: __("Locked mines can't be removed.")
            });
            if (gui_button_sprite(bx + gui_col_x(17), by + gui_col_y(0.5), spr_icon_cancel, !mine.data.locked, undefined, 
            {
                tooltip: __("Remove")
            }))
            {
                global.selected_inventory_item.mine_remove = mine;
                if (keyboard_check(vk_shift))
                {
                    remove_mine(mine);
                }
                else
                {
                    confirm_dialog(__s("Do you want to remove this item?"), function()
                    {
                        if (!is_struct(global.selected_inventory_item))
                        {
                            exit;
                        }
                        remove_mine(global.selected_inventory_item.mine_remove);
                    }, undefined, undefined, 
                    {
                        parent_nav: "mines"
                    });
                }
            }
            by += gui_col_y(3);
            var sub_row_y = by;
            by += draw_heading(bx, by, sprintf("%s (%s/%s)", __("Caves"), mine.get_active_caves(true), get_max_active_caves()));
            var cx = bx + gui_col_x(0.5);
            var cy = by + gui_col_y(0.5);
            var col_x = 0;
            var col_y = 0;
            var __array2 = mine.data.caves;
            var __prop_len2 = array_length(__array2);
            for (var __i2 = 0; __i2 < __prop_len2; __i2++)
            {
                var mitem2 = __array2[__i2];
                fx = cx + (col_x * gui_col_x(cave_padding_x));
                if (fx >= (cx + caves_width))
                {
                    col_x = 0;
                    col_y++;
                    fx = cx + (col_x * gui_col_x(cave_padding_x));
                }
                fy = cy + (col_y * gui_col_y(cave_padding_y));
                var cave = mitem2;
                var btn_bg_color = mine.get_cave_color(cave);
                var selected = false;
                if (is_struct(selected_cave))
                {
                    selected = selected_cave.id == cave.id;
                }
                if (gui_button_sprite(fx, fy, mine.get_icon(cave), undefined, undefined, 
                {
                    selected: selected,
                    btn_bg_color: btn_bg_color
                }))
                {
                    global.selected_inventory_item.mine_cave = cave;
                    mine.selected_cave = cave;
                    if (mouse_lastbutton == 2)
                    {
                        if (mine.can_mine_cave(cave))
                        {
                            mine.mine_cave(cave);
                        }
                        else if (mine.can_claim_cave(cave))
                        {
                            mine.claim_cave(cave);
                        }
                        refresh_ua_section("mines");
                    }
                }
                draw_sprite_contain(mine.get_mini_icon(cave), 0, fx + 20, fy - 20, 32);
                col_x++;
            }
            by += (((col_y + 1) * gui_col_y(cave_padding_y)) + gui_col_y(1));
            if (has_bought_shop_item_safe(global.shops.mines.mines_drill_mines))
            {
                var drill_text = mine.is_drilling() ? __("On") : __("Off");
                var remaining_time = divide_safe(1 - mine.data.drill_progress, mine.get_drill_value());
                var by_start = by;
                by += draw_heading(bx, by, sprintf("%s (%s)", __("Drill"), drill_text), undefined, undefined, undefined, undefined, false);
                var drill_text_btn = mine.is_drilling() ? __("Stop drilling") : __s("Start drilling");
                if (gui_button_tl(bx, by, drill_text_btn, true, gui_col_x(3)))
                {
                    mine.toggle_drill();
                }
                by += gui_col_y(2);
                by += draw_description(bx, by, [__s("Progress: %s", number_format_percent(mine.data.drill_progress)), __s("Progress/s: %s", number_format_percent(mine.get_drill_value(), 4)), __s("Ready in: %s", format_time(remaining_time, undefined, true, "-")), __s("Depleted: %s", number_format_percent(mine.data.drill_depletion))]);
                var reward_x = bx + gui_col_x(5);
                var reward_y = by_start;
                reward_y += draw_heading(reward_x, reward_y, __("Drill Reward"));
                draw_result(reward_x, reward_y, mine.get_drill_reward());
            }
            var fx = bx + gui_col_x(11);
            var fy = sub_row_y;
            if (is_struct(selected_cave))
            {
                var type = variable_struct_get(global.mine_cave_types, selected_cave.type_key);
                var cave_name = sprintf("%s #%s", __("Cave"), selected_cave.index + 1);
                fy += draw_heading(fx, fy, cave_name);
                var can_mine = mine.can_mine_cave(selected_cave);
                if (gui_button_sprite_tl(fx, fy, spr_icon_mine, can_mine, undefined, 
                {
                    tooltip: __("Mine cave"),
                    result_mini: mine.get_mine_cave_cost()
                }))
                {
                    mine.mine_cave(selected_cave);
                    mine.selected_cave = selected_cave;
                }
                var can_claim = mine.can_claim_cave(selected_cave);
                var is_inventory_full = array_length(global.mine_inventory) >= get_mines_inventory_size();
                var claim_text_below = "";
                if (is_inventory_full && selected_cave.type_key == "item")
                {
                    claim_text_below = __("Inventory full");
                }
                if (gui_button_sprite_tl(fx + gui_col_x(2), fy, spr_icon_check, can_claim, undefined, 
                {
                    tooltip: __("Claim"),
                    text_below: claim_text_below
                }))
                {
                    mine.claim_cave(selected_cave);
                }
                fy += gui_col_y(3);
                fy += draw_description(fx, fy, mine.get_cave_description(selected_cave), gui_col_x(7));
                if (selected_cave.progress >= 1 && (type.key != "item" || (type.key == "item" && selected_cave.claimed)))
                {
                    fy += draw_result(fx, fy, selected_cave.result, undefined, undefined, undefined, gui_col_x(6));
                }
            }
        }
        if (global.debug && keyboard_check(vk_control))
        {
            if (gui_button_tl(arg0, y_start + gui_col_y(16), "Add mine"))
            {
                var level = irandom_range(get_mines_min_level(), get_mines_max_level());
                generate_mine(level, undefined, true);
            }
            if (gui_button_tl(arg0 + gui_col_x(2), y_start + gui_col_y(16), "Clear mines"))
            {
                global.mines = [];
                global.selected_inventory_item.mine = undefined;
                global.selected_inventory_item.mine_cave = undefined;
            }
            if (gui_button_tl(arg0 + gui_col_x(5), y_start + gui_col_y(16), "Mine + claim all"))
            {
                var __array = global.mines;
                var __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    mitem.mine_all_caves();
                    mitem.claim_all_caves();
                }
                refresh_ua_section("mines");
            }
            if (gui_button_tl(arg0 + gui_col_x(8), y_start + gui_col_y(16), "Clear UA stats"))
            {
                o_game.data.mines.upgrade_attributes = {};
                refresh_ua_section("mines");
            }
            if (gui_button_tl(arg0 + gui_col_x(11), y_start + gui_col_y(16), "Recalc diff"))
            {
                var __array = global.mines;
                var __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    mitem.difficulty = mitem.get_difficulty();
                }
            }
            if (gui_button_tl(arg0 + gui_col_x(14), y_start + gui_col_y(16), "Mine ready"))
            {
                var __array = global.mines;
                var __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    var __array2 = mitem.data.caves;
                    var __prop_len2 = array_length(__array2);
                    for (var __i2 = 0; __i2 < __prop_len2; __i2++)
                    {
                        var mitem2 = __array2[__i2];
                        mitem.active = false;
                        mitem2.progress = 1;
                    }
                }
            }
            if (gui_button_tl(arg0 + gui_col_x(17), y_start + gui_col_y(16), "Create all mines"))
            {
                var levels = [1, 2, 5, 10, 20];
                var __array = levels;
                var __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    var __array2 = global.mine_rarity_sorted;
                    var __prop_len2 = array_length(__array2);
                    for (var __i2 = 0; __i2 < __prop_len2; __i2++)
                    {
                        var mitem2 = __array2[__i2];
                        generate_mine(mitem, mitem2, true);
                    }
                }
            }
        }
        return max(by) - y_start;
    }
    else if (is_current_dialog_section(global.dialog_sections.mines.inventory))
    {
        var detail_x = gui_col_x(18);
        var detail_y = gui_col_y(10);
        var inventory_items_length = array_length(global.mine_inventory);
        var inventory_size = get_mines_inventory_size();
        var paging_id = "mine_items";
        draw_heading(arg0 + gui_col_x(0), arg1, sprintf("%s: %s/%s", __("Inventory"), inventory_items_length, inventory_size));
        if (inventory_items_length > inventory_size)
        {
            draw_description(arg0, arg1 + gui_col_y(0.8), __s("Overflowing items are not applied. Buy more inventory space!"));
        }
        var inventory_padding = get_option(global.options.borbventures_inventory_padding);
        var padding_text = get_option_text(global.options.borbventures_inventory_padding);
        if (gui_button_tl(arg0 + gui_col_x(15.5), gui_col_y(7), padding_text, undefined, gui_col_x(2), undefined, 
        {
            tooltip: __("Padding")
        }))
        {
            global.options.borbventures_inventory_padding._func();
        }
        var sort_dir = get_option(global.options.borbventures_inventory_sort_dir);
        var sort_type_text = get_option_text(global.options.borbventures_inventory_sort_type);
        if (gui_button_tl(arg0 + gui_col_x(18.5), gui_col_y(7), sort_type_text, undefined, gui_col_x(2), undefined, 
        {
            tooltip: __("Sort by")
        }))
        {
            global.options.borbventures_inventory_sort_type._func();
            sort_array_by(global.mine_inventory, "get_sort_value", sort_dir == "asc");
        }
        var sort_dir_sprite = (sort_dir == "asc") ? spr_gui_arrow_up : spr_gui_arrow_down;
        if (gui_button_sprite(arg0 + gui_col_x(22), gui_col_y(7) + gui_col_y(0.6), sort_dir_sprite, undefined, undefined, 
        {
            tooltip: __("Sort direction")
        }))
        {
            global.options.borbventures_inventory_sort_dir._func();
            sort_dir = get_option(global.options.borbventures_inventory_sort_dir);
            sort_array_by(global.mine_inventory, "get_sort_value", sort_dir == "asc");
        }
        arg0 += gui_col_x(0.5);
        arg1 += gui_col_y(2);
        var col_x = 0;
        var col_y = 0;
        var col_x_padding_default = 1.5;
        var col_x_padding_compact = global.is_mobile ? 1.25 : 0.85;
        var col_x_padding = gui_col_x((inventory_padding == "default") ? col_x_padding_default : col_x_padding_compact);
        arg1 += draw_inventory_items(arg0, arg1, global.mine_inventory, inventory_size, gui_col_x(12), 128, undefined, undefined, true, paging_id, 
        {
            display_count: true,
            
            func_rightclick: function(arg0)
            {
                arg0.data.locked = !arg0.data.locked;
            },
            
            override_inventory_size: true,
            padding_x: col_x_padding,
            func_salvage: true
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
            global.scrap_count_tmp = scrap_count;
            if (selected_item.is_usable)
            {
                var use_count = 1;
                var use_text = __("Use");
                if (gui_button_tl(detail_x + gui_col_x(0), detail_y + gui_col_y(1), use_text, selected_item._can_activate(use_count), gui_col_x(2)))
                {
                    selected_item._activate(use_count);
                    exit;
                }
            }
            else
            {
                var craft_text = (count > 1) ? __s("Craft %s", count) : __("Craft");
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
                        if (!is_struct(struct_get_from_hash(global.selected_inventory_item, variable_get_hash("mine_items"))))
                        {
                            return notify_error(__("Scrap item failed."));
                        }
                        global.selected_inventory_item.mine_items.scrap(global.scrap_count_tmp);
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
                    global.selected_inventory_item.mine_items.remove();
                    exit;
                }
                confirm_dialog(__s("Do you really want to remove %s from your inventory?", selected_item.name), function()
                {
                    global.selected_inventory_item.mine_items.remove();
                }, undefined, undefined, 
                {
                    parent_nav: o_shop.current_nav_key
                });
                exit;
            }
            draw_description(detail_x, detail_y + gui_col_y(4), selected_item.get_description(), gui_col_x(9));
        }
        if (global.debug)
        {
            if (gui_button_tl(arg0, y_start + gui_col_y(16), "clear"))
            {
                global.mine_inventory = [];
            }
            if (gui_button_tl(arg0 + gui_col_x(2), y_start + gui_col_y(16), "max"))
            {
                var __array = global.mine_inventory;
                var __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    mitem.collect(mitem.get_max_count());
                }
            }
            if (gui_button_tl(arg0 + gui_col_x(4), y_start + gui_col_y(16), "drill items"))
            {
                global.mine_inventory = [];
                var __array = global.mine_rarity_sorted;
                var __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    add_mine_inventory_item("drill", mitem, 1);
                    add_mine_inventory_item("pickaxe", mitem, 1);
                }
            }
            if (gui_button_tl(arg0 + gui_col_x(6), y_start + gui_col_y(16), "dice"))
            {
                var __array = global.mine_rarity_sorted;
                var __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    add_mine_inventory_item("battle_die", mitem, 1);
                }
            }
            if (gui_button_tl(arg0 + gui_col_x(8), y_start + gui_col_y(16), "blossom"))
            {
                var __array = global.mine_rarity_sorted;
                var __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    add_mine_inventory_item("blossom", mitem, 1);
                }
            }
        }
    }
    else if (is_current_dialog_section(global.dialog_sections.mines.drill))
    {
        var drill_depth_inc_value = get_mines_drill_depth_inc_value();
        var sprite_add_y = is_depth_drilling() ? (sin(o_game.data.stats.time_elapsed) * 5) : 0;
        draw_sprite_ext(spr_weapon_drill, 0, arg0 + gui_col_x(3), arg1 + gui_col_y(2) + sprite_add_y, 10, 10, 270, c_white, 1);
        var row_x = arg0 + gui_col_x(8);
        var row_y = arg1;
        row_y += draw_option(global.options.mines_depth_drill_active, row_x + gui_col_x(0.5), row_y + gui_col_y(0.5), undefined, undefined, 5);
        row_y += gui_col_y(2);
        var power_drill_count = get_key_modifier();
        var power_drill_cost = get_power_drill_cost(power_drill_count);
        var power_drill_value = drill_depth_inc_value * 30 * power_drill_count;
        power_drill_value *= (1 + get_upgrade_attribute_value(global.upgrade_attributes.mines_coal_time_sphere_efficiency));
        var can_power_drill = has_enough(power_drill_cost);
        if (gui_button_tl(row_x, row_y, sprintf("%sx %s", number_format(power_drill_count), __("Power Drill")), can_power_drill, gui_col_x(4), undefined, 
        {
            result_mini: power_drill_cost,
            text_below: sprintf("+%sm", number_format(power_drill_value))
        }))
        {
            o_game.data.mines.drill_depth += power_drill_value;
            o_game.data.mines.power_drills += power_drill_count;
            dec_result(power_drill_cost);
            refresh_ua_section("mines");
        }
        row_y += gui_col_y(4);
        var can_refuel = !has_timeout_data("drill_refuel");
        var refuel_result = get_mines_free_refuel_result();
        if (gui_button_tl(row_x, row_y, __("Free refuel"), can_refuel, gui_col_x(4), undefined, 
        {
            result_mini: refuel_result,
            text_below: format_remaining_time(get_timeout_data("drill_refuel"), undefined, true, "-")
        }))
        {
            add_result_lite(refuel_result);
            set_timeout_data("drill_refuel", sec(global.game_settings.mines_depth_drill_free_refuel_duration));
        }
        row_x = arg0 + gui_col_x(14);
        row_y = arg1;
        draw_heading(row_x, row_y, __("Fuel"));
        draw_result(row_x, row_y + gui_col_y(1), get_depth_drill_fuel_drain_result(), undefined, 
        {
            insufficient_indicator: true,
            show_current_collection_count: true
        });
        draw_heading(row_x + gui_col_x(5), row_y, __("Depth"));
        draw_heading(row_x + gui_col_x(5), row_y + gui_col_y(1.4), sprintf("%sm", number_format(o_game.data.mines.drill_depth)));
        row_y += gui_col_y(3.5);
        row_y += draw_heading(row_x, row_y, __("Stats"), undefined, undefined, undefined, undefined, false);
        row_y += draw_description(row_x, row_y, [__s("Status: %s", is_depth_drilling() ? __("active") : __("inactive")), sprintf("%s/s: %sm", __("Depth"), number_format(drill_depth_inc_value)), sprintf("%s: %s", __("Fuel time remaining"), format_time(divide_safe(global.resources.fuel.data.count, get_depth_drill_fuel_drain()), undefined, true, "-"))], gui_col_x(8));
        row_y += gui_col_y(1);
        row_y += draw_heading(row_x, row_y, __("Bonuses"), undefined, undefined, undefined, undefined, false);
        var next_stage_text = __s("All bonuses unlocked.");
        var current_stage = get_cache("mines_drill_ua_stage", 0);
        if (current_stage < array_length(global.mines_drill_ua_stages))
        {
            var stage = global.mines_drill_ua_stages[current_stage];
            var remaining = stage.depth - o_game.data.mines.drill_depth;
            next_stage_text = __s("Next bonuses: %s", number_format(remaining) + "m");
        }
        row_y += draw_description(row_x, row_y, next_stage_text, gui_col_x(10));
        row_y += draw_description(row_x, row_y, get_cache("mines_upgrades_text", "-"), gui_col_x(10));
        if (global.debug)
        {
            if (gui_button_tl(arg0, arg1, "=0m"))
            {
                o_game.data.mines.drill_depth = 0;
            }
            if (gui_button_tl(arg0 + gui_col_x(1), arg1, "+100m"))
            {
                o_game.data.mines.drill_depth += 100;
            }
            if (gui_button_tl(arg0 + gui_col_x(2), arg1, "+1km"))
            {
                o_game.data.mines.drill_depth += 1000;
            }
            if (gui_button_tl(arg0 + gui_col_x(3), arg1, "+1mm"))
            {
                o_game.data.mines.drill_depth += 1000000;
            }
            if (gui_button_tl(arg0 + gui_col_x(4), arg1, "+1bm"))
            {
                o_game.data.mines.drill_depth += 1000000000;
            }
            if (gui_button_tl(arg0 + gui_col_x(0), arg1 + gui_col_y(2), "refuelt=0"))
            {
                set_timeout_data("drill_refuel", 0);
            }
        }
        return row_y - y_start;
    }
    else if (is_current_dialog_section(global.dialog_sections.mines.shop))
    {
        return gui_item_shop(arg0, arg1, 
        {
            shop_items: o_shop.shop_items.mines,
            shop_key: "mines"
        });
    }
    else if (is_current_dialog_section(global.dialog_sections.mines.transmute))
    {
        arg1 += draw_heading(arg0, arg1, __("Transmute"));
        arg1 += draw_transmuters_section(arg0, arg1, "mines");
    }
    else if (is_current_dialog_section(global.dialog_sections.mines.codex))
    {
        arg1 += gui_item_selection(arg0, arg1, 
        {
            list_props: 
            {
                columns: global.is_mobile ? 9 : 12,
                fixed_y: true,
                
                is_unlocked_func: function(arg0)
                {
                    return !is_undefined(variable_struct_get(o_game.data.mines.types_seen, arg0.key));
                },
                
                items: global.mine_items,
                items_array: global.mine_items_array,
                width: gui_col_x(14),
                
                button_func: function(arg0)
                {
                    global.selected_inventory_item.mine_codex = arg0;
                }
            },
            
            selected_item: function()
            {
                return struct_get_from_hash(global.selected_inventory_item, variable_get_hash("mine_codex"));
            },
            
            selected_item_draw_props: 
            {
                draw_use_button: false,
                draw_below_func: gui_item_mine_codex_selected
            },
            
            selected_item_is_unlocked_func: function(arg0)
            {
                return !is_undefined(variable_struct_get(o_game.data.mines.types_seen, arg0.key));
            }
        });
    }
    return arg1 - y_start;
}

function gui_item_mines_add_draw()
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
    if (is_current_dialog_section(global.dialog_sections.mines.mines))
    {
        draw_description(add_text_base_x, add_text_base_y, __s("Levels: %s-%s", get_mines_min_level(), get_mines_max_level()), gui_col_x(3));
        global.options.mines_scale_min_level.draw(add_button_base_x + gui_col_x(2.5), add_button_base_y + gui_col_y(0));
    }
    else if (is_current_dialog_section(global.dialog_sections.mines.transmute))
    {
    }
    else if (is_current_dialog_section(global.dialog_sections.mines.shop))
    {
        gui_draw_buy_max(add_button_base_x_tl, add_button_base_y_tl, global.shops_sorted.mines);
    }
    draw_materials_current_amount_lite(add_text_base_x + gui_col_x(global.is_mobile ? 11.5 : 13), add_text_base_y, global.materials.bar_coal, false);
    draw_resources_current_amount_lite_array(add_text_base_x + gui_col_x(21), add_text_base_y, [global.resources.diamond_coal, global.resources.diamond_shiny, global.resources.coal_time_sphere, global.resources.fuel], false);
}

function gui_item_mine_codex_selected(arg0, arg1, arg2)
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
    if (has_bought_shop_item_safe(global.shops.mines.mines_craft_from_codex))
    {
        var count = 1;
        var cost = 
        {
            resources: 
            {
                diamond_coal: 25
            }
        };
        var existing_item = get_mine_inventory_item(arg2.key, global.mine_rarity.common.key);
        var can_craft_add = true;
        if (is_struct(existing_item))
        {
            can_craft_add = false;
        }
        else
        {
            can_craft_add = array_length(global.mine_inventory) < get_mines_inventory_size();
        }
        var can_craft = has_enough(cost) && can_craft_add;
        var craft_text = (count > 1) ? __s("Craft %s", count) : __("Craft");
        if (gui_button_tl(arg0 + gui_col_x(0), arg1 + gui_col_y(1), craft_text, can_craft, gui_col_x(2), undefined, 
        {
            result_mini: cost
        }))
        {
            dec_result(cost);
            var crafted_item = add_mine_random_inventory_item(count, arg2.key, global.mine_rarity.common);
            notify(__s("%s %s crafted.", concatstr(count, "x"), crafted_item.get_name(false)));
        }
        arg1 += gui_col_y(4);
    }
    arg1 += draw_heading(arg0, arg1, __("Upgrades"), undefined, undefined, undefined, undefined, false);
    arg1 += draw_description(arg0, arg1, arg2.upgrade_cache_text, gui_col_x(8));
    return arg1 - y_start;
}
