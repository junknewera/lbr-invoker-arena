function gui_item_cards(arg0, arg1, arg2)
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
    var y_height = global.gui_items_default_height;
    if (is_current_dialog_section(global.dialog_sections.cards.packs))
    {
        global.selected_card = undefined;
        var pack_width = gui_col_x(6);
        var pack_height = gui_col_y(12);
        var __array = global.cards_packs_array;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            var pack_x = arg0 + gui_col_x(1) + ((pack_width + gui_col_x(1)) * __i);
            var pack_y = arg1;
            draw_sprite_stretched(mitem.sprite, 0, pack_x, pack_y, pack_width, pack_height);
            set_default_font(f_gui_small, 1, 0);
            draw_text(pack_x + (pack_width / 2), pack_y + (pack_height * 0.18), mitem.name);
            var cards_guarantee_text = [__s("Cards: %s", mitem.cards_count), "", sprintf("- %s - ", __("Guaranteed"))];
            var __array2 = global.cards_types_rarity;
            var __prop_len2 = array_length(__array2);
            for (var __i2 = 0; __i2 < __prop_len2; __i2++)
            {
                var mitem2 = __array2[__i2];
                if (is_undefined(variable_struct_get(mitem.cards_guarantee, mitem2.key)))
                {
                    continue;
                }
                var text = sprintf("%s: %sx", mitem2.name, variable_struct_get(mitem.cards_guarantee, mitem2.key));
                array_push(cards_guarantee_text, text);
            }
            draw_set_valign(fa_middle);
            draw_text(pack_x + (pack_width / 2), pack_y + (pack_height * 0.5), implode("\n", cards_guarantee_text));
            draw_set_valign(fa_top);
            draw_text(pack_x + (pack_width / 2), pack_y + (pack_height * 0.78), sprintf("%sx", number_format(mitem.data.count)));
            var pack_open_count = clamp(get_key_modifier(undefined, get_option(global.options.cards_packs_open_multiplier)), 1, max(1, mitem.data.count));
            if (gui_button(pack_x + (pack_width / 2), pack_y + pack_height + gui_col_y(0.5), __s("Open %s", number_format(pack_open_count)), mitem.can_open(), gui_col_x(2.5)))
            {
                global.selected_card_pack = mitem;
                global.selected_card_pack_open_count = pack_open_count;
                if (get_defeated_enemies_count_unique() < global.game_settings.cards_pack_min_unique_enemies)
                {
                    text_dialog(__s("You have to defeat at least %s unique enemies before opening a Card pack.", global.game_settings.cards_pack_min_unique_enemies), undefined, 
                    {
                        parent_nav: o_shop.current_nav_key
                    });
                    exit;
                }
                if (mitem.get_available_cards_pack_count() < mitem.cards_count)
                {
                    confirm_dialog(__s("You will receive less cards than the number of cards in the pack. However, you will get some %s as compensation though. Do you still want to open this card pack?", global.resources.card_parts.name_plural), function()
                    {
                        global.selected_card_pack.open(global.selected_card_pack_open_count);
                    }, undefined, undefined, 
                    {
                        parent_nav: o_shop.current_nav_key
                    });
                }
                else
                {
                    mitem.open(pack_open_count);
                    check_cards();
                }
            }
            var buy_pack_count = max(1, get_key_modifier(undefined, get_option(global.options.cards_packs_buy_multiplier)));
            var buy_pack_cost_parts = multiply_struct_values(mitem.cost_parts, buy_pack_count);
            var buy_pack_cost = multiply_struct_values(mitem.cost, buy_pack_count);
            var buy_packs_text = iif(buy_pack_count > 1, __s("Buy %s", number_format(buy_pack_count)), __s("Buy"));
            if (gui_button((pack_x + (pack_width / 3)) - gui_col_x(0.5), pack_y + pack_height + gui_col_y(3.5), buy_packs_text, mitem.can_buy(buy_pack_cost_parts, false, buy_pack_count), gui_col_x(2.5), undefined, 
            {
                resources_mini: buy_pack_cost_parts
            }))
            {
                mitem.buy(buy_pack_cost_parts, false, buy_pack_count);
            }
            if (gui_button(pack_x + ((pack_width / 3) * 2) + gui_col_x(0.5), pack_y + pack_height + gui_col_y(3.5), buy_packs_text, mitem.can_buy(buy_pack_cost, true, buy_pack_count), gui_col_x(2.5), undefined, 
            {
                resources_mini: buy_pack_cost
            }))
            {
                mitem.buy(buy_pack_cost, true, buy_pack_count);
            }
        }
        if (gui_button(gui_col_x(26), arg1 + gui_col_y(3), __("Odds"), undefined, gui_col_x(2)))
        {
            var text = [__("Card packs drop rates"), ""];
            __array = global.cards_packs_array;
            __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                array_push(text, mitem.name);
                array_push(text, "----------");
                var __array2 = mitem.cards_rarity;
                var __prop_len2 = array_length(__array2);
                for (var __i2 = 0; __i2 < __prop_len2; __i2++)
                {
                    var mitem2 = __array2[__i2];
                    array_push(text, sprintf("%s: %s%", mitem2.type.name, mitem2.chance));
                }
                array_push(text, "");
                array_push(text, "");
            }
            array_push(text, __("Enemy card drop rates"));
            array_push(text, "");
            array_push(text, __s("Regular: %s", number_format_percent(get_cards_drop_chance())));
            array_push(text, __s("Boss: %s", number_format_percent(get_boss_cards_drop_chance())));
            array_push(text, "");
            __array = global.cards_types_array;
            __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                array_push(text, sprintf("%s: %s%", mitem.name, mitem.spawn_chance));
            }
            text_dialog(implode("\n", text), 
            {
                title: __("Card Odds")
            }, 
            {
                parent_nav: "cards"
            });
        }
        var can_open_all = get_struct_sum(global.cards_packs) > 0;
        if (gui_button_tl(gui_col_x(25), arg1 + gui_col_y(5.5), __("Open all"), can_open_all, gui_col_x(2)))
        {
            confirm_dialog(__("Do you want to open all card packs? Note: Opening many card packs at once might lead to inaccuracies. Only the last pack type will be shown."), open_all_card_packs, undefined, undefined, 
            {
                parent_nav: "cards"
            });
        }
        global.options.cards_packs_open_multiplier.draw(gui_col_x(25), arg1 + gui_col_y(9), undefined, 
        {
            name_position: "top"
        });
        global.options.cards_packs_buy_multiplier.draw(gui_col_x(25), arg1 + gui_col_y(11.5), undefined, 
        {
            name_position: "top"
        });
    }
    else if (is_current_dialog_section(global.dialog_sections.cards.transcend))
    {
        var transcension_resources_regular = get_cards_transcension_resources(global.transcension_types.regular.cards);
        var transcension_resources_boss = get_cards_transcension_resources(global.transcension_types.boss.cards);
        var text = __s("Transcend cards to get %s. Transcension decreases the required number of all relevant cards. Regular Transcension only requires cards from regular enemies whereas Boss Transcension requires cards from bosses only.", global.resources.transcension_card_parts.name_plural, 10);
        draw_description(arg0, arg1, text);
        if (gui_button_tl(arg0, arg1 + gui_col_y(1.5), __s("Transcend all %s", __("Regular Cards")), can_transcend_cards(global.transcension_types.regular.cards), gui_col_x(5), undefined, 
        {
            resources_mini: transcension_resources_regular
        }))
        {
            confirm_dialog(__s("Do you want to perform %s Cards Transcension? All %s cards will be transcended as many times as you can afford it.", __("Regular"), __("Regular")), function()
            {
                transcend_cards(global.transcension_types.regular.cards);
            }, undefined, undefined, 
            {
                parent_nav: "cards"
            });
        }
        if (gui_button_tl(arg0 + gui_col_x(8), arg1 + gui_col_y(1.5), __s("Transcend all %s", __("Boss Cards")), can_transcend_cards(global.transcension_types.boss.cards), gui_col_x(5), undefined, 
        {
            resources_mini: transcension_resources_boss
        }))
        {
            confirm_dialog(__s("Do you want to perform %s Cards Transcension? All %s cards will be reset to %s.", __("Boss"), __("Boss"), 0), function()
            {
                transcend_cards(global.transcension_types.boss.cards);
            }, undefined, undefined, 
            {
                parent_nav: "cards"
            });
        }
        var shop_items_y = arg1 + gui_col_y(4.5);
        y_height += gui_draw_shop_items(arg0, shop_items_y, variable_struct_get(o_shop.shop_items, UnknownEnum.Value_39), false);
        return y_height;
    }
    else if (is_current_dialog_section(global.dialog_sections.cards.options))
    {
        global.options.enable_salvage_cards.draw(arg0 + gui_col_x(0.5), arg1 + gui_col_y(1), undefined, undefined, 5);
        arg1 += gui_col_y(3);
        global.options.cards_auto_ascend.draw(arg0 + gui_col_x(0.5), arg1 + gui_col_y(1), undefined, undefined, 5, has_bought_shop_item_safe(global.shops.coal.unlock_cards_auto_ascend));
        global.options.cards_auto_ascend_type.draw(arg0 + gui_col_x(5.5), arg1 + gui_col_y(0.4), undefined, undefined, undefined, has_bought_shop_item_safe(global.shops.coal.unlock_cards_auto_transcend));
        arg1 += gui_col_y(3);
        global.options.cards_auto_transcend.draw(arg0 + gui_col_x(0.5), arg1 + gui_col_y(1), undefined, undefined, 5, has_bought_shop_item_safe(global.shops.coal.unlock_cards_auto_transcend));
        global.options.cards_auto_transcend_type.draw(arg0 + gui_col_x(5.5), arg1 + gui_col_y(0.4), undefined, undefined, undefined, has_bought_shop_item_safe(global.shops.coal.unlock_cards_auto_transcend));
    }
    else
    {
        var dialog_section = get_current_dialog_section();
        var cards_max_count = get_cards_max_count(dialog_section.key);
        var section_card_type = get_default_struct_value(global.cards_types, dialog_section.key, undefined);
        var section_type_name = "";
        if (is_undefined(section_card_type))
        {
            section_type_name = __("base");
        }
        else
        {
            section_type_name = section_card_type.name;
        }
        var text = [__s("Max cards (%s): %s", section_type_name, cards_max_count)];
        if (!is_undefined(section_card_type))
        {
            var type_transcension_count = get_default_struct_value(o_game.data.stats.cards_transcensions, section_card_type.key, 0);
            if (type_transcension_count > 0)
            {
                type_transcension_count = type_transcension_count % global.game_settings.cards_transcension_increase_max_count;
            }
            array_push(text, __s("Transcensions until count increase: %s/%s", type_transcension_count, global.game_settings.cards_transcension_increase_max_count));
        }
        draw_description(arg0, gui_y_start + gui_col_y(2), implode(" | ", text));
        gui_item_collectable_list(arg0, arg1, 
        {
            add_draw_list: function(arg0, arg1, arg2)
            {
                if (arg2.data.lockedaa)
                {
                    draw_sprite_ext(spr_icon_lock, 0, arg0 + gui_col_x(0.05), arg1 - gui_col_y(0.6), 2, 2, 0, c_white, 1);
                }
            },
            
            btn_bg_color: function(arg0)
            {
                return arg0.can_transcend(true) ? global.colors.transcend : 16777215;
            },
            
            button_func: function(arg0)
            {
                global.selected_card = arg0;
            },
            
            button_func_alt: function(arg0)
            {
                arg0.data.locked = !arg0.data.locked;
            },
            
            items: global.cards,
            items_array: global.cards_array,
            sections_key: "cards",
            display_count: true,
            columns: global.is_mobile ? 10 : 13,
            
            selected_key: function()
            {
                return get_default_struct_value(global.selected_card, "key", "");
            },
            
            width: gui_col_x(14)
        });
        var height = gui_item_dynamic(arg0, arg1, 
        {
            func: function(arg0, arg1)
            {
                return draw_card(gui_col_x(19.5), arg1, global.selected_card, undefined, gui_col_y(12), true);
            }
        });
        if (global.is_mobile)
        {
            height += global.ui_gaps.md;
        }
        return height;
    }
}

function gui_item_cards_add_draw()
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
    if (!is_current_dialog_section(global.dialog_sections.cards.packs) && !is_current_dialog_section(global.dialog_sections.cards.transcend) && !is_current_dialog_section(global.dialog_sections.cards.options))
    {
        var current_dialog_section = get_current_dialog_section();
        var can_transcend = get_option(global.options.enable_salvage_cards);
        if (gui_button_tl(add_button_base_x + gui_col_x(0), add_button_base_y, __s("Transcend %s (%s)", __("regular"), current_dialog_section.name), can_transcend, gui_col_x(4)))
        {
            global.transcend_cards_type_tmp = variable_struct_get(global.cards_array_sorted_by_type, current_dialog_section.type_key);
            global.transcend_cards_type_tmp = _filter(global.transcend_cards_type_tmp, function(arg0)
            {
                return !arg0.enemy.is_main_boss();
            });
            confirm_dialog(__s("Do you want to perform Cards Transcension? All %s %s cards will be reset to %s.", current_dialog_section.name, __("Regular"), 0), function()
            {
                transcend_cards(global.transcend_cards_type_tmp);
            }, undefined, undefined, 
            {
                parent_nav: "cards"
            });
        }
        if (gui_button_tl(add_button_base_x + gui_col_x(6), add_button_base_y, __s("Transcend %s (%s)", __("boss"), current_dialog_section.name), can_transcend, gui_col_x(4)))
        {
            global.transcend_cards_type_tmp = variable_struct_get(global.cards_array_sorted_by_type, current_dialog_section.type_key);
            global.transcend_cards_type_tmp = _filter(global.transcend_cards_type_tmp, function(arg0)
            {
                return arg0.enemy.is_main_boss();
            });
            confirm_dialog(__s("Do you want to perform Cards Transcension? All %s %s cards will be reset to %s.", current_dialog_section.name, __("Boss"), 0), function()
            {
                transcend_cards(global.transcend_cards_type_tmp);
            }, undefined, undefined, 
            {
                parent_nav: "cards"
            });
        }
    }
    if (is_current_dialog_section(global.dialog_sections.cards.packs))
    {
        var cards_total = array_length(global.cards_array);
        var cards_collected = 0;
        var __struct = global.cards;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            if (mitem.data.count >= 1)
            {
                cards_collected++;
            }
        }
        var cards_collected_pct = cards_collected / cards_total;
        var daily_data = get_daily_data_today();
        var packs_left_today = global.game_settings.cards_packs_gem_purchases_per_day;
        if (!is_undefined(struct_get_from_hash(daily_data.data, variable_get_hash("cards_packs_bought"))))
        {
            packs_left_today = global.game_settings.cards_packs_gem_purchases_per_day - daily_data.data.cards_packs_bought;
        }
        var text = [sprintf("%s: %s/%s (%s)", __("Collected"), cards_collected, cards_total, number_format_percent(cards_collected_pct)), __s("Gem Card Packs left today: %s/%s", packs_left_today, global.game_settings.cards_packs_gem_purchases_per_day)];
        draw_description(add_text_base_x + gui_col_x(0), add_text_base_y + gui_col_y(0.25), implode("\n", text), gui_col_x(10), 0, 1);
    }
    draw_resources_current_amount_lite_array(add_text_base_x + gui_col_x(20), add_text_base_y, [global.resources.card_parts, global.resources.transcension_card_parts], false, undefined, undefined, 2.5);
}

enum UnknownEnum
{
    Value_39 = 39
}
