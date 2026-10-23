function init_milestones()
{
    var lp_count = [3, 25, 50];
    var lp_count_special = 100;
    global.milestones = 
    {
        tower: 
        {
            index: 0,
            section_name: __("Tower"),
            milestones: 
            {
                tower1: new Milestone(
                {
                    level: 1,
                    description: __("Welcome to the Leaf Tower!")
                }),
                tower11: new Milestone(
                {
                    level: 11,
                    description: __("You beat the first tower boss! Congratulations!"),
                    reward: 
                    {
                        resources: 
                        {
                            cheese: 100,
                            beer: 5
                        }
                    }
                }),
                tower25: new Milestone(
                {
                    level: 25,
                    description: __("So many floors..."),
                    reward: 
                    {
                        resources: 
                        {
                            silver_token: 25000,
                            gold_token: 25
                        }
                    }
                }),
                tower42: new Milestone(
                {
                    level: 42,
                    description: __("This floor is peculiar...")
                }),
                tower50: new Milestone(
                {
                    level: 50,
                    description: __("Half way up..."),
                    reward: 
                    {
                        resources: 
                        {
                            silver_token: 1000000,
                            gold_token: 1000
                        }
                    }
                }),
                tower66: new Milestone(
                {
                    level: 66,
                    description: __("- H E L L O -"),
                    reward: 
                    {
                        stats: 
                        {
                            cursed_count: 66
                        }
                    }
                }),
                tower69: new Milestone(
                {
                    level: 69,
                    description: __("Hehehh..."),
                    reward: 
                    {
                        resources: 
                        {
                            gems: 69
                        }
                    }
                }),
                tower75: new Milestone(
                {
                    level: 75,
                    description: __("Here, have some gems!"),
                    reward: 
                    {
                        resources: 
                        {
                            gems: 75
                        }
                    }
                }),
                tower100: new Milestone(
                {
                    level: 100,
                    description: __("You have defeated Bob! Mega Leaf Crunch is now available.")
                }),
                tower101: new Milestone(
                {
                    level: 101,
                    description: __("Oh, there are more tower floors? Interesting... Here is some beer and cheese."),
                    reward: 
                    {
                        resources: 
                        {
                            cheese: 5000,
                            beer: 100
                        }
                    }
                }),
                tower150: new Milestone(
                {
                    level: 150,
                    description: __("Curses aren't that bad actually..."),
                    reward: 
                    {
                        stats: 
                        {
                            cursed_count: 200
                        }
                    }
                }),
                tower200: new Milestone(
                {
                    level: 200,
                    description: __("Mmm, cheese."),
                    reward: 
                    {
                        resources: 
                        {
                            cheese: 10000
                        }
                    }
                }),
                tower201: new Milestone(
                {
                    level: 201,
                    description: __("Mmm, beer."),
                    reward: 
                    {
                        resources: 
                        {
                            beer: 200
                        }
                    }
                }),
                tower250: new Milestone(
                {
                    level: 250,
                    description: __("Mmm, MLC coins."),
                    upgrade_attributes: 
                    {
                        mlc_value_multiplier_milestone: 0.25
                    }
                }),
                tower251: new Milestone(
                {
                    level: 251,
                    description: __("Mmm, Cards."),
                    upgrade_attributes: 
                    {
                        cards_enemy_drop_chance: 0.0002
                    }
                }),
                tower420: new Milestone(
                {
                    level: 420,
                    description: __("Hehehh..."),
                    upgrade_attributes: 
                    {
                        daily_reward_gems: 5
                    }
                }),
                tower500: new Milestone(
                {
                    level: 500,
                    description: __("Mmm, essences."),
                    reward: 
                    {
                        materials: 
                        {
                            essence_cosmic: 50,
                            essence_dark: 5,
                            essence_earth: 50,
                            essence_leaf: 50,
                            essence_water: 50
                        }
                    }
                }),
                tower666: new Milestone(
                {
                    level: 666,
                    description: __("- H E L L O - A G A I N -"),
                    reward: 
                    {
                        stats: 
                        {
                            cursed_count: 666
                        }
                    }
                }),
                tower750: new Milestone(
                {
                    level: 750,
                    description: __("Mmm, MLC coins."),
                    upgrade_attributes: 
                    {
                        mlc_value_multiplier_milestone: 0.75
                    }
                }),
                tower751: new Milestone(
                {
                    level: 751,
                    description: __("Mmm, Cards."),
                    upgrade_attributes: 
                    {
                        cards_enemy_drop_chance: 0.0002
                    }
                }),
                tower1000: new Milestone(
                {
                    level: 1000,
                    description: __("1k floors! Don't fall down!"),
                    upgrade_attributes: 
                    {
                        material_max_count: 500
                    }
                }),
                tower1337: new Milestone(
                {
                    level: 1337,
                    description: __("1v1 de_aztec no awp?"),
                    upgrade_attributes: 
                    {
                        skip_tower_floor_chance: 0.01
                    }
                }),
                tower2500: new Milestone(
                {
                    level: 2500,
                    description: __("Keep climbing, keep climbing..."),
                    upgrade_attributes: 
                    {
                        material_spawn_chance_add_base: 0.005
                    }
                }),
                tower5000: new Milestone(
                {
                    level: 5000,
                    description: __("Mmm, MLC coins."),
                    upgrade_attributes: 
                    {
                        mlc_value_multiplier_milestone: 1
                    }
                }),
                tower5001: new Milestone(
                {
                    level: 5001,
                    description: __("Mmm, Cards."),
                    upgrade_attributes: 
                    {
                        cards_enemy_drop_chance: 0.0002
                    }
                }),
                tower6666: new Milestone(
                {
                    level: 6666,
                    description: __("- H E L L O - A G A I N -"),
                    reward: 
                    {
                        stats: 
                        {
                            cursed_count: 6666
                        }
                    }
                }),
                tower7500: new Milestone(
                {
                    level: 7500,
                    description: __("Some offline boost for you!"),
                    upgrade_attributes: 
                    {
                        offline_mlc: 1
                    }
                }),
                tower10k: new Milestone(
                {
                    level: 10000,
                    description: __("Must. Brew. Faster."),
                    upgrade_attributes: 
                    {
                        alchemy_brew_time_reduction: 0.02
                    }
                }),
                tower25k: new Milestone(
                {
                    level: 25000,
                    description: __("Avocados are a fruit, not a vegetable."),
                    upgrade_attributes: 
                    {
                        alchemy_brew_crit_chance: 0.01
                    }
                }),
                tower55k: new Milestone(
                {
                    level: 55555,
                    description: __("I lost track of the number of stairs..."),
                    upgrade_attributes: 
                    {
                        scrolls_active_max: 1
                    }
                }),
                tower66k: new Milestone(
                {
                    level: 66666,
                    description: __("- H E L L O - A G A I N -"),
                    reward: 
                    {
                        stats: 
                        {
                            cursed_count: 66666
                        }
                    }
                }),
                tower69420: new Milestone(
                {
                    level: 69420,
                    description: __(":)"),
                    reward: 
                    {
                        stats: 
                        {
                            cursed_count: 69420
                        }
                    }
                }),
                tower100k: new Milestone(
                {
                    level: 100000,
                    description: __s("%s floors! Back in the day, we only had 100 floors.", "100k"),
                    upgrade_attributes: 
                    {
                        max_pets: 1
                    }
                }),
                tower150k: new Milestone(
                {
                    level: 150000,
                    upgrade_attributes: 
                    {
                        material_max_count: 500
                    }
                }),
                tower200k: new Milestone(
                {
                    level: 200000,
                    description: __s("%s floors! Never skip leg day.", "200k"),
                    upgrade_attributes: 
                    {
                        shards_max_count: 2
                    }
                }),
                tower250k: new Milestone(
                {
                    level: 250000,
                    upgrade_attributes: 
                    {
                        material_max_count: 500
                    }
                }),
                tower300k: new Milestone(
                {
                    level: 300000,
                    description: __s("%s floors! Where are you heading to?", "300k"),
                    upgrade_attributes: 
                    {
                        scrolls_active_max: 1
                    }
                }),
                tower350k: new Milestone(
                {
                    level: 350000,
                    upgrade_attributes: 
                    {
                        material_max_count: 500
                    }
                }),
                tower400k: new Milestone(
                {
                    level: 400000,
                    description: __s("%s floors! Who approved of this?", "400k"),
                    upgrade_attributes: 
                    {
                        alchemy_brew_multiplier: 0.2
                    }
                }),
                tower450k: new Milestone(
                {
                    level: 450000,
                    upgrade_attributes: 
                    {
                        material_max_count: 500
                    }
                })
            }
        },
        inner_pyramid: 
        {
            index: 10,
            section_name: __("Pyramid"),
            
            is_obfuscated: function()
            {
                return !is_unlocked_pyramid() && o_game.data.stats.prestige_ulc == 0;
            },
            
            milestones: 
            {
                pyramid1: new Milestone(
                {
                    level: 2,
                    description: __("Welcome to the Pyramid, the land of Ancient Leaves and chests!")
                }),
                pyramid5: new Milestone(
                {
                    level: 5,
                    description: __("Rare Chests drop from floor -5 or below.")
                }),
                pyramid10: new Milestone(
                {
                    level: 10,
                    description: __("Epic Chests drop from floor -10 or below.")
                }),
                pyramid15: new Milestone(
                {
                    level: 15,
                    description: __("Legendary Chests drop from floor -15 or below.")
                }),
                pyramid20: new Milestone(
                {
                    level: 20,
                    description: __("Some materials to help you on your way down."),
                    reward: 
                    {
                        materials: 
                        {
                            essence_cosmic: 30,
                            essence_dark: 3,
                            essence_earth: 30,
                            essence_leaf: 30,
                            essence_water: 30
                        }
                    }
                }),
                pyramid25: new Milestone(
                {
                    level: 25,
                    description: __("Your damage is multiplied based on your highest Leaf Tower floor."),
                    
                    get_bonus_value: function()
                    {
                        return sqrt(global.areas.tower.data.highest_floor_stats / 100);
                    },
                    
                    upgrade_attributes: 
                    {
                        blower_enemy_damage_multiplier_milestone: [function()
                        {
                            return self.get_bonus_value();
                        }]
                    }
                }),
                pyramid30: new Milestone(
                {
                    level: 30,
                    description: sprintf(__("SHARDS! SHARDS! SHARDS!"), 3),
                    reward: 
                    {
                        resources: 
                        {
                            shards: 3
                        }
                    }
                }),
                pyramid35: new Milestone(
                {
                    level: 35,
                    description: __("- A U T O - C U R S E S -"),
                    upgrade_attributes: 
                    {
                        cursed_autocollect: 1
                    }
                }),
                pyramid40: new Milestone(
                {
                    level: 40,
                    description: __("Some materials to help you on your way down."),
                    reward: 
                    {
                        materials: 
                        {
                            essence_cosmic: 100,
                            essence_dark: 10,
                            essence_earth: 100,
                            essence_leaf: 100,
                            essence_water: 100
                        }
                    }
                }),
                pyramid45: new Milestone(
                {
                    level: 45,
                    description: __("Free gems! Weeeee!"),
                    reward: 
                    {
                        resources: 
                        {
                            gems: 50
                        }
                    }
                }),
                pyramid50: new Milestone(
                {
                    level: 50,
                    description: __("Your damage is multiplied based on your lowest Pyramid floor."),
                    
                    get_bonus_value: function()
                    {
                        return global.areas.inner_pyramid.data.highest_floor_stats / 10;
                    },
                    
                    upgrade_attributes: 
                    {
                        blower_enemy_damage_multiplier_milestone: [function()
                        {
                            return self.get_bonus_value();
                        }]
                    }
                }),
                pyramid51: new Milestone(
                {
                    level: 51,
                    description: __("Mmm, Cards."),
                    upgrade_attributes: 
                    {
                        cards_enemy_drop_chance: 0.0005
                    }
                }),
                pyramid55: new Milestone(
                {
                    level: 55,
                    description: __("Some materials to help you on your way down."),
                    reward: 
                    {
                        materials: 
                        {
                            essence_cosmic: 200,
                            essence_dark: 20,
                            essence_earth: 200,
                            essence_leaf: 200,
                            essence_water: 200
                        }
                    }
                }),
                pyramid60: new Milestone(
                {
                    level: 60,
                    description: __("- A U T O - C U R S E S -"),
                    upgrade_attributes: 
                    {
                        cursed_autocollect: 2
                    }
                }),
                pyramid65: new Milestone(
                {
                    level: 65,
                    description: sprintf(__("SHARDS! SHARDS! SHARDS!"), 10),
                    reward: 
                    {
                        resources: 
                        {
                            shards: 10
                        }
                    }
                }),
                pyramid70: new Milestone(
                {
                    level: 70,
                    description: __("Free gems! Weeeee!"),
                    reward: 
                    {
                        resources: 
                        {
                            gems: 100
                        }
                    }
                }),
                pyramid75: new Milestone(
                {
                    level: 75,
                    description: __("Your slap damage is multiplied based on your highest Leaf Tower floor."),
                    
                    get_bonus_value: function()
                    {
                        return sqrt(global.areas.tower.data.highest_floor_stats / 100);
                    },
                    
                    upgrade_attributes: 
                    {
                        slap_multiplier_milestone: [function()
                        {
                            return self.get_bonus_value();
                        }]
                    }
                }),
                pyramid80: new Milestone(
                {
                    level: 80,
                    description: __("Some materials to help you on your way down."),
                    reward: 
                    {
                        materials: 
                        {
                            essence_cosmic: 500,
                            essence_dark: 50,
                            essence_earth: 500,
                            essence_leaf: 500,
                            essence_water: 500
                        }
                    }
                }),
                pyramid85: new Milestone(
                {
                    level: 85,
                    description: __("- A U T O - C U R S E S -"),
                    upgrade_attributes: 
                    {
                        cursed_autocollect: 3
                    }
                }),
                pyramid90: new Milestone(
                {
                    level: 90,
                    description: sprintf(__("SHARDS! SHARDS! SHARDS!"), 20),
                    reward: 
                    {
                        resources: 
                        {
                            shards: 20
                        }
                    }
                }),
                pyramid95: new Milestone(
                {
                    level: 95,
                    description: __("Free gems! Weeeee!"),
                    reward: 
                    {
                        resources: 
                        {
                            gems: 150
                        }
                    }
                }),
                pyramid100: new Milestone(
                {
                    level: 100,
                    description: __("You have discovered a new area!")
                }),
                pyramid101: new Milestone(
                {
                    level: 101,
                    description: __("Mmm, Cards."),
                    upgrade_attributes: 
                    {
                        cards_enemy_drop_chance: 0.0005
                    }
                }),
                pyramid105: new Milestone(
                {
                    level: 105,
                    description: __("Your slap damage is multiplied based on your lowest Pyramid floor."),
                    
                    get_bonus_value: function()
                    {
                        return global.areas.inner_pyramid.data.highest_floor_stats / 10;
                    },
                    
                    upgrade_attributes: 
                    {
                        slap_multiplier_milestone: [function()
                        {
                            return self.get_bonus_value();
                        }]
                    }
                }),
                pyramid110: new Milestone(
                {
                    level: 110,
                    description: __("Some more storage space for you!"),
                    upgrade_attributes: 
                    {
                        material_max_count: 1000
                    }
                }),
                pyramid115: new Milestone(
                {
                    level: 115,
                    description: __("- A U T O - C U R S E S -"),
                    upgrade_attributes: 
                    {
                        cursed_autocollect: 4,
                        cursed_autocollect_multiplier: 0.25
                    }
                }),
                pyramid120: new Milestone(
                {
                    level: 120,
                    description: __("Must. Brew. Faster."),
                    upgrade_attributes: 
                    {
                        alchemy_brew_time_reduction: 0.05
                    }
                }),
                pyramid125: new Milestone(
                {
                    level: 125,
                    description: __("Must. Brew. Better."),
                    upgrade_attributes: 
                    {
                        alchemy_brew_crit_chance: 0.2
                    }
                }),
                pyramid130: new Milestone(
                {
                    level: 130,
                    description: __("Some more Energy storage for you"),
                    upgrade_attributes: 
                    {
                        max_energy_storage: 200
                    }
                }),
                pyramid135: new Milestone(
                {
                    level: 135,
                    description: __("Free gems! Weeeee!"),
                    reward: 
                    {
                        resources: 
                        {
                            gems: 200
                        }
                    }
                }),
                pyramid140: new Milestone(
                {
                    level: 140,
                    description: __("Some more storage space for you!"),
                    upgrade_attributes: 
                    {
                        material_max_count: 1000
                    }
                }),
                pyramid145: new Milestone(
                {
                    level: 145,
                    description: __("- A U T O - C U R S E S -"),
                    upgrade_attributes: 
                    {
                        cursed_autocollect: 5,
                        cursed_autocollect_multiplier: 0.25
                    }
                }),
                pyramid150: new Milestone(
                {
                    level: 150,
                    description: __("Must. Add. More. Shards."),
                    upgrade_attributes: 
                    {
                        shards_max_count: 2
                    }
                }),
                pyramid151: new Milestone(
                {
                    level: 151,
                    description: __("Mmm, Cards."),
                    upgrade_attributes: 
                    {
                        cards_enemy_drop_chance: 0.0005
                    }
                }),
                pyramid155: new Milestone(
                {
                    level: 155,
                    description: __("Must. Brew. Faster."),
                    upgrade_attributes: 
                    {
                        alchemy_brew_time_reduction: 0.1
                    }
                }),
                pyramid160: new Milestone(
                {
                    level: 160,
                    description: __("Must. Brew. More."),
                    upgrade_attributes: 
                    {
                        alchemy_brew_multiplier: 0.2
                    }
                }),
                pyramid165: new Milestone(
                {
                    level: 165,
                    description: __("Must. Brew. More."),
                    upgrade_attributes: 
                    {
                        alchemy_brew_multiplier: 0.2
                    }
                })
            }
        },
        fire_fields: 
        {
            index: 15,
            section_name: __("Fire Fields"),
            
            is_obfuscated: function()
            {
                return !is_unlocked_fire_fields() && o_game.data.stats.prestige_ulc == 0;
            },
            
            milestones: 
            {
                gf1: new Milestone(
                {
                    level: 1,
                    enemy: global.enemies.boss_green_flame,
                    enemy_data_key: "defeat_counter_highest",
                    upgrade_attributes: 
                    {
                        cards_boss_drop_chance: 0.01
                    }
                }),
                gf3: new Milestone(
                {
                    level: 3,
                    enemy: global.enemies.boss_green_flame,
                    enemy_data_key: "defeat_counter_highest",
                    upgrade_attributes: 
                    {
                        borbventure_increase_reward_milestone: 0.05
                    }
                }),
                gf5: new Milestone(
                {
                    level: 5,
                    enemy: global.enemies.boss_green_flame,
                    enemy_data_key: "defeat_counter_highest",
                    upgrade_attributes: 
                    {
                        craft_backpack_size: 4
                    }
                }),
                gf7: new Milestone(
                {
                    level: 7,
                    enemy: global.enemies.boss_green_flame,
                    enemy_data_key: "defeat_counter_highest",
                    upgrade_attributes: 
                    {
                        borbventure_increase_success_chance: 0.02
                    }
                }),
                gf9: new Milestone(
                {
                    level: 9,
                    enemy: global.enemies.boss_green_flame,
                    enemy_data_key: "defeat_counter_highest",
                    upgrade_attributes: 
                    {
                        alchemy_brew_multiplier: 0.1
                    }
                }),
                gf10: new Milestone(
                {
                    level: 10,
                    enemy: global.enemies.boss_green_flame,
                    enemy_data_key: "defeat_counter_highest",
                    description: __s("Enables auto reset of %s.", global.enemies.boss_green_flame.name)
                }),
                gf15: new Milestone(
                {
                    level: 15,
                    enemy: global.enemies.boss_green_flame,
                    enemy_data_key: "defeat_counter_highest",
                    upgrade_attributes: 
                    {
                        dice_battlefield_damage_multiplier_milestone: 0.05
                    }
                }),
                gf20: new Milestone(
                {
                    level: 20,
                    enemy: global.enemies.boss_green_flame,
                    enemy_data_key: "defeat_counter_highest",
                    upgrade_attributes: 
                    {
                        borbventure_max_borbs: 1
                    }
                }),
                gf25: new Milestone(
                {
                    level: 25,
                    enemy: global.enemies.boss_green_flame,
                    enemy_data_key: "defeat_counter_highest",
                    upgrade_attributes: 
                    {
                        dice_cursed_reward_multiplier_milestone: 0.05
                    }
                }),
                gf30: new Milestone(
                {
                    level: 30,
                    enemy: global.enemies.boss_green_flame,
                    enemy_data_key: "defeat_counter_highest",
                    upgrade_attributes: 
                    {
                        cards_boss_drop_chance: 0.02
                    }
                }),
                gf35: new Milestone(
                {
                    level: 35,
                    enemy: global.enemies.boss_green_flame,
                    enemy_data_key: "defeat_counter_highest",
                    upgrade_attributes: 
                    {
                        trade_max_gems_trades_per_day: 200
                    }
                }),
                gf40: new Milestone(
                {
                    level: 40,
                    enemy: global.enemies.boss_green_flame,
                    enemy_data_key: "defeat_counter_highest",
                    upgrade_attributes: 
                    {
                        slap_multiplier_milestone: 0.1
                    }
                }),
                gf45: new Milestone(
                {
                    level: 45,
                    enemy: global.enemies.boss_green_flame,
                    enemy_data_key: "defeat_counter_highest",
                    upgrade_attributes: 
                    {
                        dice_inventory_size: 2
                    }
                }),
                gf50: new Milestone(
                {
                    level: 50,
                    enemy: global.enemies.boss_green_flame,
                    enemy_data_key: "defeat_counter_highest",
                    upgrade_attributes: 
                    {
                        borbventure_inventory_size: 2
                    }
                }),
                spec1: new Milestone(
                {
                    level: 1,
                    index_add: 1000,
                    enemy: global.enemies.boss_spectralseeker,
                    enemy_data_key: "defeat_counter_highest",
                    upgrade_attributes: 
                    {
                        cards_boss_drop_chance: 0.02
                    }
                }),
                spec3: new Milestone(
                {
                    level: 3,
                    index_add: 1000,
                    enemy: global.enemies.boss_spectralseeker,
                    enemy_data_key: "defeat_counter_highest",
                    upgrade_attributes: 
                    {
                        borbventure_increase_reward_milestone: 0.1
                    }
                }),
                spec5: new Milestone(
                {
                    level: 5,
                    index_add: 1000,
                    enemy: global.enemies.boss_spectralseeker,
                    enemy_data_key: "defeat_counter_highest",
                    upgrade_attributes: 
                    {
                        craft_backpack_size: 7
                    }
                }),
                spec7: new Milestone(
                {
                    level: 7,
                    index_add: 1000,
                    enemy: global.enemies.boss_spectralseeker,
                    enemy_data_key: "defeat_counter_highest",
                    upgrade_attributes: 
                    {
                        borbventure_increase_success_chance: 0.04
                    }
                }),
                spec9: new Milestone(
                {
                    level: 9,
                    index_add: 1000,
                    enemy: global.enemies.boss_spectralseeker,
                    enemy_data_key: "defeat_counter_highest",
                    upgrade_attributes: 
                    {
                        alchemy_brew_multiplier: 0.2
                    }
                }),
                spec10: new Milestone(
                {
                    level: 10,
                    index_add: 1000,
                    enemy: global.enemies.boss_spectralseeker,
                    enemy_data_key: "defeat_counter_highest",
                    description: __s("Enables auto reset of %s.", global.enemies.boss_spectralseeker.name)
                }),
                spec15: new Milestone(
                {
                    level: 15,
                    index_add: 1000,
                    enemy: global.enemies.boss_spectralseeker,
                    enemy_data_key: "defeat_counter_highest",
                    upgrade_attributes: 
                    {
                        dice_battlefield_damage_multiplier_milestone: 0.1
                    }
                }),
                spec20: new Milestone(
                {
                    level: 20,
                    index_add: 1000,
                    enemy: global.enemies.boss_spectralseeker,
                    enemy_data_key: "defeat_counter_highest",
                    upgrade_attributes: 
                    {
                        borbventure_max_borbs: 1
                    }
                }),
                spec25: new Milestone(
                {
                    level: 25,
                    index_add: 1000,
                    enemy: global.enemies.boss_spectralseeker,
                    enemy_data_key: "defeat_counter_highest",
                    upgrade_attributes: 
                    {
                        dice_cursed_reward_multiplier_milestone: 0.1
                    }
                }),
                spec30: new Milestone(
                {
                    level: 30,
                    index_add: 1000,
                    enemy: global.enemies.boss_spectralseeker,
                    enemy_data_key: "defeat_counter_highest",
                    upgrade_attributes: 
                    {
                        cards_boss_drop_chance: 0.04
                    }
                }),
                spec35: new Milestone(
                {
                    level: 35,
                    index_add: 1000,
                    enemy: global.enemies.boss_spectralseeker,
                    enemy_data_key: "defeat_counter_highest",
                    upgrade_attributes: 
                    {
                        trade_max_gems_trades_per_day: 300
                    }
                }),
                spec40: new Milestone(
                {
                    level: 40,
                    index_add: 1000,
                    enemy: global.enemies.boss_spectralseeker,
                    enemy_data_key: "defeat_counter_highest",
                    upgrade_attributes: 
                    {
                        slap_multiplier_milestone: 0.2
                    }
                }),
                spec45: new Milestone(
                {
                    level: 45,
                    index_add: 1000,
                    enemy: global.enemies.boss_spectralseeker,
                    enemy_data_key: "defeat_counter_highest",
                    upgrade_attributes: 
                    {
                        dice_inventory_size: 2
                    }
                }),
                spec50: new Milestone(
                {
                    level: 50,
                    index_add: 1000,
                    enemy: global.enemies.boss_spectralseeker,
                    enemy_data_key: "defeat_counter_highest",
                    upgrade_attributes: 
                    {
                        borbventure_inventory_size: 2
                    }
                })
            }
        },
        soul_crypt: 
        {
            index: 20,
            section_name: __("Soul Crypt"),
            
            is_obfuscated: function()
            {
                return !is_unlocked_soul_crypt() && o_game.data.stats.prestige_ulc == 0;
            },
            
            milestones: 
            {
                sc2: new Milestone(
                {
                    level: 2,
                    description: __("Welcome to the Soul Crypt, THE place to visit if you want an everlasting experience!"),
                    reward: 
                    {
                        materials: 
                        {
                            raw_soul_stone: 50
                        },
                        resources: 
                        {
                            soul_stones: 20
                        }
                    }
                }),
                sc3: new Milestone(
                {
                    level: 3,
                    description: __("Mmm, Soul Keys."),
                    upgrade_attributes: 
                    {
                        soul_keys_crypt_multiplier: 0.05
                    }
                }),
                sc4: new Milestone(
                {
                    level: 4,
                    description: __("Mmm, Soul Particles."),
                    upgrade_attributes: 
                    {
                        soul_particles_crypt_multiplier: 0.05
                    }
                }),
                sc5: new Milestone(
                {
                    level: 5,
                    description: __("Mmm, more Soul Keys."),
                    upgrade_attributes: 
                    {
                        soul_keys_crypt_base: 1
                    }
                }),
                sc6: new Milestone(
                {
                    level: 6,
                    description: __("Found a new soul buddy!"),
                    reward: 
                    {
                        resources: 
                        {
                            soul_stones: 30,
                            soul_particles: 250,
                            soul_entities: 20
                        }
                    }
                }),
                sc7: new Milestone(
                {
                    level: 7,
                    description: __("Mmm, Soul Keys."),
                    upgrade_attributes: 
                    {
                        soul_keys_crypt_multiplier: 0.05
                    }
                }),
                sc8: new Milestone(
                {
                    level: 8,
                    description: __("Mmm, Soul Particles."),
                    upgrade_attributes: 
                    {
                        soul_particles_crypt_multiplier: 0.05
                    }
                }),
                sc9: new Milestone(
                {
                    level: 9,
                    description: __("Mmm, more Soul Keys."),
                    upgrade_attributes: 
                    {
                        soul_keys_crypt_base: 2
                    }
                }),
                sc10: new Milestone(
                {
                    level: 10,
                    description: __("The souls are whispering something..."),
                    reward: 
                    {
                        resources: 
                        {
                            soul_stones: 75,
                            soul_particles: 500,
                            soul_entities: 35
                        }
                    }
                }),
                sc11: new Milestone(
                {
                    level: 11,
                    description: __("Mmm, Soul Keys."),
                    upgrade_attributes: 
                    {
                        soul_keys_crypt_multiplier: 0.1
                    }
                }),
                sc12: new Milestone(
                {
                    level: 12,
                    description: __("Mmm, Soul Particles."),
                    upgrade_attributes: 
                    {
                        soul_particles_crypt_multiplier: 0.1
                    }
                }),
                sc13: new Milestone(
                {
                    level: 13,
                    description: __("Mmm, more Soul Keys."),
                    upgrade_attributes: 
                    {
                        soul_keys_crypt_base: 3
                    }
                }),
                sc14: new Milestone(
                {
                    level: 14,
                    description: __("The souls are whispering... - L E A V E - N O W - ! So cute!"),
                    reward: 
                    {
                        resources: 
                        {
                            soul_stones: 100,
                            soul_particles: 1000,
                            soul_entities: 50,
                            soul_flask: 5
                        }
                    }
                }),
                sc15: new Milestone(
                {
                    level: 15,
                    description: __("Mmm, Soul Keys."),
                    upgrade_attributes: 
                    {
                        soul_keys_crypt_multiplier: 0.1
                    }
                }),
                sc16: new Milestone(
                {
                    level: 16,
                    description: __("Mmm, Soul Particles."),
                    upgrade_attributes: 
                    {
                        soul_particles_crypt_multiplier: 0.1
                    }
                }),
                sc17: new Milestone(
                {
                    level: 17,
                    description: __("Mmm, more Soul Keys."),
                    upgrade_attributes: 
                    {
                        soul_keys_crypt_base: 4
                    }
                }),
                sc18: new Milestone(
                {
                    level: 18,
                    description: __("The souls are whispering... - L E A V E - N O W - ! So cute!"),
                    reward: 
                    {
                        resources: 
                        {
                            soul_stones: 200,
                            soul_particles: 2000,
                            soul_entities: 75,
                            soul_flask: 10
                        }
                    }
                }),
                sc19: new Milestone(
                {
                    level: 19,
                    description: __("- S E R I O U S L Y - L E A V E -"),
                    reward: 
                    {
                        resources: 
                        {
                            soul_entities: 100
                        }
                    }
                }),
                sc20: new Milestone(
                {
                    level: 20,
                    description: __s("You have unlocked %s.", global.areas.soul_zone.name)
                }),
                sc25: new Milestone(
                {
                    level: 25,
                    description: __("Now would you look at this, another pet slot!"),
                    upgrade_attributes: 
                    {
                        max_pets: 1
                    }
                }),
                sc100: new Milestone(
                {
                    level: 100,
                    description: __s("You have unlocked %s.", global.areas.fabric_universe.name)
                })
            }
        },
        leafton_pit: 
        {
            index: 30,
            section_name: __("Leafton Pit"),
            
            is_obfuscated: function()
            {
                return !is_unlocked_leafton() && o_game.data.stats.prestige_ulc == 0;
            },
            
            milestones: 
            {
                lp1_100: new Milestone(
                {
                    level: 1,
                    index_add: 1100,
                    defeat_count_max: lp_count_special,
                    upgrade_attributes: 
                    {
                        cards_boss_drop_chance: 0.05
                    }
                }),
                lp2_100: new Milestone(
                {
                    level: 2,
                    index_add: 2100,
                    defeat_count_max: lp_count_special,
                    upgrade_attributes: 
                    {
                        craft_backpack_size: 8
                    }
                }),
                lp3_100: new Milestone(
                {
                    level: 3,
                    index_add: 3100,
                    defeat_count_max: lp_count_special,
                    upgrade_attributes: 
                    {
                        dice_backpack_size: 5
                    }
                }),
                lp4_100: new Milestone(
                {
                    level: 4,
                    index_add: 4100,
                    defeat_count_max: lp_count_special,
                    upgrade_attributes: 
                    {
                        shards_max_count: 3
                    }
                }),
                lp5_100: new Milestone(
                {
                    level: 5,
                    index_add: 5100,
                    defeat_count_max: lp_count_special,
                    upgrade_attributes: 
                    {
                        slap_multiplier_milestone: 0.2
                    }
                }),
                lp6_100: new Milestone(
                {
                    level: 6,
                    index_add: 6100,
                    defeat_count_max: lp_count_special,
                    upgrade_attributes: 
                    {
                        dice_sides: 10
                    }
                }),
                lp7_100: new Milestone(
                {
                    level: 7,
                    index_add: 7100,
                    defeat_count_max: lp_count_special,
                    upgrade_attributes: 
                    {
                        scrolls_active_max: 1
                    }
                }),
                lp8_100: new Milestone(
                {
                    level: 8,
                    index_add: 8100,
                    defeat_count_max: lp_count_special,
                    upgrade_attributes: 
                    {
                        blower_enemy_damage_multiplier_milestone: 0.2
                    }
                }),
                lp9_100: new Milestone(
                {
                    level: 9,
                    index_add: 9100,
                    defeat_count_max: lp_count_special,
                    upgrade_attributes: 
                    {
                        dice_battlefield_damage_multiplier_milestone: 0.3
                    }
                }),
                lp10_100: new Milestone(
                {
                    level: 10,
                    index_add: 10100,
                    defeat_count_max: lp_count_special,
                    upgrade_attributes: 
                    {
                        dice_cursed_reward_multiplier_milestone: 0.15
                    }
                }),
                lp11_100: new Milestone(
                {
                    level: 11,
                    index_add: 11100,
                    defeat_count_max: lp_count_special,
                    upgrade_attributes: 
                    {
                        autocraft_delay_reduction: 0.15
                    }
                }),
                lp12_100: new Milestone(
                {
                    level: 12,
                    index_add: 12100,
                    defeat_count_max: lp_count_special,
                    upgrade_attributes: 
                    {
                        dice_dice: 5
                    }
                }),
                lp13_100: new Milestone(
                {
                    level: 13,
                    index_add: 13100,
                    defeat_count_max: lp_count_special,
                    upgrade_attributes: 
                    {
                        relics_base_damage_multiplier_milestone: 0.2
                    }
                }),
                lp14_100: new Milestone(
                {
                    level: 14,
                    index_add: 14100,
                    defeat_count_max: lp_count_special,
                    upgrade_attributes: 
                    {
                        pet_max_upgrade_level: 10
                    }
                }),
                lp15_100: new Milestone(
                {
                    level: 15,
                    index_add: 15100,
                    defeat_count_max: lp_count_special,
                    upgrade_attributes: 
                    {
                        offline_boss_kills_multiplier_milestone: 0.2
                    }
                }),
                lp16_100: new Milestone(
                {
                    level: 16,
                    index_add: 16100,
                    defeat_count_max: lp_count_special,
                    upgrade_attributes: 
                    {
                        dice_cursed_critical_chance: 2
                    }
                }),
                lp17_100: new Milestone(
                {
                    level: 17,
                    index_add: 17100,
                    defeat_count_max: lp_count_special,
                    upgrade_attributes: 
                    {
                        dice_cursed_critical_multiplier: 0.5
                    }
                }),
                lp18_100: new Milestone(
                {
                    level: 18,
                    index_add: 18100,
                    defeat_count_max: lp_count_special,
                    upgrade_attributes: 
                    {
                        db_souls_count_multiplier_milestone: 0.1
                    }
                }),
                lp19_100: new Milestone(
                {
                    level: 19,
                    index_add: 19100,
                    defeat_count_max: lp_count_special,
                    upgrade_attributes: 
                    {
                        artifact_max_count_add_global: 100
                    }
                }),
                lp20_100: new Milestone(
                {
                    level: 20,
                    index_add: 20100,
                    defeat_count_max: lp_count_special,
                    upgrade_attributes: 
                    {
                        max_pets: 1
                    }
                })
            }
        },
        events: 
        {
            index: 1000,
            section_name: __("Events"),
            milestones: 
            {
                cursed_halloween1: new Milestone(
                {
                    level: 1,
                    description: __s("You have defeated %s! But it gets more powerful with every defeat...", global.enemies.boss_cursed_cheese.name),
                    enemy: global.enemies.boss_cursed_cheese,
                    reward: 
                    {
                        resources: 
                        {
                            gems: 69
                        }
                    }
                }),
                cursed_halloween2: new Milestone(
                {
                    level: 2,
                    description: __s("Defeating %s doubles your curses up to %s each reward.", global.enemies.boss_cursed_cheese.name, number_format(1000000)),
                    enemy: global.enemies.boss_cursed_cheese,
                    reward: 
                    {
                        resources: 
                        {
                            gems: 69
                        }
                    }
                }),
                cursed_halloween3: new Milestone(
                {
                    level: 3,
                    description: __s("Increases %s claw count by %s for every %s defeats of %s.", global.resources.borb_o_lantern.name_plural, 1, 3, global.enemies.boss_cursed_cheese.name),
                    enemy: global.enemies.boss_cursed_cheese
                }),
                cursed_halloween6: new Milestone(
                {
                    level: 6,
                    enemy: global.enemies.boss_cursed_cheese,
                    reward: 
                    {
                        cards_packs: 
                        {
                            common: 1
                        }
                    }
                }),
                cursed_halloween10: new Milestone(
                {
                    level: 10,
                    description: __s("Unlocks %s.", global.artifacts.leafscension_exploit.name),
                    enemy: global.enemies.boss_cursed_cheese
                }),
                cursed_halloween16: new Milestone(
                {
                    level: 16,
                    enemy: global.enemies.boss_cursed_cheese,
                    reward: 
                    {
                        cards_packs: 
                        {
                            common: 1,
                            rare: 1
                        }
                    }
                }),
                cursed_halloween25: new Milestone(
                {
                    level: 25,
                    description: __s("Enables %s %s.", global.artifacts.leafscension_exploit.name, sprintf("L%s", 2)),
                    enemy: global.enemies.boss_cursed_cheese
                }),
                cursed_halloween26: new Milestone(
                {
                    level: 26,
                    enemy: global.enemies.boss_cursed_cheese,
                    reward: 
                    {
                        cards_packs: 
                        {
                            common: 1,
                            rare: 1,
                            legendary: 1
                        }
                    }
                }),
                cursed_halloween36: new Milestone(
                {
                    level: 36,
                    enemy: global.enemies.boss_cursed_cheese,
                    reward: 
                    {
                        cards_packs: 
                        {
                            common: 1,
                            rare: 1,
                            legendary: 1
                        }
                    }
                }),
                cursed_halloween46: new Milestone(
                {
                    level: 46,
                    enemy: global.enemies.boss_cursed_cheese,
                    reward: 
                    {
                        cards_packs: 
                        {
                            common: 1,
                            rare: 1,
                            legendary: 1
                        }
                    }
                }),
                cursed_halloween50: new Milestone(
                {
                    level: 50,
                    description: __s("Enables %s %s.", global.artifacts.leafscension_exploit.name, sprintf("L%s", 3)),
                    enemy: global.enemies.boss_cursed_cheese
                }),
                cursed_halloween69: new Milestone(
                {
                    level: 69,
                    enemy: global.enemies.boss_cursed_cheese,
                    reward: 
                    {
                        cards_packs: 
                        {
                            legendary: 3
                        }
                    }
                }),
                cursed_halloween75: new Milestone(
                {
                    level: 75,
                    description: __s("Enables %s %s.", global.artifacts.leafscension_exploit.name, sprintf("L%s", 4)),
                    enemy: global.enemies.boss_cursed_cheese
                }),
                cursed_halloween100: new Milestone(
                {
                    level: 100,
                    description: __s("Enables %s %s.", global.artifacts.leafscension_exploit.name, sprintf("L%s", 5)),
                    enemy: global.enemies.boss_cursed_cheese
                }),
                cursed_halloween125: new Milestone(
                {
                    level: 125,
                    description: __s("Enables %s %s.", global.artifacts.leafscension_exploit.name, sprintf("L%s", 6)),
                    enemy: global.enemies.boss_cursed_cheese
                })
            }
        }
    };
    for (i = 0; i < 9; i++)
    {
        var milestone_level = 210 + (100 * i);
        var milestone_key = sprintf("%s%s", "tower", milestone_level);
        variable_struct_set(global.milestones.tower.milestones, milestone_level, new Milestone(
        {
            level: milestone_level,
            description: __("Polish the gem leaves!"),
            upgrade_attributes: 
            {
                gem_leaf_multiplier_milestone: 0.5
            }
        }));
    }
    for (i = 0; i < 8; i++)
    {
        var milestone_level = 22 + (i * 10);
        var milestone_key = sprintf("%s%s", "sc", milestone_level);
        variable_struct_set(global.milestones.soul_crypt.milestones, milestone_key, new Milestone(
        {
            level: milestone_level,
            description: __("You must construct additional storage."),
            upgrade_attributes: 
            {
                material_max_count: 1500
            }
        }));
        milestone_level = 24 + (i * 10);
        milestone_key = sprintf("%s%s", "sc", milestone_level);
        variable_struct_set(global.milestones.soul_crypt.milestones, milestone_key, new Milestone(
        {
            level: milestone_level,
            description: __("You must construct additional energy storage."),
            upgrade_attributes: 
            {
                max_resource_storage: 
                {
                    energy_electrical: 2000
                }
            }
        }));
        milestone_level = 26 + (i * 10);
        milestone_key = sprintf("%s%s", "sc", milestone_level);
        variable_struct_set(global.milestones.soul_crypt.milestones, milestone_key, new Milestone(
        {
            level: milestone_level,
            description: __("You must construct additional cauldrons."),
            upgrade_attributes: 
            {
                alchemy_brew_multiplier: 0.2
            }
        }));
        milestone_level = 28 + (i * 10);
        milestone_key = sprintf("%s%s", "sc", milestone_level);
        variable_struct_set(global.milestones.soul_crypt.milestones, milestone_key, new Milestone(
        {
            level: milestone_level,
            description: __("You must construct critical cauldrons."),
            upgrade_attributes: 
            {
                alchemy_brew_crit_multi_chance: 0.05
            }
        }));
    }
    for (i = 1; i <= 20; i++)
    {
        var milestone_level = i;
        var defeat_count = 5;
        var milestone_key = sprintf("%s%s_%s", "lp", milestone_level, defeat_count);
        variable_struct_set(global.milestones.leafton_pit.milestones, milestone_key, new Milestone(
        {
            level: milestone_level,
            index: (milestone_level * 1000) + 0,
            defeat_count_max: defeat_count,
            upgrade_attributes: 
            {
                quark_damage_multiplier: 0.1
            }
        }));
        defeat_count = 10;
        milestone_key = sprintf("%s%s_%s", "lp", milestone_level, defeat_count);
        variable_struct_set(global.milestones.leafton_pit.milestones, milestone_key, new Milestone(
        {
            level: milestone_level,
            index: (milestone_level * 1000) + 1,
            defeat_count_max: defeat_count,
            upgrade_attributes: 
            {
                leafton_pit_reward_multiplier: 0.05
            }
        }));
        defeat_count = 20;
        milestone_key = sprintf("%s%s_%s", "lp", milestone_level, defeat_count);
        variable_struct_set(global.milestones.leafton_pit.milestones, milestone_key, new Milestone(
        {
            level: milestone_level,
            index: (milestone_level * 1000) + 2,
            defeat_count_max: defeat_count,
            upgrade_attributes: 
            {
                quarkstige_damage_multiplier: 0.005
            }
        }));
        defeat_count = 25;
        milestone_key = sprintf("%s%s_%s", "lp", milestone_level, defeat_count);
        variable_struct_set(global.milestones.leafton_pit.milestones, milestone_key, new Milestone(
        {
            level: milestone_level,
            index: (milestone_level * 1000) + 3,
            defeat_count_max: defeat_count,
            upgrade_attributes: 
            {
                leafton_pit_duration: 1
            }
        }));
        defeat_count = 35;
        milestone_key = sprintf("%s%s_%s", "lp", milestone_level, defeat_count);
        variable_struct_set(global.milestones.leafton_pit.milestones, milestone_key, new Milestone(
        {
            level: milestone_level,
            index: (milestone_level * 1000) + 4,
            defeat_count_max: defeat_count,
            upgrade_attributes: 
            {
                quark_energy_charge_multiplier: 0.01
            }
        }));
        defeat_count = 50;
        milestone_key = sprintf("%s%s_%s", "lp", milestone_level, defeat_count);
        variable_struct_set(global.milestones.leafton_pit.milestones, milestone_key, new Milestone(
        {
            level: milestone_level,
            index: (milestone_level * 1000) + 5,
            defeat_count_max: defeat_count,
            upgrade_attributes: 
            {
                leafton_pit_quark_boost_chance: 0.01
            }
        }));
        defeat_count = 60;
        milestone_key = sprintf("%s%s_%s", "lp", milestone_level, defeat_count);
        variable_struct_set(global.milestones.leafton_pit.milestones, milestone_key, new Milestone(
        {
            level: milestone_level,
            index: (milestone_level * 1000) + 6,
            defeat_count_max: defeat_count,
            upgrade_attributes: 
            {
                quark_structurize_multiplier: 0.01
            }
        }));
        defeat_count = 75;
        milestone_key = sprintf("%s%s_%s", "lp", milestone_level, defeat_count);
        variable_struct_set(global.milestones.leafton_pit.milestones, milestone_key, new Milestone(
        {
            level: milestone_level,
            index: (milestone_level * 1000) + 7,
            defeat_count_max: defeat_count,
            upgrade_attributes: 
            {
                quark_damage_blower_damage_multiplier: 0.1
            }
        }));
    }
    var __struct = global.milestones.leafton_pit.milestones;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        mitem.reward = 
        {
            resources: 
            {
                leafton: mitem.level * mitem.defeat_count_max
            }
        };
    }
    for (i = 0; i < 10; i++)
    {
        var milestone_level = 21 + (i * 20);
        var milestone_key = sprintf("cursed_halloween%s", milestone_level);
        var value = 10;
        variable_struct_set(global.milestones.events.milestones, milestone_level, new Milestone(
        {
            level: milestone_level,
            upgrade_attributes: 
            {
                artifact_max_count_add_global: value
            },
            enemy: global.enemies.boss_cursed_cheese
        }));
    }
    var i = 0;
    while (i < 10)
    {
        i++;
    }
    global.milestones_array = [];
    global.milestones_sorted = {};
    __struct = global.milestones;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        add_keys_to_struct(mitem.milestones);
        variable_struct_set(global.milestones_sorted, mkey, struct_to_sorted_array_by(mitem.milestones, "index", true));
        var __struct2 = mitem.milestones;
        var __prop_names2 = struct_get_names(__struct2);
        var __prop_len2 = array_length(__prop_names2);
        for (var __i2 = 0; __i2 < __prop_len2; __i2++)
        {
            var mkey2 = __prop_names2[__i2];
            var mitem2 = variable_struct_get(__struct2, mkey2);
            mitem2.area = variable_struct_get(global.areas, mkey);
            mitem2.set_name();
            variable_struct_set(global.dialog_sections.milestones, mkey, 
            {
                name: mitem.section_name,
                index: mitem.index,
                is_obfuscated: get_default_struct_value(mitem, "is_obfuscated", false)
            });
            array_push(global.milestones_array, mitem2);
        }
    }
}
