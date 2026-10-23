function init_shop_blc()
{
    var shop_resource = global.resources.blc;
    global.shops_prestige_levels.blc = global.prestige_levels.blc;
    global.shops.blc = 
    {
        prestige_value_multiplier: 
        {
            index: 0,
            name: __("Prestige+++++"),
            sprite: spr_gold,
            description: __("Increases prestige coins reward by 200% per level."),
            cost: 
            {
                blc: 1
            },
            cost_exp: 2,
            upgrade_attributes: 
            {
                prestige_value_multiplier: 2
            },
            max_count: 0
        },
        blc_value_adder: 
        {
            index: 10,
            name: __("BLC++"),
            sprite: spr_blc,
            description: __("Increases blc points reward by +1 per level."),
            cost: 
            {
                blc: 2
            },
            cost_exp: 2,
            upgrade_attributes: 
            {
                blc_value_adder: 1
            },
            max_count: 0
        },
        converter_speed: 
        {
            index: 50,
            name: __("More Converter Transistors"),
            sprite: spr_icon_converters,
            description: __("Adds more transistors to converters so they work at double the speed. Hooray for transistors!"),
            cost: 
            {
                blc: 1
            },
            cost_exp: 3,
            upgrade_attributes: 
            {
                converter_speed: 1
            },
            max_count: 3
        },
        converter_increase_output_count: 
        {
            index: 60,
            name: __("Increase Converter Output"),
            description: global.texts.converter_increase_output_count_all,
            sprite: spr_icon_converters,
            cost: 
            {
                blc: 2
            },
            cost_exp: 2.5,
            max_count: 0,
            upgrade_attributes: 
            {
                converter_output_multiplier_global: 1
            }
        },
        printers_upgrade: 
        {
            index: 80,
            name: __("Better Printer Ink"),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_icon_printer,
            cost: 
            {
                blc: 1
            },
            upgrade_attributes: 
            {
                printer_multiplier: 1
            },
            max_count: 0,
            tag: global.shop_item_tags.printer
        },
        printers_persist: 
        {
            index: 90,
            name: __("Unlimited Printer Ink"),
            description: __("Printers persist after Big Leaf Crunch."),
            sprite: spr_icon_printer,
            cost: 
            {
                blc: 25000000
            },
            upgrade_attributes: 
            {
                prestige_persist_shops: 
                {
                    printers: global.prestige_levels.blc.level - 1
                }
            },
            max_count: 1,
            tag: global.shop_item_tags.printer
        },
        printers_room: 
        {
            index: 100,
            name: __("Bigger Printer Room"),
            sprite: spr_icon_printer,
            
            description: function()
            {
                var value = get_max_printer_storage();
                return __s("Max printers increased by %s per level. Max printers: %s", "10x", number_format(value, 2, false, false));
            },
            
            cost: 
            {
                blc: 50000000
            },
            cost_exp: 3,
            max_count: 10,
            upgrade_attributes: 
            {
                max_printer_storage: 1
            },
            tag: global.shop_item_tags.printer
        },
        leaf_multiplier_all: 
        {
            index: 150,
            name: __("Master of Leaves"),
            sprite: spr_leaf,
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            cost: 
            {
                blc: 1
            },
            cost_exp: 2,
            upgrade_attributes: 
            {
                leaf_multiplier: 4
            },
            max_count: 0
        },
        fruit_value: 
        {
            index: 200,
            name: __("Super Fruits"),
            sprite: spr_fruit,
            sprite_image_index: 0,
            description: __s("Fruits contain much more fruit. Increases fruit rewards by %s.", number_format_percent(5)),
            cost: 
            {
                blc: 1
            },
            cost_exp: 2,
            upgrade_attributes: 
            {
                fruit_value: 5
            },
            max_count: 0
        },
        fruit_leaves_upgrade: 
        {
            index: 210,
            name: __("Fruit Leaves"),
            sprite: spr_fruit,
            description: __("Leaf + combo upgrades affect fruits now. Join the Fruits Gang!"),
            cost: 
            {
                blc: 5000000
            },
            max_count: 1
        },
        fruit_magnet: 
        {
            index: 220,
            name: __("Fruit Magnet"),
            sprite: spr_fruit,
            sprite_image_index: 0,
            description: __("Fruits move towards you."),
            cost: 
            {
                blc: 1
            },
            max_count: 1
        },
        combo_multiplier: 
        {
            index: 400,
            name: __("What The Combo"),
            sprite: spr_icon_combo,
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            cost: 
            {
                blc: 2
            },
            cost_exp: 2,
            upgrade_attributes: 
            {
                combo_multiplier: 2
            },
            max_count: 0,
            tag: global.shop_item_tags.combo
        },
        nuclear_fuel: 
        {
            index: 500,
            name: __("Nuclear Apocaleaves"),
            sprite: spr_icon_nuclear,
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            cost: 
            {
                blc: 1
            },
            cost_exp: 2,
            upgrade_attributes: 
            {
                nuclear_fuel_multiplier: 0.4
            },
            max_count: 5
        },
        daily_reward_gems: 
        {
            index: 600,
            name: __("Moar Gems"),
            sprite: spr_resource_gem,
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            cost: 
            {
                blc: 1
            },
            upgrade_attributes: 
            {
                daily_reward_gems: 2
            },
            max_count: 1
        },
        albs_tools: 
        {
            index: 610,
            name: __("ALB Tools"),
            sprite: spr_autoblower,
            description: __("ALBs can equip your tools. Wow."),
            cost: 
            {
                blc: 3
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
        albs_pathing: 
        {
            index: 611,
            name: __("ALB Pathing"),
            sprite: spr_autoblower,
            description: __("Switch the pathing method of ALBs."),
            cost: 
            {
                blc: 25000
            },
            max_count: 1,
            options: [
            {
                value: UnknownEnum.Value_0,
                text: __("Default")
            }, 
            {
                value: UnknownEnum.Value_1,
                text: __("Rot C"),
                tooltip: __("Rotate clockwise")
            }, 
            {
                value: UnknownEnum.Value_3,
                text: __("Rot CC"),
                tooltip: __("Rotate counter-clockwise")
            }, 
            {
                value: UnknownEnum.Value_12,
                text: __("Zigzag")
            }, 
            {
                value: UnknownEnum.Value_7,
                text: __("Stroke"),
                tooltip: __("Don't ask")
            }, 
            {
                value: UnknownEnum.Value_6,
                text: __("Sin"),
                tooltip: __("sin(t)")
            }, 
            {
                value: UnknownEnum.Value_2,
                text: __("Cos"),
                tooltip: __("cos(t)")
            }, 
            {
                value: UnknownEnum.Value_8,
                text: __("Tan"),
                tooltip: __("tan(t)")
            }, 
            {
                value: UnknownEnum.Value_4,
                text: __("Log2Sin"),
                tooltip: __("log2(abs(sin(t)))")
            }, 
            {
                value: UnknownEnum.Value_9,
                text: __("T Center"),
                tooltip: sprintf(__("Target center every %s seconds"), 6)
            }, 
            {
                value: UnknownEnum.Value_10,
                text: __("T Edges"),
                tooltip: sprintf(__("Target each room edge every %s seconds"), 6)
            }, 
            {
                value: UnknownEnum.Value_11,
                text: __("T Player"),
                tooltip: sprintf(__("Target player every %s seconds"), 6)
            }],
            
            func: function()
            {
                with (o_autoblower)
                {
                    init();
                }
            }
        },
        albs_pathing_timer_start: 
        {
            index: 612,
            name: __("ALB Pathing Timer"),
            sprite: spr_autoblower,
            description: __("ALB pathing timers start immediately after entering an area."),
            cost: 
            {
                blc: 500000000
            },
            is_toggle: true,
            max_count: 1
        },
        auto_teleport_best_area: 
        {
            index: 650,
            name: __("Area Teleport Bot"),
            sprite: spr_flag,
            description: __("This neat device automatically teleports you to your target destination after prestige."),
            cost: 
            {
                blc: 2
            },
            max_count: 1,
            is_toggle: true
        },
        autocrunch_bot: 
        {
            index: 660,
            name: __("Auto Crunch Bot"),
            sprite: spr_icon_portal_leaf_crunch,
            description: __("This bot can automatically perform the Big Leaf Crunch for you. Auto Crunch is disabled in certain areas."),
            data: 
            {
                toggle: false
            },
            cost: 
            {
                blc: 100000
            },
            cost_exp: 4,
            max_count: 1,
            is_toggle: true
        },
        autocrunch_setting: 
        {
            index: 661,
            name: __("Auto Crunch Settings"),
            sprite: spr_icon_portal_leaf_crunch,
            description: __("The Auto Crunch Bot checks if the BLC threshold is fulfilled to automatically crunch."),
            cost: 
            {
                blc: 5000000
            },
            max_count: 1,
            is_slider: true,
            slider_affix: " BLC",
            slider_format_number: true,
            slider_min: 0,
            slider_max: 1000000000000,
            slider_step: 1000000,
            data: 
            {
                slider_value: 10000000
            }
        },
        autocrunch_timer_reduction: 
        {
            index: 662,
            name: __("Auto Crunch Timer"),
            sprite: spr_icon_portal_leaf_crunch,
            description: __("When the crunch settings are fulfilled, the bot will start the 5 minute auto crunch timer. Each upgrade reduces the bot's timer by 10 seconds."),
            cost: 
            {
                blc: 10000
            },
            cost_exp: 1.75,
            max_count: 30,
            upgrade_attributes: 
            {
                autocrunch_timer_reduced: 10
            },
            
            func: function()
            {
                o_game.autocrunch_timer = max(o_game.autocrunch_timer, 1);
            }
        },
        autobuy_priority: 
        {
            index: 900,
            name: __("Autobuy Priority Device"),
            sprite: spr_icon_bot,
            description: __("With this device, you can change the priority and quantity of all autobuy items."),
            cost: 
            {
                blc: 250000
            },
            max_count: 1,
            prestige_level: global.prestige_levels.mlc.level
        },
        auto_start_converters: 
        {
            index: 910,
            name: __("Converter Start Bot"),
            sprite: spr_icon_converters,
            description: __("This useful bot will start all converters after prestige. Beep bloop."),
            cost: 
            {
                blc: 750000
            },
            max_count: 1,
            is_toggle: true
        },
        coins_persist_blc: 
        {
            index: 990,
            name: __("Crunchy Coins"),
            sprite: spr_gold,
            description: __("Coins persist after the Big Leaf Crunch. Each level doubles the coin rewards."),
            cost: 
            {
                blc: 400000
            },
            cost_exp: 2,
            max_count: 10
        },
        increase_max_leaves: 
        {
            index: 1000,
            name: __("Bigger Bag"),
            sprite: spr_leaf,
            
            description: function()
            {
                var max_leaves = get_max_leaf_storage();
                return __s("Increases max resource storage by the power of %s per level. Max leaf storage: %s", 1, number_format(max_leaves, 2, false, false));
            },
            
            cost: 
            {
                blc: 10
            },
            cost_exp: 1.5,
            max_count: 270,
            upgrade_attributes: 
            {
                max_leaf_storage: 1
            }
        },
        unlock_unique_leaves: 
        {
            index: 2000,
            name: __("Unlock Unique Leaves"),
            description: __("Discover secret Unique Leaves that only spawn under certain conditions."),
            sprite: spr_leaf_unique_fire,
            description: __(""),
            cost: 
            {
                blc: 20000000
            },
            max_count: 1
        },
        unique_leaves_concurrent: 
        {
            index: 2010,
            name: __("Greedy Uniques"),
            sprite: spr_leaf_unique_fire,
            description: __("Additional active Unique Leaf."),
            cost: 
            {
                blc: 3000000
            },
            max_count: 11,
            
            get_max_count: function()
            {
                return array_length(global.unique_leaves_sorted) - 1;
            },
            
            upgrade_attributes: 
            {
                max_unique_leaves: 1
            },
            
            is_obfuscated: function()
            {
                return !is_unlocked_unique_leaves();
            }
        },
        unlock_pets: 
        {
            index: 3000,
            name: __("Unlock Pets"),
            sprite: spr_pet_dog,
            description: __("Pets also like to watch numbers go up!"),
            cost: 
            {
                blc: 1000000
            },
            max_count: 1
        },
        unlock_trading: 
        {
            index: 3500,
            name: __("Buy Trading Certificate"),
            description: __("With this certificate, you're an official trader now."),
            sprite: spr_icon_trading,
            cost: 
            {
                blc: 100000
            },
            max_count: 1
        },
        max_trades: build_shop_item("max_trades", global.resources.blc, 3510),
        trade_education: build_shop_item("trade_education", global.resources.blc, 3520),
        unlock_crafting: 
        {
            index: 3700,
            name: __("Buy Crafting Certificate"),
            description: __("With this certificate, you're an official crafter now."),
            sprite: spr_icon_crafting,
            cost: 
            {
                blc: 500000
            },
            max_count: 1
        },
        craft_level: build_shop_item("craft_level", global.resources.blc, 3701),
        craft_min_chance: build_shop_item("craft_min_chance", global.resources.blc, 3702),
        unlock_artifacts: 
        {
            index: 4000,
            name: __("Unlock Artifacts"),
            sprite: spr_artifact_orb,
            description: __("The true secrets in the Leaf Blower Universe."),
            cost: 
            {
                blc: 50000000
            },
            max_count: 1
        },
        alb_can_collect_artifacts: 
        {
            index: 4010,
            name: __("ALB <3 Artifacts"),
            description: __("ALBs can collect Artifacts for you now. Should they also do your laundry?"),
            sprite: spr_autoblower,
            cost: 
            {
                blc: 10000000
            },
            
            is_obfuscated: function()
            {
                return get_upgrade_count(global.shops.blc.unlock_artifacts) == 0;
            },
            
            max_count: 1
        },
        offline_artifacts: build_shop_item("offline_artifacts", shop_resource, 4020, 
        {
            base_cost: 5000000,
            max_count: 2,
            value: 1
        }),
        offline_crunches: build_shop_item("offline_crunches", shop_resource, 4030, 
        {
            base_cost: 1500000,
            cost_exp: 96,
            max_count: 5,
            value: 1,
            value2: 0.001
        }),
        offline_crunches_blc_pct: build_shop_item("offline_crunches_blc_pct", shop_resource, 4031, 
        {
            base_cost: 100000,
            cost_exp: 48,
            max_count: 50,
            value: 0.01
        }),
        unlock_scrolls: 
        {
            index: 5000,
            name: __("Unlock Scrolls"),
            sprite: spr_scroll_damage,
            description: __("Scrolls provide temporary boosts. Neat."),
            cost: 
            {
                blc: 5000000
            },
            max_count: 1
        },
        unlock_mulch: 
        {
            index: 6000,
            name: __("Unlock Mulch"),
            sprite: spr_icon_mulch,
            description: __("Make mulch out of leaves."),
            cost: 
            {
                blc: 25000000
            },
            max_count: 1,
            
            func: function()
            {
                global.resources.mulch.data.unlocked = true;
            }
        },
        unlock_materials: 
        {
            index: 7000,
            name: __("Unlock Materials"),
            sprite: spr_material_copper_bar,
            description: __("Discover a variety of materials in different areas. Materials can be used in trades, quests and alchemy."),
            cost: 
            {
                blc: 250000
            },
            max_count: 1
        },
        material_inspector: 
        {
            index: 7010,
            name: __("Material Inspector"),
            description: __("Reveals material spawn areas and spawn chance in their description."),
            sprite: spr_material_copper_bar,
            cost: 
            {
                blc: 500000
            },
            max_count: 1,
            
            is_obfuscated: function()
            {
                return get_upgrade_count(global.shops.blc.unlock_materials) == 0;
            }
        },
        unlock_alchemy: 
        {
            index: 8000,
            name: __("Unlock Alchemy"),
            sprite: spr_icon_alchemy,
            description: __("Throw some materials into a pot and call yourself an alchemist. Find recipes to brew useful items."),
            cost: 
            {
                blc: 15000000
            },
            
            is_obfuscated: function()
            {
                return get_upgrade_count(global.shops.blc.unlock_materials) == 0;
            },
            
            max_count: 1
        },
        dig_item_chance_reduction: build_shop_item("dig_item_chance_reduction", shop_resource, 8500, 
        {
            base_cost: 500000,
            max_count: 10,
            value: 0.005
        }),
        dig_count_multiplier: build_shop_item("dig_count_multiplier", shop_resource, 8501, 
        {
            base_cost: 7500000,
            max_count: 3,
            value: 1
        }),
        dig_reduce_timeout: build_shop_item("dig_reduce_timeout", shop_resource, 8502, 
        {
            base_cost: 5000000,
            max_count: 10,
            value: 0.01
        }),
        player_hp_reg_perma: 
        {
            index: 10000,
            name: __("Perma HP Regeneration"),
            sprite: spr_icon_heart,
            description: __("Now look at your health. HP Regeneration is permanent."),
            cost: 
            {
                blc: 75000000
            },
            max_count: 1
        },
        blow_power_controller: 
        {
            index: 20010,
            name: __("Blow Power Controller"),
            sprite: spr_weapon_leaf_blower,
            description: __("This controller regulates the power of your current blowing tool."),
            cost: 
            {
                blc: 25000000000
            },
            is_slider: true,
            max_count: 1,
            slider_affix: "%",
            data: 
            {
                slider_value: 100
            },
            
            func: function()
            {
                with (o_blower)
                {
                    init();
                }
            }
        },
        auto_buy_all_coin_upgrades: build_shop_item("autobuy_shop", shop_resource, 680, 
        {
            base_cost: 5,
            resource: global.resources.coins,
            section: global.dialog_sections.blc_shop.autoupgrade_bots
        }),
        auto_buy_all_science_upgrades: build_shop_item("autobuy_shop", shop_resource, 700, 
        {
            base_cost: 50,
            resource: global.resources.flask_red,
            name: __s("%s Upgrade Bot", __("Science")),
            description: __s(global.texts.auto_upgrade_shop_description, __("Science")),
            auto_upgrade_shop: ["flask_red", "flask_green", "flask_blue", "flask_magenta", "flask_orange", "flask_black", "flask_strange"],
            section: global.dialog_sections.blc_shop.autoupgrade_bots
        }),
        auto_buy_leaves_shop: build_shop_item("autobuy_shop", shop_resource, 710, 
        {
            base_cost: 250000,
            resource: global.resources.leaves,
            section: global.dialog_sections.blc_shop.autoupgrade_bots,
            auto_upgrade_shop: "environment"
        }),
        auto_buy_gold_shop: build_shop_item("autobuy_shop", shop_resource, 720, 
        {
            base_cost: 500000,
            resource: global.resources.gold,
            section: global.dialog_sections.blc_shop.autoupgrade_bots
        }),
        auto_buy_platinum_shop: build_shop_item("autobuy_shop", shop_resource, 730, 
        {
            base_cost: 1000000,
            resource: global.resources.platinum,
            section: global.dialog_sections.blc_shop.autoupgrade_bots
        }),
        auto_buy_bismuth_shop: build_shop_item("autobuy_shop", shop_resource, 740, 
        {
            base_cost: 2000000,
            resource: global.resources.bismuth,
            section: global.dialog_sections.blc_shop.autoupgrade_bots
        }),
        auto_buy_cosmic_shop: build_shop_item("autobuy_shop", shop_resource, 750, 
        {
            base_cost: 4000000,
            resource: global.resources.cosmic,
            section: global.dialog_sections.blc_shop.autoupgrade_bots
        }),
        auto_buy_void_shop: build_shop_item("autobuy_shop", shop_resource, 760, 
        {
            base_cost: 8000000,
            resource: global.resources.void,
            section: global.dialog_sections.blc_shop.autoupgrade_bots
        }),
        auto_buy_exotic_shop: build_shop_item("autobuy_shop", shop_resource, 770, 
        {
            base_cost: 16000000,
            resource: global.resources.exotic,
            section: global.dialog_sections.blc_shop.autoupgrade_bots
        }),
        auto_buy_celestial_shop: build_shop_item("autobuy_shop", shop_resource, 780, 
        {
            base_cost: 32000000,
            resource: global.resources.celestial,
            section: global.dialog_sections.blc_shop.autoupgrade_bots
        }),
        auto_buy_mythical_shop: build_shop_item("autobuy_shop", shop_resource, 790, 
        {
            base_cost: 64000000,
            resource: global.resources.mythical,
            section: global.dialog_sections.blc_shop.autoupgrade_bots
        }),
        auto_buy_lava_shop: build_shop_item("autobuy_shop", shop_resource, 800, 
        {
            base_cost: 128000000,
            resource: global.resources.lava,
            section: global.dialog_sections.blc_shop.autoupgrade_bots
        }),
        auto_buy_ice_shop: build_shop_item("autobuy_shop", shop_resource, 810, 
        {
            base_cost: 256000000,
            resource: global.resources.ice,
            section: global.dialog_sections.blc_shop.autoupgrade_bots
        }),
        auto_buy_obsidian_shop: build_shop_item("autobuy_shop", shop_resource, 820, 
        {
            base_cost: 512000000,
            resource: global.resources.obsidian,
            section: global.dialog_sections.blc_shop.autoupgrade_bots
        }),
        auto_buy_silicon_shop: build_shop_item("autobuy_shop", shop_resource, 825, 
        {
            base_cost: 1024000000,
            resource: global.resources.silicon,
            section: global.dialog_sections.blc_shop.autoupgrade_bots
        }),
        auto_buy_benitoite_shop: build_shop_item("autobuy_shop", shop_resource, 830, 
        {
            base_cost: 2048000000,
            resource: global.resources.benitoite,
            section: global.dialog_sections.blc_shop.autoupgrade_bots
        }),
        auto_buy_moonstone_shop: build_shop_item("autobuy_shop", shop_resource, 831, 
        {
            base_cost: 4096000000,
            resource: global.resources.moonstone,
            section: global.dialog_sections.blc_shop.autoupgrade_bots
        }),
        auto_buy_sand_shop: build_shop_item("autobuy_shop", shop_resource, 832, 
        {
            base_cost: 8192000000,
            resource: global.resources.sand,
            section: global.dialog_sections.blc_shop.autoupgrade_bots
        }),
        auto_buy_ancient_shop: build_shop_item("autobuy_shop", shop_resource, 833, 
        {
            base_cost: 32768000000,
            resource: global.resources.ancient,
            section: global.dialog_sections.blc_shop.autoupgrade_bots
        }),
        auto_buy_sacred_shop: build_shop_item("autobuy_shop", shop_resource, 834, 
        {
            base_cost: 65536000000,
            resource: global.resources.sacred,
            section: global.dialog_sections.blc_shop.autoupgrade_bots
        }),
        auto_buy_biotite_shop: build_shop_item("autobuy_shop", shop_resource, 835, 
        {
            base_cost: 131072000000,
            resource: global.resources.biotite,
            section: global.dialog_sections.blc_shop.autoupgrade_bots
        }),
        auto_buy_malachite_shop: build_shop_item("autobuy_shop", shop_resource, 836, 
        {
            base_cost: 262144000000,
            resource: global.resources.malachite,
            section: global.dialog_sections.blc_shop.autoupgrade_bots
        }),
        auto_buy_hematite_shop: build_shop_item("autobuy_shop", shop_resource, 837, 
        {
            base_cost: 524288000000,
            resource: global.resources.hematite,
            section: global.dialog_sections.blc_shop.autoupgrade_bots
        }),
        auto_buy_plasma_shop: build_shop_item("autobuy_shop", shop_resource, 838, 
        {
            base_cost: 1048576000000,
            resource: global.resources.plasma,
            section: global.dialog_sections.blc_shop.autoupgrade_bots
        }),
        auto_buy_energy_electrical_shop: build_shop_item("autobuy_shop", shop_resource, 839, 
        {
            base_cost: 2097152000000,
            resource: global.resources.energy_electrical,
            section: global.dialog_sections.blc_shop.autoupgrade_bots
        }),
        auto_buy_coal_shop: build_shop_item("autobuy_shop", shop_resource, 840, 
        {
            base_cost: 4194304000000,
            resource: global.resources.coal,
            section: global.dialog_sections.blc_shop.autoupgrade_bots
        }),
        auto_buy_dusk_shop: build_shop_item("autobuy_shop", shop_resource, 841, 
        {
            base_cost: 8388608000000,
            resource: global.resources.dusk,
            section: global.dialog_sections.blc_shop.autoupgrade_bots
        })
    };
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_6 = 6,
    Value_7,
    Value_8,
    Value_9,
    Value_10,
    Value_11,
    Value_12
}
