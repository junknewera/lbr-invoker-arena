function init_challenges()
{
    global.challenges = 
    {
        autobuy_disabled: new Challenge(
        {
            name: __("All Manual"),
            description: __("Automation is for the lazy! Perform a Big Leaf Crunch with no autobuyers to complete this challenge."),
            sprite: spr_icon_cog,
            difficulty: 0,
            
            challenge: function()
            {
                global.game_settings.autobuy_enabled = false;
            },
            
            check: function()
            {
                return o_game.data.stats.prestige_crunch > 0;
            },
            
            get_progress_text: function()
            {
                return sprintf("%s: %s/%s", __("BLC"), o_game.data.stats.prestige_crunch, 1);
            },
            
            upgrade_attributes: 
            {
                autobuy_accelerator: 0.05
            }
        }),
        bingo: new Challenge(
        {
            name: __("Bingo"),
            description: sprintf(__("Play some LBR Bingo! Complete randomized quests on a 5x5 bingo sheet. Win by completing a row, column or diagonal. You start with %s %s, collect %s every %s seconds and all areas cost some %s."), 50, __("Cheese"), 5, 60, __("Cheese")),
            sprite: spr_icon_bingo,
            bingo: true,
            difficulty: 1,
            gem_upgrades_enabled: false,
            result_start: 
            {
                resources: 
                {
                    cheese: 50
                }
            },
            reward_override_concurrent: 2,
            
            challenge: function()
            {
                init_bingo_challenge();
            },
            
            check: function()
            {
                return check_bingo_columns_finished();
            },
            
            start: function()
            {
                generate_bingo_quests(self.difficulty);
            },
            
            start_challenge: function()
            {
                global.globalstats.challenge_data.unlocked_resources.cheese = true;
            },
            
            upgrade_attributes: 
            {
                trade_resources_multiplier_challenges: 3
            }
        }),
        bingo_all: new Challenge(
        {
            name: __("Bingo++"),
            description: sprintf(__("Play some LBR Bingo++! Complete randomized quests on a 5x5 bingo sheet. Win by completing all quests. You start with %s %s, collect %s every %s seconds and all areas cost some %s."), 50, __("Cheese"), 5, 60, __("Cheese")),
            sprite: spr_icon_bingo,
            bingo: true,
            difficulty: 2,
            gem_upgrades_enabled: false,
            reward_override_concurrent: 5,
            result_start: 
            {
                resources: 
                {
                    cheese: 50
                }
            },
            
            challenge: function()
            {
                init_bingo_challenge();
            },
            
            check: function()
            {
                return check_bingo_all_finished();
            },
            
            start: function()
            {
                generate_bingo_quests(self.difficulty);
            },
            
            start_challenge: function()
            {
                global.globalstats.challenge_data.unlocked_resources.cheese = true;
            },
            
            upgrade_attributes: 
            {
                trade_resources_multiplier_challenges: 5
            }
        }),
        claw_percent: new Challenge(
        {
            name: __("Claw%"),
            difficulty: -1,
            description: sprintf(__("Get %s curses in the Borb Claw Machine."), 10),
            sprite: spr_icon_cursed_cheese,
            gem_upgrades_enabled: false,
            result_start: 
            {
                resources: 
                {
                    cheese: 1000
                }
            },
            
            challenge: function()
            {
                global.game_settings.gem_upgrades_enabled = false;
                global.game_settings.borb_claw_machine_spawn_chances.curse = 100;
                global.game_settings.borb_claw_machine_items_min = 2;
                global.areas.cheese_pub.data.count = 1;
                global.shops.coins.unlock_areas.data.count = 1;
                global.shops.blc.unlock_pets.data.count = 1;
                global.shops.pets.pet_cheesetor.data.count = 1;
                change_area(global.areas.cheese_pub);
            },
            
            check: function()
            {
                return get_default_struct_value(o_game.data.stats.borb_claw_machine.values, "1", 0) >= 10;
            },
            
            get_progress_text: function()
            {
                return sprintf("%s: %s/%s", __("Curses"), get_default_struct_value(o_game.data.stats.borb_claw_machine.values, "1", 0), 10);
            },
            
            upgrade_attributes: 
            {
                borb_claw_machine_spawn_chances_curse: 0.1
            }
        }),
        combno: new Challenge(
        {
            name: __("Combno"),
            description: __("Combos are disabled. Collect 100m BLC without any combo multipliers."),
            sprite: spr_icon_combo,
            difficulty: 1,
            
            challenge: function()
            {
                global.game_settings.combo_enabled = false;
                var combo_items = get_shop_items_by_tag(global.shop_item_tags.combo);
                var __array = combo_items;
                var __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    mitem.is_buyable = false;
                }
            },
            
            check: function()
            {
                return global.resources.blc.data.collected_total >= 100000000;
            },
            
            get_progress_text: function()
            {
                return sprintf("%s: %s/%s", __("BLC"), number_format(global.resources.blc.data.collected_total), number_format(100000000));
            },
            
            upgrade_attributes: 
            {
                combo_multiplier_multiplier: 5
            }
        }),
        curse_game_percent: new Challenge(
        {
            name: __("Curse Game%"),
            difficulty: 0,
            description: __s("Clear all curses in the Curse Machine."),
            sprite: spr_icon_cursed_cheese,
            gem_upgrades_enabled: false,
            
            challenge: function()
            {
                global.game_settings.gem_upgrades_enabled = false;
                global.areas.cheese_pub.data.count = 1;
                global.shops.coins.unlock_areas.data.count = 1;
                change_area(global.areas.cheese_pub);
            },
            
            check: function()
            {
                return variable_struct_get(o_game.data.stats.curse_game, "12").won >= 1;
            },
            
            get_progress_text: function()
            {
                var count = 0;
                for (var i = 1; i <= 12; i++)
                {
                    if (get_default_struct_value(o_game.data.stats.curse_game, string(i), 0).won >= 1)
                    {
                        count++;
                    }
                }
                return sprintf("%s: %s/%s", __("Curses"), count, 12);
            },
            
            upgrade_attributes: 
            {
                daily_reward_gems: 4
            }
        }),
        curse_game_percent_lite: new Challenge(
        {
            name: __("Curse Game Lite%"),
            difficulty: -1,
            description: __s("Clear the first %s curses in the Curse Machine.", 6),
            sprite: spr_icon_cursed_cheese,
            gem_upgrades_enabled: false,
            
            challenge: function()
            {
                global.game_settings.gem_upgrades_enabled = false;
                global.areas.cheese_pub.data.count = 1;
                global.shops.coins.unlock_areas.data.count = 1;
                change_area(global.areas.cheese_pub);
            },
            
            check: function()
            {
                return variable_struct_get(o_game.data.stats.curse_game, "6").won >= 1;
            },
            
            get_progress_text: function()
            {
                var count = 0;
                for (var i = 1; i <= 6; i++)
                {
                    if (get_default_struct_value(o_game.data.stats.curse_game, string(i), 0).won >= 1)
                    {
                        count++;
                    }
                }
                return sprintf("%s: %s/%s", __("Curses"), count, 6);
            },
            
            upgrade_attributes: 
            {
                daily_reward_gems: 2
            }
        }),
        f2p: new Challenge(
        {
            name: __("F2P"),
            description: __("Hello, communism! Reach Leaf Tower Level 11."),
            sprite: spr_resource_gem,
            difficulty: 2,
            gem_upgrades_enabled: false,
            
            challenge: function()
            {
                global.game_settings.gem_upgrades_enabled = false;
                var __struct = global.shops.gems;
                var __prop_names = struct_get_names(__struct);
                var __prop_len = array_length(__prop_names);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mkey = __prop_names[__i];
                    var mitem = variable_struct_get(__struct, mkey);
                    mitem.is_buyable = false;
                }
            },
            
            check: function()
            {
                return global.areas.tower.data.highest_floor >= 11;
            },
            
            get_progress_text: function()
            {
                return sprintf("%s: %s/%s", __("Floor"), global.areas.tower.data.highest_floor, 11);
            },
            
            upgrade_attributes: 
            {
                daily_reward_gems: 10
            }
        }),
        fishing: new Challenge(
        {
            name: __("Fishing"),
            description: __("The Old Man and the Sea.") + "\n" + __s("Catch %s fish.", 100),
            sprite: spr_fish_aquazure,
            difficulty: 0,
            
            challenge: function()
            {
                global.game_settings.fishing_lure_value = 0.01;
                global.game_settings.fishing_wait_duration = 3;
                global.game_settings.unlocked.fishing = true;
            },
            
            check: function()
            {
                return o_game.data.stats.fish_caught >= 100;
            },
            
            get_progress_text: function()
            {
                return sprintf("%s: %s/%s", __("Fish caught"), o_game.data.stats.fish_caught, 100);
            },
            
            upgrade_attributes: 
            {
                fishing_xp_multiplier: 0.15
            },
            is_unlocked: is_unlocked_fishing
        }),
        hands_only: new Challenge(
        {
            name: __("Hands Only"),
            description: __("Everyone in the world bought tools to blow the leaves out of their gardens, so there's no tool available for you anymore. Perform a Big Leaf Crunch with Your Hands only to complete this challenge."),
            sprite: spr_icon_hands,
            difficulty: 0,
            
            challenge: function()
            {
                var __struct = global.shops.weapons;
                var __prop_names = struct_get_names(__struct);
                var __prop_len = array_length(__prop_names);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mkey = __prop_names[__i];
                    var mitem = variable_struct_get(__struct, mkey);
                    mitem.is_buyable = false;
                }
            },
            
            check: function()
            {
                return o_game.data.stats.prestige_crunch > 0;
            },
            
            get_progress_text: function()
            {
                return sprintf("%s: %s/%s", __("BLC"), o_game.data.stats.prestige_crunch, 1);
            },
            
            upgrade_attributes: 
            {
                reduce_upgrade_prices: 0.05
            }
        }),
        harbor_hustle: new Challenge(
        {
            name: __("Harbor Hustle"),
            description: __s("Ship happens! Complete %s shipments at the Industrial Harbor.", 10),
            sprite: spr_icon_ship,
            difficulty: 1,
            gem_upgrades_enabled: false,
            start_shop_items: 
            {
                leaves: 
                {
                    fertilizer: 50
                },
                harbor: 
                {
                    fertilizer: -1,
                    harbor_jobs_refresh_max_count: -1,
                    harbor_jobs_max_count: 1,
                    harbor_container_auto_add_job_leaves: 1,
                    harbor_jobs_auto_start: 1,
                    harbor_jobs_auto_claim: 1,
                    harbor_jobs_auto_refresh: 1,
                    unlock_harbor_diver: 1
                },
                plasma: 
                {
                    unlock_industrial_harbor: 1
                }
            },
            
            challenge: function()
            {
                global.game_settings.converters_enabled = false;
                global.game_settings.custom_leaf_spawn_settings.enabled = true;
                global.game_settings.custom_leaf_spawn_settings.count = global.max_leaves;
                global.game_settings.harbor_diver_find_water_crystal_chance = 0.1;
                global.game_settings.harbor_jobs_duration = sec(5);
                global.game_settings.harbor_jobs_refresh_duration = sec(5);
                global.game_settings.harbor_ships_travel_duration = sec(30);
                global.game_settings.unlocked.tools = true;
                unlock_harbor();
                change_area(global.areas.industrial_harbor);
            },
            
            start_challenge: function()
            {
                global.shops.weapons.strange_blower.data.count = 1;
                change_blower(global.shops.weapons.strange_blower);
            },
            
            check: function()
            {
                var required_shipments = 10;
                return get_default_struct_value(o_game.data.harbor, "shipments_completed", 0) >= required_shipments;
            },
            
            get_progress_text: function()
            {
                return sprintf("%s: %s/%s", __s("Shipments completed"), get_default_struct_value(o_game.data.harbor, "shipments_completed", 0), 10);
            },
            
            upgrade_attributes: 
            {
                harbor_jobs_reward_multiplier: 0.25,
                harbor_ship_reward_multiplier: 0.25,
                harbor_ship_xp_multiplier: 0.5
            }
        }),
        infertile_grounds: new Challenge(
        {
            name: __("Infertile Grounds"),
            description: __("The Farmer Gang went on a strike, no seeds for anyone! Reach Leaf Tower Level 15 without the Farming Certificate."),
            sprite: spr_icon_farming,
            difficulty: 2,
            
            challenge: function()
            {
                global.game_settings.seeds_enabled = false;
                var disable_items = get_shop_items_by_tag(global.shop_item_tags.farming);
                var __array = disable_items;
                var __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    mitem.is_buyable = false;
                }
            },
            
            check: function()
            {
                return global.areas.tower.data.highest_floor >= 15;
            },
            
            get_progress_text: function()
            {
                return sprintf("%s: %s/%s", __("Floor"), global.areas.tower.data.highest_floor, 15);
            },
            
            upgrade_attributes: 
            {
                seed_spawn_chance: 0.03
            }
        }),
        obsidian_pct: new Challenge(
        {
            name: __("Obsidian%"),
            difficulty: -1,
            description: __s("Merge, merge, merge! Get %s Obsidian Leaves.", 21),
            sprite: spr_leaf_obsidian,
            gem_upgrades_enabled: false,
            
            challenge: function()
            {
                global.game_settings.area_menu_unlocked = true;
                global.game_settings.blower_base_power = 2500;
                global.game_settings.gem_upgrades_enabled = false;
                global.artifacts.water_seal.data.count = 1;
                global.areas.antarctica.data.count = 1;
                global.areas.hidden_sea.data.count = 1;
                global.areas.hidden_sea.hp_drain = 0;
                global.resources.obsidian.data.unlocked = true;
                global.resources.lava.data.unlocked = true;
                global.resources.ice.data.unlocked = true;
                global.shops.lava.fertilizer.data.count = global.shops.lava.fertilizer.max_count;
                global.shops.ice.fertilizer.data.count = global.shops.ice.fertilizer.max_count;
                change_area(global.areas.hidden_sea);
            },
            
            check: function()
            {
                return global.resources.obsidian.data.count >= 21;
            },
            
            get_progress_text: function()
            {
                return sprintf("%s: %s/%s", __("Obsidian Leaves"), global.resources.obsidian.data.count, 21);
            },
            
            upgrade_attributes: 
            {
                leaf_merge_count_add: 2,
                leaf_merge_range: 20
            }
        }),
        petless: new Challenge(
        {
            name: __("Petless"),
            description: __("No pets, no fun. Collect 100m Benitoite Leaves in total to complete this challenge."),
            sprite: spr_pet_dog,
            difficulty: 2,
            
            challenge: function()
            {
                global.shops.blc.unlock_pets.is_buyable = false;
            },
            
            check: function()
            {
                return global.resources.benitoite.data.collected_total >= 100000000;
            },
            
            get_progress_text: function()
            {
                return sprintf("%s: %s/%s", __("Benitoite Leaves"), number_format(global.resources.benitoite.data.collected_total), number_format(100000000));
            },
            
            upgrade_attributes: 
            {
                max_pets: 1
            }
        }),
        printer_maintenance: new Challenge(
        {
            name: __("Printer Maintenance"),
            description: __("Your leaf printers broke down for the third time this week. AGAIN. Reach Leaf Tower Level 21 without any printers to complete this challenge."),
            sprite: spr_icon_printer,
            difficulty: 2,
            
            challenge: function()
            {
                global.shops.coins.unlock_printers.is_buyable = false;
                global.game_settings.printers_enabled = false;
                var disable_items = get_shop_items_by_tag(global.shop_item_tags.printer);
                var __array = disable_items;
                var __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    mitem.is_buyable = false;
                }
            },
            
            check: function()
            {
                return global.areas.tower.data.highest_floor >= 21;
            },
            
            get_progress_text: function()
            {
                return sprintf("%s: %s/%s", __("Floor"), global.areas.tower.data.highest_floor, 21);
            },
            
            upgrade_attributes: 
            {
                printer_multiplier: 100
            }
        }),
        quarantine: new Challenge(
        {
            name: __("Quarantine"),
            description: __("You won't be able to leave home due to a dangerous leaf virus. Perform a Big Leaf Crunch to complete this challenge."),
            sprite: spr_icon_house,
            difficulty: 0,
            
            challenge: function()
            {
                global.shops.coins.unlock_areas.is_buyable = false;
            },
            
            check: function()
            {
                return o_game.data.stats.prestige_crunch > 0;
            },
            
            get_progress_text: function()
            {
                return sprintf("%s: %s/%s", __("BLC"), o_game.data.stats.prestige_crunch, 1);
            },
            
            upgrade_attributes: 
            {
                damage_resistance: 0.1
            }
        }),
        speed_crunch: new Challenge(
        {
            name: __("Speedblower Revolution"),
            difficulty: 1,
            description: __("No time to explain: perform a Big Leaf Crunch within 20 seconds after a Big Leaf Crunch."),
            sprite: spr_icon_portal_leaf_crunch,
            gem_upgrades_enabled: false,
            
            challenge: function()
            {
                global.game_settings.gem_upgrades_enabled = false;
                var __struct = global.shops.gems;
                var __prop_names = struct_get_names(__struct);
                var __prop_len = array_length(__prop_names);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mkey = __prop_names[__i];
                    var mitem = variable_struct_get(__struct, mkey);
                    mitem.is_buyable = false;
                }
            },
            
            check: function()
            {
                if (variable_struct_get(o_game.data.stats.prestige_time_fastest, global.prestige_levels.blc.level) == -1)
                {
                    return false;
                }
                if (o_game.data.stats.prestige_crunch < 2)
                {
                    return false;
                }
                return variable_struct_get(o_game.data.stats.prestige_time_fastest, global.prestige_levels.blc.level) <= sec(20);
            },
            
            get_progress_text: function()
            {
                var fastest = variable_struct_get(o_game.data.stats.prestige_time_fastest, global.prestige_levels.blc.level);
                if (fastest == -1)
                {
                    return __("No BLC yet");
                }
                return sprintf("%s: %s/%s", __("Fastest BLC"), format_time(secr(fastest)), format_time(20));
            },
            
            upgrade_attributes: 
            {
                autocrunch_timer_reduced: 15
            }
        }),
        speedrun_official_any_prestige: new Challenge(
        {
            name: __("Speedblower Prestige%"),
            difficulty: -1,
            description: __("Official speedrun challenge: fastest prestige. Offline rewards are enabled."),
            sprite: spr_icon_portal,
            gem_upgrades_enabled: false,
            
            challenge: function()
            {
                global.game_settings.gem_upgrades_enabled = false;
                var __struct = global.shops.gems;
                var __prop_names = struct_get_names(__struct);
                var __prop_len = array_length(__prop_names);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mkey = __prop_names[__i];
                    var mitem = variable_struct_get(__struct, mkey);
                    mitem.is_buyable = false;
                }
            },
            
            check: function()
            {
                if (variable_struct_get(o_game.data.stats.prestige_time_fastest, global.prestige_levels.prestige.level) == -1)
                {
                    return false;
                }
                return true;
            },
            
            get_progress_text: function()
            {
                var fastest = variable_struct_get(o_game.data.stats.prestige_time_fastest, global.prestige_levels.prestige.level);
                if (fastest == -1)
                {
                    return __("No Prestige yet");
                }
                return sprintf("%s: %s", __("Fastest Prestige"), format_time(secr(fastest)));
            },
            
            upgrade_attributes: 
            {
                blc_value_multiplier: 0.25
            }
        }),
        speedrun_official_any_prestige_online: new Challenge(
        {
            name: __("Speedblower Prestige% Online"),
            difficulty: -1,
            description: __("Official speedrun challenge: fastest prestige. Offline rewards are disabled."),
            sprite: spr_icon_portal,
            gem_upgrades_enabled: false,
            
            challenge: function()
            {
                global.game_settings.gem_upgrades_enabled = false;
                global.game_settings.offline_rewards_enabled = false;
                var __struct = global.shops.gems;
                var __prop_names = struct_get_names(__struct);
                var __prop_len = array_length(__prop_names);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mkey = __prop_names[__i];
                    var mitem = variable_struct_get(__struct, mkey);
                    mitem.is_buyable = false;
                }
            },
            
            check: function()
            {
                if (variable_struct_get(o_game.data.stats.prestige_time_fastest, global.prestige_levels.prestige.level) == -1)
                {
                    return false;
                }
                return true;
            },
            
            get_progress_text: function()
            {
                var fastest = variable_struct_get(o_game.data.stats.prestige_time_fastest, global.prestige_levels.prestige.level);
                if (fastest == -1)
                {
                    return __("No Prestige yet");
                }
                return sprintf("%s: %s", __("Fastest Prestige"), format_time(secr(fastest)));
            },
            
            upgrade_attributes: 
            {
                blc_value_multiplier: 0.25
            }
        }),
        speedrun_official_any_prestige_online_combo: new Challenge(
        {
            name: __("Speedblower Prestige% Online Combo"),
            difficulty: -1,
            description: __("Official speedrun challenge: fastest prestige. Offline rewards are disabled, combo is enabled."),
            sprite: spr_icon_portal,
            gem_upgrades_enabled: false,
            
            challenge: function()
            {
                global.game_settings.gem_upgrades_enabled = false;
                global.game_settings.offline_rewards_enabled = false;
                var __struct = global.shops.gems;
                var __prop_names = struct_get_names(__struct);
                var __prop_len = array_length(__prop_names);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mkey = __prop_names[__i];
                    var mitem = variable_struct_get(__struct, mkey);
                    mitem.is_buyable = false;
                }
                global.shops.gold.combo.data.count = 1;
                global.shops.gold.combo_max.data.count = 10;
            },
            
            check: function()
            {
                if (variable_struct_get(o_game.data.stats.prestige_time_fastest, global.prestige_levels.prestige.level) == -1)
                {
                    return false;
                }
                return true;
            },
            
            get_progress_text: function()
            {
                var fastest = variable_struct_get(o_game.data.stats.prestige_time_fastest, global.prestige_levels.prestige.level);
                if (fastest == -1)
                {
                    return __("No Prestige yet");
                }
                return sprintf("%s: %s", __("Fastest Prestige"), format_time(secr(fastest)));
            },
            
            upgrade_attributes: 
            {
                blc_value_multiplier: 0.25
            }
        }),
        speedrun_official_any_blc: new Challenge(
        {
            name: __("Speedblower BLC%"),
            difficulty: 0,
            description: __("Official speedrun challenge: fastest BLC. Offline rewards are enabled."),
            sprite: spr_icon_portal_leaf_crunch,
            gem_upgrades_enabled: false,
            
            challenge: function()
            {
                global.game_settings.gem_upgrades_enabled = false;
                var __struct = global.shops.gems;
                var __prop_names = struct_get_names(__struct);
                var __prop_len = array_length(__prop_names);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mkey = __prop_names[__i];
                    var mitem = variable_struct_get(__struct, mkey);
                    mitem.is_buyable = false;
                }
            },
            
            check: function()
            {
                if (variable_struct_get(o_game.data.stats.prestige_time_fastest, global.prestige_levels.blc.level) == -1)
                {
                    return false;
                }
                return true;
            },
            
            get_progress_text: function()
            {
                var fastest = variable_struct_get(o_game.data.stats.prestige_time_fastest, global.prestige_levels.blc.level);
                if (fastest == -1)
                {
                    return __("No BLC yet");
                }
                return sprintf("%s: %s", __("Fastest BLC"), format_time(secr(fastest)));
            },
            
            upgrade_attributes: 
            {
                blc_value_multiplier: 25
            }
        }),
        speedrun_official_any_blc_online: new Challenge(
        {
            name: __("Speedblower BLC% Online"),
            difficulty: 0,
            description: __("Official speedrun challenge: fastest BLC. Offline rewards are disabled."),
            sprite: spr_icon_portal_leaf_crunch,
            gem_upgrades_enabled: false,
            
            challenge: function()
            {
                global.game_settings.gem_upgrades_enabled = false;
                global.game_settings.offline_rewards_enabled = false;
                var __struct = global.shops.gems;
                var __prop_names = struct_get_names(__struct);
                var __prop_len = array_length(__prop_names);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mkey = __prop_names[__i];
                    var mitem = variable_struct_get(__struct, mkey);
                    mitem.is_buyable = false;
                }
            },
            
            check: function()
            {
                if (variable_struct_get(o_game.data.stats.prestige_time_fastest, global.prestige_levels.blc.level) == -1)
                {
                    return false;
                }
                return true;
            },
            
            get_progress_text: function()
            {
                var fastest = variable_struct_get(o_game.data.stats.prestige_time_fastest, global.prestige_levels.blc.level);
                if (fastest == -1)
                {
                    return __("No BLC yet");
                }
                return sprintf("%s: %s", __("Fastest BLC"), format_time(secr(fastest)));
            },
            
            upgrade_attributes: 
            {
                blc_value_multiplier: 25
            }
        }),
        speedrun_official_any_blc_online_combo: new Challenge(
        {
            name: __("Speedblower BLC% Online Combo"),
            difficulty: 0,
            description: __("Official speedrun challenge: fastest BLC. Offline rewards are disabled, combo is enabled."),
            sprite: spr_icon_portal_leaf_crunch,
            gem_upgrades_enabled: false,
            
            challenge: function()
            {
                global.game_settings.gem_upgrades_enabled = false;
                global.game_settings.offline_rewards_enabled = false;
                var __struct = global.shops.gems;
                var __prop_names = struct_get_names(__struct);
                var __prop_len = array_length(__prop_names);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mkey = __prop_names[__i];
                    var mitem = variable_struct_get(__struct, mkey);
                    mitem.is_buyable = false;
                }
                global.shops.gold.combo.data.count = 1;
                global.shops.gold.combo_max.data.count = 10;
            },
            
            check: function()
            {
                if (variable_struct_get(o_game.data.stats.prestige_time_fastest, global.prestige_levels.blc.level) == -1)
                {
                    return false;
                }
                return true;
            },
            
            get_progress_text: function()
            {
                var fastest = variable_struct_get(o_game.data.stats.prestige_time_fastest, global.prestige_levels.blc.level);
                if (fastest == -1)
                {
                    return __("No BLC yet");
                }
                return sprintf("%s: %s", __("Fastest BLC"), format_time(secr(fastest)));
            },
            
            upgrade_attributes: 
            {
                blc_value_multiplier: 25
            }
        }),
        speedrun_official_any_mlc: new Challenge(
        {
            name: __("Speedblower MLC%"),
            difficulty: 2,
            description: __("Official speedrun challenge: fastest MLC. Offline rewards are enabled without prestige resources."),
            sprite: spr_icon_portal_mlc,
            gem_upgrades_enabled: false,
            
            challenge: function()
            {
                global.game_settings.offline_rewards_prestige_resources = false;
                global.game_settings.gem_upgrades_enabled = false;
                var __struct = global.shops.gems;
                var __prop_names = struct_get_names(__struct);
                var __prop_len = array_length(__prop_names);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mkey = __prop_names[__i];
                    var mitem = variable_struct_get(__struct, mkey);
                    mitem.is_buyable = false;
                }
            },
            
            check: function()
            {
                if (variable_struct_get(o_game.data.stats.prestige_time_fastest, global.prestige_levels.mlc.level) == -1)
                {
                    return false;
                }
                return true;
            },
            
            get_progress_text: function()
            {
                var fastest = variable_struct_get(o_game.data.stats.prestige_time_fastest, global.prestige_levels.mlc.level);
                if (fastest == -1)
                {
                    return __("No MLC yet");
                }
                return sprintf("%s: %s", __("Fastest MLC"), format_time(secr(fastest)));
            },
            
            upgrade_attributes: 
            {
                mlc_value_multiplier: 0.25
            }
        }),
        trader_world: new Challenge(
        {
            name: __("Trader's Crunch"),
            description: __("Trading is fun, trading is life. You traded your converters for a permanent trading certificate. Trade duration and refresh timer are reduced in this challenge. Collect 1m BLC without any converters."),
            sprite: spr_icon_trading,
            difficulty: 1,
            
            challenge: function()
            {
                global.shops.coins.unlock_converters.is_buyable = false;
                global.shops.blc.unlock_trading.data.count = 1;
                global.shops.blc.max_trades.data.count = global.shops.blc.max_trades.max_count;
                global.game_settings.converters_enabled = false;
                global.game_settings.trade_duration = sec(10);
                global.game_settings.trade_duration_min = sec(10);
                global.game_settings.trade_refresh_duration = sec(1);
            },
            
            check: function()
            {
                return global.resources.blc.data.collected_total >= 1000000;
            },
            
            get_progress_text: function()
            {
                return sprintf("%s: %s/%s", __("BLC"), number_format(global.resources.blc.data.collected_total), number_format(1000000));
            },
            
            upgrade_attributes: 
            {
                trade_duration_decrease_timer: 0.15
            }
        }),
        world_of_leafcraft: new Challenge(
        {
            name: __("World of Leafcraft"),
            description: __("Crafting is unlocked at the start of the game as well as the Cheesetor pet. You start with 200 Cheese and max Craft Forge and Craft Hammer upgrades in the BLC shop. Clear Leaf Tower Level 100."),
            sprite: spr_icon_crafting,
            difficulty: 2,
            result_start: 
            {
                resources: 
                {
                    cheese: 200
                }
            },
            
            challenge: function()
            {
                global.shops.blc.unlock_crafting.data.count = 1;
                global.shops.blc.unlock_pets.data.count = 1;
                global.shops.blc.craft_level.data.count = get_shop_item_max_count(global.shops.blc.craft_level);
                global.shops.blc.craft_min_chance.data.count = get_shop_item_max_count(global.shops.blc.craft_min_chance);
                global.shops.pets.pet_cheesetor.data.count = 1;
                global.game_settings.craft_leaves_cost = 
                {
                    cheese: 2
                };
            },
            
            check: function()
            {
                return global.areas.tower.data.highest_floor >= 101;
            },
            
            get_progress_text: function()
            {
                return sprintf("%s: %s/%s", __("Floor"), global.areas.tower.data.highest_floor, 101);
            },
            
            upgrade_attributes: 
            {
                craft_min_chance: 5
            }
        })
    };
    load_custom_challenges();
    after_init_challenges();
}

function after_init_challenges()
{
    global.challenges_sorted = [];
    var __struct = global.challenges;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        mitem.key = mkey;
        array_push(global.challenges_sorted, mitem);
    }
    sort_array_by_key(global.challenges_sorted, true);
}

function apply_challenge()
{
    if (!in_challenge())
    {
        exit;
    }
    global.current_challenge = variable_struct_get(global.challenges, global.globalstats.current_challenge_key);
    global.current_challenge._challenge();
    if (!global.current_challenge.data.init)
    {
        global.current_challenge._start_init();
    }
    init_game_vars();
}

function apply_challenge_before_load()
{
    if (!in_challenge())
    {
        exit;
    }
    global.current_challenge = variable_struct_get(global.challenges, global.globalstats.current_challenge_key);
    global.current_challenge._before_load_game();
    reset_shops();
}

function apply_season_challenge()
{
    if (!global.cloud_data.is_season)
    {
        exit;
    }
    var challenge = variable_struct_get(global.challenges, o_season_helper.challenge_key);
    if (!is_struct(challenge))
    {
        if (!is_string(struct_get_from_hash(o_season_helper.challenge_data, variable_get_hash("key"))))
        {
            o_season_helper.challenge_data.key = "__custom_online_challenge";
        }
        challenge = load_custom_challenge(o_season_helper.challenge_data);
    }
    if (is_struct(challenge))
    {
        global.cloud_data.current_challenge = challenge;
        global.current_challenge = challenge;
        challenge._challenge();
        if (!o_game.data.season_challenge_init_done)
        {
            challenge._start_init();
            o_game.data.season_challenge_init_done = true;
        }
    }
    init_game_vars();
}

function check_current_challenge()
{
    if (!in_challenge() && !in_mp_challenge())
    {
        exit;
    }
    if (global.current_challenge.data.current_run_finished || !global.current_challenge._check())
    {
        exit;
    }
    if (mp_is_season() && o_game.data.mp_current_run_finished)
    {
        exit;
    }
    if (mp_is_season())
    {
        open_dialog(gui_item_challenge_requirements, __("Challenge progress"));
    }
    else
    {
        var complete_time = sprintf(__("%s (%s frames)"), format_time(secr(o_game.data.stats.time_elapsed)), o_game.data.stats.time_elapsed);
        resource_dialog(__s("Challenge %s was completed successfully in %s. Well done!\n\nYou can continue playing this challenge or start another one.\n\nYour rewards:", global.current_challenge.name, complete_time), global.current_challenge.get_reward(global.current_challenge.data.finished + 1), "", false, true, 
        {
            title: __("Challenge completed")
        });
    }
    global.current_challenge._complete();
    if (mp_is_season())
    {
        force_save_game_mp();
    }
}

function in_challenge()
{
    if (!variable_global_exists("globalstats"))
    {
        return false;
    }
    return global.globalstats.current_challenge_key != -1 && global.current_profile == global.profile_types.challenge && !is_undefined(variable_struct_get(global.challenges, global.globalstats.current_challenge_key));
}

function in_mp_challenge()
{
    if (!mp_is_season())
    {
        return false;
    }
    return is_struct(struct_get_from_hash(global.cloud_data, variable_get_hash("current_challenge")));
}

function is_any_challenge_active()
{
    return _any(global.challenges, function(arg0)
    {
        return arg0.data.active;
    });
}

function load_custom_challenge(arg0)
{
    var challenge_data = struct_clone(arg0);
    challenge_data.key = sprintf("_cc_%s", arg0.key);
    challenge_data.custom_data = arg0;
    challenge_data.disable_reward = true;
    challenge_data.is_custom_challenge = true;
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("add_data"))))
    {
        apply_struct_to_struct(challenge_data, arg0.add_data);
    }
    var cc = new Challenge(challenge_data);
    if (is_array(cc.requirements))
    {
        cc.quests = create_quests_from_requirements(cc.requirements);
        var quest_text_array = [__("Completion requirements") + ":"];
        cc.description += implode("\n", quest_text_array);
    }
    variable_struct_set(global.challenges, cc.key, cc);
    return cc;
}

function load_custom_challenges()
{
    exit;
    var filename = "custom-challenges.txt";
    if (!file_exists(filename))
    {
        exit;
    }
    var cc_content = get_file_contents(filename);
    try
    {
        var data = json_parse(cc_content);
        if (!is_struct(data))
        {
            return log("invalid json data", cc_content);
        }
        if (!is_array(struct_get_from_hash(data, variable_get_hash("challenges"))))
        {
            return log("invalid custom challenges array");
        }
        var __array = data.challenges;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            load_custom_challenge(mitem);
        }
    }
    catch (err)
    {
        log("invalid data", err);
    }
    after_init_challenges();
}

function load_weekly_challenges()
{
    var filename = "weekly_challenges.json";
    if (!file_exists(filename))
    {
        exit;
    }
    var weekly_challenges = read_json_file(filename);
    if (!is_struct(weekly_challenges))
    {
        exit;
    }
    var challenges = struct_get_from_hash(weekly_challenges, variable_get_hash("challenges"));
    if (!is_array(challenges))
    {
        exit;
    }
    var challenge_week = real(struct_get_from_hash(weekly_challenges, variable_get_hash("week")));
    log("challenge week?");
    if (is_numeric(challenge_week))
    {
        var current_date = get_time_object_from_datetime();
        log("check week", challenge_week, get_week_from_date());
        if (challenge_week != get_week_from_date())
        {
            file_delete(filename);
            exit;
        }
    }
    var __array = challenges;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        mitem.category = "weekly";
        load_custom_challenge(mitem);
    }
}

function not_in_challenge()
{
    return !in_challenge();
}

function refresh_weekly_challenges()
{
    var refresh_timeout_name = "refresh_online_challenges";
    if (has_timeout(refresh_timeout_name))
    {
        exit;
    }
    post_to_cloud("misc", "get_weekly_challenge", undefined, function(arg0)
    {
        log("got weekly challenges", arg0);
        var challenges = get_default_struct_value(arg0, "challenges", undefined);
        if (!is_array(challenges))
        {
            exit;
        }
        save_string_to_file(json_stringify(arg0), "weekly_challenges.json");
        load_weekly_challenges();
    });
    set_timeout(refresh_timeout_name, iif(global.debug, sec(10), sec(60)));
}
