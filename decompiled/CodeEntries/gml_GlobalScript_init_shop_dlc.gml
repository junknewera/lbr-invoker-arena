function init_shop_dlc()
{
    global.shops_prestige_levels.dlc = global.prestige_levels.inf;
    global.shops.dlc = 
    {
        supporter_pack: 
        {
            index: 0,
            name: __("Supporter Pack"),
            description: __("The leaf blower's starter pack. Get 400 Gems, 20 more Gems per daily reward, 1x 6h Time Travel, 2x 30m Time Travel.") + "\n" + "\n" + __s("Unlocks Tier %s Supporter Perks.", 1),
            sprite: spr_icon_supporter,
            cost: 
            {
                usd: 5.99
            },
            max_count: 1,
            is_static: true,
            is_dlc: true,
            is_paid: true,
            dlc_id: global.is_mobile ? "supporter_pack" : "1482630",
            supporters_tier: UnknownEnum.Value_1,
            upgrade_attributes: 
            {
                daily_reward_gems: 20
            },
            instant_result: 
            {
                resources: 
                {
                    gems: 400
                },
                time_travel: 
                {
                    time_travel_6h: 1,
                    time_travel_30m: 2
                }
            }
        },
        premium_pack: 
        {
            index: 100,
            name: __("Premium Pack"),
            description: __("The ultimate leaf blowing experience. Get 2000 Gems, 100 more Gems per daily reward, 1x 72h Time Travel, 2x 24h Time Travel, 3x 6h Time Travel, 5x 30m Time Travel.") + "\n" + "\n" + __s("Unlocks Tier %s Supporter Perks.", 2),
            sprite: spr_icon_star2,
            cost: 
            {
                usd: 24.99
            },
            max_count: 1,
            is_static: true,
            is_dlc: true,
            is_paid: true,
            dlc_id: global.is_mobile ? "premium_pack" : "1482631",
            supporters_tier: UnknownEnum.Value_2,
            upgrade_attributes: 
            {
                daily_reward_gems: 100
            },
            instant_result: 
            {
                resources: 
                {
                    gems: 2000
                },
                time_travel: 
                {
                    time_travel_72h: 1,
                    time_travel_24h: 2,
                    time_travel_6h: 3,
                    time_travel_30m: 5
                }
            }
        },
        fishing_pack: 
        {
            index: 130,
            name: __("Fishing Pack"),
            description_prefix: __("Reel in the fun with the Fishing Pack which includes a boatload of bonuses!"),
            
            description: function(arg0)
            {
                return get_dlc_description(arg0);
            },
            
            sprite: spr_fish_aquazure,
            cost: 
            {
                usd: 13.99
            },
            max_count: 1,
            is_static: true,
            is_dlc: true,
            is_iap: true,
            is_paid: true,
            dlc_id: global.is_mobile ? "fishing_pack" : 10003,
            supporters_tier: UnknownEnum.Value_1,
            upgrade_attributes: 
            {
                daily_reward_result: 
                {
                    materials: 
                    {
                        tide_crystal: 100
                    },
                    resources: 
                    {
                        fish_credits: 2000,
                        gems: 40
                    }
                },
                fishing_catch_credits_multiplier_dlc: 3,
                fishing_catch_tide_crystal_chance: 0.05,
                fishing_min_fish_length_multiplier_dlc: 0.5,
                fishing_max_fish_length_multiplier_dlc: 0.5,
                fishing_rods_max_count: 1,
                fishing_wait_duration_reduction_multiplier: 0.15,
                fishing_xp_multiplier: 0.25
            },
            instant_result: 
            {
                fishing_rods_rarity: 
                {
                    legendary: 1
                },
                materials: 
                {
                    tide_crystal: 500
                },
                resources: 
                {
                    fish_credits: 10000,
                    gems: 250
                }
            }
        },
        mines_pack: 
        {
            index: 140,
            name: __("Mines Pack"),
            description_prefix: __("Unearth a bounty of rewards every day with the Mines Pack!"),
            
            description: function(arg0)
            {
                return get_dlc_description(arg0);
            },
            
            sprite: spr_icon_mine,
            cost: 
            {
                usd: 13.99
            },
            max_count: 1,
            is_static: true,
            is_dlc: true,
            is_iap: true,
            is_paid: true,
            dlc_id: global.is_mobile ? "mines_pack" : 10002,
            supporters_tier: UnknownEnum.Value_1,
            upgrade_attributes: 
            {
                daily_reward_result: 
                {
                    mine_item_rarity: 
                    {
                        epic: 5,
                        mythical: 3,
                        legendary: 2
                    },
                    resources: 
                    {
                        coal_time_sphere: 10,
                        diamond_coal: 500,
                        diamond_shiny: 5,
                        fuel: 25000,
                        gems: 40
                    }
                },
                mines_drill_depth_progress_multiplier_dlc: 0.5,
                mines_max_active_caves: 4,
                mines_inventory_size: 8,
                mines_mine_power_multiplier_dlc: 1
            },
            instant_result: 
            {
                mine_item_rarity: 
                {
                    epic: 10,
                    mythical: 10,
                    legendary: 5
                },
                resources: 
                {
                    coal_time_sphere: 75,
                    diamond_coal: 5000,
                    diamond_shiny: 50,
                    fuel: 100000,
                    gems: 250
                }
            }
        },
        nature_pack: 
        {
            index: 150,
            name: __("Nature Pack"),
            description_prefix: __("Get ready to explore a new world of nature and environmental conservation with the Nature Pack! Featuring exciting new elements like Nature Gems, Plants, Butterflies, and more, this purchase offers an immersive experience that will keep you engaged for hours on end.") + "\n" + __s("%s will always be active.", global.events.nature_season.name) + "\n" + __s("Unlocks premium rewards for %s.", __("Nature Season")),
            
            description: function(arg0)
            {
                return get_dlc_description(arg0);
            },
            
            sprite: spr_plant_primula,
            cost: 
            {
                usd: 19.99
            },
            max_count: 1,
            is_static: true,
            is_dlc: true,
            is_iap: true,
            is_paid: true,
            dlc_id: global.is_mobile ? "nature_pack" : 10000,
            supporters_tier: UnknownEnum.Value_1,
            upgrade_attributes: 
            {
                daily_reward_result: 
                {
                    resources: 
                    {
                        gems: 50,
                        nature_gems: 150,
                        nature_time_sphere: 10,
                        magic_mulch: 200
                    }
                },
                nature_xp_multiplier: 0.5
            },
            instant_result: 
            {
                resources: 
                {
                    gems: 500,
                    nature_gems: 500,
                    nature_time_sphere: 50,
                    magic_mulch: 1000
                }
            }
        },
        dice_pack: 
        {
            index: 160,
            name: __("Dice Pack"),
            description_prefix: __("The Dice Pack isn't just about luck - it's about enhancing your strategy and taking your skills to the next level!"),
            
            description: function(arg0)
            {
                return get_dlc_description(arg0);
            },
            
            sprite: spr_icon_die,
            cost: 
            {
                usd: 13.99
            },
            max_count: 1,
            is_static: true,
            is_dlc: true,
            is_iap: true,
            is_paid: true,
            dlc_id: global.is_mobile ? "dice_pack" : 10001,
            supporters_tier: UnknownEnum.Value_1,
            upgrade_attributes: 
            {
                daily_reward_result: 
                {
                    dice_rarity: 
                    {
                        rare: 1,
                        epic: 1
                    },
                    resources: 
                    {
                        dice: 1000,
                        gems: 40
                    }
                },
                dice_backpack_size: 10,
                dice_inventory_size: 10,
                dice_battlefield_die_drop_chance: 0.01
            },
            instant_result: 
            {
                dice_rarity: 
                {
                    epic: 1,
                    mythical: 1,
                    legendary: 1
                },
                resources: 
                {
                    dice: 7500,
                    gems: 250
                }
            }
        },
        material_pack: 
        {
            index: 200,
            name: __("Material Pack"),
            description: __("Upgrade your leaf-blowing tools with materials! Get 1000 of all materials, 50 of all essences, and 50 more Gems per daily reward. Instantly get 500 of all materials, 25 of all essences, and 400 gems. Material storage is increased by 10000, and you have access to more Kokkaupunki quests.") + "\n" + "\n" + __s("Unlocks Tier %s Supporter Perks.", 1) + "\n" + __("Note: some materials and essences have a lower daily reward."),
            sprite: spr_material_copper_bar,
            cost: 
            {
                usd: 8.99
            },
            max_count: 1,
            is_static: true,
            is_dlc: true,
            is_paid: true,
            dlc_id: global.is_mobile ? "materials_pack" : "1873910",
            supporters_tier: UnknownEnum.Value_1,
            upgrade_attributes: 
            {
                daily_reward_gems: 50,
                daily_reward_materials: 1000,
                daily_reward_materials_essences: 50,
                material_max_count: 10000,
                kokka_more_quests: 1
            },
            instant_result: 
            {
                resources: 
                {
                    gems: 400
                }
            },
            
            func: function(arg0 = false)
            {
                var add_mats = {};
                var __array = global.materials_spawnable;
                var __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    variable_struct_set(add_mats, mitem.key, 500);
                }
                __array = global.materials_essences;
                __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    variable_struct_set(add_mats, mitem.key, 25);
                }
                add_materials(add_mats);
                log("added mats", add_mats);
            }
        },
        cards_pack: 
        {
            index: 250,
            name: __("Cards Pack"),
            description: __("Progress quicker with the Cards Pack! Get the following packs per daily reward: 3 Common Packs, 2 Rare Packs, 1 Legendary Pack. Additionally, you'll get 5 Common Packs, 3 Rare Packs, 2 Legendary Packs instantly. There's even more: Get 500 + 75 daily Gems!") + "\n" + "\n" + __s("Unlocks Tier %s Supporter Perks.", 1),
            sprite: spr_card_legendary,
            cost: 
            {
                usd: 13.99
            },
            max_count: 1,
            is_static: true,
            is_dlc: true,
            is_paid: true,
            dlc_id: global.is_mobile ? "cards_pack" : "2125730",
            supporters_tier: UnknownEnum.Value_1,
            upgrade_attributes: 
            {
                daily_reward_gems: 75,
                daily_reward_cards_packs: 
                {
                    common: 3,
                    rare: 2,
                    legendary: 1
                }
            },
            instant_result: 
            {
                cards_packs: 
                {
                    common: 5,
                    rare: 3,
                    legendary: 2
                },
                resources: 
                {
                    gems: 500
                }
            }
        },
        borbventure_pack: 
        {
            index: 260,
            name: __("Borbventure Pack"),
            description_prefix: __s("Supercharge your Borbs with the Borbventure Pack! Get the following packs per daily reward: %s Common Packs, %s Rare Packs, %s Legendary Pack. Additionally, you'll get %s Common Packs, %s Rare Packs, %s Legendary Packs instantly. There's even more: Unlock Borbiana Jones + %s Gems instantly + %s daily!", 3, 2, 1, 5, 3, 2, 500, 75),
            
            description: function(arg0)
            {
                return get_dlc_description(arg0);
            },
            
            sprite: spr_borb_jones,
            cost: 
            {
                usd: 13.99
            },
            max_count: 1,
            is_static: true,
            is_dlc: true,
            is_paid: true,
            dlc_id: global.is_mobile ? "borbventure_pack" : "2239260",
            supporters_tier: UnknownEnum.Value_1,
            upgrade_attributes: 
            {
                daily_reward_gems: 75,
                daily_reward_borbventure_packs: 
                {
                    common: 3,
                    rare: 2,
                    legendary: 1
                },
                borbventure_max_borbs: 1,
                borbventure_increase_time: -0.05
            },
            instant_result: 
            {
                borbventure_borb: 
                {
                    common: 
                    {
                        borbiana_jones: 1
                    }
                },
                borbventure_packs: 
                {
                    common: 5,
                    rare: 3,
                    legendary: 2
                },
                resources: 
                {
                    gems: 500
                }
            },
            
            func: function(arg0 = false)
            {
                variable_struct_set(global.borbventures.data.unlocked_borb_types, global.borbventures.borb_types.borbiana_jones.key, true);
            }
        },
        skins_pack: 
        {
            index: 300,
            name: __("Skins Pack"),
            description: __("Do you want fashion for your character? You get fashion for your character. The Skins Pack unlocks all available and future skins in the game. Also, I'll throw in 200 gems on top."),
            sprite: spr_player_rainbow,
            cost: 
            {
                usd: 3.99
            },
            max_count: 1,
            is_static: true,
            is_dlc: true,
            is_paid: true,
            dlc_id: global.is_mobile ? "skins_pack" : "1482632",
            instant_result: 
            {
                resources: 
                {
                    gems: 200
                }
            }
        },
        gems_pack_legendary: 
        {
            index: 5000,
            name: __s("%s %s Pack", __("Legendary"), __("Gems")),
            description_prefix: __("Equip yourself with powerful Gems to purchase useful upgrades!"),
            
            description: function(arg0)
            {
                return get_dlc_description(arg0);
            },
            
            sprite: spr_resource_gem,
            cost: 
            {
                usd: 9.99
            },
            max_count: 1,
            is_static: true,
            is_dlc: true,
            is_iap: true,
            is_paid: true,
            dlc_id: global.is_mobile ? "gems_pack_legendary" : 11003,
            supporters_tier: UnknownEnum.Value_1,
            instant_result: 
            {
                resources: 
                {
                    gems: 3000
                }
            },
            upgrade_attributes: 
            {
                daily_reward_result: 
                {
                    resources: 
                    {
                        gems: 50
                    }
                }
            }
        },
        gems_pack_epic: 
        {
            index: 5001,
            name: __s("%s %s Pack", __("Epic"), __("Gems")),
            description_prefix: __("Equip yourself with powerful Gems to purchase useful upgrades!"),
            
            description: function(arg0)
            {
                return get_dlc_description(arg0);
            },
            
            sprite: spr_resource_gem,
            cost: 
            {
                usd: 6.99
            },
            max_count: 1,
            is_static: true,
            is_dlc: true,
            is_iap: true,
            is_paid: true,
            dlc_id: global.is_mobile ? "gems_pack_epic" : 11002,
            instant_result: 
            {
                resources: 
                {
                    gems: 800
                }
            },
            upgrade_attributes: 
            {
                daily_reward_result: 
                {
                    resources: 
                    {
                        gems: 30
                    }
                }
            }
        },
        gems_pack_uncommon: 
        {
            index: 5002,
            name: __s("%s %s Pack", __("Uncommon"), __("Gems")),
            description_prefix: __("Equip yourself with powerful Gems to purchase useful upgrades!"),
            
            description: function(arg0)
            {
                return get_dlc_description(arg0);
            },
            
            sprite: spr_resource_gem,
            cost: 
            {
                usd: 2.99
            },
            max_count: 1,
            is_static: true,
            is_dlc: true,
            is_iap: true,
            is_paid: true,
            dlc_id: global.is_mobile ? "gems_pack_uncommon" : 11001,
            instant_result: 
            {
                resources: 
                {
                    gems: 250
                }
            },
            upgrade_attributes: 
            {
                daily_reward_result: 
                {
                    resources: 
                    {
                        gems: 10
                    }
                }
            }
        },
        fan_pack: 
        {
            index: 10000,
            name: __("Fan Gift"),
            description: __s("This gift is for all leaf blowing fans! Get %s instantly and %s per daily reward!", format_resources_text(
            {
                gems: 100
            }), format_resources_text(
            {
                gems: 5
            })),
            sprite: spr_icon_gift,
            cost: 
            {
                usd: 0
            },
            max_count: 1,
            is_free: true,
            is_static: true,
            is_dlc: true,
            is_paid: false,
            dlc_id: "supporter_pack_free",
            upgrade_attributes: 
            {
                daily_reward_gems: 5
            },
            instant_result: 
            {
                resources: 
                {
                    gems: 100
                }
            }
        }
    };
}

enum UnknownEnum
{
    Value_1 = 1,
    Value_2
}
