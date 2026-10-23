function init_journeys()
{
    global.journeys = 
    {
        fishing: new Journey(
        {
            name: __("Fishing Journey"),
            data_key: "fishing",
            max_level: 60,
            tiers: 1,
            items_data: [
            {
                sprite: spr_fish_aquazure,
                level: 2,
                result: 
                {
                    fish_rarity: 
                    {
                        common: 10
                    }
                },
                rarity_key: "common"
            }, 
            {
                sprite: spr_fish_aquazure,
                level: 7,
                result: 
                {
                    fish_rarity: 
                    {
                        common: 25
                    }
                },
                rarity_key: "common"
            }, 
            {
                sprite: spr_fish_aquazure,
                level: 12,
                result: 
                {
                    fish_rarity: 
                    {
                        uncommon: 10
                    }
                },
                rarity_key: "uncommon"
            }, 
            {
                sprite: spr_fish_aquazure,
                level: 17,
                result: 
                {
                    fish_rarity: 
                    {
                        uncommon: 25
                    }
                },
                rarity_key: "uncommon"
            }, 
            {
                sprite: spr_fish_aquazure,
                level: 22,
                result: 
                {
                    fish_rarity: 
                    {
                        rare: 10
                    }
                },
                rarity_key: "rare"
            }, 
            {
                sprite: spr_fish_aquazure,
                level: 27,
                result: 
                {
                    fish_rarity: 
                    {
                        rare: 25
                    }
                },
                rarity_key: "rare"
            }, 
            {
                sprite: spr_fish_aquazure,
                level: 32,
                result: 
                {
                    fish_rarity: 
                    {
                        epic: 10
                    }
                },
                rarity_key: "epic"
            }, 
            {
                sprite: spr_fish_aquazure,
                level: 37,
                result: 
                {
                    fish_rarity: 
                    {
                        epic: 25
                    }
                },
                rarity_key: "epic"
            }, 
            {
                sprite: spr_fish_aquazure,
                level: 42,
                result: 
                {
                    fish_rarity: 
                    {
                        mythical: 10
                    }
                },
                rarity_key: "mythical"
            }, 
            {
                sprite: spr_fish_aquazure,
                level: 47,
                result: 
                {
                    fish_rarity: 
                    {
                        mythical: 25
                    }
                },
                rarity_key: "mythical"
            }, 
            {
                sprite: spr_fish_aquazure,
                level: 52,
                result: 
                {
                    fish_rarity: 
                    {
                        legendary: 10
                    }
                },
                rarity_key: "legendary"
            }, 
            {
                sprite: spr_fish_aquazure,
                level: 57,
                result: 
                {
                    fish_rarity: 
                    {
                        legendary: 25
                    }
                },
                rarity_key: "legendary"
            }, 
            {
                sprite: spr_bait_common,
                level: 3,
                result: 
                {
                    fish_baits: 
                    {
                        common: 10
                    }
                },
                rarity_key: "common"
            }, 
            {
                sprite: spr_bait_common,
                level: 8,
                result: 
                {
                    fish_baits: 
                    {
                        common: 20
                    }
                },
                rarity_key: "common"
            }, 
            {
                sprite: spr_bait_uncommon,
                level: 13,
                result: 
                {
                    fish_baits: 
                    {
                        uncommon: 10
                    }
                },
                rarity_key: "uncommon"
            }, 
            {
                sprite: spr_bait_uncommon,
                level: 18,
                result: 
                {
                    fish_baits: 
                    {
                        uncommon: 20
                    }
                },
                rarity_key: "uncommon"
            }, 
            {
                sprite: spr_bait_rare,
                level: 23,
                result: 
                {
                    fish_baits: 
                    {
                        rare: 10
                    }
                },
                rarity_key: "rare"
            }, 
            {
                sprite: spr_bait_rare,
                level: 28,
                result: 
                {
                    fish_baits: 
                    {
                        rare: 20
                    }
                },
                rarity_key: "rare"
            }, 
            {
                sprite: spr_bait_epic,
                level: 33,
                result: 
                {
                    fish_baits: 
                    {
                        epic: 10
                    }
                },
                rarity_key: "epic"
            }, 
            {
                sprite: spr_bait_epic,
                level: 38,
                result: 
                {
                    fish_baits: 
                    {
                        epic: 20
                    }
                },
                rarity_key: "epic"
            }, 
            {
                sprite: spr_bait_mythical,
                level: 43,
                result: 
                {
                    fish_baits: 
                    {
                        mythical: 10
                    }
                },
                rarity_key: "mythical"
            }, 
            {
                sprite: spr_bait_mythical,
                level: 48,
                result: 
                {
                    fish_baits: 
                    {
                        mythical: 20
                    }
                },
                rarity_key: "mythical"
            }, 
            {
                sprite: spr_bait_legendary,
                level: 53,
                result: 
                {
                    fish_baits: 
                    {
                        legendary: 10
                    }
                },
                rarity_key: "legendary"
            }, 
            {
                sprite: spr_bait_legendary,
                level: 58,
                result: 
                {
                    fish_baits: 
                    {
                        legendary: 20
                    }
                },
                rarity_key: "legendary"
            }, 
            {
                sprite: spr_material_advanced_tide_crystal,
                level: 49,
                result: 
                {
                    materials: 
                    {
                        tide_crystal_advanced: 1
                    }
                }
            }, 
            {
                sprite: spr_material_advanced_tide_crystal,
                level: 59,
                result: 
                {
                    materials: 
                    {
                        tide_crystal_advanced: 2
                    }
                }
            }, 
            {
                sprite: spr_material_tide_crystal,
                frequency: 5,
                multiplier: 1,
                result: 
                {
                    materials: 
                    {
                        tide_crystal: 3
                    }
                }
            }],
            remaining_reward: 
            {
                multiplier: 1,
                result: 
                {
                    resources: 
                    {
                        fish_credits: 15
                    }
                },
                sprite: spr_resource_fish_credits
            },
            static_upgrade_attributes: 
            {
                daily_quest_slots: 1
            },
            upgrade_attributes: 
            {
                blower_enemy_damage_multiplier_fish: 2,
                fishing_catch_credits_multiplier: 0.5,
                fishing_catch_tide_crystal_chance: 0.03,
                fishing_min_fish_length_multiplier: 0.25,
                fishing_max_fish_length_multiplier: 0.25,
                fishing_tourney_rod_value_multiplier: 0.1,
                leaf_multiplier_fish: 1
            }
        }),
        harbor: new Journey(
        {
            name: __("Harbor Journey"),
            data_key: "harbor",
            max_level: 60,
            tiers: 1,
            xp_table_base: 10,
            xp_table_exp: 1.5,
            items_data: [
            {
                sprite: spr_icon_questionbox,
                level: 2,
                result: 
                {
                    harbor_items_rarity: 
                    {
                        common: 5
                    }
                },
                rarity_key: "common"
            }, 
            {
                sprite: spr_icon_questionbox,
                level: 7,
                result: 
                {
                    harbor_items_rarity: 
                    {
                        common: 10
                    }
                },
                rarity_key: "common"
            }, 
            {
                sprite: spr_icon_pusher,
                level: 9,
                result: 
                {
                    resources: 
                    {
                        water_crystal: 35
                    }
                },
                description: __s("Unlocks the %s upgrade in the %s shop.", __("Hire Pusher"), __("Gems"))
            }, 
            {
                sprite: spr_icon_questionbox,
                level: 12,
                result: 
                {
                    harbor_items_rarity: 
                    {
                        uncommon: 5
                    }
                },
                rarity_key: "uncommon"
            }, 
            {
                sprite: spr_icon_questionbox,
                level: 17,
                result: 
                {
                    harbor_items_rarity: 
                    {
                        uncommon: 10
                    }
                },
                rarity_key: "uncommon"
            }, 
            {
                sprite: spr_icon_diver,
                level: 19,
                result: 
                {
                    resources: 
                    {
                        water_crystal: 60
                    }
                },
                description: __s("Unlocks the %s upgrade in the %s shop.", __("Diver"), __("Gems"))
            }, 
            {
                sprite: spr_icon_questionbox,
                level: 22,
                result: 
                {
                    harbor_items_rarity: 
                    {
                        rare: 5
                    }
                },
                rarity_key: "rare"
            }, 
            {
                sprite: spr_icon_questionbox,
                level: 27,
                result: 
                {
                    harbor_items_rarity: 
                    {
                        rare: 10
                    }
                },
                rarity_key: "rare"
            }, 
            {
                sprite: spr_icon_questionbox,
                level: 32,
                result: 
                {
                    harbor_items_rarity: 
                    {
                        epic: 5
                    }
                },
                rarity_key: "epic"
            }, 
            {
                sprite: spr_icon_questionbox,
                level: 37,
                result: 
                {
                    harbor_items_rarity: 
                    {
                        epic: 10
                    }
                },
                rarity_key: "epic"
            }, 
            {
                sprite: spr_icon_questionbox,
                level: 42,
                result: 
                {
                    harbor_items_rarity: 
                    {
                        mythical: 5
                    }
                },
                rarity_key: "mythical"
            }, 
            {
                sprite: spr_icon_questionbox,
                level: 47,
                result: 
                {
                    harbor_items_rarity: 
                    {
                        mythical: 10
                    }
                },
                rarity_key: "mythical"
            }, 
            {
                sprite: spr_icon_questionbox,
                level: 52,
                result: 
                {
                    harbor_items_rarity: 
                    {
                        legendary: 5
                    }
                },
                rarity_key: "legendary"
            }, 
            {
                sprite: spr_icon_questionbox,
                level: 57,
                result: 
                {
                    harbor_items_rarity: 
                    {
                        legendary: 10
                    }
                },
                rarity_key: "legendary"
            }, 
            {
                sprite: spr_resource_ship_fuel,
                frequency: 5,
                multiplier: 0.5,
                result: 
                {
                    resources: 
                    {
                        ship_fuel: 20
                    }
                }
            }],
            remaining_reward: 
            {
                multiplier: 0.5,
                result: 
                {
                    resources: 
                    {
                        water_crystal: 10
                    }
                },
                sprite: spr_resource_water_crystal
            },
            static_upgrade_attributes: 
            {
                max_pets: 1,
                daily_quest_slots: 1
            },
            upgrade_attributes: 
            {
                blower_enemy_damage_multiplier_harbor: 2,
                leaf_multiplier_harbor: 1,
                max_pets: 1
            }
        }),
        anniversary: new Journey(
        {
            name: __("Anniversary Journey"),
            data_key: "anniversary",
            max_level: 60,
            tiers: 1,
            xp_table_base: 10,
            xp_table_exp: 1.5,
            remaining_reward: 
            {
                multiplier: 0.5,
                result: 
                {
                    resources: 
                    {
                        party_tokens: 10
                    }
                },
                sprite: spr_icon_birthday_cake
            },
            static_upgrade_attributes: 
            {
                max_pets: 1,
                daily_quest_slots: 1
            },
            upgrade_attributes: 
            {
                blower_enemy_damage_multiplier: 2,
                leaf_multiplier: 1,
                max_pets: 1
            }
        })
    };
    init_game_object_struct(global.journeys);
    global.journeys_array = struct_to_array(global.journeys);
}
