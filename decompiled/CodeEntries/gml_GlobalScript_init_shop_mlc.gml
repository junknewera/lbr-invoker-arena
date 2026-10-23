function init_shop_mlc()
{
    global.shops_prestige_levels.mlc = global.prestige_levels.mlc;
    var shop_resource = global.resources.mlc;
    global.shops.mlc = 
    {
        unlock_cards: 
        {
            index: -100,
            name: __("Unlock Cards"),
            description: __("Cards can be collected by defeating enemies and bosses."),
            sprite: spr_card_default,
            cost: 
            {
                mlc: 5000
            },
            max_count: 1
        },
        unlock_borbventures: 
        {
            index: -99,
            name: __("Unlock Borbventures"),
            description: __("Send Borbs on adventures to find rare resources and items."),
            sprite: spr_borb_jones,
            cost: 
            {
                mlc: 5000
            },
            max_count: 1,
            
            func: function()
            {
                unlock_borbventures();
            }
        },
        leaf_multiplier_all: build_shop_item("leaf_multiplier_all", shop_resource, 10, 
        {
            base_cost: 10,
            cost_exp: 8,
            max_count: 0,
            value: 2.5
        }),
        master_of_mlc: build_shop_item("master_of_mlc", shop_resource, 20, 
        {
            base_cost: 10,
            max_count: 0,
            value: 0.1
        }),
        blc_value_adder_real: build_shop_item("blc_value_adder_real", shop_resource, 100, 
        {
            base_cost: 5,
            cost_exp: 8,
            max_count: 0,
            value: 20000
        }),
        auto_buy_blc_shop: 
        {
            index: 200,
            name: __s("%s Upgrade Bot", __("BLC")),
            sprite: spr_blc,
            description: __s("This useful bot will help to purchase all upgrades in the %s shop. Beep bloop.", __("BLC")),
            cost: 
            {
                mlc: 2500
            },
            max_count: 1,
            is_toggle: true,
            data: 
            {
                toggle: false
            },
            auto_upgrade_shop: "blc",
            
            auto_upgrade_check: function()
            {
                return global.resources.blc.data.collected > 0;
            }
        },
        auto_buy_silver_token_shop: 
        {
            index: 210,
            name: __s("%s Upgrade Bot", global.resources.silver_token.name_plural),
            sprite: spr_resource_silver_token,
            description: __s("This useful bot will help to purchase all upgrades in the %s shop. Beep bloop.", global.resources.silver_token.name_plural),
            cost: 
            {
                mlc: 5000
            },
            max_count: 1,
            is_toggle: true,
            data: 
            {
                toggle: false
            },
            auto_upgrade_shop: "silver_token",
            
            auto_upgrade_check: function()
            {
                return global.resources.silver_token.data.collected > 0;
            }
        },
        auto_buy_gold_token_shop: 
        {
            index: 220,
            name: __s("%s Upgrade Bot", global.resources.gold_token.name_plural),
            sprite: spr_resource_gold_token,
            description: __s("This useful bot will help to purchase all upgrades in the %s shop. Beep bloop.", global.resources.gold_token.name_plural),
            cost: 
            {
                mlc: 10000
            },
            max_count: 1,
            is_toggle: true,
            data: 
            {
                toggle: false
            },
            auto_upgrade_shop: "gold_token",
            
            auto_upgrade_check: function()
            {
                return global.resources.gold_token.data.collected > 0;
            }
        },
        auto_buy_gem_leaves_shop: 
        {
            index: 230,
            name: __s("%s Upgrade Bot", __("Gem Leaves")),
            sprite: spr_leaf_emerald,
            description: __s("This useful bot will help to purchase all upgrades in the %s shop. Beep bloop.", __("Gem Leaves")),
            cost: 
            {
                mlc: 10000
            },
            max_count: 1,
            is_toggle: true,
            data: 
            {
                toggle: false
            },
            auto_upgrade_shop: "gem_leaves"
        },
        auto_upgrade_seeds: 
        {
            index: 240,
            name: __s("%s Upgrade Bot", __("Farming")),
            description: __s("This useful bot will help to purchase all upgrades in the %s shop. Beep bloop.", __("Farming")),
            sprite: spr_icon_farming,
            cost: build_resource_cost(shop_resource, 250000),
            max_count: 1,
            is_toggle: true,
            auto_upgrade_shop: "farming",
            
            auto_upgrade_check: function()
            {
                return get_upgrade_count(global.shops.exotic.unlock_farming) > 0;
            }
        },
        auto_use_artifacts: 
        {
            index: 250,
            name: __("Autofacts"),
            description: __("Enables the automatic use of Artifacts."),
            sprite: spr_artifact_orb,
            cost: build_resource_cost(shop_resource, 125000),
            max_count: 1,
            is_toggle: true
        },
        artifact_autouse_timer_delay_reduction_multiplier: build_shop_item("artifact_autouse_timer_delay_reduction_multiplier", shop_resource, 251, 
        {
            base_cost: 5000000,
            cost_exp: 128,
            max_count: 5,
            value: 0.1
        }),
        offline_seeds: build_shop_item("offline_seeds", global.resources.mlc, 600, 
        {
            base_cost: 3
        }),
        offline_mlc: build_shop_item("offline_mlc", shop_resource, 700, 
        {
            base_cost: 25000,
            cost_exp: 96,
            max_count: 5,
            value: 1,
            value2: 0.001
        }),
        offline_mlc_pct: build_shop_item("offline_mlc_pct", shop_resource, 701, 
        {
            base_cost: 10000,
            cost_exp: 48,
            max_count: 50,
            value: 0.01
        }),
        tower_floor: build_shop_item("more_tower_floors", shop_resource, 1000, 
        {
            base_cost: 40,
            cost_exp: 8,
            max_count: 0,
            value: 20
        }),
        crunchy_tower: 
        {
            index: 1050,
            name: __("Crunchy Tower"),
            description: sprintf(__("Don't rebuild everything! Increases tower start floor by %s per level. This doesn't exceed your highest tower floor."), 50),
            description_locked: sprintf(__("Reach Tower Floor %s to unlock."), 500),
            sprite: spr_icon_tower_floor,
            cost: 
            {
                mlc: 2000
            },
            cost_exp: 1.25,
            max_count: 100,
            upgrade_attributes: 
            {
                tower_floor_persist: 50
            },
            
            is_obfuscated: function()
            {
                return global.areas.tower.get_highest_floor_current_run() < 500;
            }
        },
        offline_tower_floors: build_shop_item("offline_tower_floors", shop_resource, 1060, 
        {
            base_cost: 1000000,
            value: 1,
            max_count: 3
        }),
        authority: 
        {
            index: 1100,
            name: __("Authority"),
            description: __("Enemies in the Leaf Tower fear your authority. Reduce the number of enemies each floor by 1 per level."),
            sprite: spr_icon_authority,
            cost: 
            {
                mlc: 1000
            },
            cost_exp: 10,
            max_count: 5,
            upgrade_attributes: 
            {
                tower_floor_enemies_decrease: 1
            }
        },
        areas_persist_mlc: 
        {
            index: 1150,
            name: __("Crunchy Areas"),
            description: __("Areas persist after Mega Leaf Crunch."),
            sprite: spr_flag,
            cost: 
            {
                mlc: 250000
            },
            max_count: 1
        },
        coins_persist_mlc: 
        {
            index: 1200,
            name: __("Crunchy Coins"),
            sprite: spr_gold,
            description: __("Prestige Coins persist after the Mega Leaf Crunch. Each level doubles the Prestige coin rewards."),
            cost: 
            {
                mlc: 300
            },
            cost_exp: 2,
            max_count: 10
        },
        blc_persist_mlc: 
        {
            index: 1201,
            name: __("Crunchy BLC"),
            sprite: spr_blc,
            description: __("BLC Coins persist after the Mega Leaf Crunch. Each level doubles the BLC coin rewards. Bigger Bags level will persist, too."),
            cost: 
            {
                mlc: 500
            },
            cost_exp: 2,
            max_count: 10
        },
        pets_persist_mlc: 
        {
            index: 1210,
            name: __("Crunchy Pets"),
            description: __("Pets persist after the Mega Leaf Crunch."),
            sprite: spr_pet_dog,
            cost: 
            {
                mlc: 75000
            },
            max_count: 1
        },
        seeds_persist_mlc: 
        {
            index: 1215,
            name: __("Crunchy Seeds Lite"),
            description: __("Purchased seeds persist after the Mega Leaf Crunch with level 1."),
            sprite: spr_seed_leaf,
            cost: 
            {
                mlc: 250000
            },
            is_toggle: true,
            max_count: 1,
            upgrade_attributes: 
            {
                prestige_persist_shops: 
                {
                    farming: 1
                }
            }
        },
        unique_leaves_persist_mlc: 
        {
            index: 1220,
            name: __("Crunchy Unique Leaves"),
            description: __("Unique Leaves persist after the Mega Leaf Crunch."),
            sprite: spr_leaf_unique_rainbow,
            cost: 
            {
                mlc: 50000
            },
            max_count: 1
        },
        printers_persist_mlc: 
        {
            index: 1300,
            name: __("Unlimited+1 Printer Ink"),
            description: __("Printers count and Printers Room count persist after Mega Leaf Crunch. Locked by Unlimited Printer Ink."),
            sprite: spr_icon_printer,
            cost: 
            {
                mlc: 15000
            },
            upgrade_attributes: 
            {
                prestige_persist_shops: 
                {
                    printers: 1
                }
            },
            is_buyable: [has_bought_shop_item_safe, "blc", "printers_persist"],
            max_count: 1,
            tag: global.shop_item_tags.printer
        },
        alb_unlimited_power: 
        {
            index: 2000,
            name: __("Leaf powered ALBs"),
            description: __("ALBs are powered by leaves so they don't need to be charged anymore. They have to be charged at startup, though."),
            sprite: spr_autoblower,
            cost: 
            {
                mlc: 10
            },
            max_count: 1,
            is_toggle: true,
            
            func: function()
            {
                with (o_autoblower)
                {
                    init();
                }
            }
        },
        trade_education_advanced: build_shop_item("trade_education_advanced", shop_resource, 2100, 
        {
            base_cost: 5000000,
            max_count: 50,
            value: 1
        }),
        artifact_spawn_time: build_shop_item("faster_artifacts", shop_resource, 2500, 
        {
            max_count: 25,
            cost_exp: 5,
            value: 0.01
        }),
        offline_artifacts: build_shop_item("offline_artifacts", shop_resource, 2510, 
        {
            base_cost: 5000,
            max_count: 5,
            value: 2
        }),
        critical_converters_crit_chance: build_shop_item("critical_converters_crit_chance", shop_resource, 2600, 
        {
            base_cost: 20,
            max_count: 10,
            value: 0.01
        }),
        craft_level: build_shop_item("craft_level", shop_resource, 2700, 
        {
            max_count: 5
        }),
        craft_min_chance: build_shop_item("craft_min_chance", shop_resource, 2701, 
        {
            base_cost: 200
        }),
        autocraft_delay_reduction: build_shop_item("autocraft_delay_reduction", shop_resource, 2710, 
        {
            base_cost: 1000,
            cost_exp: 384,
            max_count: 5,
            value: 0.05
        }),
        unlock_converter_strange_silver: build_shop_item("unlock_converter", shop_resource, 2800, 
        {
            base_cost: 5000,
            value: global.converters.convert_flask_strange_silver_token.key
        }),
        unlock_converter_silver_gold: build_shop_item("unlock_converter", shop_resource, 2800, 
        {
            base_cost: 50000,
            value: global.converters.convert_silver_token_gold_token.key
        }),
        unlock_resource_amber: build_shop_item("unlock_resource", shop_resource, 3000, 
        {
            base_cost: 1000,
            description: __s("These leaves only drop from bosses in the Leaf Tower above floor %s. Each unlocked gem leaf increases all gem leaf rewards by %s.", 101, number_format_percent(1)),
            value: global.resources.amber
        }),
        unlock_resource_amethyst: build_shop_item("unlock_resource", shop_resource, 3010, 
        {
            base_cost: 1000,
            description: __s("These leaves only drop from bosses in the Leaf Tower above floor %s. Each unlocked gem leaf increases all gem leaf rewards by %s.", 101, number_format_percent(1)),
            value: global.resources.amethyst
        }),
        unlock_resource_emerald: build_shop_item("unlock_resource", shop_resource, 3020, 
        {
            base_cost: 1000,
            description: __s("These leaves only drop from bosses in the Leaf Tower above floor %s. Each unlocked gem leaf increases all gem leaf rewards by %s.", 101, number_format_percent(1)),
            value: global.resources.emerald
        }),
        unlock_resource_kyanite: build_shop_item("unlock_resource", shop_resource, 3030, 
        {
            base_cost: 1000,
            description: __s("These leaves only drop from bosses in the Leaf Tower above floor %s. Each unlocked gem leaf increases all gem leaf rewards by %s.", 101, number_format_percent(1)),
            value: global.resources.kyanite
        }),
        unlock_resource_rhodonite: build_shop_item("unlock_resource", shop_resource, 3040, 
        {
            base_cost: 1000,
            description: __s("These leaves only drop from bosses in the Leaf Tower above floor %s. Each unlocked gem leaf increases all gem leaf rewards by %s.", 101, number_format_percent(1)),
            value: global.resources.rhodonite
        }),
        unlock_resource_ruby: build_shop_item("unlock_resource", shop_resource, 3050, 
        {
            base_cost: 1000,
            description: __s("These leaves only drop from bosses in the Leaf Tower above floor %s. Each unlocked gem leaf increases all gem leaf rewards by %s.", 101, number_format_percent(1)),
            value: global.resources.ruby
        }),
        unlock_resource_tektite: build_shop_item("unlock_resource", shop_resource, 3060, 
        {
            base_cost: 1000,
            description: __s("These leaves only drop from bosses in the Leaf Tower above floor %s. Each unlocked gem leaf increases all gem leaf rewards by %s.", 101, number_format_percent(1)),
            value: global.resources.tektite
        })
    };
}
