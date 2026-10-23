function init_shop_ulc()
{
    global.shops_prestige_levels.ulc = global.prestige_levels.ulc;
    var shop_resource = global.resources.ulc;
    global.shops.ulc = 
    {
        ulc_min_sacrifices_decrease_count: build_shop_item("ulc_min_sacrifices_decrease_count", shop_resource, -9000, 
        {
            name: __("Less Sacrifices"),
            sprite: spr_flag,
            base_cost: 2500,
            cost_exp: 2,
            max_count: 3,
            upgrade_attributes: 
            {
                ulc_min_sacrifices_decrease_count: 1
            }
        }),
        areas_persist_ulc: build_shop_item("areas_persist_ulc", shop_resource, -100, 
        {
            name: __("Stable Areas"),
            description: __("Areas persist after ULC but floor stats will reset."),
            sprite: spr_flag,
            base_cost: 5000,
            max_count: 1
        }),
        crunchy_pyramid: build_shop_item("crunchy_pyramid", shop_resource, -90, 
        {
            name: __("Crunchy Pyramid"),
            description: __s("Increases %s start floor by %s per level.", __("Pyramid"), 10),
            sprite: spr_icon_area_pyramid,
            base_cost: 1000,
            cost_exp: 1.5,
            max_count: 10,
            upgrade_attributes: 
            {
                pyramid_floors_persist: 10
            }
        }),
        leaf_multiplier_all: build_shop_item("leaf_multiplier_all", shop_resource, 10, 
        {
            base_cost: 50,
            cost_exp: 2,
            max_count: 0,
            value: 25
        }),
        prestige_value_multiplier: build_shop_item("prestige_value_multiplier", shop_resource, 20, 
        {
            name: __s("Lord of %s", __("Prestige")),
            sprite: spr_gold,
            base_cost: 25,
            cost_exp: 2,
            max_count: 0,
            value: 10,
            upgrade_attributes: 
            {
                prestige_value_multiplier: 10
            },
            obfuscate_upgrade_description: false
        }),
        blc_value_multiplier: build_shop_item("blc_value_multiplier", shop_resource, 21, 
        {
            name: __s("Lord of %s", __("BLC")),
            sprite: spr_blc,
            base_cost: 40,
            cost_exp: 2,
            max_count: 0,
            value: 10,
            upgrade_attributes: 
            {
                blc_value_multiplier: 10
            },
            obfuscate_upgrade_description: false
        }),
        mlc_value_multiplier: build_shop_item("mlc_value_multiplier", shop_resource, 22, 
        {
            name: __s("Lord of %s", __("MLC")),
            sprite: spr_mlc,
            base_cost: 80,
            cost_exp: 2,
            max_count: 0,
            value: 10,
            upgrade_attributes: 
            {
                mlc_value_multiplier: 10
            },
            obfuscate_upgrade_description: false
        }),
        max_pets: build_shop_item("max_pets", shop_resource, 30, 
        {
            base_cost: 2000,
            max_count: 1
        }),
        printers_persist: build_shop_item("printers_persist_mlc", shop_resource, 40, 
        {
            name: __s("Unlimited Printer Ink %s", "+2"),
            description: __s("Printers count and Printers Room count persist after %s. Locked by %s.", __("Ultra Leaf Crunch"), __("Unlimited Printer Ink")),
            sprite: spr_icon_printer,
            base_cost: 500,
            upgrade_attributes: 
            {
                prestige_persist_shops: 
                {
                    printers: 2
                }
            },
            is_buyable: [has_bought_shop_item_safe, "mlc", "printers_persist_mlc"],
            max_count: 1,
            tag: global.shop_item_tags.printer
        }),
        albs_slap: build_shop_item("albs_slap", shop_resource, 50, 
        {
            name: __s("Autoblowerslapper"),
            description: __s("ALBs can now equip trouts. ALBs slap at a reduced rate."),
            sprite: spr_autoblower,
            base_cost: 750
        }),
        slap_critical_chance: build_shop_item("slap_critical_chance", shop_resource, 51, 
        {
            name: __s("Critical Slaps"),
            sprite: spr_weapon_trout,
            base_cost: 350,
            cost_exp: 1.25,
            max_count: 10,
            upgrade_attributes: 
            {
                slap_critical_chance: 0.02
            }
        }),
        slap_critical_multiplier: build_shop_item("slap_critical_multiplier", shop_resource, 52, 
        {
            name: __s("Critical Slap Multiplier"),
            sprite: spr_weapon_trout,
            base_cost: 250,
            cost_exp: 1.2,
            max_count: 10,
            upgrade_attributes: 
            {
                slap_critical_multiplier: 0.05
            }
        }),
        craft_min_chance: build_shop_item("craft_min_chance", shop_resource, 60, 
        {
            base_cost: 500,
            cost_exp: 1.5,
            max_count: 10,
            value: 8
        }),
        craft_max_tier: build_shop_item("craft_max_tier", shop_resource, 61, 
        {
            name: __s("Higher Craft Tier"),
            sprite: spr_icon_crafting,
            base_cost: 1000,
            cost_exp: 3,
            max_count: 3,
            upgrade_attributes: 
            {
                craft_max_tier: 1
            }
        }),
        craft_leaf_type_manual_malachite: build_shop_item("craft_max_tier", shop_resource, 70, 
        {
            name: __s("Craft Formula: %s", global.resources.malachite.name_single),
            sprite: spr_leaf_malachite,
            base_cost: 750,
            max_count: 1,
            upgrade_attributes: 
            {
                craft_leaf_type_manual: 
                {
                    malachite: 1
                }
            }
        }),
        craft_leaf_type_manual_hematite: build_shop_item("craft_max_tier", shop_resource, 71, 
        {
            name: __s("Craft Formula: %s", global.resources.hematite.name_single),
            sprite: spr_leaf_hematite,
            base_cost: 1250,
            max_count: 1,
            upgrade_attributes: 
            {
                craft_leaf_type_manual: 
                {
                    hematite: 1
                }
            },
            
            is_obfuscated: function()
            {
                return !has_bought_shop_item(global.shops.ulc.craft_leaf_type_manual_malachite);
            }
        }),
        craft_leaf_type_manual_plasma: build_shop_item("craft_max_tier", shop_resource, 72, 
        {
            name: __s("Craft Formula: %s", global.resources.plasma.name_single),
            sprite: spr_leaf_plasma,
            base_cost: 1500,
            max_count: 1,
            upgrade_attributes: 
            {
                craft_leaf_type_manual: 
                {
                    plasma: 1
                }
            },
            
            is_obfuscated: function()
            {
                return !has_bought_shop_item(global.shops.ulc.craft_leaf_type_manual_hematite);
            }
        }),
        craft_leaf_type_manual_coal: build_shop_item("craft_max_tier", shop_resource, 73, 
        {
            name: __s("Craft Formula: %s", global.resources.coal.name_single),
            sprite: spr_leaf_coal,
            base_cost: 2000,
            max_count: 1,
            upgrade_attributes: 
            {
                craft_leaf_type_manual: 
                {
                    coal: 1
                }
            },
            
            is_obfuscated: function()
            {
                return !has_bought_shop_item(global.shops.ulc.craft_leaf_type_manual_plasma);
            }
        }),
        craft_leaf_type_manual_soul: build_shop_item("craft_max_tier", shop_resource, 74, 
        {
            name: __s("Craft Formula: %s", global.resources.soul.name_single),
            sprite: spr_leaf_soul,
            base_cost: 2500,
            max_count: 1,
            upgrade_attributes: 
            {
                craft_leaf_type_manual: 
                {
                    soul: 1
                }
            },
            
            is_obfuscated: function()
            {
                return !has_bought_shop_item(global.shops.ulc.craft_leaf_type_manual_coal);
            }
        }),
        craft_leaf_type_manual_quark: build_shop_item("craft_max_tier", shop_resource, 75, 
        {
            name: __s("Craft Formula: %s", global.resources.quark.name_single),
            sprite: spr_leaf_quark,
            base_cost: 3000,
            max_count: 1,
            upgrade_attributes: 
            {
                craft_leaf_type_manual: 
                {
                    quark: 1
                }
            },
            
            is_obfuscated: function()
            {
                return !has_bought_shop_item(global.shops.ulc.craft_leaf_type_manual_soul);
            }
        }),
        max_borbventures: build_shop_item("max_borbventures", shop_resource, 1000, 
        {
            name: __s("More %s", "Borbventures"),
            description: __s("Increases the number of %s by %s.", "Borbventures", 1),
            sprite: spr_borb_jones,
            base_cost: 300,
            cost_exp: 2,
            max_count: 4,
            upgrade_attributes: 
            {
                borbventure_max_borbventures: 1
            }
        }),
        max_borbventure_borbs: build_shop_item("max_borbventure_borbs", shop_resource, 1001, 
        {
            name: __s("More %s", "Borbs"),
            description: __s("Increases borb roster size by %s.", 1),
            sprite: spr_borb_jones,
            base_cost: 450,
            cost_exp: 2.5,
            max_count: 4,
            upgrade_attributes: 
            {
                borbventure_max_borbs: 1
            }
        }),
        borbventure_items_max_count: build_shop_item("borbventure_items_max_count", shop_resource, 1010, 
        {
            name: __s("%s Backpack", __("Borbventure")),
            sprite: spr_icon_backpack,
            base_cost: 75,
            cost_exp: 1.5,
            max_count: 10,
            value: 3,
            upgrade_attributes: 
            {
                borbventure_items_max_count: 3
            }
        }),
        auto_craft_bv_items: build_shop_item("auto_craft_bv_items", shop_resource, 1100, 
        {
            name: __s("Auto Craft"),
            description: __s("Automatically crafts %s %s items every second. Can be toggled for each item.", 1, __("Borbventure")),
            sprite: spr_icon_backpack,
            base_cost: 750,
            max_count: 1
        }),
        auto_craft_bv_items_count: build_shop_item("auto_craft_bv_items_count", shop_resource, 1101, 
        {
            name: __s("Auto Craft Count"),
            sprite: spr_icon_backpack,
            base_cost: 1000,
            cost_exp: 1.5,
            max_count: 5,
            
            is_obfuscated: function()
            {
                return !has_bought_shop_item_safe(global.shops.ulc.auto_craft_bv_items);
            },
            
            upgrade_attributes: 
            {
                borbventure_auto_craft_count: 5
            }
        }),
        cards_enemy_drop_chance: build_shop_item("cards_enemy_drop_chance", shop_resource, 2000, 
        {
            base_cost: 75,
            cost_exp: 1.5,
            max_count: 10,
            value: 0.05
        }),
        cards_decrease_transcension_count_multiplier: build_shop_item("cards_decrease_transcension_count_multiplier", shop_resource, 2010, 
        {
            name: __("Cheap Transcension"),
            sprite: spr_card_uncommon,
            base_cost: 250,
            cost_exp: 1.75,
            max_count: 5,
            value: 1,
            upgrade_attributes: 
            {
                cards_decrease_transcension_count_multiplier: 0.02
            }
        }),
        dice_power_roll_count: build_shop_item("dice_power_roll_count", shop_resource, 4000, 
        {
            name: __("Power Roll Count"),
            sprite: spr_icon_die,
            base_cost: 200,
            cost_exp: 2.5,
            max_count: 5,
            upgrade_attributes: 
            {
                dice_power_roll_count: 1
            }
        }),
        dice_battlefield_die_drop_chance: build_shop_item("dice_battlefield_die_drop_chance", shop_resource, 4010, 
        {
            name: __s("Lucky Dice"),
            sprite: spr_icon_die,
            base_cost: 300,
            cost_exp: 2.5,
            max_count: 5,
            upgrade_attributes: 
            {
                dice_battlefield_die_drop_chance: 0.01
            }
        }),
        dice_inventory_size: build_shop_item("dice_inventory_size", shop_resource, 4020, 
        {
            base_cost: 250,
            cost_exp: 1.5,
            max_count: 5,
            value: 1
        }),
        dice_backpack_size: build_shop_item("dice_backpack_size", shop_resource, 4021, 
        {
            base_cost: 150,
            cost_exp: 1.5,
            max_count: 5,
            value: 1
        }),
        auto_collect_equipment: build_shop_item("auto_collect_equipment", shop_resource, 5000, 
        {
            name: __s("Equipment Harvester"),
            sprite: spr_equip_shield,
            base_cost: 200,
            cost_exp: 1.2,
            max_count: 0,
            upgrade_attributes: 
            {
                result_auto_collect: 
                {
                    equipment_random: 1000
                }
            }
        }),
        leafscender_output_count: build_shop_item("leafscender_output_count", shop_resource, 6000, 
        {
            name: __("Leafscender Enhancer"),
            sprite: spr_icon_leafscension,
            base_cost: 300,
            cost_exp: 1.5,
            max_count: 10,
            upgrade_attributes: 
            {
                leafscender_output_count: 1
            }
        }),
        material_spawn_chance_add_base: build_shop_item("material_spawn_chance_add_base", shop_resource, 7000, 
        {
            name: __("Material Finder"),
            sprite: spr_material_copper_bar,
            base_cost: 150,
            cost_exp: 1.3,
            max_count: 10,
            upgrade_attributes: 
            {
                material_spawn_chance_add_base: 0.02
            }
        }),
        material_collect_count: build_shop_item("material_collect_count", shop_resource, 7001, 
        {
            name: __("Material Collector"),
            sprite: spr_material_copper_bar,
            base_cost: 250,
            cost_exp: 1.3,
            max_count: 5,
            upgrade_attributes: 
            {
                material_collect_count: 2
            }
        }),
        reactor_size: build_shop_item("reactor_size", shop_resource, 8000, 
        {
            base_cost: 200,
            cost_exp: 1.2,
            value: 100
        }),
        banks_auto_start_deposit: build_shop_item("banks_auto_start_deposit", shop_resource, 9000, 
        {
            name: __("Auto Banks"),
            description: __("Enables auto deposit for each bank after ULC."),
            sprite: spr_icon_bank,
            base_cost: 300,
            is_toggle: true
        }),
        auto_buy_mlc_shop: build_shop_item("autobuy_shop", shop_resource, 10000, 
        {
            base_cost: 25,
            resource: global.resources.mlc
        })
    };
}
