function init_shop_gems()
{
    global.shops_prestige_levels.gems = global.prestige_levels.inf;
    global.shops_resources.gems = global.resources.gems;
    var shop_resource = global.resources.gems;
    global.shops.gems = 
    {
        keep_blower_after_prestige: 
        {
            index: -10,
            name: __("It's mine!"),
            description: __("Keep all of your bought tools permanently."),
            sprite: spr_weapon_leaf_blower,
            cost: 
            {
                gems: 75
            },
            max_count: 1
        },
        leaf_multiplier_all: build_shop_item("leaf_multiplier_all", global.resources.gems, 10, 
        {
            base_cost: 75,
            value: 7.5
        }),
        prestige_coins_multiplier: build_shop_item("prestige_coins_multiplier", shop_resource, 30, 
        {
            name: __("Prestige Coins x3"),
            description: __("Increase your prestige coin rewards x3."),
            sprite: spr_gold,
            base_cost: 150,
            upgrade_attributes: 
            {
                prestige_value_multiplier_adder: 2
            },
            max_count: 1
        }),
        prestige_blc_multiplier: build_shop_item("prestige_blc_multiplier", shop_resource, 40, 
        {
            name: __("BLC Coins x3"),
            description: __("Increase your BLC coin rewards x3."),
            sprite: spr_blc,
            base_cost: 250,
            upgrade_attributes: 
            {
                blc_gems_upgrade: 2
            },
            max_count: 1,
            
            is_obfuscated: function()
            {
                return o_game.data.stats.prestige < 1;
            }
        }),
        prestige_mlc_multiplier: build_shop_item("prestige_mlc_multiplier", shop_resource, 41, 
        {
            name: __("MLC Coins x3"),
            description: __("Increase your MLC coin rewards x3."),
            sprite: spr_mlc,
            base_cost: 350,
            upgrade_attributes: 
            {
                mlc_gems_upgrade: 2
            },
            max_count: 1,
            
            is_obfuscated: function()
            {
                return o_game.data.stats.prestige_crunch < 1;
            }
        }),
        prestige_ulc_multiplier: build_shop_item("prestige_ulc_multiplier", shop_resource, 42, 
        {
            name: __("ULC Coins x3"),
            description: __("Increases your ULC coin rewards x3."),
            sprite: spr_ulc,
            base_cost: 44444,
            upgrade_attributes: 
            {
                ulc_gems_upgrade: 2
            },
            max_count: 1,
            
            is_obfuscated: function()
            {
                return o_game.data.stats.prestige_ulc < 1;
            }
        }),
        prestige_speed: build_shop_item("prestige_speed", shop_resource, 45, 
        {
            name: __("Speedstige"),
            description: __s("Reduces the prestige animation to %s.", format_time(1, false, false)),
            sprite: spr_icon_portal,
            base_cost: 750,
            max_count: 1,
            is_toggle: true
        }),
        converters_upgrade: 
        {
            index: 200,
            name: __("Converters Output +300%"),
            description: __("Increase the Converter output rewards by +300%."),
            sprite: spr_icon_converters,
            cost: 
            {
                gems: 150
            },
            upgrade_attributes: 
            {
                converter_output_multiplier_global: 3
            },
            max_count: 1
        },
        converters_static_upgrade: 
        {
            index: 201,
            name: __("Converters Static Output +400%"),
            description: __("Increase the Converter static output rewards by +400%."),
            sprite: spr_icon_converters,
            cost: 
            {
                gems: 300
            },
            upgrade_attributes: 
            {
                converter_output_static_multiplier_global: 4
            },
            max_count: 1
        },
        converters_safe_energy_storage: 
        {
            index: 202,
            name: __("Safe Energy Converters"),
            description: __("Don't waste anything! With this upgrade, energy converters will only convert if the max storage doesn't exceed."),
            sprite: spr_icon_converters,
            cost: 
            {
                gems: 555
            },
            
            is_obfuscated: function()
            {
                return global.resources.blc.data.collected_total == 0;
            },
            
            max_count: 1,
            is_toggle: true
        },
        fruit_value_multiplier: 
        {
            index: 220,
            name: __("Ultra Fruits"),
            description: __("Increase all fruit rewards by +800%."),
            sprite: spr_fruit,
            cost: 
            {
                gems: 100
            },
            upgrade_attributes: 
            {
                fruit_value_multiplier: 8
            },
            max_count: 1
        },
        seed_spawn_rate: 
        {
            index: 230,
            name: __("More Seeds"),
            description: __("Increases seed spawn chance by 3%."),
            sprite: spr_seed_leaf,
            cost: 
            {
                gems: 250
            },
            upgrade_attributes: 
            {
                seed_spawn_chance: 0.03
            },
            max_count: 1
        },
        artifact_spawn_time: build_shop_item("faster_artifacts", global.resources.gems, 241, 
        {
            base_cost: 500,
            max_count: 1,
            value: 0.3
        }),
        artifact_spawn_time_multiplier: 
        {
            index: 242,
            name: __("Super Durable Artifacts"),
            description: __("Increases expire duration of Artifacts by 500%."),
            sprite: spr_artifact_orb,
            cost: 
            {
                gems: 500
            },
            upgrade_attributes: 
            {
                artifact_expire_duration_multiplier: 5
            },
            max_count: 1
        },
        artifact_event_max_count: build_shop_item("artifact_event_max_count", global.resources.gems, 243, 
        {
            name: __("Event Artifacts Storage"),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_artifact_orb,
            base_cost: 1500,
            max_count: 5,
            upgrade_attributes: 
            {
                artifact_max_count_add_event: 1
            }
        }),
        trade_refresh_decrease_timer: build_shop_item("trade_refresh_decrease_timer", global.resources.gems, 300, 
        {
            base_cost: 200,
            max_count: 1,
            value: 0.25
        }),
        max_trades: build_shop_item("max_trades", global.resources.gems, 301, 
        {
            base_cost: 300,
            cost_exp: 1.5,
            max_count: 3,
            value: 1
        }),
        better_unique_leaves: build_shop_item("better_unique_leaves", global.resources.gems, 410, 
        {
            base_cost: 500,
            max_count: 1,
            value: 0.3
        }),
        free_borb_taxi: 
        {
            index: 500,
            name: __("Buy Borb Taxi Ltd."),
            description: __("Purchase Borb Taxi Ltd. so your Borb Taxi will be free forever."),
            sprite: spr_borb,
            cost: 
            {
                gems: 300
            },
            max_count: 1,
            
            is_obfuscated: function()
            {
                return global.areas.tower.data.highest_floor_stats <= 1;
            }
        },
        alb_tower: 
        {
            index: 510,
            name: __("ALB Outsourcing"),
            description: __("You can bring your ALBs to The Leaf Tower permanently."),
            sprite: spr_autoblower,
            cost: 
            {
                gems: 400
            },
            max_count: 1,
            upgrade_attributes: 
            {
                alb_tower: 1
            },
            
            buy_after: function()
            {
                init_game_vars();
                create_autoblowers();
            },
            
            is_obfuscated: function()
            {
                return global.areas.tower.data.highest_floor_stats <= 1;
            }
        },
        crunchy_tower: 
        {
            index: 520,
            name: __("Crunchy Tower"),
            description: sprintf(__("Don't rebuild everything! Increases tower start floor by %s per level. This doesn't exceed your highest tower floor."), 500),
            description_locked: sprintf(__("Reach Tower Floor %s to unlock."), 500),
            sprite: spr_icon_tower_floor,
            cost: 
            {
                gems: 300
            },
            cost_exp: 1.2,
            max_count: 10,
            upgrade_attributes: 
            {
                tower_floor_persist: 500
            },
            
            is_obfuscated: function()
            {
                return global.areas.tower.data.highest_floor_stats < 500;
            }
        },
        blazing_skull_tower: 
        {
            index: 530,
            name: __("Blazing Tower Skull"),
            description: __("The Blazing Skull artifact can be used in The Leaf Tower. Come at me, yo!"),
            description_locked: __s("Reach Tower Floor %s to unlock.", 666),
            sprite: spr_icon_tower_floor,
            cost: 
            {
                gems: 666
            },
            max_count: 1,
            
            is_obfuscated: function()
            {
                return global.areas.tower.data.highest_floor_stats < 666;
            }
        },
        skip_tower_floor_bosses: 
        {
            index: 540,
            name: __("Skippable Tower Bosses"),
            description: __("Tower bosses can be skipped when skipping tower floors. Look at those easy boss fights."),
            description_locked: __s("Reach Tower Floor %s to unlock.", 1000),
            sprite: spr_icon_tower_floor,
            cost: 
            {
                gems: 850
            },
            max_count: 1,
            is_toggle: true,
            
            is_obfuscated: function()
            {
                return global.areas.tower.data.highest_floor_stats < 1000;
            }
        },
        autoloot_tower_gem_leaves: 
        {
            index: 550,
            name: __("Autoloot Gem Leaves"),
            description: __("All dropped gem leaves will be auto-looted after a tower boss was defeated."),
            description_locked: __s("Reach Tower Floor %s to unlock.", 1500),
            sprite: spr_icon_tower_floor,
            cost: 
            {
                gems: 500
            },
            max_count: 1,
            is_toggle: true,
            
            is_obfuscated: function()
            {
                return global.areas.tower.data.highest_floor_stats < 1500;
            }
        },
        material_daily_shipment: 
        {
            index: 600,
            name: __("Daily Material Shipment"),
            description: __("Get a daily shipment of materials. The shipment contains 50 of all spawnable materials each level. Collected with the daily reward."),
            sprite: spr_material_copper_bar,
            cost: 
            {
                gems: 300
            },
            cost_exp: 1.15,
            max_count: 5,
            
            is_obfuscated: function()
            {
                return get_upgrade_count(global.shops.blc.unlock_materials) == 0;
            },
            
            upgrade_attributes: 
            {
                daily_reward_materials: 50
            }
        },
        daily_quest_expansion: 
        {
            index: 601,
            name: __("Daily Quest Expansion"),
            description: __s("Increase your daily quest count by %s.", 2),
            sprite: spr_icon_calendar,
            cost: 
            {
                gems: 1500
            },
            max_count: 1,
            upgrade_attributes: 
            {
                daily_quest_slots: 2
            }
        },
        daily_quest_auto_claim: 
        {
            index: 602,
            name: __("Daily Quest Auto Claim"),
            description: __("Daily quests will be finished automatically if requirements are met."),
            sprite: spr_icon_check,
            cost: 
            {
                gems: 1500
            },
            max_count: 1
        },
        material_magnet: 
        {
            index: 610,
            name: __("Material Magnet"),
            description: __("Materials will automatically move towards you."),
            sprite: spr_material_copper_bar,
            cost: 
            {
                gems: 650
            },
            max_count: 1,
            
            is_obfuscated: function()
            {
                return get_upgrade_count(global.shops.blc.unlock_materials) == 0;
            }
        },
        material_finder: build_shop_item("material_finder", shop_resource, 615, 
        {
            base_cost: 400,
            max_count: 1,
            value: 1,
            upgrade_attribute_key: "material_spawn_chance_multiplier_gems"
        }),
        material_storage_inc: build_shop_item("material_storage_inc", shop_resource, 620, 
        {
            base_cost: 250,
            cost_exp: 2,
            max_count: 5,
            value: 500
        }),
        dig_item_chance_reduction: build_shop_item("dig_item_chance_reduction", shop_resource, 700, 
        {
            base_cost: 600,
            max_count: 1,
            value: 0.2
        }),
        dig_count_multiplier: build_shop_item("dig_count_multiplier", shop_resource, 710, 
        {
            base_cost: 500,
            max_count: 1,
            value: 1
        }),
        dig_reduce_timeout: build_shop_item("dig_reduce_timeout", shop_resource, 720, 
        {
            base_cost: 300,
            max_count: 1,
            value: 0.25
        }),
        dig_auto: 
        {
            index: 730,
            name: __("Auto Dig Bot"),
            description: __("This bot digs automatically for you. Hooray for automation! Also comes with a free dig magnet."),
            sprite: spr_weapon_shovel,
            cost: 
            {
                gems: 400
            },
            is_toggle: true,
            max_count: 1,
            
            is_obfuscated: function()
            {
                return global.shops.weapons.shovel.data.collected == 0;
            },
            
            upgrade_attributes: 
            {
                dig_auto: 1
            }
        },
        dig_auto_decrease_delay: 
        {
            index: 740,
            name: __("Faster Auto Dig Bot"),
            description: sprintf(__("Each upgrade decreases the auto dig bot's delay by %s."), format_time(1)),
            sprite: spr_weapon_shovel,
            cost: 
            {
                gems: 100
            },
            cost_exp: 1.05,
            max_count: 10,
            
            is_obfuscated: function()
            {
                return get_upgrade_count(global.shops.gems.dig_auto) == 0;
            },
            
            upgrade_attributes: 
            {
                dig_auto_decrease_delay: 1
            }
        },
        auto_slap: 
        {
            index: 750,
            name: __("Auto Slap Bot"),
            description: __("This bot slaps automatically for you. Hooray for autoslaption!"),
            sprite: spr_weapon_trout,
            cost: 
            {
                gems: 400
            },
            is_toggle: true,
            max_count: 1,
            
            is_obfuscated: function()
            {
                return global.shops.weapons.trout.data.collected == 0;
            },
            
            upgrade_attributes: 
            {
                auto_slap: 1
            }
        },
        auto_slap_decrease_delay: 
        {
            index: 751,
            name: __("Faster Auto Slap Bot"),
            description: sprintf(__("Each upgrade decreases the auto slap bot's delay by %s."), format_time(1)),
            sprite: spr_weapon_trout,
            cost: 
            {
                gems: 100
            },
            cost_exp: 1.05,
            max_count: 10,
            
            is_obfuscated: function()
            {
                return get_upgrade_count(global.shops.gems.auto_slap) == 0;
            },
            
            upgrade_attributes: 
            {
                auto_slap_decrease_delay: 1
            }
        },
        alchemy_brew_crit_chance: build_shop_item("alchemy_brew_crit_chance", shop_resource, 800, 
        {
            base_cost: 300,
            cost_exp: 1.25,
            max_count: 5,
            value: 0.01
        }),
        alchemy_brew_time_reduction: build_shop_item("alchemy_brew_time_reduction", shop_resource, 810, 
        {
            base_cost: 200,
            cost_exp: 1.1,
            max_count: 10,
            value: 0.02
        }),
        leafscender_decrease_input_cost: build_shop_item("leafscender_decrease_input_cost", shop_resource, 850, 
        {
            base_cost: 350,
            cost_exp: 1.25,
            max_count: 5,
            value: 1
        }),
        relics_magnet: 
        {
            index: 860,
            name: __("Relics Magnet"),
            description: __("Dropped Relics will automatically move towards you."),
            sprite: spr_relic_uncommon,
            cost: 
            {
                gems: 350
            },
            max_count: 1,
            
            is_obfuscated: function()
            {
                return !is_unlocked_relics();
            }
        },
        craft_improve_rng: 
        {
            index: 900,
            name: __("Craft RNG Manipulator"),
            description: __("Rerolling Crafted Leaves' quality will always improve. Can be toggled."),
            sprite: spr_icon_crafting,
            cost: 
            {
                gems: 250
            },
            max_count: 1,
            is_toggle: true,
            
            is_obfuscated: function()
            {
                return !is_unlocked_crafting();
            }
        },
        persistent_autocraft_leaves: 
        {
            index: 901,
            name: __("Craft ALB"),
            description: __s("Hires an ALB to craft leaves for you but it's %s slower. Autocraft has to be enabled in the crafting menu.", number_format_percent(global.game_settings.autocraft_delay_alb)),
            sprite: spr_icon_crafting,
            cost: 
            {
                gems: 999
            },
            max_count: 1,
            is_toggle: true,
            
            is_obfuscated: function()
            {
                return !is_unlocked_crafting();
            }
        },
        autocraft_delay_reduction: build_shop_item("autocraft_delay_reduction", shop_resource, 905, 
        {
            base_cost: 400,
            cost_exp: 1.25,
            max_count: 3,
            value: 0.15
        }),
        craft_autofuse: 
        {
            index: 2000,
            name: __("Autofuse Crafted Leaves"),
            description: __("Enables automatic fusion of Crafted Leaves. Autofusion doesn't select locked leaves."),
            sprite: spr_icon_crafting,
            cost: 
            {
                gems: 300
            },
            max_count: 1,
            
            is_obfuscated: function()
            {
                return !is_unlocked_fusion_shards();
            }
        },
        loadout_sets_size: 
        {
            index: 2100,
            name: __("More Loadout Sets"),
            description: sprintf(__("Increases the number of loadout sets by %s per level."), 1),
            sprite: spr_icon_bot,
            cost: 
            {
                gems: 200
            },
            cost_exp: 1.2,
            max_count: 5,
            
            is_obfuscated: function()
            {
                return get_upgrade_count(global.shops.blc.autobuy_priority) == 0;
            },
            
            upgrade_attributes: 
            {
                loadout_sets_size: 1
            }
        },
        craft_sets_size: build_shop_item("craft_sets_size", shop_resource, 2101, 
        {
            base_cost: 100,
            cost_exp: 1.2,
            max_count: 5
        }),
        show_boss_area_timer: 
        {
            index: 4000,
            name: __("Boss Timer"),
            description: __("Show boss spawn timers in the area description. Also adds an overview to show boss timers in the right navigation bar."),
            sprite: spr_flag,
            cost: 
            {
                gems: 150
            },
            is_toggle: true,
            
            is_obfuscated: function()
            {
                return global.areas.kokkaupunki_cursed.data.count == 0;
            }
        },
        area_enemies_decrease_pyramid: build_shop_item("area_enemies_decrease", shop_resource, 5010, 
        {
            max_count: 5,
            value: 1,
            base_cost: 300,
            cost_exp: 1.5,
            area_key: global.areas.inner_pyramid.key
        }),
        auto_boosters: build_shop_item("auto_boosters", shop_resource, 5100, 
        {
            name: __s("Auto %s", __("Boosters")),
            description: __("Activates boosters automatically."),
            sprite: spr_icon_rocket,
            max_count: 1,
            value: 1,
            base_cost: 750,
            
            is_obfuscated: function()
            {
                return !is_unlocked_boosters();
            }
        }),
        cards_magnet: 
        {
            index: 6000,
            name: __("Cards Magnet"),
            description: __("Dropped Cards will automatically move towards you."),
            sprite: spr_card_common,
            cost: 
            {
                gems: 350
            },
            max_count: 1,
            
            is_obfuscated: function()
            {
                return !is_unlocked_cards();
            }
        },
        cards_enemy_drop_chance: build_shop_item("cards_enemy_drop_chance", shop_resource, 6010, 
        {
            base_cost: 750,
            cost_exp: 1.25,
            max_count: 5,
            value: 0.005
        }),
        mirror_drop_relic_fragments_chance: build_shop_item("mirror_drop_relic_fragments_chance", shop_resource, 6100, 
        {
            name: __("Fragment Chance"),
            sprite: spr_material_relic_fragment,
            base_cost: 500,
            cost_exp: 2,
            max_count: 5,
            upgrade_attributes: 
            {
                mirror_drop_relic_fragments_chance: 0.02
            },
            
            is_obfuscated: function()
            {
                return !has_bought_shop_item_safe(global.shops.energy_electrical.mirror_drop_relic_fragments);
            }
        }),
        mirror_drop_relic_fragments_count: build_shop_item("mirror_drop_relic_fragments_count", shop_resource, 6101, 
        {
            name: __("Fragment Count"),
            sprite: spr_material_relic_fragment,
            base_cost: 3500,
            cost_exp: 1.5,
            max_count: 3,
            upgrade_attributes: 
            {
                mirror_drop_relic_fragments_count: 1
            },
            
            is_obfuscated: function()
            {
                return !has_bought_shop_item_safe(global.shops.energy_electrical.mirror_drop_relic_fragments);
            }
        }),
        quark_reactor_add_chance_multiplier: build_shop_item("quark_reactor_add_chance_multiplier", shop_resource, 7000, 
        {
            name: __s("Quark Literacy"),
            sprite: spr_icon_quark_reactor,
            base_cost: 1250,
            cost_exp: 1.1,
            max_count: 5,
            
            is_obfuscated: function()
            {
                return !is_unlocked_quarks();
            },
            
            upgrade_attributes: 
            {
                quark_reactor_add_chance_multiplier: 0.01
            }
        }),
        quark_reactor_auto_add: build_shop_item("quark_reactor_auto_add", shop_resource, 7100, 
        {
            name: __s("Quark auto add"),
            description: __s("Enables a toggle for %s.", __("Quark Reactor")),
            sprite: spr_icon_quark_reactor,
            base_cost: 5000,
            max_count: 1,
            
            is_obfuscated: function()
            {
                return !is_unlocked_quarks();
            }
        }),
        quark_reactor_auto_add_optimizer: build_shop_item("quark_reactor_auto_add_optimizer", shop_resource, 7101, 
        {
            name: __s("Quark auto add optimizer"),
            description: __s("The quark with the lowest count will be chosen."),
            sprite: spr_icon_quark_reactor,
            base_cost: 2000,
            max_count: 1,
            
            is_obfuscated: function()
            {
                return !is_unlocked_quarks();
            }
        }),
        quark_reactor_auto_quarkstige: build_shop_item("quark_reactor_auto_quarkstige", shop_resource, 7110, 
        {
            name: __s("Auto Quarkstige"),
            description: __s("Enables a toggle for %s.", __("Quarkstige")),
            sprite: spr_icon_quark_reactor,
            base_cost: 7500,
            max_count: 1,
            
            is_obfuscated: function()
            {
                return !is_unlocked_quarks();
            }
        }),
        quark_auto_funnel: build_shop_item("quark_auto_funnel", shop_resource, 7200, 
        {
            name: __s("Auto %s", __("Funnel")),
            description: __s("Enables a toggle for %s.", __("Funnel")),
            sprite: spr_resource_quark_blob,
            base_cost: 1500,
            max_count: 1,
            
            is_obfuscated: function()
            {
                return !is_unlocked_quarks_structure();
            }
        }),
        quark_auto_structurize: build_shop_item("quark_auto_structurize", shop_resource, 7210, 
        {
            name: __s("Auto %s", __("Structurize")),
            description: __s("Enables a toggle for %s.", __("Structurize")),
            sprite: spr_resource_quark_structure,
            base_cost: 2000,
            max_count: 1,
            
            is_obfuscated: function()
            {
                return !is_unlocked_quarks_structure();
            }
        }),
        quark_auto_quantify: build_shop_item("quark_auto_quantify", shop_resource, 7220, 
        {
            name: __s("Auto %s", __("Quantify")),
            description: __s("Enables a toggle for %s.", __("Quantify")),
            sprite: spr_resource_quantum_blob,
            base_cost: 2500,
            max_count: 1,
            
            is_obfuscated: function()
            {
                return !is_unlocked_quarks_structure();
            }
        }),
        quark_auto_leaftonify: build_shop_item("quark_auto_leaftonify", shop_resource, 7230, 
        {
            name: __s("Auto %s", __("Leaftonify")),
            description: __s("Enables a toggle for %s.", __("Leaftonify")),
            sprite: spr_resource_quantum_blob,
            base_cost: 3000,
            max_count: 1,
            
            is_obfuscated: function()
            {
                return !is_unlocked_quarks_structure();
            }
        }),
        harbor_container_leaf_adder: build_shop_item("harbor_container_leaf_adder", shop_resource, 7500, 
        {
            name: __s("Container Density"),
            sprite: spr_icon_container,
            base_cost: 750,
            cost_exp: 1.5,
            max_count: 5,
            upgrade_attributes: 
            {
                harbor_container_leaf_adder: 1
            }
        }),
        harbor_container_auto_add_count: build_shop_item("harbor_container_auto_add_count", shop_resource, 7510, 
        {
            name: __s("Hire Pusher"),
            description_locked: __s("Unlock through %s", global.journeys.harbor.name),
            sprite: spr_icon_pusher,
            base_cost: 2000,
            cost_exp: 1.75,
            max_count: 5,
            refresh_ua: true,
            upgrade_attributes: 
            {
                harbor_container_auto_add_count: 0.3
            },
            
            is_obfuscated: function()
            {
                return global.journeys.harbor.data.finished <= 0 && global.journeys.harbor.data.level < 9;
            }
        }),
        harbor_find_water_crystal_chance: build_shop_item("harbor_find_water_crystal_chance", shop_resource, 7520, 
        {
            name: __s("Improved Diving Goggles"),
            description_locked: __s("Unlock through %s", global.journeys.harbor.name),
            sprite: spr_icon_diver,
            base_cost: 1250,
            cost_exp: 1.5,
            max_count: 5,
            upgrade_attributes: 
            {
                harbor_diver_find_water_crystal_chance: 0.01
            },
            
            is_obfuscated: function()
            {
                return !is_unlocked_harbor_diver() || (global.journeys.harbor.data.finished <= 0 && global.journeys.harbor.data.level < 19);
            }
        }),
        harbor_find_water_crystal_count: build_shop_item("harbor_find_water_crystal_count", shop_resource, 7530, 
        {
            name: __s("Improved Lungs"),
            description_locked: __s("Unlock through %s", global.journeys.harbor.name),
            sprite: spr_icon_diver,
            base_cost: 1500,
            cost_exp: 1.5,
            max_count: 5,
            upgrade_attributes: 
            {
                harbor_diver_find_water_crystal_count: 2
            },
            
            is_obfuscated: function()
            {
                return !is_unlocked_harbor_diver() || (global.journeys.harbor.data.finished <= 0 && global.journeys.harbor.data.level < 19);
            }
        }),
        harbor_ship_delivery_speed: build_shop_item("harbor_ship_delivery_speed", shop_resource, 7540, 
        {
            name: __s("Bigger Sails"),
            sprite: spr_icon_ship,
            base_cost: 750,
            cost_exp: 1.75,
            max_count: 5,
            upgrade_attributes: 
            {
                harbor_ship_speed_multiplier: 0.2
            },
            
            is_obfuscated: function()
            {
                return !is_unlocked_harbor_ships();
            }
        }),
        harbor_ship_reward_multiplier: build_shop_item("harbor_ship_reward_multiplier", shop_resource, 7550, 
        {
            name: __s("Ship Rewards"),
            sprite: spr_icon_ship,
            base_cost: 1000,
            cost_exp: 2,
            max_count: 5,
            upgrade_attributes: 
            {
                harbor_ship_reward_multiplier: 0.5
            },
            
            is_obfuscated: function()
            {
                return !is_unlocked_harbor_ships();
            }
        }),
        auto_journey_finish: build_shop_item("auto_journey_finish", shop_resource, 7600, 
        {
            name: __("Auto Journey Manager"),
            description: __("Automatically claims rewards and finishes Journeys if they are completed. At least one manual finish is required."),
            description_locked: __s("Finish at least one Journey."),
            sprite: spr_icon_journey,
            base_cost: 5000,
            max_count: 1,
            
            buy_after: function()
            {
                var __struct = global.journeys;
                var __prop_names = struct_get_names(__struct);
                var __prop_len = array_length(__prop_names);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mkey = __prop_names[__i];
                    var mitem = variable_struct_get(__struct, mkey);
                    mitem.check_auto_finish();
                }
            },
            
            is_obfuscated: function()
            {
                var __struct = global.journeys;
                var __prop_names = struct_get_names(__struct);
                var __prop_len = array_length(__prop_names);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mkey = __prop_names[__i];
                    var mitem = variable_struct_get(__struct, mkey);
                    if (mitem.data.finished > 0)
                    {
                        return false;
                    }
                }
                return true;
            }
        }),
        booster_duration_multiplier: build_shop_item("booster_duration_multiplier", shop_resource, 8000, 
        {
            name: __s("Extra Booster"),
            sprite: spr_icon_rocket,
            base_cost: 1500,
            cost_exp: 1.3,
            max_count: 5,
            
            is_obfuscated: function()
            {
                return !is_unlocked_boosters();
            },
            
            upgrade_attributes: 
            {
                booster_duration_multiplier: 0.5
            }
        }),
        better_pets: build_shop_item("better_pets", global.resources.gems, 400, 
        {
            base_cost: 500,
            max_count: 1,
            value: 0.3,
            section: global.dialog_sections.shop_gems.pets
        }),
        pets_sets_size: 
        {
            index: 2110,
            name: __("More Pet Teams"),
            description: __s("Increases the number of pet teams by %s per level.", 1) + " " + __s("This upgrade will not increase the number of pet slots."),
            sprite: spr_pet_dog,
            cost: 
            {
                gems: 100
            },
            cost_exp: 1.2,
            max_count: 5,
            
            is_obfuscated: function()
            {
                return get_upgrade_count(global.shops.blc.unlock_pets) == 0;
            },
            
            upgrade_attributes: 
            {
                pets_sets_size: 1
            },
            section: global.dialog_sections.shop_gems.pets
        },
        auto_pet_pets: 
        {
            index: 2500,
            name: __("Pet Pet Bot"),
            description: __s("The Pet Pet Bot automatically pets all of your pets. Each level pets all pets once more, so at level 5, all pets will be pet 5 times simultaneously. This upgrade also affects manual petting."),
            sprite: spr_pet_dog,
            cost: 
            {
                gems: 1250
            },
            cost_exp: 1.2,
            max_count: 5,
            
            is_obfuscated: function()
            {
                return get_upgrade_count(global.shops.blc.unlock_pets) == 0;
            },
            
            upgrade_attributes: 
            {
                pet_auto_pet_count: 1
            },
            section: global.dialog_sections.shop_gems.pets
        },
        can_handle_gems_trade: 
        {
            index: 3000,
            name: __("Bearo <3 Gems"),
            description: __("Bearo can start and accept gem trades now."),
            sprite: spr_pet_bear,
            cost: 
            {
                gems: 400
            },
            
            is_obfuscated: function()
            {
                return get_upgrade_count(global.shops.blc.unlock_pets) == 0;
            },
            
            section: global.dialog_sections.shop_gems.pets
        },
        auto_trade_boost: 
        {
            index: 3001,
            name: __("Bearo <3 Boosts"),
            description: __("Bearo can automatically boost trades now."),
            sprite: spr_pet_bear,
            cost: 
            {
                gems: 400
            },
            is_toggle: true,
            
            is_obfuscated: function()
            {
                return get_upgrade_count(global.shops.blc.unlock_pets) == 0;
            },
            
            section: global.dialog_sections.shop_gems.pets
        },
        trouto_slap_all: build_shop_item("trouto_slap_all", shop_resource, 3100, 
        {
            name: __("Slap All"),
            description: __s("%s slaps all enemies now. Ouch!", __("Trouto")),
            sprite: spr_weapon_trout,
            base_cost: 5000,
            
            is_obfuscated: function()
            {
                return global.pets.trouto.data.count == 0;
            },
            
            max_count: 1,
            section: global.dialog_sections.shop_gems.pets
        }),
        borbventure_auto_start: build_shop_item("borbventure_auto_start", shop_resource, 10, 
        {
            name: __s("Auto start %s", __("Borbventures")),
            description: __("Borbventures will be filled with available Borbs and started automatically if the success chance is higher than the min chance setting. Also enables auto refresh."),
            sprite: spr_borb_jones,
            section: global.dialog_sections.shop_gems.borbventure,
            base_cost: 3000,
            max_count: 1,
            
            is_obfuscated: function()
            {
                return !is_unlocked_borbventure();
            }
        }),
        borbventure_auto_finish: build_shop_item("borbventure_auto_finish", shop_resource, 11, 
        {
            name: __s("Auto finish %s", __("Borbventures")),
            description: __("Borbventures will be finished automatically."),
            sprite: spr_borb_jones,
            section: global.dialog_sections.shop_gems.borbventure,
            base_cost: 3000,
            max_count: 1,
            
            is_obfuscated: function()
            {
                return !is_unlocked_borbventure();
            }
        }),
        borbventure_increase_reward: build_shop_item("borbventure_increase_reward", shop_resource, 100, 
        {
            section: global.dialog_sections.shop_gems.borbventure,
            base_cost: 800,
            cost_exp: 1.75,
            max_count: 5,
            value: 0.05
        }),
        max_borbventure_items: build_shop_item("max_borbventure_items", shop_resource, 200, 
        {
            section: global.dialog_sections.shop_gems.borbventure,
            base_cost: 600,
            cost_exp: 1.15,
            max_count: 10,
            value: 3
        }),
        borbventure_craft_cost_multiplier: build_shop_item("borbventure_craft_cost_multiplier", shop_resource, 300, 
        {
            section: global.dialog_sections.shop_gems.borbventure,
            base_cost: 1000,
            cost_exp: 1.25,
            max_count: 4,
            value: -0.025
        }),
        borbventure_increase_xp: build_shop_item("borbventure_increase_xp", shop_resource, 400, 
        {
            section: global.dialog_sections.shop_gems.borbventure,
            base_cost: 600,
            cost_exp: 1.35,
            max_count: 5,
            value: 0.025
        }),
        borbventure_refresh_timer_multiplier: build_shop_item("borbventure_refresh_timer_multiplier", shop_resource, 500, 
        {
            section: global.dialog_sections.shop_gems.borbventure,
            base_cost: 500,
            cost_exp: 1.25,
            max_count: 5,
            value: -0.02
        }),
        borbventure_special_recruit_chance: build_shop_item("borbventure_special_recruit_chance", shop_resource, 600, 
        {
            section: global.dialog_sections.shop_gems.borbventure,
            base_cost: 1500,
            cost_exp: 1.5,
            max_count: 5,
            value: 0.03
        }),
        dice_battlefield_auto_roll: 
        {
            index: 100,
            name: __s("%s auto roll", __("Dice Battlefield")),
            description: concatstr(__s("Enables the auto roll toggle for %s.", __("Dice Battlefield")), " ", __s("Works offline.")),
            sprite: spr_icon_die,
            cost: 
            {
                gems: 3000
            },
            max_count: 1,
            section: global.dialog_sections.shop_gems.dice
        },
        dice_battlefield_auto_progress: 
        {
            index: 101,
            name: __s("%s auto progress", __("Dice Battlefield")),
            description: concatstr(__s("Enables the auto progress toggle for %s.", __("Dice Battlefield")), " ", __s("Works offline.")),
            sprite: spr_icon_die,
            cost: 
            {
                gems: 3000
            },
            max_count: 1,
            section: global.dialog_sections.shop_gems.dice
        },
        dice_cursed_auto_roll: 
        {
            index: 110,
            name: __s("%s auto roll", __("Cursed Dice")),
            description: __s("Enables the auto roll toggle for %s.", __("Cursed Dice")),
            sprite: spr_icon_die,
            cost: 
            {
                gems: 3000
            },
            max_count: 1,
            section: global.dialog_sections.shop_gems.dice
        },
        dice_cursed_auto_save: 
        {
            index: 111,
            name: __s("%s auto save", __("Cursed Dice")),
            description: __s("Enables the auto save toggle for %s.", __("Cursed Dice")),
            sprite: spr_icon_die,
            cost: 
            {
                gems: 3000
            },
            max_count: 1,
            section: global.dialog_sections.shop_gems.dice
        },
        dice_count: build_shop_item("dice_count", shop_resource, 1000, 
        {
            base_cost: 300,
            cost_exp: 1.75,
            max_count: 10,
            value: 1,
            section: global.dialog_sections.shop_gems.dice
        }),
        dice_sides: build_shop_item("dice_sides", shop_resource, 1100, 
        {
            base_cost: 200,
            cost_exp: 1.75,
            max_count: 10,
            value: 1,
            section: global.dialog_sections.shop_gems.dice
        }),
        dice_inventory_size: build_shop_item("dice_inventory_size", shop_resource, 1200, 
        {
            base_cost: 400,
            cost_exp: 1.5,
            max_count: 5,
            value: 2,
            section: global.dialog_sections.shop_gems.dice
        }),
        dice_timeout_reduction: build_shop_item("dice_timeout_reduction", shop_resource, 1300, 
        {
            base_cost: 250,
            cost_exp: 1.4,
            max_count: 10,
            value: 0.5,
            section: global.dialog_sections.shop_gems.dice
        }),
        dice_battlefield_roll_timeout_reduction: build_shop_item("dice_battlefield_roll_timeout_reduction", shop_resource, 1400, 
        {
            base_cost: 250,
            cost_exp: 1.4,
            max_count: 10,
            value: 0.5,
            section: global.dialog_sections.shop_gems.dice
        }),
        mines_auto_vein: build_shop_item("mines_auto_vein", shop_resource, 100, 
        {
            name: __s("%s auto pack", __("Veins")),
            description: concatstr(__s("Enables automation for %s.", __("Mine Veins"))),
            sprite: spr_icon_mine_vein,
            base_cost: 5000,
            max_count: 1,
            section: global.dialog_sections.shop_gems.mines
        }),
        mines_auto_cave: build_shop_item("mines_auto_cave", shop_resource, 101, 
        {
            name: __s("%s auto pack", __("Caves")),
            description: concatstr(__s("Enables automation for %s.", __("Mine Caves"))),
            sprite: spr_icon_mine,
            base_cost: 5000,
            max_count: 1,
            section: global.dialog_sections.shop_gems.mines
        }),
        mines_max_veins_mine_count: build_shop_item("mines_max_veins_mine_count", shop_resource, 200, 
        {
            name: __s("Veins Exploit"),
            sprite: spr_icon_mine_vein,
            base_cost: 300,
            cost_exp: 1.5,
            max_count: 5,
            upgrade_attributes: 
            {
                mines_max_veins_mine_count: 2
            },
            section: global.dialog_sections.shop_gems.mines
        }),
        mines_max_active_caves: build_shop_item("mines_max_active_caves", shop_resource, 201, 
        {
            name: __s("Multimining"),
            sprite: spr_icon_mine,
            base_cost: 500,
            cost_exp: 1.5,
            max_count: 5,
            upgrade_attributes: 
            {
                mines_max_active_caves: 1
            },
            after_apply: refresh_mines_cache,
            section: global.dialog_sections.shop_gems.mines
        }),
        mines_mine_power_multiplier: build_shop_item("mines_mine_power_multiplier", shop_resource, 300, 
        {
            name: __s("Better Pickaxe"),
            sprite: spr_icon_mine,
            base_cost: 400,
            cost_exp: 1.5,
            max_count: 10,
            upgrade_attributes: 
            {
                mines_mine_power_multiplier: 0.5
            },
            section: global.dialog_sections.shop_gems.mines
        }),
        offline_multiplier: 
        {
            index: 40000,
            name: __("Offline Profits +750%"),
            description: __("Increase your offline rewards by +750% for all leaves."),
            sprite: spr_icon_clock,
            cost: 
            {
                gems: 75
            },
            cost_exp: 8,
            upgrade_attributes: 
            {
                offline_multiplier: 7.5
            },
            max_count: 3,
            section: global.dialog_sections.shop_gems.offline
        },
        offline_max_time: 
        {
            index: 40010,
            name: __("Max Offline Time"),
            description: __("Offline earnings are limited to 1 day. This upgrade extends max offline earnings to 7 days."),
            sprite: spr_icon_clock,
            cost: 
            {
                gems: 125
            },
            max_count: 1,
            section: global.dialog_sections.shop_gems.offline
        },
        offline_prestige: build_shop_item("offline_prestige", shop_resource, 40020, 
        {
            base_cost: 450,
            cost_exp: 1.5,
            max_count: 5,
            value: 1,
            value2: 0.005,
            section: global.dialog_sections.shop_gems.offline
        }),
        offline_prestige_pct: build_shop_item("offline_prestige_pct", shop_resource, 40021, 
        {
            base_cost: 250,
            cost_exp: 1.25,
            max_count: 10,
            value: 0.05,
            section: global.dialog_sections.shop_gems.offline
        }),
        offline_crunches: build_shop_item("offline_crunches", shop_resource, 40022, 
        {
            base_cost: 450,
            cost_exp: 1.5,
            max_count: 5,
            value: 1,
            value2: 0.005,
            section: global.dialog_sections.shop_gems.offline
        }),
        offline_crunches_blc_pct: build_shop_item("offline_crunches_blc_pct", shop_resource, 40023, 
        {
            base_cost: 250,
            cost_exp: 1.25,
            max_count: 10,
            value: 0.05,
            section: global.dialog_sections.shop_gems.offline
        }),
        offline_mlc: build_shop_item("offline_mlc", shop_resource, 40024, 
        {
            base_cost: 750,
            cost_exp: 1.5,
            max_count: 5,
            value: 1,
            value2: 0.005,
            section: global.dialog_sections.shop_gems.offline
        }),
        offline_crunches_mlc_pct: build_shop_item("offline_mlc_pct", shop_resource, 40025, 
        {
            base_cost: 550,
            cost_exp: 1.25,
            max_count: 10,
            value: 0.05,
            section: global.dialog_sections.shop_gems.offline
        }),
        offline_seeds: build_shop_item("offline_seeds", global.resources.gems, 40026, 
        {
            base_cost: 350,
            cost_exp: 1.1,
            max_count: 10,
            value: 1,
            section: global.dialog_sections.shop_gems.offline
        }),
        offline_artifacts: build_shop_item("offline_artifacts", shop_resource, 40027, 
        {
            base_cost: 750,
            max_count: 1,
            value: 5,
            section: global.dialog_sections.shop_gems.offline
        }),
        offline_ancient: 
        {
            index: 40030,
            name: __("Offline Ancient Leaves"),
            description: __s("Enables offline earnings for %s. Gain %s from the highest cleared Pyramid floor reward. A pyramid floor must be cleared for this upgrade to take effect.", global.resources.ancient.name_plural, number_format_percent(1 / global.game_settings.ancient_offline_div)),
            sprite: spr_leaf_ancient,
            cost: 
            {
                gems: 450
            },
            max_count: 1,
            
            is_obfuscated: function()
            {
                return !is_unlocked_pyramid();
            },
            
            section: global.dialog_sections.shop_gems.offline
        },
        boss_offline_time_reduction: 
        {
            index: 40040,
            name: __("Boss Offline Timer"),
            description: __("Spawn timer of bosses continue even when offline. Magic."),
            sprite: spr_boss_witch,
            cost: 
            {
                gems: 200
            },
            
            is_obfuscated: function()
            {
                return global.areas.kokkaupunki_cursed.data.count == 0;
            },
            
            section: global.dialog_sections.shop_gems.offline
        },
        offline_alchemy: 
        {
            index: 40100,
            name: __("Offlinechemy"),
            description: __s("Enables offline brewing. It works at %s of the base rate, and max offline brew count is %s. Recipes must have auto-brew enabled to work offline. Does not work with time skips.", number_format_percent(global.game_settings.alchemy_offline_brew_rate), global.game_settings.alchemy_offline_max_brews),
            sprite: spr_icon_alchemy,
            cost: 
            {
                gems: 1500
            },
            max_count: 1,
            section: global.dialog_sections.shop_gems.offline
        },
        offline_alchemy_brew_rate: 
        {
            index: 40110,
            name: __("Offline Brew Rate"),
            description: __s("Increases the offline rate of brewing by %s.", number_format_percent(0.05)),
            sprite: spr_icon_alchemy,
            cost: 
            {
                gems: 650
            },
            cost_exp: 1.3,
            max_count: 10,
            upgrade_attributes: 
            {
                alchemy_offline_brew_rate: 0.05
            },
            section: global.dialog_sections.shop_gems.offline
        },
        offline_alchemy_max_brews: 
        {
            index: 40120,
            name: __("Offline Brew Count"),
            description: __s("Increases the max offline brew count by %s.", number_format(216)),
            sprite: spr_icon_alchemy,
            cost: 
            {
                gems: 400
            },
            cost_exp: 1.2,
            max_count: 10,
            upgrade_attributes: 
            {
                alchemy_offline_max_brews: 216
            },
            section: global.dialog_sections.shop_gems.offline
        },
        time_travel_30m: build_shop_item("time_travel", global.resources.gems, 510000, 
        {
            base_cost: 30,
            value: 30,
            value_name: "30m",
            section: global.dialog_sections.shop_gems.time_travel
        }),
        time_travel_6h: build_shop_item("time_travel", global.resources.gems, 511000, 
        {
            base_cost: 120,
            value: 360,
            value_name: "6h",
            section: global.dialog_sections.shop_gems.time_travel
        }),
        time_travel_24h: build_shop_item("time_travel", global.resources.gems, 512000, 
        {
            base_cost: 360,
            value: 1440,
            value_name: "24h",
            section: global.dialog_sections.shop_gems.time_travel
        }),
        time_travel_72h: build_shop_item("time_travel", global.resources.gems, 513000, 
        {
            base_cost: 600,
            value: 4320,
            value_name: "72h",
            section: global.dialog_sections.shop_gems.time_travel
        }),
        leaf_multiplier_all_t1: build_shop_item("leaf_multiplier_all", global.resources.gems, 50000, 
        {
            name_suffix: "T1",
            value: 1,
            section: global.dialog_sections.shop_gems.supporter,
            supporters_tier: UnknownEnum.Value_1
        }),
        prestige_blc_multiplier_t1: 
        {
            index: 50100,
            name: __("BLC Coins Multiplier T1"),
            description: __s("Increase your BLC coin rewards by %s.", number_format_percent(1)),
            sprite: spr_blc,
            upgrade_attributes: 
            {
                blc_value_multiplier_supporter: 1
            },
            
            is_obfuscated: function()
            {
                return o_game.data.stats.prestige < 1;
            },
            
            section: global.dialog_sections.shop_gems.supporter,
            supporters_only: true,
            supporters_tier: UnknownEnum.Value_1
        },
        crafting_backpack_size_t1: build_shop_item("crafting_backpack_size", shop_resource, 50150, 
        {
            name_suffix: "T1",
            value: 8,
            max_count: 1,
            section: global.dialog_sections.shop_gems.supporter,
            supporters_tier: UnknownEnum.Value_1
        }),
        prestige_mlc_multiplier_t1: 
        {
            index: 50200,
            name: __("MLC Coins Multiplier T1"),
            description: __s("Increase your MLC coin rewards by %s.", number_format_percent(1)),
            sprite: spr_mlc,
            upgrade_attributes: 
            {
                mlc_value_multiplier_supporter: 1
            },
            
            is_obfuscated: function()
            {
                return o_game.data.stats.prestige_crunch < 1;
            },
            
            section: global.dialog_sections.shop_gems.supporter,
            supporters_only: true,
            supporters_tier: UnknownEnum.Value_1
        },
        supporter_damage_t1: 
        {
            index: 50300,
            name: __("Leaf Damage T1"),
            description: __s("Increases leaf hit damage by %s.", number_format_percent(1)),
            sprite: spr_weapon_leaf_blower,
            supporters_only: true,
            supporters_tier: UnknownEnum.Value_1,
            upgrade_attributes: 
            {
                blower_enemy_damage_multiplier_supporter: 1
            },
            is_toggle: true,
            section: global.dialog_sections.shop_gems.supporter
        },
        offline_tower_floors_t1: build_shop_item("offline_tower_floors", global.resources.gems, 50400, 
        {
            name_suffix: "T1",
            value: 1,
            max_count: 1,
            section: global.dialog_sections.shop_gems.supporter,
            supporters_tier: UnknownEnum.Value_1
        }),
        area_enemies_decrease_pyramid_t1: build_shop_item("area_enemies_decrease", shop_resource, 50500, 
        {
            name_suffix: "T1",
            supporters_tier: UnknownEnum.Value_1,
            section: global.dialog_sections.shop_gems.supporter,
            max_count: 1,
            value: 2,
            area_key: global.areas.inner_pyramid.key
        }),
        cards_enemy_drop_chance_t1: build_shop_item("cards_enemy_drop_chance", shop_resource, 50600, 
        {
            name_suffix: "T1",
            supporters_tier: UnknownEnum.Value_1,
            section: global.dialog_sections.shop_gems.supporter,
            max_count: 1,
            value: 0.005
        }),
        nature_plant_xp_multiplier_global_t1: build_shop_item("plant_hugger", shop_resource, 50800, 
        {
            name_suffix: "T1",
            supporters_tier: UnknownEnum.Value_1,
            section: global.dialog_sections.shop_gems.supporter,
            max_count: 1,
            value: 0.02
        }),
        trade_max_gems_trades_per_day_t1: build_shop_item("trade_max_gems_trades_per_day", shop_resource, 50900, 
        {
            name: __s("Max %s Trades", global.resources.gems.name),
            name_suffix: "T1",
            sprite: spr_icon_trading,
            supporters_tier: UnknownEnum.Value_1,
            section: global.dialog_sections.shop_gems.supporter,
            max_count: 1,
            upgrade_attributes: 
            {
                trade_max_gems_trades_per_day: 2000
            }
        }),
        max_mirrors_t1: build_shop_item("max_mirrors", shop_resource, 51000, 
        {
            name_suffix: "T1",
            supporters_tier: UnknownEnum.Value_1,
            section: global.dialog_sections.shop_gems.supporter,
            value: 1
        }),
        supporter_damage_t2: 
        {
            index: 59999,
            name: __("Leaf Damage T2"),
            description: __s("Increases leaf hit damage by %s.", number_format_percent(3)),
            sprite: spr_weapon_leaf_blower,
            supporters_only: true,
            supporters_tier: UnknownEnum.Value_2,
            upgrade_attributes: 
            {
                blower_enemy_damage_multiplier_supporter: 3
            },
            section: global.dialog_sections.shop_gems.supporter
        },
        leaf_multiplier_all_t2: build_shop_item("leaf_multiplier_all", global.resources.gems, 60000, 
        {
            name_suffix: "T2",
            value: 3,
            section: global.dialog_sections.shop_gems.supporter,
            supporters_tier: UnknownEnum.Value_2
        }),
        prestige_blc_multiplier_t2: 
        {
            index: 60100,
            name: __("BLC Coins Multiplier T2"),
            description: __s("Increase your BLC coin rewards by %s.", number_format_percent(3)),
            sprite: spr_blc,
            upgrade_attributes: 
            {
                blc_value_multiplier_supporter: 3
            },
            
            is_obfuscated: function()
            {
                return o_game.data.stats.prestige < 1;
            },
            
            section: global.dialog_sections.shop_gems.supporter,
            supporters_only: true,
            supporters_tier: UnknownEnum.Value_2
        },
        prestige_mlc_multiplier_t2: 
        {
            index: 60200,
            name: __("MLC Coins Multiplier T2"),
            description: __s("Increase your MLC coin rewards by %s.", number_format_percent(3)),
            sprite: spr_mlc,
            upgrade_attributes: 
            {
                mlc_value_multiplier_supporter: 3
            },
            
            is_obfuscated: function()
            {
                return o_game.data.stats.prestige_crunch < 1;
            },
            
            section: global.dialog_sections.shop_gems.supporter,
            supporters_only: true,
            supporters_tier: UnknownEnum.Value_2
        },
        crafting_backpack_size_t2: build_shop_item("crafting_backpack_size", shop_resource, 60250, 
        {
            name_suffix: "T2",
            value: 8,
            max_count: 1,
            section: global.dialog_sections.shop_gems.supporter,
            supporters_tier: UnknownEnum.Value_2
        }),
        supporter_damage_t2: 
        {
            index: 60300,
            name: __("Leaf Damage T2"),
            description: __s("Increases leaf hit damage by %s.", number_format_percent(3)),
            sprite: spr_weapon_leaf_blower,
            supporters_only: true,
            supporters_tier: UnknownEnum.Value_2,
            upgrade_attributes: 
            {
                blower_enemy_damage_multiplier_supporter: 3
            },
            section: global.dialog_sections.shop_gems.supporter
        },
        offline_tower_floors_t2: build_shop_item("offline_tower_floors", global.resources.gems, 60400, 
        {
            name_suffix: "T2",
            value: 1,
            section: global.dialog_sections.shop_gems.supporter,
            supporters_tier: UnknownEnum.Value_2
        }),
        area_enemies_decrease_pyramid_t2: build_shop_item("area_enemies_decrease", shop_resource, 60500, 
        {
            name_suffix: "T2",
            supporters_tier: UnknownEnum.Value_2,
            section: global.dialog_sections.shop_gems.supporter,
            max_count: 1,
            value: 3,
            area_key: global.areas.inner_pyramid.key
        }),
        cards_enemy_drop_chance_t2: build_shop_item("cards_enemy_drop_chance", shop_resource, 60600, 
        {
            name_suffix: "T2",
            supporters_tier: UnknownEnum.Value_2,
            section: global.dialog_sections.shop_gems.supporter,
            max_count: 1,
            value: 0.01
        }),
        nature_plant_xp_multiplier_global_t2: build_shop_item("plant_hugger", shop_resource, 60700, 
        {
            name_suffix: "T2",
            supporters_tier: UnknownEnum.Value_2,
            section: global.dialog_sections.shop_gems.supporter,
            max_count: 1,
            value: 0.05
        }),
        trade_max_gems_trades_per_day_t2: build_shop_item("trade_max_gems_trades_per_day", shop_resource, 60800, 
        {
            name: __s("Max %s Trades", global.resources.gems.name),
            name_suffix: "T2",
            sprite: spr_icon_trading,
            supporters_tier: UnknownEnum.Value_2,
            section: global.dialog_sections.shop_gems.supporter,
            max_count: 1,
            upgrade_attributes: 
            {
                trade_max_gems_trades_per_day: 3000
            }
        }),
        max_mirrors_t2: build_shop_item("max_mirrors", shop_resource, 61000, 
        {
            name_suffix: "T2",
            supporters_tier: UnknownEnum.Value_2,
            section: global.dialog_sections.shop_gems.supporter,
            value: 2
        })
    };
}

enum UnknownEnum
{
    Value_1 = 1,
    Value_2
}
