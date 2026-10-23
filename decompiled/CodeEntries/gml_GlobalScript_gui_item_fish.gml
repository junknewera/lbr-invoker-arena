function gui_item_fish(arg0, arg1)
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
    if (is_current_dialog_section(global.dialog_sections.fishing.pond))
    {
        var max_fishing_spots = global.game_settings.fishing_spots_count + global.upgrade_attributes.fishing_spots_count;
        var fishing_spots_length = array_length(global.fishing_spots);
        var search_key = "fishing_search_pond";
        var can_search = o_game.data.fishing.search_charges > 0 && fishing_spots_length < max_fishing_spots;
        var max_charges = get_max_fishing_spot_search_charges();
        var text_below = "";
        var search_timeout = get_timeout_data(search_key);
        if (search_timeout > 0)
        {
            text_below = format_remaining_time(search_timeout, false, true);
        }
        if (max_charges > 1)
        {
            text_below = __s("Charges: %s/%s", o_game.data.fishing.search_charges, max_charges) + "\n" + text_below;
        }
        if (gui_button_tl(arg0, arg1, __("Search"), can_search, gui_col_x(3), undefined, 
        {
            text_below: text_below,
            tooltip: __("Search for a new fishing spot.")
        }))
        {
            var spot = add_random_fishing_spot();
            o_game.data.fishing.search_charges--;
        }
        var lure_key = "fishing_lure";
        var can_lure = !has_timeout_data(lure_key) && _any(global.fishing_spots, function(arg0)
        {
            return arg0.can_reel();
        });
        if (gui_button_tl(arg0 + gui_col_x(4), arg1, __("Lure"), can_lure, gui_col_x(3), undefined, 
        {
            text_below: format_remaining_time(get_timeout_data(lure_key), false, true),
            tooltip: __("Increase catch chance for all fishing rods.")
        }))
        {
            __array = global.fishing_spots;
            __prop_len = array_length(__array);
            for (__i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                if (mitem.can_lure_manual())
                {
                    mitem.lure_manual();
                }
            }
            set_timeout_data(lure_key, sec(10));
        }
        if (gui_button_tl(arg0 + gui_col_x(12.5), arg1, __("Odds"), undefined, gui_col_x(2)))
        {
            var text_array = [__("Fishing spots rarity chance"), ""];
            if (has_bought_shop_item_safe(global.shops.fish.fishing_spots_pity_counter))
            {
                array_push(text_array, __("Pity counter is enabled."));
                array_push(text_array, __s("Fishing spot searches: %s", number_format(o_game.data.stats.fishing_spots)));
                array_push(text_array, "");
                __array = global.fishing_spots_pity_steps;
                __prop_len = array_length(__array);
                for (__i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    var next_pity_text = sprintf("%s: %s", mitem.rarity.name, mitem.count);
                    var next_pity_count = mitem.count - (o_game.data.stats.fishing_spots % mitem.count);
                    next_pity_text += sprintf(" (%s)", __s("next in: %s", next_pity_count));
                    array_push(text_array, next_pity_text);
                }
                array_push(text_array, "");
            }
            __array = global.fishing_spots;
            __prop_len = array_length(__array);
            for (__i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                var text = $"Spot #{__i + 1}\n-----\n";
                var use_bait = mitem.has_bait() && mitem.bait.can_use();
                var __array2 = mitem.catch_rarities;
                var __prop_len2 = array_length(__array2);
                var __i2 = __prop_len2 - 1;
                while (__i2 >= 0)
                {
                    var mitem2 = __array2[__i2];
                    var base_chance = mitem2.chance;
                    var bait_add_chance = 0;
                    if (use_bait)
                    {
                        bait_add_chance = get_default_struct_value(mitem.bait.rarity.catch_chance, mitem2.key, 0);
                        base_chance += bait_add_chance;
                    }
                    var chance = base_chance * (1 + mitem.get_catch_rarity_multiplier());
                    chance = min(1, chance);
                    text += $"{mitem2.name}: {number_format_percent(chance)}";
                    text += "\n";
                    __i2--;
                }
                array_push(text_array, text);
            }
            var final_text = implode("\n", text_array);
            text_dialog(final_text, undefined, undefined, "fishing");
        }
        arg1 += gui_col_y(global.is_mobile ? 4.25 : 3.25);
        arg1 += draw_heading(arg0, arg1, sprintf("%s (%s/%s)", __("Fishing Spots"), fishing_spots_length, max_fishing_spots));
        arg1 += gui_col_y(0.25);
        var col_x = 0;
        var col_y = 0;
        var item_x = 0;
        var item_y = 0;
        var width = gui_col_x(7);
        var height = gui_col_y(global.is_mobile ? 9 : 6);
        var padding_x = gui_col_x(0.6);
        var padding_y = gui_col_y(global.is_mobile ? 1.75 : 1);
        var __array = global.fishing_spots;
        var __prop_len = array_length(__array);
        for (__i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (col_x >= 2)
            {
                col_x = 0;
                col_y++;
            }
            item_x = arg0 + (col_x * (width + padding_x));
            item_y = arg1 + (col_y * (height + padding_y));
            var spot = mitem;
            draw_rect(item_x - 16, item_y - 26, item_x + width, item_y + height, undefined, global.colors.content_section_background);
            draw_rect(item_x - 16, item_y - 26, item_x - 8, item_y + height, false, variable_struct_get(global.rarity_colors, spot.data.rarity_key));
            var can_remove_spot = fishing_spots_length > 1 && spot.data.status == "idle";
            if (gui_button_sprite_tl(item_x + gui_col_x(6), item_y - 8, spr_icon_cancel, can_remove_spot, undefined, 
            {
                tooltip: __s("Remove %s", __("Fishing Spot"))
            }))
            {
                confirm_remove_item(spot, "fishing_spot", remove_fishing_spot);
                if (!is_struct(variable_struct_get(global.fishing_spots_map, spot.data.id)))
                {
                    exit;
                }
            }
            item_y += draw_description(item_x + gui_col_x(0.2), item_y - gui_col_y(0.3), spot.name, gui_col_x(5));
            item_y += draw_description(item_x + gui_col_x(0.2), item_y - gui_col_y(0.5), spot.get_description(), gui_col_x(5));
            var __array2 = spot.data.rods;
            var __prop_len2 = array_length(__array2);
            for (var __i2 = 0; __i2 < __prop_len2; __i2++)
            {
                var mitem2 = __array2[__i2];
                var can_change_rod = spot.can_change_rod();
                var btn_bg_color = 16777215;
                var sprite = spr_solid;
                var tooltip = "";
                if (is_string(mitem2))
                {
                    var rod = variable_struct_get(global.fishing_rods_map, mitem2);
                    if (is_struct(rod))
                    {
                        if (rod.rarity.key != "common")
                        {
                            btn_bg_color = variable_struct_get(global.rarity_colors, rod.rarity.key);
                        }
                        sprite = rod.sprite;
                        tooltip = rod.get_tooltip();
                    }
                }
                if (!can_change_rod)
                {
                    btn_bg_color = merge_color(btn_bg_color, c_black, 0.5);
                }
                if (gui_button_sprite_tl(item_x + gui_col_x(global.is_mobile ? 0.4 : 0.2) + (__i2 * gui_col_x(global.is_mobile ? 1.3 : 1)), item_y - gui_col_y(0.2), sprite, can_change_rod, undefined, 
                {
                    btn_bg_color: btn_bg_color,
                    tooltip: tooltip
                }))
                {
                    spot.change_rod(__i2);
                    instance_destroy(o_tooltip);
                }
            }
            item_y += gui_col_y(global.is_mobile ? 2 : 1.5);
            if (spot.data.status == "idle")
            {
                text_below = "";
                if (spot.data.reel_time_end > o_game.data.stats.time_elapsed)
                {
                    text_below = format_remaining_time(spot.data.reel_time_end, undefined, true);
                }
                if (gui_button_tl(item_x + gui_col_x(0.1), item_y, __("Cast"), spot.can_cast(), gui_col_x(3), undefined, 
                {
                    text_below: text_below
                }))
                {
                    spot.cast_rod();
                }
            }
            else if (spot.data.status == "cast")
            {
                progress_pct = divide_safe(o_game.data.stats.time_elapsed - spot.data.cast_time_end, spot.data.reel_time_end - spot.data.cast_time_end) * 100;
                text_below = number_format_percent(spot.data.catch_chance);
                if (gui_button_tl(item_x + gui_col_x(0.1), item_y, __("Reel"), spot.can_reel(), gui_col_x(3), undefined, 
                {
                    text_below: text_below
                }))
                {
                    spot.reel();
                }
            }
            if (is_unlocked_fishing_baits())
            {
                var has_bait = spot.has_bait();
                var btn_bg_color = has_bait ? variable_struct_get(global.rarity_colors_button, spot.bait.rarity.key) : 16777215;
                var bait_sprite = has_bait ? spot.bait.sprite : spr_solid;
                var bait_tooltip = has_bait ? spot.bait.get_tooltip() : __("Bait");
                if (gui_button_sprite_tl(item_x + gui_col_x(6), item_y, bait_sprite, undefined, undefined, 
                {
                    btn_bg_color: btn_bg_color,
                    display_count: true,
                    item: spot.bait,
                    tooltip: bait_tooltip
                }))
                {
                    spot.change_bait();
                    instance_destroy(o_tooltip);
                }
            }
            col_x++;
        }
        var log_x = arg0 + gui_col_x(15.5);
        var log_y = gui_y_start_items;
        log_y += draw_heading(log_x, log_y, __("Last Catches"));
        if (array_length(global.fishing_rewards_last) == 0)
        {
            draw_description(log_x, log_y, "-");
        }
        __array = global.fishing_rewards_last;
        __prop_len = array_length(__array);
        var __i = __prop_len - 1;
        while (__i >= 0)
        {
            var mitem = __array[__i];
            var __ireal = __prop_len - 1 - __i;
            if (mitem.success)
            {
                var fish_xp = get_default_struct_value(struct_get_from_hash(mitem.reward, variable_get_hash("journey_xp")), "fishing");
                var suffix_resource_text = is_numeric(fish_xp) ? sprintf(" (+%s %s)", number_format(fish_xp), __("exp")) : "";
                draw_resources_mini(log_x, log_y, get_default_struct_value(mitem.reward, "fish"), undefined, 
                {
                    collection: global.fish,
                    display_rarity: true,
                    resource_name: "name_full",
                    show_resource_name: true,
                    suffix_value: "m",
                    suffix_resource_text: suffix_resource_text
                });
                draw_resources_mini(log_x + gui_col_x(0.1), log_y + gui_col_y(0.7), get_default_struct_value(mitem.reward, "resources"));
                log_y += gui_col_y(2);
            }
            else if (is_struct(mitem.reward))
            {
                draw_resources_mini(log_x + gui_col_x(0.1), log_y + gui_col_y(0), get_default_struct_value(mitem.reward, "resources"), undefined, 
                {
                    show_resource_name: true
                });
                log_y += gui_col_y(1.3);
            }
            else
            {
                draw_description(log_x, log_y, __("Nothing caught"));
                log_y += gui_col_y(1.3);
            }
            __i--;
        }
        arg1 = item_y;
        if (global.is_mobile)
        {
            arg1 += gui_col_y(1.5);
        }
    }
    else if (is_current_dialog_section(global.dialog_sections.fishing.rods))
    {
        var rod_y = draw_selected_item(arg0 + gui_col_x(14), y_start, struct_get_from_hash(global.selected_inventory_item, variable_get_hash("fishing_rod")), undefined, undefined, gui_item_selected_fishing_rod);
        var col_y = gui_y_start_items;
        var fishing_rods_count = array_length(global.fishing_rods);
        var max_fishing_rods = get_max_fishing_rods();
        var can_buy_fishing_rod = true;
        if (fishing_rods_count >= max_fishing_rods)
        {
            can_buy_fishing_rod = false;
        }
        if (!has_enough(global.costs.fishing_craft_rod))
        {
            can_buy_fishing_rod = false;
        }
        if (gui_button_tl(arg0, col_y, __s("Craft %s", __("Fishing Rod")), can_buy_fishing_rod, gui_col_x(4), undefined, 
        {
            result_mini: global.costs.fishing_craft_rod
        }))
        {
            dec_result(global.costs.fishing_craft_rod);
            var rod = add_fishing_rod();
            variable_struct_set(global.fishing_rods_map, rod.data.id, rod);
        }
        col_y += gui_col_y(4);
        col_y += draw_heading(arg0, col_y, sprintf("%s [%s/%s]", __("Fishing Rods"), fishing_rods_count, max_fishing_rods));
        col_y += draw_inventory_items(arg0, col_y, global.fishing_rods, max_fishing_rods, undefined, undefined, undefined, undefined, undefined, "fishing_rod", 
        {
            override_inventory_size: true
        });
        return rod_y;
        return max(col_y, rod_y) - y_start;
    }
    else if (is_current_dialog_section(global.dialog_sections.fishing.fish))
    {
        var selection_key = "fish";
        draw_heading_description(arg0, gui_y_start_items, __("Caught Fish"));
        draw_sort_button(arg0 + gui_col_x(9), gui_y_start_items, global.options.fishing_fish_sort_dir, global.options.fishing_fish_sort_type);
        var sort_type = get_option(global.options.fishing_fish_sort_type);
        var display_array = global.fish_array;
        if (sort_type == UnknownEnum.Value_1)
        {
            display_array = global.fish_array_sorted_type;
        }
        arg1 += gui_item_selection(arg0, arg1, 
        {
            list_props: 
            {
                columns: global.is_mobile ? 8 : 13,
                display_count: false,
                fixed_y: true,
                items: global.fish,
                items_array: display_array,
                loop_dir: get_option(global.options.fishing_fish_sort_dir),
                selection_key: selection_key,
                width: gui_col_x(12)
            },
            selection_key: selection_key,
            selected_item_draw_props: 
            {
                draw_below_func: gui_item_selected_fish,
                draw_use_button: false,
                check_is_unlocked_from_item: true
            }
        });
    }
    else if (is_current_dialog_section(global.dialog_sections.fishing.tournaments))
    {
        if (!is_struct(global.active_fishing_tournament))
        {
            var __array = global.fishing_tournaments_array;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                var dx = arg0;
                var dy = arg1;
                arg1 += draw_heading_description(dx, dy, mitem.name, mitem.get_description(), gui_col_x(11), undefined, undefined, 0);
                draw_result(dx + gui_col_x(13), dy, mitem.type.reward, undefined, 
                {
                    result_prefix: __("1st rank"),
                    show_tooltip: true
                });
                if (mitem.data.status == "idle")
                {
                    var text_below = "";
                    if (mitem.data.time_end > o_game.data.stats.time_elapsed)
                    {
                        text_below = format_remaining_time(mitem.data.time_end, undefined, true);
                    }
                    if (gui_button_tl(dx + gui_col_x(19), dy, __("Start"), mitem.can_start(), gui_col_x(3), undefined, 
                    {
                        result_mini: mitem.type.cost,
                        text_below: text_below
                    }))
                    {
                        mitem.start();
                    }
                }
                else if (gui_button_tl(dx + gui_col_x(19), dy, __("Resume"), true, gui_col_x(3)))
                {
                    global.active_fishing_tournament = mitem;
                }
                arg1 += gui_col_y(1);
            }
        }
        else
        {
            var tournament = global.active_fishing_tournament;
            draw_heading(arg0, arg1, tournament.name);
            draw_description(arg0, arg1 + gui_col_y(1), [__s("Turn %s/%s", tournament.data.turn, tournament.max_turns), __s("Fish length player: %s", sprintf("%sm - %sm", tournament.get_min_fish_length(), tournament.get_max_fish_length())), __s("Opponents fish length: %s", sprintf("%sm - %sm", tournament.get_min_fish_length_bot(), tournament.get_max_fish_length_bot()))]);
            var timeout_duration = global.debug ? sec(0.5) : sec(1);
            var timeout_key = "fishing_tournament_select_choice";
            if (has_timeout(timeout_key))
            {
                var text = tournament.data.last_choice_success ? __("Success") : __("Fail");
                draw_heading(arg0 + gui_col_x(5), arg1 + gui_col_y(5), text);
            }
            else if (tournament.data.status == "started")
            {
                var col_x = 0;
                var col_y = 0;
                var __array = tournament.data.choices;
                var __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    if (col_x >= 3)
                    {
                        col_x = 0;
                        col_y++;
                    }
                    var dx = arg0 + gui_col_x(col_x * 5);
                    var dy = arg1 + gui_col_y(4) + gui_col_y(6 * col_y);
                    var choice_type = variable_struct_get(tournament.choice_types, mitem.type);
                    draw_heading(dx + gui_col_x(1.5), dy, choice_type.title, undefined, undefined, 1);
                    var format_value_func = get_default_struct_value(choice_type, "format_value", number_format);
                    var value_text = format_value_func(mitem.value);
                    var text_below = number_format_percent(mitem.chance, 0);
                    if (get_default_struct_value(choice_type, "has_value", true))
                    {
                        text_below += ("\n" + sprintf("%s%s%s", get_default_struct_value(choice_type, "text_prefix", ""), value_text, get_default_struct_value(choice_type, "text_suffix", "")));
                    }
                    if (mitem.boost)
                    {
                        text_below += ("\n" + __("Boosted"));
                    }
                    var can_select = !has_timeout(timeout_key);
                    if (gui_button_tl(dx, dy + gui_col_y(1), __("Select"), can_select, gui_col_x(3), undefined, 
                    {
                        result_mini: struct_get_from_hash(mitem, variable_get_hash("result")),
                        text_below: text_below,
                        tooltip: struct_get_from_hash(choice_type, variable_get_hash("description"))
                    }))
                    {
                        tournament.select_choice(mitem);
                        set_timeout(timeout_key, timeout_duration);
                        instance_destroy(o_tooltip);
                    }
                    col_x++;
                }
            }
            else if (tournament.data.status == "finished")
            {
                draw_heading(arg0, arg1 + gui_col_y(4), __s("You've finished %s.", sprintf("#%s", tournament.data.rank)));
                draw_result(arg0, arg1 + gui_col_y(6), tournament.data.reward);
                if (gui_button_tl(arg0, arg1 + gui_col_y(8), __("Claim"), undefined, gui_col_x(3)))
                {
                    tournament.claim();
                }
            }
            var tx = arg0 + gui_col_x(16);
            var ty = arg1;
            ty += draw_heading(tx, ty, __("Leaderboard"));
            set_default_font();
            draw_text_table(tx, ty, tournament.leaderboard_cache, undefined, gui_col_x(7), 16);
            var lx = tx;
            var ly = ty + gui_col_y(10);
            if (gui_button_tl(arg0 + gui_col_x(20), arg1 + gui_col_y(15), __("Cancel"), undefined, gui_col_x(3)))
            {
                confirm_dialog_item_func(__("Do you want to cancel the current tournament?"), tournament.cancel);
            }
        }
    }
    else if (is_current_dialog_section(global.dialog_sections.fishing.baits))
    {
        var collection = global.fishing_baits_array;
        var collection_count = array_length(collection);
        var selection_key = "fishing_bait";
        arg1 += draw_heading_description(arg0, gui_y_start_items, __("Fish Baits"), __("Baits boost the chance to catch fishes of higher rarity."));
        arg1 += gui_item_selection(arg0, arg1, 
        {
            list_props: 
            {
                columns: global.is_mobile ? 6 : 8,
                display_count: true,
                display_count_data: true,
                fixed_y: true,
                items: global.fishing_baits,
                items_array: global.fishing_baits_array,
                selection_key: selection_key,
                width: gui_col_x(12)
            },
            selection_key: selection_key,
            selected_item_draw_props: 
            {
                draw_below_func: gui_item_selected_bait,
                draw_use_button: false,
                check_is_unlocked_from_item: true
            }
        });
    }
    else if (is_current_dialog_section(global.dialog_sections.fishing.bait_farm))
    {
        var farm_length = array_length(global.fishing_baits_farm);
        if (farm_length < global.game_settings.fishing_bait_farms_max)
        {
            var farm_cost = multiply_struct_values(global.costs.fishing_bait_farm, power(2, farm_length));
            var can_build_farm = has_enough(farm_cost) && farm_length < global.game_settings.fishing_bait_farms_max;
            if (gui_button_tl(arg0, arg1, __("Build Farm"), can_build_farm, gui_col_x(4), undefined, 
            {
                result_mini: farm_cost
            }))
            {
                add_fishing_bait_farm();
                dec_result(farm_cost);
            }
        }
        else
        {
            draw_description(arg0, arg1, __("Max farms reached."), gui_col_x(6));
        }
        if (gui_button_tl(arg0 + gui_col_x(7), arg1, __("Collect all"), undefined, gui_col_x(4)))
        {
            __array = global.fishing_baits_farm;
            __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                if (mitem.can_collect())
                {
                    mitem.collect();
                }
            }
        }
        arg1 += gui_col_y(3);
        var container_size = get_bait_farm_container_size();
        var col_x = 0;
        var col_y = 0;
        var bait_padding_x = global.is_mobile ? 1.1 : 0.8;
        var __array = global.fishing_baits_farm;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (col_x >= 3)
            {
                col_x = 0;
                col_y++;
            }
            var item_x = arg0 + (col_x * gui_col_x(7));
            var item_y = arg1 + (col_y * gui_col_y(7));
            var desc = __s("Progress: %s", number_format_percent(mitem.data.progress));
            item_y += draw_heading_description(item_x, item_y, concatstr(__s("Farm"), " #", __i + 1), desc, gui_col_x(5));
            for (var i = 0; i < container_size; i++)
            {
                var btn_bg_color = 16777215;
                var sprite = spr_solid;
                var tooltip = "";
                if (i < mitem.container_count)
                {
                    var bait = variable_struct_get(global.fishing_baits, mitem.data.container[i]);
                    btn_bg_color = variable_struct_get(global.rarity_colors_button, bait.key);
                    sprite = bait.sprite;
                    tooltip = bait.name;
                }
                if (gui_button_sprite_tl(item_x + (gui_col_x(i) * bait_padding_x), item_y, sprite, undefined, undefined, 
                {
                    btn_bg_color: btn_bg_color,
                    tooltip: tooltip
                }))
                {
                }
            }
            item_y += gui_col_y(2);
            col_x++;
        }
    }
    else if (is_current_dialog_section(global.dialog_sections.fishing.tourney_rod))
    {
        var x1 = arg0;
        var x2 = arg0 + gui_col_x(12);
        var y1 = gui_y_start_items;
        var y2 = arg1;
        y1 += draw_heading_description(x1, y1, __("Tourney Rod"), __("Upgrade your tourney rod to increase your chances of winning a tournament. The more fish you've caught, the better the tourney rod."), gui_col_x(12));
        y1 += gui_col_y(3);
        draw_sprite_contain(global.fishing_tournament_rod.get_sprite(), undefined, x1 + gui_col_x(5.5), y1, 128);
        y1 += gui_col_y(3);
        y1 += draw_description(x1 + gui_col_x(5.5), y1, [__s("Value: %s", global.fishing_tournament_rod.get_base_value()), __s("Tournament value: %s", global.fishing_tournament_rod.get_value()), "", __s("Fish length: %s", sprintf("%sm - %sm", number_format(global.fishing_tournament_rod.get_min_fish_length()), number_format(global.fishing_tournament_rod.get_max_fish_length())))], undefined, 1);
        y2 += draw_upgrades_buyable(x2, y2, global.fishing_tournament_rod, gui_col_x(10));
        y2 -= gui_col_y(1);
        arg1 = max(y1, y2);
    }
    else if (is_current_dialog_section(global.dialog_sections.fishing.shop))
    {
        arg1 += gui_item_shop(arg0, arg1, 
        {
            shop_items: o_shop.shop_items.fish,
            shop_key: "fish"
        });
    }
    else if (is_current_dialog_section(global.dialog_sections.fishing.journey))
    {
        arg1 += gui_item_journey(arg0, arg1, global.journeys.fishing);
    }
    else if (is_current_dialog_section(global.dialog_sections.fishing.transmuters))
    {
        arg1 += draw_transmuters_section(arg0, arg1, "fishing");
    }
    return arg1 - y_start;
}

function gui_item_fish_add_draw()
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
    if (is_current_dialog_section(global.dialog_sections.fishing.pond))
    {
        var has_auto_fishing = has_bought_shop_item_safe(global.shops.fish.auto_fishing);
        var timeout_key = "check_fish";
        var suffix = "";
        if (has_auto_fishing && get_option(global.options.auto_fishing))
        {
            suffix = sprintf(" (%s)", format_remaining_time(get_timeout_data(timeout_key), undefined, true));
        }
        draw_option(global.options.auto_fishing, add_button_base_x_tl + gui_col_x(global.is_mobile ? 0.3 : 0.15), add_button_base_y + gui_col_y(0.5), undefined, 
        {
            suffix: suffix
        }, 5, has_auto_fishing);
        var has_auto_fishing_threshold = has_bought_shop_item_safe(global.shops.fish.auto_fishing_reel_threshold);
        if (has_auto_fishing_threshold)
        {
            draw_option(global.options.auto_fishing_threshold, add_button_base_x_tl + gui_col_x(6), add_button_base_y);
        }
    }
    else if (is_current_dialog_section([global.dialog_sections.fishing.fish, global.dialog_sections.fishing.tourney_rod]))
    {
        var desc = __s("Total caught: %s", number_format(o_game.data.stats.fish_caught)) + " | " + __s("Max length: %s", number_format(o_game.data.stats.fish_length_max) + "m");
        draw_description(add_text_base_x, add_text_base_y, desc);
    }
    else if (is_current_dialog_section(global.dialog_sections.fishing.bait_farm))
    {
        var has_auto_collect = has_bought_shop_item_safe(global.shops.fish.auto_collect_baits);
        var timeout_key_farm = "check_bait_farm";
        var suffix = "";
        if (has_auto_collect && get_option(global.options.auto_collect_baits))
        {
            suffix = sprintf(" (%s)", format_remaining_time(get_timeout_data(timeout_key_farm), undefined, true));
        }
        draw_option(global.options.auto_collect_baits, add_button_base_x_tl + gui_col_x(0.15), add_button_base_y + gui_col_y(0.5), undefined, 
        {
            suffix: suffix
        }, 5, has_auto_collect);
    }
    else if (is_current_dialog_section(global.dialog_sections.fishing.shop))
    {
        gui_draw_buy_max(add_button_base_x_tl, add_button_base_y_tl, global.shops_sorted.fish);
    }
    draw_resources_current_amount_lite_array(add_text_base_x + gui_col_x(17), add_text_base_y, [global.resources.fish_trash, global.resources.fish_credits], false);
    draw_materials_current_amount_lite(add_text_base_x + gui_col_x(19.5), add_text_base_y, [global.materials.tide_crystal_advanced, global.materials.tide_crystal], false);
    if (global.debug)
    {
        var i = 0;
        var dx = add_button_base_x_tl + gui_col_x(23.7);
        var dy = add_button_base_y - gui_col_y(19);
        if (gui_button_tl(dx, dy, "collect all"))
        {
            var __struct = global.fish;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                mitem.collect();
            }
        }
        if (gui_button_tl(dx, dy + gui_col_y(++i * 1.1), "collect none"))
        {
            var __struct = global.fish;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                mitem.data.count = 0;
                mitem.data.collected = 0;
                mitem.data.unlocked = false;
            }
        }
        if (gui_button_tl(dx, dy + gui_col_y(++i * 1.1), "clear rods"))
        {
            global.fishing_rods = [];
        }
        if (gui_button_tl(dx, dy + gui_col_y(++i * 1.1), "add rod"))
        {
            add_fishing_rod();
        }
        if (gui_button_tl(dx, dy + gui_col_y(++i * 1.1), "add rods rarity"))
        {
            var __array = global.fishing_rods_rarity_array;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                var rod = add_fishing_rod(mitem);
                variable_struct_set(global.fishing_rods_map, rod.data.id, rod);
            }
        }
        if (gui_button_tl(dx, dy + gui_col_y(++i * 1.1), "add special rod"))
        {
            var type = array_random_item(global.fishing_rod_types_special);
            add_fishing_rod(undefined, type.key);
        }
        if (gui_button_tl(dx, dy + gui_col_y(++i * 1.1), "1x random fish"))
        {
            var __array = global.fishing_spots;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                if (!mitem.has_any_rod())
                {
                    continue;
                }
                mitem.data.catch_chance = 1;
                mitem.reel();
            }
        }
        if (gui_button_tl(dx, dy + gui_col_y(++i * 1.1), "1000x random fish"))
        {
            var __array = global.fishing_spots;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                repeat (1000)
                {
                    if (!mitem.has_any_rod())
                    {
                        continue;
                    }
                    mitem.data.catch_chance = 1;
                    mitem.reel();
                }
            }
        }
        if (gui_button_tl(dx, dy + gui_col_y(++i * 1.1), "+100 fish credits"))
        {
            add_resources(
            {
                fish_credits: 100
            });
        }
        if (gui_button_tl(dx, dy + gui_col_y(++i * 1.1), "wait=1s"))
        {
            global.game_settings.fishing_wait_duration = 1;
        }
        if (gui_button_tl(dx, dy + gui_col_y(++i * 1.1), "journey xp"))
        {
            global.journeys.fishing.add_xp(100 * get_key_modifier());
        }
        if (gui_button_tl(dx, dy + gui_col_y(++i * 1.1), "journey=0"))
        {
            global.journeys.fishing.data.xp = 0;
            global.journeys.fishing.data.level = 0;
            global.journeys.fishing.data.tier = 1;
        }
        if (gui_button_tl(dx, dy + gui_col_y(++i * 1.1), "tier++"))
        {
            global.journeys.fishing.data.tier++;
        }
        if (gui_button_tl(dx, dy + gui_col_y(++i * 1.1), "fish length=max"))
        {
            var __struct = global.fish;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                mitem.collect(300);
            }
        }
        if (gui_button_tl(dx, dy + gui_col_y(++i * 1.1), "clear spots"))
        {
            global.fishing_spots = [];
            global.fishing_spots_map = {};
        }
        if (gui_button_tl(dx, dy + gui_col_y(++i * 1.1), "add fishing spots"))
        {
            var __array = global.fishing_spots;
            var __prop_len = array_length(__array);
            var __i = __prop_len - 1;
            while (__i >= 0)
            {
                var mitem = __array[__i];
                var __ireal = __prop_len - 1 - __i;
                remove_fishing_spot(mitem);
                __i--;
            }
            __array = global.fishing_spots_rarity_array;
            __prop_len = array_length(__array);
            for (__i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                var spot = add_fishing_spot(mitem.key, array_random_item(global.fishing_spot_types_special));
                variable_struct_set(global.fishing_spots_map, spot.data.id, spot);
            }
        }
        if (gui_button_tl(dx, dy + gui_col_y(++i * 1.1), "add baits"))
        {
            var __array = global.fishing_baits_array;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                mitem.collect(10);
            }
        }
        if (gui_button_tl(dx, dy + gui_col_y(++i * 1.1), "fast baits"))
        {
            global.game_settings.fishing_bait_farm_progress_value = 0.5;
        }
    }
}

function gui_item_selected_bait(arg0, arg1, arg2)
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
    if (is_struct(arg2.rarity.previous_rarity))
    {
        arg1 += gui_col_y(1);
        var convert_count = _clamp(get_key_modifier_abs(), 1, arg2.data.count);
        var can_convert = convert_count > 0 && arg2.data.count > 0;
        var previous_bait = variable_struct_get(global.fishing_baits, arg2.rarity.previous_rarity.key);
        gui_draw_sprite(arg0 + gui_col_x(0.5), arg1, arg2.rarity.sprite, undefined, undefined, undefined, arg2.name, undefined, number_format(convert_count));
        gui_draw_sprite(arg0 + gui_col_x(2), arg1, spr_gui_arrow_right);
        gui_draw_sprite(arg0 + gui_col_x(3), arg1, arg2.rarity.previous_rarity.sprite, undefined, undefined, undefined, previous_bait.name, undefined, number_format(convert_count));
        if (gui_button_tl(arg0 + gui_col_x(5), arg1 - gui_col_y(0.5), __s("Descend"), can_convert, gui_col_x(3)))
        {
            previous_bait.data.count += convert_count;
            arg2.data.count -= convert_count;
        }
    }
    return arg1 - y_start;
}

function gui_item_selected_fish(arg0, arg1, arg2)
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
    arg1 += draw_description(arg0, arg1, [__s("Max length: %s", sprintf("%sm", arg2.data.max_length)), __s("Caught: %s", number_format(arg2.data.collected)), "", format_upgrade_text(arg2.get_upgrade_attributes())]);
    if (global.debug)
    {
        var i = 0;
        arg1 += gui_col_y(2);
        if (gui_button_tl(arg0, arg1, "Count++"))
        {
            arg2.collect(undefined, get_key_modifier());
        }
        if (gui_button_tl(arg0, arg1 + gui_col_y(++i * 1.2), "Length=0.1"))
        {
            arg2.data.max_length = 0.1;
            arg2.collect();
        }
        if (gui_button_tl(arg0, arg1 + gui_col_y(++i * 1.2), "Length=keymod"))
        {
            arg2.data.max_length = get_key_modifier();
            arg2.collect();
        }
    }
}

function gui_item_selected_fishing_rod(arg0, arg1, arg2)
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
    var desc_array = [__s("Quality: %s", number_format_percent(arg2.data.quality, 0)), sprintf("%sm - %sm", number_format(arg2.get_min_length()), number_format(arg2.get_max_length()))];
    if (is_struct(arg2.spot))
    {
        array_push(desc_array, __s("Assigned to spot %s", concatstr("#", arg2.spot.data.index)));
    }
    var desc_text = implode(" | ", desc_array);
    if (arg2.type.is_special)
    {
        desc_text += ("\n" + arg2.upgrade_attributes_text);
    }
    arg1 += draw_description(arg0, arg1, desc_text, gui_col_x(8));
    arg1 += gui_col_y(0.5);
    if (gui_button_tl(arg0, arg1, __("Upgrade"), arg2.can_upgrade(), gui_col_x(3), undefined, 
    {
        result_mini: arg2.get_upgrade_cost(),
        text_right: __s("Increases fish length")
    }))
    {
        arg2.upgrade();
    }
    arg1 += gui_col_y(3);
    if (gui_button_tl(arg0, arg1, __("Refine"), arg2.can_refine(), gui_col_x(3), undefined, 
    {
        result_mini: arg2.get_refine_cost(),
        text_right: __s("Improves quality by %s", number_format_percent(arg2.refine_value))
    }))
    {
        arg2.refine();
    }
    arg1 += gui_col_y(3);
    if (is_struct(arg2.rarity.next_rarity))
    {
        if (gui_button_tl(arg0, arg1, __("Ascend"), arg2.can_ascend(), gui_col_x(3), undefined, 
        {
            result_mini: arg2.get_ascend_cost(),
            text_right: __s("Ascends this rod to the next rarity.")
        }))
        {
            arg2.ascend();
        }
    }
    else if (arg2.rarity == global.fishing_rods_rarity.legendary)
    {
        if (gui_button_tl(arg0, arg1, __("Transcend"), arg2.can_transcend(), gui_col_x(3), undefined, 
        {
            result_mini: arg2.get_transcend_cost(),
            text_right: __s("Transcends this rod to a higher tier.") + "\n" + __s("Requires a fully upgraded rod.")
        }))
        {
            arg2.transcend();
        }
    }
    arg1 += gui_col_y(3);
    if (global.is_mobile)
    {
        arg1 += gui_col_y(2);
    }
    if (gui_button_tl(arg0, arg1, __("Change type"), arg2.can_change_type(), gui_col_x(3), undefined, 
    {
        result_mini: arg2.get_change_type_cost(),
        text_right: __s("Changes the rod type.")
    }))
    {
        arg2.change_random_type();
    }
    arg1 += gui_col_y(2);
    if (global.debug)
    {
        var dx = arg0 + gui_col_x(7);
        var dy = gui_y_start_items;
        var i = 0;
        if (gui_button_tl(dx, dy + gui_col_y(++i * 1.1), "max tier"))
        {
            arg2.data.tier = arg2.max_tier;
        }
    }
    return arg1 - y_start;
}

enum UnknownEnum
{
    Value_1 = 1
}
