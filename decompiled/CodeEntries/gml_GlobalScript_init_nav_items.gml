function init_nav_items()
{
    with (o_shop)
    {
        hotkeys = [];
        nav_items = {};
        nav_items_array = [];
        nav_items_array_cp = [];
        nav_items_tl = [
        {
            key: "options",
            name: __("Options"),
            sprite: spr_icon_cog,
            
            check: function()
            {
                return true;
            },
            
            check_badge: function()
            {
                return false;
            },
            
            exclude_cp: true,
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_25), variable_struct_get(o_shop.titles, UnknownEnum.Value_25), 8, 
                {
                    dialog_id: "options",
                    sections_key: "options",
                    tab: UnknownEnum.Value_25,
                    can_toggle: true,
                    
                    add_draw: function()
                    {
                        var version_text = "";
                        if (global.is_pc)
                        {
                            version_text = sprintf("Steam %s", steam_initialised() ? __("online") : __("offline"));
                        }
                        else if (global.is_android)
                        {
                            version_text = sprintf("Google Play %s", GooglePlayServices_IsSignedIn() ? __("online") : __("offline"));
                            var time_diff = 0;
                            var time_diff_text = "-";
                            if (global.last_save_upload_google > 0)
                            {
                                time_diff = o_game.data.stats.time_elapsed - global.last_save_upload_google;
                            }
                            if (time_diff > 0)
                            {
                                time_diff_text = format_time(secr(time_diff), false, true);
                            }
                            version_text += (" | " + __s("Last cloud save: %s", time_diff_text));
                        }
                        version_text += sprintf(" | v%s", global.game_version);
                        if (global.cloud_data.is_season)
                        {
                            var cloud_upload_text = "-";
                            if (is_struct(global.cloud_data.last_season_upload))
                            {
                                var cloud_time_diff = date_second_span(get_date_from_object(global.cloud_data.last_season_upload), date_current_datetime());
                                cloud_upload_text = sprintf(__("%s ago"), format_time(cloud_time_diff));
                            }
                            var cloud_add_text = sprintf(__("Last cloud save: %s"), cloud_upload_text);
                            version_text = cloud_add_text + " | " + version_text;
                        }
                        draw_description((add_text_base_x + global.gui_settings.content_width) - 24, add_text_base_y, version_text, undefined, 2);
                    }
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "guide",
            name: __("Guide"),
            sprite: spr_icon_guide,
            check: __return_true,
            check_badge: __return_false,
            tags: ["other"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_16), variable_struct_get(o_shop.titles, UnknownEnum.Value_16), 48, 
                {
                    dialog_id: "guide",
                    tab: UnknownEnum.Value_16,
                    can_toggle: true
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "supporter_shop",
            name: __("Supporter Shop"),
            sprite: spr_icon_star2,
            
            check: function()
            {
                if (in_challenge())
                {
                    return false;
                }
                return true;
            },
            
            check_badge: function()
            {
                var __struct = global.shops.dlc;
                var __prop_names = struct_get_names(__struct);
                var __prop_len = array_length(__prop_names);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mkey = __prop_names[__i];
                    var mitem = variable_struct_get(__struct, mkey);
                    if ((get_value_ext(mitem, mitem.is_free) || mitem.data.count == 1) && !is_dlc_claimed(mkey))
                    {
                        return true;
                    }
                }
                return false;
            },
            
            exclude_cp: true,
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_45), variable_struct_get(o_shop.titles, UnknownEnum.Value_45), global.gui_items_count_shop, 
                {
                    dialog_id: "shop_dlc",
                    tab: UnknownEnum.Value_45,
                    can_toggle: true,
                    add_draw: gui_item_shop_item_dlc_add_draw
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "shop_gems",
            name: __("Gems Shop"),
            sprite: spr_resource_gem,
            
            check: function()
            {
                if (!global.game_settings.gem_upgrades_enabled)
                {
                    return false;
                }
                if (in_challenge())
                {
                    return true;
                }
                return is_gt(global.resources.coins.data.collected, 0) || global.resources.gems.data.unlocked || global.is_mobile;
            },
            
            check_badge: function()
            {
                return false;
            },
            
            is_shop: true,
            shop: global.shops.gems,
            tags: ["shop"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_61), variable_struct_get(o_shop.titles, UnknownEnum.Value_61), global.gui_items_count_shop, 
                {
                    dialog_id: "shop_gems",
                    is_shop: true,
                    shop_resource_key: global.resources.gems.key,
                    tab: UnknownEnum.Value_61,
                    can_toggle: true,
                    sections_key: "shop_gems",
                    
                    add_draw: function()
                    {
                        if (is_current_dialog_section(global.dialog_sections.shop_gems.supporter))
                        {
                            if (gui_button_tl(add_button_base_x, add_button_base_y, __("Refresh"), true))
                            {
                                refresh_dlc_shop();
                            }
                        }
                    }
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "season_pass",
            name: __("Season Pass"),
            sprite: spr_resource_nature_gem,
            
            check: function()
            {
                return is_unlocked_areas() && is_event_active(global.events.nature_season);
            },
            
            check_badge: function()
            {
                return false;
            },
            
            is_shop: true,
            shop: global.shops.gems,
            tags: ["other"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_29), variable_struct_get(o_shop.titles, UnknownEnum.Value_29), global.gui_items_count_shop, 
                {
                    dialog_id: "season_pass",
                    tab: UnknownEnum.Value_29,
                    can_toggle: true,
                    sections_key: "season_pass",
                    
                    add_draw: function()
                    {
                    }
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "unique_leaves",
            name: __("Unique Leaves"),
            sprite: spr_leaf_unique_fire,
            
            check: function()
            {
                return is_unlocked_unique_leaves();
            },
            
            check_badge: function()
            {
                return false;
            },
            
            tags: ["other"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_92), variable_struct_get(o_shop.titles, UnknownEnum.Value_92), 5, 
                {
                    dialog_id: "unique_leaves",
                    tab: UnknownEnum.Value_92,
                    can_toggle: true,
                    show_quantity_selection: true,
                    add_draw: gui_item_unique_leaves_add_draw
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "pets",
            name: __("Pets"),
            sprite: spr_pet_dog,
            
            check: function()
            {
                return is_unlocked_pets();
            },
            
            check_badge: function()
            {
                return false;
            },
            
            tags: ["other"],
            
            func: function()
            {
                actions_dialog_simple(gui_item_pets, variable_struct_get(o_shop.titles, UnknownEnum.Value_73), 
                {
                    dialog_id: "shop_pets",
                    is_shop: true,
                    tab: UnknownEnum.Value_37,
                    can_toggle: true,
                    sections_key: "pets",
                    show_quantity_selection: true,
                    add_draw: gui_item_pets_add_draw
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "artifacts",
            name: __("Artifacts"),
            sprite: spr_artifact_orb,
            
            check: function()
            {
                return is_unlocked_artifacts();
            },
            
            check_badge: function()
            {
                return _any(global.artifacts, function(arg0)
                {
                    return !arg0.is_obfuscated() && !arg0.data.shown;
                }, false);
            },
            
            tags: ["other"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_32), variable_struct_get(o_shop.titles, UnknownEnum.Value_32), 5, 
                {
                    dialog_id: "shop_artifacts",
                    sections_key: "artifacts",
                    tab: UnknownEnum.Value_32,
                    can_toggle: true,
                    show_quantity_selection: true,
                    add_draw: gui_item_add_draw_artifacts
                });
                _map(global.artifacts, function(arg0)
                {
                    if (is_gt(arg0.data.collected, 0))
                    {
                        arg0.data.shown = true;
                    }
                }, false);
            },
            
            hotkey: -1
        }, 
        {
            key: "cards",
            name: __("Cards"),
            sprite: spr_card_default,
            
            check: function()
            {
                return is_unlocked_cards() && (o_game.data.stats.prestige_mlc > 0 || get_default_struct_value(struct_get_from_hash(global.game_settings, variable_get_hash("unlocked")), "cards", false));
            },
            
            check_badge: __return_false,
            tags: ["other"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_7), variable_struct_get(o_shop.titles, UnknownEnum.Value_7), 5, 
                {
                    dialog_id: "cards",
                    tab: UnknownEnum.Value_7,
                    can_toggle: true,
                    show_quantity_selection: true,
                    sections_key: "cards",
                    use_last_scroll_position: false,
                    add_draw: gui_item_cards_add_draw
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "items",
            name: __("Equipment"),
            sprite: spr_equip_shield,
            
            check: function()
            {
                return is_unlocked_equipment();
            },
            
            check_badge: function()
            {
                return false;
            },
            
            tags: ["other"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_15), variable_struct_get(o_shop.titles, UnknownEnum.Value_15), 5, 
                {
                    dialog_id: "equipment",
                    tab: UnknownEnum.Value_15,
                    can_toggle: true,
                    show_quantity_selection: true,
                    add_draw: gui_item_equipment_add_draw
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "materials",
            name: __("Materials"),
            sprite: spr_material_copper_bar,
            
            check: function()
            {
                return is_unlocked_materials();
            },
            
            check_badge: function()
            {
                return false;
            },
            
            tags: ["other"],
            
            func: function()
            {
                actions_dialog_simple(gui_item_materials, variable_struct_get(o_shop.titles, UnknownEnum.Value_20), 
                {
                    dialog_id: "materials",
                    tab: UnknownEnum.Value_20,
                    can_toggle: true,
                    add_draw: gui_item_materials_add_draw
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "relics",
            name: __("Leaf Relics"),
            sprite: spr_relic_uncommon,
            
            check: function()
            {
                return is_unlocked_relics();
            },
            
            check_badge: __return_false,
            tags: ["other"],
            
            func: function()
            {
                var actions = [new Gui_Item(UnknownEnum.Value_18, id, 
                {
                    func: gui_item_relics
                })];
                actions_dialog(actions, variable_struct_get(o_shop.titles, UnknownEnum.Value_27), undefined, 
                {
                    dialog_id: "relics",
                    tab: UnknownEnum.Value_27,
                    sections_key: "relics",
                    add_draw: gui_item_relics_add_draw
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "scrolls",
            name: __("Scrolls"),
            sprite: spr_scroll_damage,
            
            check: function()
            {
                return is_unlocked_scrolls();
            },
            
            check_badge: function()
            {
                return false;
            },
            
            tags: ["other"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_28), variable_struct_get(o_shop.titles, UnknownEnum.Value_28), 5, 
                {
                    dialog_id: "scrolls",
                    tab: UnknownEnum.Value_28,
                    can_toggle: true,
                    
                    add_draw: function()
                    {
                        set_default_font(f_gui_small);
                        draw_text(add_text_base_x, add_text_base_y, __s("Active: %s/%s", global.active_scroll_count, get_max_active_scroll_count()));
                    }
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "chests",
            name: __("Chests"),
            sprite: spr_chest_rare,
            
            check: function()
            {
                return is_unlocked_chests();
            },
            
            check_badge: function()
            {
                return false;
            },
            
            tags: ["other"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_9), variable_struct_get(o_shop.titles, UnknownEnum.Value_9), 4, 
                {
                    dialog_id: "chests",
                    tab: UnknownEnum.Value_9,
                    can_toggle: true,
                    show_quantity_selection: true,
                    sections_key: "chests",
                    add_draw: gui_item_chests_add_draw
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "death_book",
            name: __("Death Book"),
            sprite: spr_borbventure_item_death_book,
            
            check: function()
            {
                return is_unlocked_death_book();
            },
            
            check_badge: __return_false,
            tags: ["other"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_13), variable_struct_get(o_shop.titles, UnknownEnum.Value_13), 48, 
                {
                    dialog_id: "death_book",
                    tab: UnknownEnum.Value_13,
                    can_toggle: true
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "skins",
            name: __("Skins"),
            sprite: spr_player_rainbow,
            
            check: function()
            {
                if (in_challenge())
                {
                    return false;
                }
                if (is_undefined(struct_get_from_hash(global.profiles.def.objects, variable_get_hash("o_game"))))
                {
                    return false;
                }
                return global.profiles.def.objects.o_game.data.stats.prestige > 0 || get_upgrade_count(global.shops.dlc.skins_pack) > 0 || o_game.data.stats.time_elapsed > sec(600);
            },
            
            check_badge: function()
            {
                return false;
            },
            
            tags: ["other"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_84), variable_struct_get(o_shop.titles, UnknownEnum.Value_84), global.gui_items_count_shop, 
                {
                    dialog_id: "shop_skins",
                    tab: UnknownEnum.Value_84,
                    sections_key: "shop_skins",
                    can_toggle: true
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "achievements",
            name: __("Achievements"),
            sprite: spr_icon_achievement,
            
            check: function()
            {
                if (in_challenge())
                {
                    return false;
                }
                var collected_total = get_profile_resource(global.profile_types.def, global.resources.leaves, "collected_total");
                return is_gt(collected_total, 1000);
            },
            
            check_badge: function()
            {
                return _any(global.achievements_sorted, function(arg0, arg1)
                {
                    return arg0.data.claimed < arg0.levels_count && arg0.check();
                }, false);
            },
            
            tags: ["other"],
            
            func: function()
            {
                var actions = [new Gui_Item(UnknownEnum.Value_18, id, 
                {
                    func: gui_item_achievements
                })];
                actions_dialog(actions, variable_struct_get(o_shop.titles, UnknownEnum.Value_1), undefined, 
                {
                    dialog_id: "achievements",
                    tab: UnknownEnum.Value_1,
                    can_toggle: true,
                    sections_key: "achievements",
                    add_draw: gui_item_achievements_add_draw
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "milestones",
            name: __("Milestones"),
            sprite: spr_icon_milestone,
            
            check: function()
            {
                return global.areas.tower.data.highest_floor_stats > 1 && !in_challenge();
            },
            
            check_badge: function()
            {
                var ret = false;
                var __array = global.milestones_array;
                var __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    if (!mitem.data.shown && !mitem._is_obfuscated())
                    {
                        return true;
                    }
                }
                return false;
            },
            
            tags: ["other"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_21), variable_struct_get(o_shop.titles, UnknownEnum.Value_21), 5, 
                {
                    dialog_id: "milestones",
                    tab: UnknownEnum.Value_21,
                    can_toggle: true,
                    sections_key: "milestones",
                    
                    add_draw: function()
                    {
                        if (gui_button_tl(add_button_base_x + gui_col_x(18), add_button_base_y, __("Claim all"), true))
                        {
                            var __struct = global.milestones;
                            var __prop_names = struct_get_names(__struct);
                            var __prop_len = array_length(__prop_names);
                            for (var __i = 0; __i < __prop_len; __i++)
                            {
                                var mkey = __prop_names[__i];
                                var mitem = variable_struct_get(__struct, mkey);
                                var __struct2 = mitem.milestones;
                                var __prop_names2 = struct_get_names(__struct2);
                                var __prop_len2 = array_length(__prop_names2);
                                for (var __i2 = 0; __i2 < __prop_len2; __i2++)
                                {
                                    var mkey2 = __prop_names2[__i2];
                                    var mitem2 = variable_struct_get(__struct2, mkey2);
                                    if (!get_value_ext(mitem2, mitem2.can_claim))
                                    {
                                        continue;
                                    }
                                    call_method(mitem2, mitem2.claim);
                                }
                            }
                        }
                    }
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "stats",
            name: __("Stats"),
            sprite: spr_icon_stats,
            
            check: function()
            {
                var collected_total = get_profile_resource(global.profile_types.def, global.resources.coins, "collected_total");
                return is_gt(collected_total, 0);
            },
            
            check_badge: function()
            {
                return false;
            },
            
            tags: ["other"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_90), variable_struct_get(o_shop.titles, UnknownEnum.Value_90), 12, 
                {
                    dialog_id: "stats",
                    tab: UnknownEnum.Value_90,
                    can_toggle: true,
                    sections_key: "stats"
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "lore",
            name: __("Lore"),
            sprite: spr_icon_book,
            
            check: function()
            {
                var collected_total = get_profile_resource(global.profile_types.def, global.resources.leaves, "collected_total");
                return is_gt(collected_total, 300);
            },
            
            check_badge: function()
            {
                return _any(global.lore, function(arg0)
                {
                    return !arg0.is_obfuscated() && !arg0.data.shown;
                }, false);
            },
            
            tags: ["other"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_19), variable_struct_get(o_shop.titles, UnknownEnum.Value_19), 10, 
                {
                    dialog_id: "lore",
                    tab: UnknownEnum.Value_19,
                    can_toggle: true
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "daily_rewards",
            name: __("Daily rewards"),
            sprite: spr_icon_calendar,
            
            check: function()
            {
                if (!global.game_settings.daily_rewards_enabled)
                {
                    return false;
                }
                if (global.cloud_data.is_season)
                {
                    return global.cloud_data.daily_reward_available;
                }
                return !in_challenge() && (has_any_dlc_pack() || is_gt(global.resources.coins.data.collected_total, 0));
            },
            
            check_badge: function()
            {
                return !daily_reward_claimed() || can_claim_any_daily_quest();
            },
            
            tags: ["other"],
            
            func: function()
            {
                actions_dialog_simple(gui_item_daily_reward, 
                {
                    title: __("Daily Reward")
                }, 
                {
                    add_draw: gui_item_daily_reward_add_draw,
                    dialog_id: "daily_rewards",
                    
                    on_open: function()
                    {
                        init_game_vars(true);
                    },
                    
                    sections_key: "daily_rewards"
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "challenges",
            name: __("Challenges"),
            sprite: spr_icon_challenge,
            
            check: function()
            {
                return is_unlocked_challenges();
            },
            
            check_badge: function()
            {
                return false;
            },
            
            tags: ["other"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_8), variable_struct_get(o_shop.titles, UnknownEnum.Value_8), 4, 
                {
                    dialog_id: "challenges",
                    tab: UnknownEnum.Value_8,
                    can_toggle: true,
                    sections_key: "challenges",
                    
                    add_draw: function()
                    {
                        if (gui_button_tl(add_button_base_x, add_button_base_y, __("Clear seed"), true, gui_col_x(2)))
                        {
                            global.globalstats.challenge_seed = "";
                        }
                        if (gui_button_tl(add_button_base_x + gui_col_x(3), add_button_base_y, __("Random seed"), true, gui_col_x(2.5)))
                        {
                            global.globalstats.challenge_seed = irandom_range(100000, 999999);
                        }
                        if (gui_button_tl(add_button_base_x + gui_col_x(7), add_button_base_y, __("Set seed"), true, gui_col_x(2)))
                        {
                            input_dialog("", function(arg0)
                            {
                                arg0 = string_trim(arg0);
                                arg0 = string_digits(arg0);
                                if (is_empty(arg0))
                                {
                                    exit;
                                }
                                global.globalstats.challenge_seed = string_copy(arg0, 0, 16);
                            }, __("Enter Seed (numbers only)"), 
                            {
                                parent_nav: "challenges"
                            }, 
                            {
                                digits_only: true,
                                max_length: 16,
                                input: global.globalstats.challenge_seed
                            });
                        }
                        var seed_text = iif(is_empty(global.globalstats.challenge_seed), "-", global.globalstats.challenge_seed);
                        draw_text(add_button_base_x + gui_col_x(12), add_button_base_y + gui_col_y(0.5), sprintf("%s: %s", __("Challenge seed"), string(seed_text)));
                        var total_time = 0;
                        var total_time_frames = 0;
                        var challenges_completed = 0;
                        var challenges_count = 0;
                        var __struct = global.challenges;
                        var __prop_names = struct_get_names(__struct);
                        var __prop_len = array_length(__prop_names);
                        for (var __i = 0; __i < __prop_len; __i++)
                        {
                            var mkey = __prop_names[__i];
                            var mitem = variable_struct_get(__struct, mkey);
                            challenges_count++;
                            if (mitem.data.finished > 0)
                            {
                                total_time += mitem.data.fastest_finish_time;
                                total_time_frames += mitem.data.fastest_finish_time_frames;
                                challenges_completed++;
                            }
                        }
                        draw_text(add_button_base_x + gui_col_x(18), add_button_base_y + gui_col_y(0.5), sprintf("%s: %s/%s, %s: %s", __("Completed"), challenges_completed, challenges_count, __("Sum"), format_time(total_time, false, true)));
                    }
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "bot_control_panel",
            name: __("Control Panel"),
            sprite: spr_icon_bot,
            
            check: function()
            {
                return get_upgrade_count(global.shops.blc.autobuy_priority) > 0;
            },
            
            check_badge: function()
            {
                return false;
            },
            
            exclude_cp: true,
            tags: ["other"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_6), variable_struct_get(o_shop.titles, UnknownEnum.Value_6), global.gui_items_count_shop, 
                {
                    dialog_id: "bot_control_panel",
                    tab: UnknownEnum.Value_6,
                    can_toggle: true,
                    show_quantity_selection: true,
                    sections_key: "bot_control_panel"
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "house_constructor",
            name: __("House Constructor"),
            sprite: spr_icon_house,
            
            check: function()
            {
                return false;
            },
            
            check_badge: function()
            {
                return false;
            },
            
            exclude_cp: true,
            fixed_nav: false,
            tags: ["other"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_17), variable_struct_get(o_shop.titles, UnknownEnum.Value_17), 48, 
                {
                    dialog_id: "house_items",
                    tab: UnknownEnum.Value_17,
                    can_toggle: true,
                    
                    add_draw: function()
                    {
                        if (gui_button_tl(add_button_base_x, add_button_base_y, __("Remove all items"), true))
                        {
                            confirm_dialog(__("Do you really want to remove all house items?"), function()
                            {
                                var __struct = global.house_items;
                                var __prop_names = struct_get_names(__struct);
                                var __prop_len = array_length(__prop_names);
                                for (var __i = 0; __i < __prop_len; __i++)
                                {
                                    var mkey = __prop_names[__i];
                                    var mitem = variable_struct_get(__struct, mkey);
                                    mitem.data.build_data = [];
                                }
                                change_area(global.areas.house);
                            });
                        }
                    }
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "community_leaves",
            name: __("Community Leaves"),
            sprite: spr_leaf_comm_happy,
            
            check: function()
            {
                return comm_leaves_available();
            },
            
            check_badge: function()
            {
                return _any(global.community_leaves, function(arg0)
                {
                    return arg0.data.count > 0 && !arg0.data.shown;
                });
            },
            
            tags: ["other"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_10), variable_struct_get(o_shop.titles, UnknownEnum.Value_10), 48, 
                {
                    dialog_id: "community_leaves",
                    tab: UnknownEnum.Value_10,
                    can_toggle: true,
                    
                    add_draw: function()
                    {
                        if (gui_button_tl(add_button_base_x, add_button_base_y, __("Mark all as shown"), undefined, gui_col_x(4)))
                        {
                            var __array = global.community_leaves_array;
                            var __prop_len = array_length(__array);
                            for (var __i = 0; __i < __prop_len; __i++)
                            {
                                var mitem = __array[__i];
                                if (mitem.data.count > 0)
                                {
                                    mitem.data.shown = true;
                                }
                            }
                        }
                    }
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "bingo",
            name: __("Bingo"),
            sprite: spr_icon_bingo,
            
            check: function()
            {
                return in_challenge() && is_struct(global.current_challenge) && global.current_challenge.bingo;
            },
            
            check_badge: function()
            {
                return false;
            },
            
            exclude_cp: true,
            fixed_nav: false,
            is_shop: true,
            tags: ["other"],
            
            func: function()
            {
                var quests = struct_to_sorted_array_key(global.bingo_quests);
                actions_dialog([new Gui_Item(UnknownEnum.Value_39, id, 
                {
                    quests: quests
                })]);
            },
            
            hotkey: -1
        }, 
        {
            key: "account_gateway",
            name: __("Account Gateway"),
            sprite: spr_icon_user,
            
            check: function()
            {
                return !mp_is_logged_in();
            },
            
            check_badge: function()
            {
                return false;
            },
            
            exclude_cp: true,
            fixed_nav: false,
            tags: ["other"],
            
            func: function()
            {
                actions_dialog(global.dialog_actions.login_gateway, 
                {
                    title: __("Account Gateway"),
                    subtitle: __("Sign in or register a free Humble North account to take part in online events, use cloud saves and more!")
                }, 20);
            },
            
            hotkey: -1
        }, 
        {
            key: "account",
            name: __("Account"),
            sprite: spr_icon_user,
            
            check: function()
            {
                return mp_is_logged_in();
            },
            
            check_badge: function()
            {
                return false;
            },
            
            exclude_cp: true,
            fixed_nav: false,
            tags: ["other"],
            func: [open_dialog, "account"],
            hotkey: -1
        }, 
        {
            key: "guilds",
            name: __("Guilds"),
            sprite: spr_resource_honor,
            
            check: function()
            {
                return mp_is_season() && global.game_settings.guilds_enabled;
            },
            
            check_badge: function()
            {
                return false;
            },
            
            exclude_cp: true,
            fixed_nav: false,
            tags: ["other"],
            func: [open_dialog, "guilds"],
            hotkey: -1
        }, 
        {
            key: "news",
            name: __("News"),
            sprite: spr_icon_news,
            check: __return_true,
            
            check_badge: function()
            {
                if (!is_array(global.news))
                {
                    return false;
                }
                var __array = global.news;
                var __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    if (is_undefined(variable_struct_get(o_game.data.news_seen, mitem.id)))
                    {
                        return true;
                    }
                }
                return false;
            },
            
            fixed_nav: false,
            is_shop: false,
            tags: ["other"],
            
            func: function()
            {
                actions_dialog([new Gui_Item(UnknownEnum.Value_33, id)], 
                {
                    title: __("News"),
                    subtitle: __("Stay updated on the latest leaf news.")
                }, undefined, 
                {
                    add_draw: gui_item_news_add_draw
                });
            },
            
            hotkey: -1
        }];
        nav_items_bl = [
        {
            key: "tool_shop",
            name: __("Tool Shop"),
            sprite: spr_weapon_leaf_blower,
            
            check: function()
            {
                return is_unlocked_tools();
            },
            
            check_badge: function()
            {
                return _any(global.shops_sorted.weapons, function(arg0, arg1)
                {
                    if (get_upgrade_count(arg0) == 1)
                    {
                        return false;
                    }
                    return previous_item_bought(global.shops_sorted.weapons, arg0.array_index) && has_enough_resources(get_item_cost(arg0));
                }, false);
            },
            
            is_shop: true,
            shop: global.shops.weapons,
            shop_can_hide: false,
            tags: ["other"],
            
            func: function()
            {
                actions_dialog_simple(gui_item_blowers, 
                {
                    title: __("Tools"),
                    subtitle: ""
                }, 
                {
                    dialog_id: "shop_blowers",
                    is_shop: true,
                    tab: UnknownEnum.Value_37,
                    can_toggle: true,
                    sections_key: "shop_blowers",
                    show_quantity_selection: true,
                    
                    check_dialog_help_button: function()
                    {
                        return get_upgrade_count(global.shops.blc.unlock_materials) > 0;
                    },
                    
                    add_draw: gui_item_blowers_add_draw
                });
            },
            
            unlocked: __return_true,
            hotkey: -1
        }, 
        {
            key: "leaf_shop",
            name: __("Leaf Shop"),
            sprite: spr_leaf,
            
            check: function()
            {
                return is_gt(global.resources.leaves.data.collected_total, 50);
            },
            
            check_badge: function()
            {
                return check_badge_shop(global.shops.environment);
            },
            
            is_shop: true,
            shop: global.shops.environment,
            tags: ["shop"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_48), variable_struct_get(o_shop.titles, UnknownEnum.Value_48), global.gui_items_count_shop, 
                {
                    dialog_id: "shop_environment",
                    is_shop: true,
                    shop_resource_key: global.resources.leaves.key,
                    shop_items_array: global.shops_sorted.environment,
                    tab: UnknownEnum.Value_48,
                    can_toggle: true
                });
            },
            
            category: "leaf",
            hotkey: -1,
            shop_key: "environment"
        }, 
        {
            key: "gold_shop",
            name: __("Gold Shop"),
            sprite: spr_leaf_gold,
            
            check: function()
            {
                return global.resources.gold.data.unlocked;
            },
            
            check_badge: function()
            {
                return check_badge_shop(global.shops.gold);
            },
            
            is_shop: true,
            shop: global.shops.gold,
            tags: ["shop"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_62), variable_struct_get(o_shop.titles, UnknownEnum.Value_62), global.gui_items_count_shop, 
                {
                    dialog_id: "shop_gold",
                    is_shop: true,
                    shop_resource_key: global.resources.gold.key,
                    tab: UnknownEnum.Value_62,
                    can_toggle: true
                });
            },
            
            category: "leaf",
            hotkey: -1
        }, 
        {
            key: "platinum_shop",
            name: __("Platinum Shop"),
            sprite: spr_leaf_platinum,
            
            check: function()
            {
                return global.resources.platinum.data.unlocked;
            },
            
            check_badge: function()
            {
                return check_badge_shop(global.shops.platinum);
            },
            
            is_shop: true,
            shop: global.shops.platinum,
            tags: ["shop"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_75), variable_struct_get(o_shop.titles, UnknownEnum.Value_75), global.gui_items_count_shop, 
                {
                    dialog_id: "shop_platinum",
                    is_shop: true,
                    shop_resource_key: global.resources.platinum.key,
                    tab: UnknownEnum.Value_75,
                    can_toggle: true
                });
            },
            
            category: "leaf",
            hotkey: -1
        }, 
        {
            key: "bismuth_shop",
            name: __("Bismuth Shop"),
            sprite: spr_leaf_bismuth,
            
            check: function()
            {
                return global.resources.bismuth.data.unlocked;
            },
            
            check_badge: function()
            {
                return check_badge_shop(global.shops.bismuth);
            },
            
            is_shop: true,
            shop: global.shops.bismuth,
            tags: ["shop"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_34), variable_struct_get(o_shop.titles, UnknownEnum.Value_34), global.gui_items_count_shop, 
                {
                    dialog_id: "shop_bismuth",
                    is_shop: true,
                    shop_resource_key: global.resources.bismuth.key,
                    tab: UnknownEnum.Value_34,
                    can_toggle: true
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "cosmic_shop",
            name: __("Cosmic Shop"),
            sprite: spr_leaf_cosmic,
            
            check: function()
            {
                return global.resources.cosmic.data.unlocked;
            },
            
            check_badge: function()
            {
                return check_badge_shop(global.shops.cosmic);
            },
            
            is_shop: true,
            shop: global.shops.cosmic,
            tags: ["shop"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_44), variable_struct_get(o_shop.titles, UnknownEnum.Value_44), global.gui_items_count_shop, 
                {
                    dialog_id: "shop_cosmic",
                    is_shop: true,
                    shop_resource_key: global.resources.cosmic.key,
                    tab: UnknownEnum.Value_44,
                    can_toggle: true
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "void_shop",
            name: __("Void Shop"),
            sprite: spr_leaf_void,
            
            check: function()
            {
                return global.resources.void.data.unlocked;
            },
            
            check_badge: function()
            {
                return check_badge_shop(global.shops.void);
            },
            
            is_shop: true,
            shop: global.shops.void,
            tags: ["shop"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_89), variable_struct_get(o_shop.titles, UnknownEnum.Value_89), global.gui_items_count_shop, 
                {
                    dialog_id: "shop_void",
                    is_shop: true,
                    shop_resource_key: global.resources.void.key,
                    tab: UnknownEnum.Value_89,
                    can_toggle: true
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "exotic_shop",
            name: __("Exotic Shop"),
            sprite: spr_leaf_exotic,
            
            check: function()
            {
                return global.resources.exotic.data.unlocked;
            },
            
            check_badge: function()
            {
                return check_badge_shop(global.shops.exotic);
            },
            
            is_shop: true,
            shop: global.shops.exotic,
            tags: ["shop"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_49), variable_struct_get(o_shop.titles, UnknownEnum.Value_49), global.gui_items_count_shop, 
                {
                    dialog_id: "shop_exotic",
                    is_shop: true,
                    shop_resource_key: global.resources.exotic.key,
                    tab: UnknownEnum.Value_49,
                    can_toggle: true
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "celestial_shop",
            name: __("Celestial Shop"),
            sprite: spr_leaf_celestial,
            
            check: function()
            {
                return global.resources.celestial.data.unlocked;
            },
            
            check_badge: function()
            {
                return check_badge_shop(global.shops.celestial);
            },
            
            is_shop: true,
            shop: global.shops.celestial,
            tags: ["shop"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_40), variable_struct_get(o_shop.titles, UnknownEnum.Value_40), global.gui_items_count_shop, 
                {
                    dialog_id: "shop_celestial",
                    is_shop: true,
                    shop_resource_key: global.resources.celestial.key,
                    tab: UnknownEnum.Value_40,
                    can_toggle: true
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "mythical_shop",
            name: __("Mythical Shop"),
            sprite: spr_leaf_mythical,
            
            check: function()
            {
                return global.resources.mythical.data.unlocked;
            },
            
            check_badge: function()
            {
                return check_badge_shop(global.shops.mythical);
            },
            
            is_shop: true,
            shop: global.shops.mythical,
            tags: ["shop"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_71), variable_struct_get(o_shop.titles, UnknownEnum.Value_71), global.gui_items_count_shop, 
                {
                    dialog_id: "shop_mythical",
                    is_shop: true,
                    shop_resource_key: global.resources.mythical.key,
                    tab: UnknownEnum.Value_71,
                    can_toggle: true
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "lava_shop",
            name: __("Lava Shop"),
            sprite: spr_leaf_lava,
            
            check: function()
            {
                return global.resources.lava.data.unlocked;
            },
            
            check_badge: function()
            {
                return check_badge_shop(global.shops.lava);
            },
            
            is_shop: true,
            shop: global.shops.lava,
            tags: ["shop"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_66), variable_struct_get(o_shop.titles, UnknownEnum.Value_66), global.gui_items_count_shop, 
                {
                    dialog_id: "shop_lava",
                    is_shop: true,
                    shop_resource_key: global.resources.lava.key,
                    tab: UnknownEnum.Value_66,
                    can_toggle: true
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "ice_shop",
            name: __("Ice Shop"),
            sprite: spr_leaf_ice,
            
            check: function()
            {
                return global.resources.ice.data.unlocked;
            },
            
            check_badge: function()
            {
                return check_badge_shop(global.shops.ice);
            },
            
            is_shop: true,
            shop: global.shops.ice,
            tags: ["shop"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_65), variable_struct_get(o_shop.titles, UnknownEnum.Value_65), global.gui_items_count_shop, 
                {
                    dialog_id: "shop_ice",
                    is_shop: true,
                    shop_resource_key: global.resources.ice.key,
                    tab: UnknownEnum.Value_65,
                    can_toggle: true
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "obsidian_shop",
            name: __("Obsidian Shop"),
            sprite: spr_leaf_obsidian,
            
            check: function()
            {
                return global.resources.obsidian.data.unlocked;
            },
            
            check_badge: function()
            {
                return check_badge_shop(global.shops.obsidian);
            },
            
            is_shop: true,
            shop: global.shops.obsidian,
            tags: ["shop"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_72), variable_struct_get(o_shop.titles, UnknownEnum.Value_72), global.gui_items_count_shop, 
                {
                    dialog_id: "shop_obsidian",
                    is_shop: true,
                    shop_resource_key: global.resources.obsidian.key,
                    tab: UnknownEnum.Value_72,
                    can_toggle: true
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "silicon_shop",
            name: __("Silicon Shop"),
            sprite: spr_leaf_silicon,
            
            check: function()
            {
                return global.resources.silicon.data.unlocked;
            },
            
            check_badge: function()
            {
                return check_badge_shop(global.shops.silicon);
            },
            
            is_shop: true,
            shop: global.shops.silicon,
            tags: ["shop"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_83), variable_struct_get(o_shop.titles, UnknownEnum.Value_83), global.gui_items_count_shop, 
                {
                    dialog_id: "shop_silicon",
                    is_shop: true,
                    shop_resource_key: global.resources.silicon.key,
                    tab: UnknownEnum.Value_83,
                    can_toggle: true
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "benitoite_shop",
            name: __("Benitoite Shop"),
            sprite: spr_leaf_benitoite,
            
            check: function()
            {
                return global.resources.benitoite.data.unlocked;
            },
            
            check_badge: function()
            {
                return check_badge_shop(global.shops.benitoite);
            },
            
            is_shop: true,
            shop: global.shops.benitoite,
            tags: ["shop"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_33), variable_struct_get(o_shop.titles, UnknownEnum.Value_33), global.gui_items_count_shop, 
                {
                    dialog_id: "shop_benitoite",
                    is_shop: true,
                    shop_resource_key: global.resources.benitoite.key,
                    tab: UnknownEnum.Value_33,
                    can_toggle: true
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "moonstone_shop",
            name: __("Moonstone Shop"),
            sprite: spr_leaf_moonstone,
            
            check: function()
            {
                return global.resources.moonstone.data.unlocked;
            },
            
            check_badge: function()
            {
                return check_badge_shop(global.shops.moonstone);
            },
            
            is_shop: true,
            shop: global.shops.moonstone,
            tags: ["shop"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_69), variable_struct_get(o_shop.titles, UnknownEnum.Value_69), global.gui_items_count_shop, 
                {
                    dialog_id: "shop_moonstone",
                    is_shop: true,
                    shop_resource_key: global.resources.moonstone.key,
                    tab: UnknownEnum.Value_69,
                    can_toggle: true
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "sand_shop",
            name: __("Sand Shop"),
            sprite: spr_leaf_sand,
            
            check: function()
            {
                return global.resources.sand.data.unlocked;
            },
            
            check_badge: function()
            {
                return check_badge_shop(global.shops.sand);
            },
            
            is_shop: true,
            shop: global.shops.sand,
            tags: ["shop"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_81), variable_struct_get(o_shop.titles, UnknownEnum.Value_81), global.gui_items_count_shop, 
                {
                    dialog_id: "shop_sand",
                    is_shop: true,
                    shop_resource_key: global.resources.sand.key,
                    tab: UnknownEnum.Value_81,
                    can_toggle: true
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "ancient_shop",
            name: __("Ancient Shop"),
            sprite: spr_leaf_ancient,
            
            check: function()
            {
                return is_unlocked_pyramid();
            },
            
            check_badge: function()
            {
                return check_badge_shop(global.shops.ancient);
            },
            
            is_shop: true,
            shop: global.shops.ancient,
            tags: ["shop"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_31), variable_struct_get(o_shop.titles, UnknownEnum.Value_31), global.gui_items_count_shop, 
                {
                    dialog_id: "shop_ancient",
                    is_shop: true,
                    shop_resource_key: global.resources.ancient.key,
                    tab: UnknownEnum.Value_31,
                    can_toggle: true
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "sacred_shop",
            name: __("Sacred Shop"),
            sprite: spr_leaf_sacred,
            
            check: function()
            {
                return is_unlocked_sacred();
            },
            
            check_badge: function()
            {
                return check_badge_shop(global.shops.sacred);
            },
            
            is_shop: true,
            shop: global.shops.sacred,
            tags: ["shop"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_80), variable_struct_get(o_shop.titles, UnknownEnum.Value_80), global.gui_items_count_shop, 
                {
                    dialog_id: "shop_sacred",
                    is_shop: true,
                    shop_resource_key: global.resources.sacred.key,
                    tab: UnknownEnum.Value_80,
                    can_toggle: true
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "biotite_shop",
            name: __("Biotite Shop"),
            sprite: spr_leaf_biotite,
            
            check: function()
            {
                return is_unlocked_sacred();
            },
            
            check_badge: function()
            {
                return check_badge_shop(global.shops.biotite);
            },
            
            is_shop: true,
            shop: global.shops.biotite,
            tags: ["shop"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_35), variable_struct_get(o_shop.titles, UnknownEnum.Value_35), global.gui_items_count_shop, 
                {
                    dialog_id: "shop_biotite",
                    is_shop: true,
                    shop_resource_key: global.resources.biotite.key,
                    tab: UnknownEnum.Value_35,
                    can_toggle: true
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "malachite_shop",
            name: __("Malachite Shop"),
            sprite: spr_leaf_malachite,
            
            check: function()
            {
                return global.resources.malachite.data.unlocked == 1;
            },
            
            check_badge: function()
            {
                return check_badge_shop(global.shops.malachite);
            },
            
            is_shop: true,
            shop: global.shops.malachite,
            tags: ["shop"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_67), variable_struct_get(o_shop.titles, UnknownEnum.Value_67), global.gui_items_count_shop, 
                {
                    dialog_id: "shop_malachite",
                    is_shop: true,
                    shop_resource_key: global.resources.malachite.key,
                    tab: UnknownEnum.Value_67,
                    can_toggle: true
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "hematite_shop",
            name: __("Hematite Shop"),
            sprite: spr_leaf_hematite,
            
            check: function()
            {
                return global.resources.hematite.data.unlocked == 1;
            },
            
            check_badge: function()
            {
                return check_badge_shop(global.shops.hematite);
            },
            
            is_shop: true,
            shop: global.shops.hematite,
            tags: ["shop"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_64), variable_struct_get(o_shop.titles, UnknownEnum.Value_64), global.gui_items_count_shop, 
                {
                    dialog_id: "shop_hematite",
                    is_shop: true,
                    shop_resource_key: global.resources.hematite.key,
                    tab: UnknownEnum.Value_64,
                    can_toggle: true
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "plasma_shop",
            name: __("Plasma Shop"),
            sprite: spr_leaf_plasma,
            
            check: function()
            {
                return is_unlocked_plasma();
            },
            
            check_badge: function()
            {
                return check_badge_shop(global.shops.plasma);
            },
            
            is_shop: true,
            shop: global.shops.plasma,
            tags: ["shop"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_74), variable_struct_get(o_shop.titles, UnknownEnum.Value_74), global.gui_items_count_shop, 
                {
                    dialog_id: "shop_plasma",
                    is_shop: true,
                    shop_resource_key: global.resources.plasma.key,
                    tab: UnknownEnum.Value_74,
                    can_toggle: true
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "coal_shop",
            name: __("Coal Shop"),
            sprite: spr_leaf_coal,
            
            check: function()
            {
                return global.resources.coal.data.unlocked == 1;
            },
            
            check_badge: function()
            {
                return check_badge_shop(global.shops.coal);
            },
            
            is_shop: true,
            shop: global.shops.coal,
            tags: ["shop"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_41), variable_struct_get(o_shop.titles, UnknownEnum.Value_41), global.gui_items_count_shop, 
                {
                    dialog_id: "shop_coal",
                    is_shop: true,
                    shop_resource_key: global.resources.coal.key,
                    tab: UnknownEnum.Value_41,
                    can_toggle: true
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "dusk_shop",
            name: __("Dusk Shop"),
            sprite: spr_leaf_dusk,
            
            check: function()
            {
                return is_unlocked_ulc() && global.areas.tenebris_field.check();
            },
            
            check_badge: function()
            {
                return check_badge_shop(global.shops.dusk);
            },
            
            is_shop: true,
            shop: global.shops.dusk,
            tags: ["shop"],
            
            func: function()
            {
                actions_dialog(o_shop.shop_items.dusk, 
                {
                    title: __("Dusk Shop") + " ****"
                }, global.gui_items_count_shop, 
                {
                    dialog_id: "shop_dusk",
                    is_shop: true,
                    shop_resource_key: global.resources.dusk.key,
                    tab: "dusk",
                    can_toggle: true
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "energy_electrical_shop",
            name: __("Electric Shop"),
            sprite: spr_resource_electrical_energy,
            
            check: function()
            {
                return is_unlocked_energy_electrical();
            },
            
            check_badge: function()
            {
                return check_badge_shop(global.shops.energy_electrical);
            },
            
            is_shop: true,
            shop: global.shops.energy_electrical,
            tags: ["shop"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_47), variable_struct_get(o_shop.titles, UnknownEnum.Value_47), global.gui_items_count_shop, 
                {
                    dialog_id: "shop_energy_electrical",
                    is_shop: true,
                    shop_resource_key: global.resources.energy_electrical.key,
                    tab: UnknownEnum.Value_47,
                    can_toggle: true
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "gem_leaves_shop",
            name: __("Gem Leaves Shop"),
            sprite: spr_leaf_emerald,
            
            check: function()
            {
                return is_unlocked_gem_leaves();
            },
            
            check_badge: function()
            {
                return check_badge_shop(global.shops.gem_leaves);
            },
            
            is_shop: true,
            shop: global.shops.gem_leaves,
            tags: ["shop"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_60), variable_struct_get(o_shop.titles, UnknownEnum.Value_60), global.gui_items_count_shop, 
                {
                    dialog_id: "shop_gem_leaves",
                    is_shop: true,
                    shop_key: "gem_leaves",
                    shop_resource_key: [global.resources.amber, global.resources.amethyst, global.resources.emerald, global.resources.kyanite, global.resources.rhodonite, global.resources.ruby, global.resources.tektite],
                    tab: UnknownEnum.Value_60,
                    can_toggle: true,
                    sections_key: "gem_leaves_shop"
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "coins_shop",
            name: __("Coins Shop"),
            sprite: spr_gold,
            check: can_show_prestige_shop,
            
            check_badge: function()
            {
                return check_badge_shop(global.shops.coins);
            },
            
            is_shop: true,
            shop: global.shops.coins,
            tags: ["shop"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_42), variable_struct_get(o_shop.titles, UnknownEnum.Value_42), global.gui_items_count_shop, 
                {
                    dialog_id: "shop_coins",
                    tab: UnknownEnum.Value_42,
                    can_toggle: true,
                    is_shop: true,
                    shop_resource_key: global.resources.coins.key
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "blc_shop",
            name: __("BLC Shop"),
            sprite: spr_blc,
            
            check: function()
            {
                return can_show_blc_shop();
            },
            
            check_badge: function()
            {
                return check_badge_shop(global.shops.blc);
            },
            
            is_shop: true,
            shop: global.shops.blc,
            tags: ["shop"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_36), variable_struct_get(o_shop.titles, UnknownEnum.Value_36), global.gui_items_count_shop, 
                {
                    dialog_id: "shop_blc",
                    tab: UnknownEnum.Value_36,
                    can_toggle: true,
                    is_shop: true,
                    shop_resource_key: global.resources.blc.key,
                    sections_key: "blc_shop"
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "mlc_shop",
            name: __("MLC Shop"),
            sprite: spr_mlc,
            check: can_show_mlc_shop,
            
            check_badge: function()
            {
                return check_badge_shop(global.shops.mlc);
            },
            
            is_shop: true,
            shop: global.shops.mlc,
            tags: ["shop"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_68), variable_struct_get(o_shop.titles, UnknownEnum.Value_68), global.gui_items_count_shop, 
                {
                    dialog_id: "shop_mlc",
                    tab: UnknownEnum.Value_68,
                    can_toggle: true,
                    is_shop: true,
                    shop_resource_key: global.resources.mlc.key
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "ulc_shop",
            name: __("ULC Shop"),
            sprite: spr_ulc,
            
            check: function()
            {
                return can_show_ulc_shop();
            },
            
            check_badge: function()
            {
                return check_badge_shop(global.shops.ulc);
            },
            
            is_shop: true,
            shop: global.shops.mlc,
            tags: ["shop"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_88), 
                {
                    title: __s("%s Shop", global.prestige_levels.ulc.name) + " ****"
                }, global.gui_items_count_shop, 
                {
                    dialog_id: "shop_ulc",
                    tab: UnknownEnum.Value_88,
                    can_toggle: true,
                    is_shop: true,
                    shop_resource_key: global.resources.ulc.key
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "silver_token_shop",
            name: __("Silver Token Shop"),
            sprite: spr_resource_silver_token,
            
            check: function()
            {
                return is_gt(global.resources.silver_token.data.collected, 0) && global.areas.tower.data.highest_floor > 1;
            },
            
            check_badge: function()
            {
                return check_badge_shop(global.shops.silver_token);
            },
            
            is_shop: true,
            shop: global.shops.silver_token,
            tags: ["early_game", "token", "shop"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_85), variable_struct_get(o_shop.titles, UnknownEnum.Value_85), global.gui_items_count_shop, 
                {
                    dialog_id: "shop_silver_token",
                    is_shop: true,
                    shop_resource_key: global.resources.silver_token.key,
                    tab: UnknownEnum.Value_85,
                    can_toggle: true
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "gold_token_shop",
            name: __("Gold Token Shop"),
            sprite: spr_resource_gold_token,
            
            check: function()
            {
                return is_gt(global.resources.gold_token.data.collected, 0) && global.areas.tower.data.highest_floor > 1;
            },
            
            check_badge: function()
            {
                return check_badge_shop(global.shops.gold_token);
            },
            
            is_shop: true,
            shop: global.shops.gold_token,
            tags: ["early_game", "token", "shop"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_63), variable_struct_get(o_shop.titles, UnknownEnum.Value_63), global.gui_items_count_shop, 
                {
                    dialog_id: "shop_gold_token",
                    is_shop: true,
                    shop_resource_key: global.resources.gold_token.key,
                    tab: UnknownEnum.Value_63,
                    can_toggle: true
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "red_science",
            name: __("Red Science"),
            sprite: spr_flask_red,
            
            check: function()
            {
                return global.resources.flask_red.data.unlocked;
            },
            
            check_badge: function()
            {
                return check_badge_shop(global.shops.flask_red);
            },
            
            is_shop: true,
            shop: global.shops.flask_red,
            tags: ["early_game", "science", "shop"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_53), variable_struct_get(o_shop.titles, UnknownEnum.Value_53), global.gui_items_count_shop, 
                {
                    dialog_id: "shop_flask_red",
                    is_shop: true,
                    shop_resource_key: global.resources.flask_red.key,
                    tab: UnknownEnum.Value_53,
                    can_toggle: true
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "green_science",
            name: __("Green Science"),
            sprite: spr_flask_green,
            
            check: function()
            {
                return global.resources.flask_green.data.unlocked;
            },
            
            check_badge: function()
            {
                return check_badge_shop(global.shops.flask_green);
            },
            
            is_shop: true,
            shop: global.shops.flask_green,
            tags: ["early_game", "science", "shop"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_54), variable_struct_get(o_shop.titles, UnknownEnum.Value_54), global.gui_items_count_shop, 
                {
                    dialog_id: "shop_flask_green",
                    is_shop: true,
                    shop_resource_key: global.resources.flask_green.key,
                    tab: UnknownEnum.Value_54,
                    can_toggle: true
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "blue_science",
            name: __("Blue Science"),
            sprite: spr_flask_blue,
            
            check: function()
            {
                return global.resources.flask_blue.data.unlocked;
            },
            
            check_badge: function()
            {
                return check_badge_shop(global.shops.flask_blue);
            },
            
            is_shop: true,
            shop: global.shops.flask_blue,
            tags: ["early_game", "science", "shop"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_55), variable_struct_get(o_shop.titles, UnknownEnum.Value_55), global.gui_items_count_shop, 
                {
                    dialog_id: "shop_flask_blue",
                    is_shop: true,
                    shop_resource_key: global.resources.flask_blue.key,
                    tab: UnknownEnum.Value_55,
                    can_toggle: true
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "magenta_science",
            name: __("Magenta Science"),
            sprite: spr_flask_magenta,
            
            check: function()
            {
                return global.resources.flask_magenta.data.unlocked;
            },
            
            check_badge: function()
            {
                return check_badge_shop(global.shops.flask_magenta);
            },
            
            is_shop: true,
            shop: global.shops.flask_magenta,
            tags: ["early_game", "science", "shop"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_56), variable_struct_get(o_shop.titles, UnknownEnum.Value_56), global.gui_items_count_shop, 
                {
                    dialog_id: "shop_flask_magenta",
                    is_shop: true,
                    shop_resource_key: global.resources.flask_magenta.key,
                    tab: UnknownEnum.Value_56,
                    can_toggle: true
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "orange_science",
            name: __("Orange Science"),
            sprite: spr_flask_orange,
            
            check: function()
            {
                return global.resources.flask_orange.data.unlocked;
            },
            
            check_badge: function()
            {
                return check_badge_shop(global.shops.flask_orange);
            },
            
            is_shop: true,
            shop: global.shops.flask_orange,
            tags: ["early_game", "science", "shop"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_57), variable_struct_get(o_shop.titles, UnknownEnum.Value_57), global.gui_items_count_shop, 
                {
                    dialog_id: "shop_flask_orange",
                    is_shop: true,
                    shop_resource_key: global.resources.flask_orange.key,
                    tab: UnknownEnum.Value_57,
                    can_toggle: true
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "black_science",
            name: __("Black Science"),
            sprite: spr_flask_black,
            
            check: function()
            {
                return global.resources.flask_black.data.unlocked;
            },
            
            check_badge: function()
            {
                return check_badge_shop(global.shops.flask_black);
            },
            
            is_shop: true,
            shop: global.shops.flask_black,
            tags: ["early_game", "science", "shop"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_58), variable_struct_get(o_shop.titles, UnknownEnum.Value_58), global.gui_items_count_shop, 
                {
                    dialog_id: "shop_flask_black",
                    is_shop: true,
                    shop_resource_key: global.resources.flask_black.key,
                    tab: UnknownEnum.Value_58,
                    can_toggle: true
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "strange_science",
            name: __("Strange Science"),
            sprite: spr_flask_strange,
            
            check: function()
            {
                return get_upgrade_count(global.shops.flask_black.unlock_flask_strange) > 0;
            },
            
            check_badge: function()
            {
                return check_badge_shop(global.shops.flask_strange);
            },
            
            is_shop: true,
            shop: global.shops.flask_strange,
            tags: ["early_game", "science", "shop"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_59), variable_struct_get(o_shop.titles, UnknownEnum.Value_59), global.gui_items_count_shop, 
                {
                    dialog_id: "shop_flask_strange",
                    is_shop: true,
                    shop_resource_key: global.resources.flask_strange.key,
                    tab: UnknownEnum.Value_59,
                    can_toggle: true
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "prestige",
            name: __("Prestige"),
            sprite: spr_icon_portal,
            check: can_show_prestige,
            
            check_badge: function()
            {
                return false;
            },
            
            tags: ["prestige"],
            
            func: function()
            {
                actions_dialog_simple(gui_item_prestige, 
                {
                    title: __("Prestige")
                }, 
                {
                    prestige: global.prestige_levels.prestige
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "blc",
            name: __("Big Leaf Crunch"),
            sprite: spr_icon_portal_leaf_crunch,
            check: can_show_blc,
            
            check_badge: function()
            {
                return false;
            },
            
            tags: ["prestige"],
            
            func: function()
            {
                actions_dialog_simple(gui_item_prestige, 
                {
                    title: __("Big Leaf Crunch")
                }, 
                {
                    prestige: global.prestige_levels.blc
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "mlc",
            name: __("Mega Leaf Crunch"),
            sprite: spr_icon_portal_mlc,
            check: can_show_mlc,
            
            check_badge: function()
            {
                return false;
            },
            
            tags: ["prestige"],
            
            func: function()
            {
                actions_dialog_simple(gui_item_prestige, 
                {
                    title: __("Mega Leaf Crunch")
                }, 
                {
                    prestige: global.prestige_levels.mlc
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "ulc",
            name: __("Ultra Leaf Crunch"),
            sprite: spr_icon_portal_ulc,
            
            check: function()
            {
                return can_show_ulc();
            },
            
            check_badge: function()
            {
                return false;
            },
            
            tags: ["prestige"],
            
            func: function()
            {
                actions_dialog_simple(gui_item_prestige, 
                {
                    title: __("Ultra Leaf Crunch")
                }, 
                {
                    prestige: global.prestige_levels.ulc,
                    add_draw: gui_item_prestige_ulc_add_draw
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "areas",
            name: __("Areas"),
            sprite: spr_flag,
            
            check: function()
            {
                return is_unlocked_areas();
            },
            
            check_badge: function()
            {
                return false;
            },
            
            tags: ["other"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_3), variable_struct_get(o_shop.titles, UnknownEnum.Value_3), global.gui_items_count_shop, 
                {
                    dialog_id: "areas",
                    tab: UnknownEnum.Value_3,
                    can_toggle: true,
                    sections_key: "areas",
                    show_quantity_selection: true
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "converters",
            name: __("Converters"),
            sprite: spr_icon_converters,
            
            check: function()
            {
                return is_unlocked_converters();
            },
            
            check_badge: function()
            {
                return false;
            },
            
            tags: ["other"],
            
            func: function()
            {
                actions_dialog_simple(gui_item_converters, variable_struct_get(o_shop.titles, UnknownEnum.Value_43), 
                {
                    dialog_id: "shop_converters",
                    is_shop: true,
                    tab: UnknownEnum.Value_43,
                    can_toggle: true,
                    add_draw: gui_item_converters_add_draw
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "printers",
            name: __("Printers"),
            sprite: spr_icon_printer,
            
            check: function()
            {
                return is_unlocked_printers();
            },
            
            check_badge: function()
            {
                return false;
            },
            
            tags: ["other"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_79), variable_struct_get(o_shop.titles, UnknownEnum.Value_79), global.gui_items_count_shop, 
                {
                    dialog_id: "shop_printers",
                    is_shop: true,
                    shop_resource_key: global.resources.coins.key,
                    tab: UnknownEnum.Value_79,
                    can_toggle: true
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "farming",
            name: __("Farming"),
            sprite: spr_icon_farming,
            
            check: function()
            {
                return get_upgrade_count(global.shops.exotic.unlock_farming) > 0;
            },
            
            check_badge: function()
            {
                return check_badge_shop(global.shops.farming);
            },
            
            is_shop: true,
            shop: global.shops.farming,
            tags: ["shop"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_52), variable_struct_get(o_shop.titles, UnknownEnum.Value_52), global.gui_items_count_shop, 
                {
                    dialog_id: "shop_farming",
                    is_shop: true,
                    shop_key: "farming",
                    tab: UnknownEnum.Value_52,
                    can_toggle: true
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "mulch_shop",
            name: __("Mulch Shop"),
            sprite: spr_icon_mulch,
            
            check: function()
            {
                return get_upgrade_count(global.shops.blc.unlock_mulch) > 0;
            },
            
            check_badge: function()
            {
                return check_badge_shop(global.shops.mulch);
            },
            
            is_shop: true,
            shop: global.shops.mulch,
            tags: ["shop"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_70), variable_struct_get(o_shop.titles, UnknownEnum.Value_70), global.gui_items_count_shop, 
                {
                    dialog_id: "shop_mulch",
                    is_shop: true,
                    shop_resource_key: global.resources.mulch.key,
                    tab: UnknownEnum.Value_70,
                    can_toggle: true
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "trading",
            name: __("Trading"),
            sprite: spr_icon_trading,
            check: is_unlocked_trading,
            
            check_badge: function()
            {
                var __array = global.trades;
                var __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    if (mitem.is_finished())
                    {
                        return true;
                    }
                }
                return false;
            },
            
            tags: ["other"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_91), variable_struct_get(o_shop.titles, UnknownEnum.Value_91), global.gui_items_count_shop, 
                {
                    dialog_id: "trading",
                    tab: UnknownEnum.Value_91,
                    can_toggle: true,
                    add_draw: gui_item_trades_add_draw
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "crafting",
            name: __("Crafting"),
            sprite: spr_icon_crafting,
            
            check: function()
            {
                return is_unlocked_crafting();
            },
            
            check_badge: function()
            {
                return false;
            },
            
            tags: ["other"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_11), variable_struct_get(o_shop.titles, UnknownEnum.Value_11), global.gui_items_count_shop, 
                {
                    dialog_id: "crafting",
                    tab: UnknownEnum.Value_11,
                    can_toggle: true,
                    sections_key: "crafting",
                    add_draw: gui_item_crafting_add_draw
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "alchemy",
            name: __("Alchemy"),
            sprite: spr_icon_alchemy,
            
            check: function()
            {
                return is_unlocked_alchemy();
            },
            
            check_badge: function()
            {
                return false;
            },
            
            tags: ["other"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_2), variable_struct_get(o_shop.titles, UnknownEnum.Value_2), 5, 
                {
                    dialog_id: "alchemy",
                    tab: UnknownEnum.Value_2,
                    can_toggle: true,
                    sections_key: "alchemy",
                    add_draw: gui_item_alchemy_add_draw
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "boosters",
            name: __("Boosters"),
            sprite: spr_icon_rocket,
            
            check: function()
            {
                return is_unlocked_boosters();
            },
            
            check_badge: __return_false,
            tags: ["other"],
            
            func: function()
            {
                actions_dialog_simple(gui_item_boosters, 
                {
                    title: __("Boosters")
                }, 
                {
                    dialog_id: "booster",
                    can_toggle: true,
                    add_draw: gui_item_boosters_add_draw
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "leafscension",
            name: __("Leafscension"),
            sprite: spr_icon_leafscension,
            
            check: function()
            {
                return is_unlocked_leafscension();
            },
            
            check_badge: __return_false,
            tags: ["other"],
            
            func: function()
            {
                actions_dialog_simple(gui_item_leafscension, 
                {
                    title: __("Leafscension"),
                    subtitle: __("Transcend leaves to more powerful leaves by Leafscension.")
                }, 
                {
                    dialog_id: "leafscension",
                    can_toggle: true,
                    sections_key: "leafscension",
                    add_draw: gui_item_leafscension_add_draw
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "borbventures",
            name: __("Borbventures"),
            sprite: spr_borb_jones,
            
            check: function()
            {
                return is_unlocked_borbventure() && (o_game.data.stats.prestige_mlc > 0 || get_default_struct_value(struct_get_from_hash(global.game_settings, variable_get_hash("unlocked")), "borbventure", false));
            },
            
            check_badge: function()
            {
                var __array = global.borbventures.items.borbventures;
                var __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    if (mitem.can_finish())
                    {
                        return true;
                    }
                }
                return false;
            },
            
            tags: ["other"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_5), variable_struct_get(o_shop.titles, UnknownEnum.Value_5), 5, 
                {
                    dialog_id: "borbventures",
                    tab: UnknownEnum.Value_5,
                    can_toggle: true,
                    sections_key: "borbventures",
                    show_quantity_selection: true,
                    add_draw: gui_item_borbventure_add_draw
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "mines",
            name: __("Mines"),
            sprite: spr_icon_mine,
            
            check: function()
            {
                return is_unlocked_mines();
            },
            
            check_badge: __return_false,
            tags: ["other"],
            
            func: function()
            {
                var actions = [new Gui_Item(UnknownEnum.Value_18, id, 
                {
                    func: gui_item_mines
                })];
                actions_dialog(actions, 
                {
                    title: __("Mines") + " ****"
                }, undefined, 
                {
                    dialog_id: "mines",
                    tab: UnknownEnum.Value_22,
                    can_toggle: true,
                    sections_key: "mines",
                    show_quantity_selection: true,
                    add_draw: gui_item_mines_add_draw
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "soul_shop",
            name: __("Soul Shop"),
            sprite: spr_resource_soul_entity,
            
            check: function()
            {
                return global.areas.soul_crypt.check();
            },
            
            check_badge: function()
            {
                return check_badge_shop(global.shops.soul_entities);
            },
            
            is_shop: true,
            tags: ["shop"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_86), variable_struct_get(o_shop.titles, UnknownEnum.Value_86), global.gui_items_count_shop, 
                {
                    dialog_id: "shop_soul",
                    is_shop: true,
                    shop_key: "soul_entities",
                    shop_resource_key: [global.resources.soul_stones, global.resources.soul_keys, global.resources.soul_particles, global.resources.soul_entities, global.resources.soul_flask],
                    tab: UnknownEnum.Value_86,
                    can_toggle: true
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "soul_forge",
            name: __("Soul Forge"),
            sprite: spr_icon_soul_forge,
            
            check: function()
            {
                return is_unlocked_soul_forge();
            },
            
            check_badge: function()
            {
                return check_badge_shop(global.shops.soul_forge);
            },
            
            tags: ["other"],
            
            func: function()
            {
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_87), 
                {
                    title: __("Soul Forge") + " ***"
                }, global.gui_items_count_shop, 
                {
                    dialog_id: "soul_forge",
                    is_shop: true,
                    shop_key: "soul_forge",
                    shop_resource_key: [global.resources.soul_flask, global.resources.soul],
                    tab: UnknownEnum.Value_87,
                    can_toggle: true
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "banks",
            name: __("Banks"),
            sprite: spr_icon_bank,
            
            check: function()
            {
                return is_unlocked_banks();
            },
            
            check_badge: __return_false,
            tags: ["other"],
            
            func: function()
            {
                var actions = [new Gui_Item(UnknownEnum.Value_18, id, 
                {
                    func: gui_item_banks
                })];
                actions_dialog(actions, 
                {
                    title: __("Banks") + " ****"
                }, undefined, 
                {
                    dialog_id: "banks",
                    tab: UnknownEnum.Value_4,
                    show_quantity_selection: true,
                    add_draw: gui_item_banks_add_draw
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "dice",
            name: __("Dicey Meadows"),
            sprite: spr_icon_die,
            
            check: function()
            {
                return is_unlocked_dice();
            },
            
            check_badge: function()
            {
                return false;
            },
            
            tags: ["other"],
            
            func: function()
            {
                var actions = [new Gui_Item(UnknownEnum.Value_18, id, 
                {
                    func: gui_item_dice
                })];
                actions_dialog(actions, 
                {
                    title: __("Dicey Meadows") + " ****"
                }, undefined, 
                {
                    dialog_id: "dice",
                    tab: UnknownEnum.Value_14,
                    can_toggle: true,
                    sections_key: "dice",
                    show_quantity_selection: true,
                    add_draw: gui_item_dice_add_draw
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "fishing",
            name: __("Fishing"),
            sprite: spr_fish_aquazure,
            
            check: function()
            {
                return is_unlocked_fishing();
            },
            
            check_badge: __return_false,
            tags: ["other"],
            
            func: function()
            {
                actions_dialog_simple(gui_item_fish, 
                {
                    title: __("Fishing") + " ****"
                }, 
                {
                    add_draw: gui_item_fish_add_draw,
                    sections_key: "fishing",
                    show_quantity_selection: true
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "harbor",
            name: __("Harbor"),
            sprite: spr_icon_ship,
            
            check: function()
            {
                return is_unlocked_harbor();
            },
            
            check_badge: __return_false,
            tags: ["other"],
            
            func: function()
            {
                actions_dialog_simple(gui_item_harbor, 
                {
                    title: __("Harbor") + " ****"
                }, 
                {
                    add_draw: gui_item_harbor_add_draw,
                    sections_key: "harbor"
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "quarks",
            name: __("Quarks"),
            sprite: spr_icon_quark,
            
            check: function()
            {
                return is_unlocked_quarks();
            },
            
            check_badge: function()
            {
                return false;
            },
            
            tags: ["other"],
            
            func: function()
            {
                var actions = [new Gui_Item(UnknownEnum.Value_18, id, 
                {
                    func: gui_item_quarks
                })];
                actions_dialog(actions, 
                {
                    title: __("Quarks") + " ****"
                }, undefined, 
                {
                    dialog_id: "quarks",
                    tab: UnknownEnum.Value_26,
                    can_toggle: true,
                    sections_key: "quarks",
                    show_quantity_selection: true,
                    add_draw: gui_item_quarks_add_draw
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "shadow_crystal",
            name: __("Shadow Crystal"),
            sprite: spr_object_shadow_crystal,
            
            check: function()
            {
                return o_game.data.stats.prestige_ulc > 0;
            },
            
            check_badge: __return_false,
            tags: ["other"],
            
            func: function()
            {
                var actions = [new Gui_Item(UnknownEnum.Value_18, id, 
                {
                    func: gui_item_shadow_crystal
                })];
                actions_dialog(actions, 
                {
                    title: __("Shadow Crystal") + " ****"
                }, undefined, 
                {
                    dialog_id: "shadow_crystal",
                    tab: UnknownEnum.Value_30,
                    can_toggle: true,
                    sections_key: "shadow_crystal",
                    show_quantity_selection: true,
                    add_draw: gui_item_shadow_crystal_add_draw
                });
            },
            
            hotkey: -1
        }, 
        {
            key: "event_shop",
            name: __("Event Shop"),
            sprite: spr_icon_event,
            
            check: function()
            {
                return is_unlocked_areas() && is_any_event_active();
            },
            
            check_badge: function()
            {
                return false;
            },
            
            is_shop: true,
            tags: ["shop"],
            
            func: function()
            {
                actions_dialog_simple(gui_item_events, variable_struct_get(o_shop.titles, UnknownEnum.Value_50), 
                {
                    add_draw: gui_item_events_add_draw
                }, "event");
                exit;
                actions_dialog(variable_struct_get(o_shop.shop_items, UnknownEnum.Value_50), variable_struct_get(o_shop.titles, UnknownEnum.Value_50), global.gui_items_count_shop, 
                {
                    dialog_id: "shop_event",
                    is_shop: true,
                    tab: UnknownEnum.Value_50,
                    can_toggle: true,
                    sections_key: "event",
                    
                    add_draw: function()
                    {
                        var res_x = add_text_base_x + gui_col_x(20.5);
                        var res_y = add_text_base_y;
                        var res = undefined;
                        if (is_current_dialog_section(global.dialog_sections.event.halloween))
                        {
                            res = global.resources.borb_o_lantern;
                        }
                        else if (is_current_dialog_section(global.dialog_sections.event.nature_season))
                        {
                            res = global.resources.nature_gems;
                        }
                        if (is_struct(res))
                        {
                            draw_resources(res_x, res_y, build_resource_cost(res, res.data.count), undefined, 
                            {
                                mini: true
                            });
                        }
                    }
                });
            },
            
            hotkey: -1
        }];
        if (global.debug)
        {
            array_push(nav_items_tl, 
            {
                key: "debug",
                name: __("Debug"),
                sprite: spr_placeholder2,
                
                check: function()
                {
                    return true;
                },
                
                check_badge: function()
                {
                    return false;
                },
                
                exclude_cp: true,
                
                func: function()
                {
                    actions_dialog(o_debug.actions, 
                    {
                        title: "Debug",
                        subtitle: "How did you get here?"
                    }, iif(global.is_mobile, 24, 48), 
                    {
                        can_toggle: true,
                        dialog_id: "debug",
                        tab: "debug"
                    });
                },
                
                hotkey: -1
            });
        }
        if (is_struct(global.online_shops))
        {
            build_mp_shops_nav(global.online_shops);
        }
        var __array = nav_items_tl;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            mitem.category = get_default_struct_value(mitem, "category", "top");
            mitem.check_flag = false;
            mitem.exclude_cp = get_default_struct_value(mitem, "exclude_cp", false);
            mitem.fixed_nav = get_default_struct_value(mitem, "fixed_nav", true);
            mitem.has_badge = false;
            mitem.index = __i;
            mitem.is_shop = get_default_struct_value(mitem, "is_shop", false);
            mitem.is_visible = false;
            mitem.nav_key = "tl";
            mitem.shop = get_default_struct_value(mitem, "shop", undefined);
            mitem.shop_can_hide = get_default_struct_value(mitem, "shop_can_hide", true);
            mitem.tags = get_default_struct_value(mitem, "tags", []);
            array_push(mitem.tags, "top");
            mitem.dialog_id = "shop_" + mitem.name;
            var key = get_default_struct_value(mitem, "key", mitem.name);
            var hotkey_option_name = sprintf("hotkey_%s", key);
            if (!is_undefined(variable_struct_get(global.options, hotkey_option_name)))
            {
                var action_hotkey = get_option(variable_struct_get(global.options, hotkey_option_name));
                if (!is_empty(action_hotkey) && action_hotkey != -1)
                {
                    mitem.hotkey = action_hotkey;
                    mitem.hotkey_item = variable_struct_get(global.options, hotkey_option_name).hotkey;
                    array_push(hotkeys, mitem);
                }
            }
            set_sprite_data(mitem);
            variable_struct_set(nav_items, key, mitem);
            array_push(variable_struct_get(menu_categories, mitem.category).items, mitem);
            if (!mitem.exclude_cp)
            {
                array_push(nav_items_array_cp, mitem);
            }
        }
        __array = nav_items_bl;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            mitem.category = get_default_struct_value(mitem, "category", "bottom");
            mitem.check_flag = false;
            mitem.exclude_cp = get_default_struct_value(mitem, "exclude_cp", false);
            mitem.fixed_nav = get_default_struct_value(mitem, "fixed_nav", true);
            mitem.has_badge = false;
            mitem.index = __i;
            mitem.is_shop = get_default_struct_value(mitem, "is_shop", false);
            mitem.is_visible = false;
            mitem.nav_key = "bl";
            mitem.shop = get_default_struct_value(mitem, "shop", undefined);
            mitem.shop_can_hide = get_default_struct_value(mitem, "shop_can_hide", true);
            mitem.tags = get_default_struct_value(mitem, "tags", []);
            array_push(mitem.tags, "bottom");
            mitem.dialog_id = "shop_" + mitem.name;
            var key = get_default_struct_value(mitem, "key", mitem.name);
            var hotkey_option_name = sprintf("hotkey_%s", mitem.key);
            if (!is_undefined(variable_struct_get(global.options, hotkey_option_name)))
            {
                var action_hotkey = get_option(variable_struct_get(global.options, hotkey_option_name));
                if (!is_empty(action_hotkey) && action_hotkey != -1)
                {
                    mitem.hotkey = action_hotkey;
                    mitem.hotkey_item = variable_struct_get(global.options, hotkey_option_name).hotkey;
                    array_push(hotkeys, mitem);
                }
            }
            set_sprite_data(mitem);
            variable_struct_set(nav_items, key, mitem);
            array_push(variable_struct_get(menu_categories, mitem.category).items, mitem);
            if (!mitem.exclude_cp)
            {
                array_push(nav_items_array_cp, mitem);
            }
        }
        __array = global.hotkeys_other;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            var hotkey_option_name = sprintf("hotkey_%s", mitem.key);
            if (is_undefined(variable_struct_get(global.options, hotkey_option_name)))
            {
                continue;
            }
            var action_hotkey = get_option(variable_struct_get(global.options, hotkey_option_name));
            if (!is_empty(action_hotkey) && action_hotkey != -1)
            {
                array_push(hotkeys, 
                {
                    check: __return_true,
                    hotkey: action_hotkey,
                    hotkey_item: mitem,
                    key: sprintf("hotkey_other_%s", mitem.name)
                });
            }
        }
    }
}

enum UnknownEnum
{
    Value_1 = 1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_6,
    Value_7,
    Value_8,
    Value_9,
    Value_10,
    Value_11,
    Value_13 = 13,
    Value_14,
    Value_15,
    Value_16,
    Value_17,
    Value_18,
    Value_19,
    Value_20,
    Value_21,
    Value_22,
    Value_25 = 25,
    Value_26,
    Value_27,
    Value_28,
    Value_29,
    Value_30,
    Value_31,
    Value_32,
    Value_33,
    Value_34,
    Value_35,
    Value_36,
    Value_37,
    Value_39 = 39,
    Value_40,
    Value_41,
    Value_42,
    Value_43,
    Value_44,
    Value_45,
    Value_47 = 47,
    Value_48,
    Value_49,
    Value_50,
    Value_52 = 52,
    Value_53,
    Value_54,
    Value_55,
    Value_56,
    Value_57,
    Value_58,
    Value_59,
    Value_60,
    Value_61,
    Value_62,
    Value_63,
    Value_64,
    Value_65,
    Value_66,
    Value_67,
    Value_68,
    Value_69,
    Value_70,
    Value_71,
    Value_72,
    Value_73,
    Value_74,
    Value_75,
    Value_79 = 79,
    Value_80,
    Value_81,
    Value_83 = 83,
    Value_84,
    Value_85,
    Value_86,
    Value_87,
    Value_88,
    Value_89,
    Value_90,
    Value_91,
    Value_92
}
