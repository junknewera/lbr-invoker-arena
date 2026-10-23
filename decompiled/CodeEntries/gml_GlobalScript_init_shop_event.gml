function init_shop_event()
{
    global.shops_prestige_levels.event = global.prestige_levels.inf;
    global.shops_prestige_levels.event_nature = global.prestige_levels.inf;
    global.shops_prestige_levels.event_anniversary = global.prestige_levels.inf;
    var shop_resource = global.resources.malachite;
    var shop_resource_nature_season = global.resources.nature_gems;
    var shop_resource_anniversary = global.resources.party_tokens;
    global.shops.event = 
    {
        borb_o_lantern_drop_count: 
        {
            index: 100,
            name: __("Borb O'Count"),
            description: __s("Increases %s drop count by %s.", global.resources.borb_o_lantern.name_single, 1),
            sprite: spr_borb_o_lantern,
            cost: 
            {
                borb_o_lantern: 10
            },
            cost_exp: 1.75,
            max_count: 20
        },
        borb_o_lantern_drop_chance: 
        {
            index: 101,
            name: __("Borb O'Chance"),
            description: __s("Increases %s multi drop chance by %s.", global.resources.borb_o_lantern.name_single, number_format_percent(0.1)),
            sprite: spr_borb_o_lantern,
            cost: 
            {
                borb_o_lantern: 3
            },
            cost_exp: 2,
            max_count: 20
        },
        borb_o_digs: 
        {
            index: 102,
            name: __("Borb O'Digs"),
            description: __s("Shovels can dig up %s and increases dig count by %s per level.", global.resources.borb_o_lantern.name_plural, 1),
            sprite: spr_borb_o_lantern,
            cost: 
            {
                borb_o_lantern: 75
            },
            cost_exp: 2.5,
            max_count: 10
        },
        increase_cursed_cheese_damage: 
        {
            index: 110,
            name: __("Cursed Weakness"),
            description: __s("Increases damage against %s by %s.", __("The Cursed Cheese"), number_format_percent(1)),
            sprite: spr_icon_cursed_cheese,
            cost: 
            {
                borb_o_lantern: 8
            },
            cost_exp: 1.3,
            max_count: 0,
            upgrade_attributes: 
            {
                enemy_add_damage_multiplier: 
                {
                    boss_cursed_cheese: 1
                }
            }
        },
        cursed_cheese_curses_multiplier: 
        {
            index: 111,
            name: __("Cursed Cheese Curses"),
            description: __s("Get cursed! Increases the number of curses when defeating %s by %s.", __("The Cursed Cheese"), number_format_percent(0.1)),
            sprite: spr_icon_cursed_cheese,
            cost: 
            {
                borb_o_lantern: 8
            },
            cost_exp: 1.75,
            max_count: 20,
            upgrade_attributes: 
            {
                cursed_cheese_curses_multiplier: 0.1
            }
        },
        cursed_cheese_leafscended_leaves_drop_chance: 
        {
            index: 120,
            name: __("Cursed Leafscension Luck"),
            description: __s("Increases leafscended leaves drop chance from %s by %s.", __("The Cursed Cheese"), number_format_percent(0.05)),
            sprite: spr_icon_leafscension,
            cost: 
            {
                borb_o_lantern: 10
            },
            cost_exp: 1.75,
            max_count: 10,
            upgrade_attributes: 
            {
                cursed_cheese_leafscended_leaves_drop_chance: 0.05
            }
        },
        cursed_cheese_leafscended_leaves_max_level: 
        {
            index: 121,
            name: __("Cursed Leafscension Level"),
            description: __s("Increases leafscended leaves drop level from %s by %s.", __("The Cursed Cheese"), 1),
            sprite: spr_icon_leafscension,
            cost: 
            {
                borb_o_lantern: 25
            },
            cost_exp: 8,
            max_count: 2,
            upgrade_attributes: 
            {
                cursed_cheese_leafscended_leaves_max_level: 1
            }
        }
    };
    global.shops.event_anniversary = 
    {
        candle_attack_damage: build_shop_item("candle_attack_damage", shop_resource_anniversary, 100, 
        {
            name: __("Harder Blow"),
            sprite: spr_icon_candle2,
            base_cost: 50,
            cost_exp: 1.8,
            max_count: 0,
            value: 1,
            upgrade_attributes: 
            {
                candle_attack_damage: 1
            }
        }),
        candle_attack_damage_manual: build_shop_item("candle_attack_damage_manual", shop_resource_anniversary, 101, 
        {
            name: __("Mighty Blow"),
            sprite: spr_icon_candle2,
            base_cost: 50,
            cost_exp: 1.7,
            max_count: 10,
            value: 2,
            upgrade_attributes: 
            {
                candle_attack_damage_manual: 2
            }
        }),
        candle_attack_timer_reduction_multiplier: build_shop_item("candle_attack_timer_reduction_multiplier", shop_resource_anniversary, 102, 
        {
            name: __("Faster Blow"),
            sprite: spr_icon_candle2,
            base_cost: 75,
            cost_exp: 1.9,
            max_count: 5,
            value: 0.1,
            upgrade_attributes: 
            {
                candle_attack_timer_reduction_multiplier: 0.1
            }
        }),
        candle_manual_blow_timer_reduction_multiplier: build_shop_item("candle_manual_blow_timer_reduction_multiplier", shop_resource_anniversary, 103, 
        {
            name: __("Quicker Manual Blow"),
            sprite: spr_icon_candle2,
            base_cost: 75,
            cost_exp: 1.4,
            max_count: 5,
            value: 0.1,
            upgrade_attributes: 
            {
                candle_manual_blow_timer_reduction_multiplier: 0.1
            }
        }),
        candle_reward_multiplier: build_shop_item("candle_reward_multiplier", shop_resource_anniversary, 104, 
        {
            name: __("Generous Blow"),
            sprite: spr_icon_candle2,
            base_cost: 50,
            cost_exp: 1.8,
            max_count: 10,
            value: 0.5,
            upgrade_attributes: 
            {
                candle_reward_multiplier: 0.5
            }
        }),
        candle_critical_chance: build_shop_item("candle_critical_chance", shop_resource_anniversary, 105, 
        {
            name: __("Lucky Blow"),
            sprite: spr_icon_candle2,
            base_cost: 75,
            cost_exp: 1.6,
            max_count: 10,
            value: 0.05,
            upgrade_attributes: 
            {
                candle_critical_chance: 0.05
            }
        }),
        candle_reduce_reward_multiplier: build_shop_item("candle_reduce_reward_multiplier", shop_resource_anniversary, 106, 
        {
            name: __("Forgiving Blow"),
            sprite: spr_icon_candle2,
            base_cost: 50,
            cost_exp: 1.5,
            max_count: 9,
            upgrade_attributes: 
            {
                candle_reduce_reward_multiplier: 0.1
            }
        }),
        candle_auto_manual_attack: build_shop_item("candle_auto_attack", shop_resource_anniversary, 107, 
        {
            name: __("Auto Blow"),
            description: __("Enables automatic and manual attacks in the Anniversary Minigame."),
            sprite: spr_icon_candle2,
            base_cost: 1500,
            max_count: 1
        }),
        candle_auto_advance: build_shop_item("candle_auto_advance", shop_resource_anniversary, 108, 
        {
            name: __("Auto Advance/Restart"),
            description: __("Automatically advances to the next stage and selects the best available upgrade. Automatically restarts the game when finished."),
            sprite: spr_icon_candle2,
            base_cost: 1000,
            max_count: 1,
            is_toggle: true
        }),
        curse_machine_slower_aim_multiplier: build_shop_item("curse_machine_slower_aim_multiplier", shop_resource_anniversary, 150, 
        {
            name: __("Steady Hands"),
            sprite: spr_icon_cursed_cheese,
            base_cost: 200,
            cost_exp: 1.3,
            max_count: 5,
            upgrade_attributes: 
            {
                curse_machine_slower_aim_multiplier: 0.1
            }
        }),
        curse_machine_slower_charge_speed_multiplier: build_shop_item("curse_machine_slower_charge_speed_multiplier", shop_resource_anniversary, 151, 
        {
            name: __("Slow Charge"),
            sprite: spr_icon_cursed_cheese,
            base_cost: 200,
            cost_exp: 1.3,
            max_count: 5,
            upgrade_attributes: 
            {
                curse_machine_slower_charge_speed_multiplier: 0.1
            }
        }),
        anniversary_auto_collect: build_shop_item("anniversary_auto_collect", shop_resource_anniversary, 199, 
        {
            name: __("Auto Collector"),
            sprite: spr_icon_birthday_cake,
            base_cost: 150,
            cost_exp: 1.6,
            max_count: 10,
            upgrade_attributes: 
            {
                resources_auto_collect: 
                {
                    party_tokens: 0.01
                }
            }
        }),
        anniversary_leaf_multiplier: build_shop_item("leaf_multiplier_all", shop_resource_anniversary, 200, 
        {
            base_cost: 80,
            cost_exp: 1.4,
            max_count: 10,
            value: 0.5,
            upgrade_attributes: 
            {
                leaf_multiplier_event: 0.5
            }
        }),
        anniversary_blower_damage_multiplier: build_shop_item("blower_hit_damage_multiplier", shop_resource_anniversary, 201, 
        {
            base_cost: 90,
            cost_exp: 1.4,
            max_count: 10,
            value: 5,
            upgrade_key: "blower_enemy_damage_multiplier_event"
        }),
        anniversary_enemy_drop_multiplier: build_shop_item("enemy_drop_multiplier", shop_resource_anniversary, 204, 
        {
            base_cost: 60,
            cost_exp: 1.4,
            max_count: 10,
            value: 0.5
        }),
        anniversary_dig_count: build_shop_item("dig_count", shop_resource_anniversary, 205, 
        {
            base_cost: 800,
            cost_exp: 2,
            max_count: 3,
            value: 1
        }),
        anniversary_blc_science: build_shop_item("blc_science", shop_resource_anniversary, 209, 
        {
            base_cost: 100,
            cost_exp: 1.3,
            max_count: 10,
            value: 0.5,
            upgrade_key: "blc_value_multiplier_event"
        }),
        anniversary_master_of_mlc: build_shop_item("master_of_mlc", shop_resource_anniversary, 210, 
        {
            base_cost: 250,
            cost_exp: 1.3,
            max_count: 10,
            value: 0.3,
            upgrade_key: "mlc_value_multiplier_event"
        }),
        anniversary_master_of_ulc: build_shop_item("master_of_ulc", shop_resource_anniversary, 211, 
        {
            base_cost: 1000,
            cost_exp: 1.4,
            max_count: 10,
            value: 0.1,
            upgrade_key: "ulc_value_multiplier_event"
        })
    };
    global.shops.event_nature = 
    {
        max_fields: 
        {
            index: 1,
            name: __("Lease Field"),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_icon_soil,
            cost: build_resource_cost(shop_resource_nature_season, 50),
            cost_exp: 2,
            max_count: 4,
            upgrade_attributes: 
            {
                nature_max_fields: 1
            }
        },
        nature_plant_xp_multiplier_global: build_shop_item("plant_hugger", shop_resource_nature_season, 10, 
        {
            base_cost: 50,
            cost_exp: 1.5,
            max_count: 10,
            value: 0.05
        }),
        nature_plant_xp_multiplier_global_mm: 
        {
            index: 10.1,
            name: __s("Plant Hugger"),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_plant_tulip,
            cost: build_resource_cost(global.resources.magic_mulch, 100),
            cost_exp: 1.2,
            max_count: 0,
            upgrade_attributes: 
            {
                nature_plant_xp_multiplier_global: 0.02
            }
        },
        nature_plant_grow_duration: 
        {
            index: 11,
            name: __s("Plant Stroker"),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_plant_tulip,
            cost: build_resource_cost(shop_resource_nature_season, 30),
            cost_exp: 1.6,
            max_count: 10,
            upgrade_attributes: 
            {
                nature_plant_grow_duration: 0.05
            }
        },
        nature_plant_harvest_seed_chance: 
        {
            index: 12,
            name: __s("Plant Cuddler"),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_plant_tulip,
            cost: build_resource_cost(shop_resource_nature_season, 50),
            cost_exp: 1.8,
            max_count: 5,
            upgrade_attributes: 
            {
                nature_plant_harvest_seed_chance: 0.1
            }
        },
        nature_plant_synergy: 
        {
            index: 13,
            name: __s("Plant Synergy"),
            description: __s("Enables plant synergy. Each plant provides bonuses to certain neighboring plants. "),
            sprite: spr_plant_tulip,
            cost: build_resource_cost(shop_resource_nature_season, 300),
            max_count: 1,
            
            func: function()
            {
                global.season_pass.nature.check_upgrade_attributes();
            }
        },
        nature_water_increase_value: 
        {
            index: 100,
            name: __s("Water Quality"),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_icon_farming,
            cost: build_resource_cost(shop_resource_nature_season, 10),
            cost_exp: 1.25,
            max_count: 5,
            upgrade_attributes: 
            {
                nature_water_increase_value: 0.05
            }
        },
        nature_water_decrease_drain_value_multiplier: 
        {
            index: 105,
            name: __s("Anti-Drain"),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_icon_farming,
            cost: build_resource_cost(shop_resource_nature_season, 5),
            cost_exp: 1.15,
            max_count: 5,
            upgrade_attributes: 
            {
                nature_water_decrease_drain_value_multiplier: 0.1
            }
        },
        nature_water_all_fields_effectivity: 
        {
            index: 120,
            name: __s("Splash Damage"),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_icon_farming,
            cost: build_resource_cost(shop_resource_nature_season, 100),
            cost_exp: 1.35,
            max_count: 5,
            upgrade_attributes: 
            {
                nature_water_all_fields_effectivity: 0.2
            }
        },
        nature_water_auto: 
        {
            index: 130,
            name: __s("Water Bot"),
            
            description: function()
            {
                return __s("Waters one field every second for %s of your regular water amount.", number_format_percent(self.upgrade_attributes.nature_water_auto)) + "\n" + __s("Auto water amount: %s", number_format_percent(global.season_pass.nature.get_water_auto_value()));
            },
            
            sprite: spr_icon_farming,
            cost: build_resource_cost(shop_resource_nature_season, 150),
            cost_exp: 1.2,
            max_count: 10,
            upgrade_attributes: 
            {
                nature_water_auto: 0.05
            }
        },
        nature_enhance_timeout_multiplier: 
        {
            index: 200,
            name: __s("Faster Enhancing"),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_icon_magic_mulch,
            cost: build_resource_cost(shop_resource_nature_season, 15),
            cost_exp: 1.35,
            max_count: 5,
            upgrade_attributes: 
            {
                nature_enhance_timeout_multiplier: 0.1
            }
        },
        nature_enhance_cost_reduction: 
        {
            index: 201,
            name: __s("Cheaper Enhancing"),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_icon_magic_mulch,
            cost: build_resource_cost(shop_resource_nature_season, 20),
            cost_exp: 1.25,
            max_count: 10,
            upgrade_attributes: 
            {
                nature_enhance_cost_reduction: 0.05
            }
        },
        nature_enhance_bonus_multiplier: 
        {
            index: 202,
            name: __s("Synergy Enhancing"),
            description_prefix: __s("Field quality affects plant/butterfly bonus."),
            
            description: function()
            {
                return get_general_description();
            },
            
            sprite: spr_icon_magic_mulch,
            cost: build_resource_cost(shop_resource_nature_season, 150),
            cost_exp: 1.2,
            max_count: 5,
            upgrade_attributes: 
            {
                nature_enhance_bonus_multiplier: 0.05
            },
            
            is_obfuscated: function()
            {
                return get_upgrade_count(global.shops.event_nature.nature_plant_synergy) == 0;
            }
        },
        increase_damage_doomed_tree: 
        {
            index: 250,
            name: __("Weakness Finder"),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_boss_doomed_tree,
            cost: build_resource_cost(shop_resource_nature_season, 25),
            cost_exp: 1.3,
            max_count: 0,
            upgrade_attributes: 
            {
                enemy_add_damage_multiplier: 
                {
                    boss_doomed_tree: 1
                }
            }
        },
        nature_vial_max_charges: 
        {
            index: 300,
            name: __s("Bigger Vial"),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_icon_vial_of_life,
            cost: build_resource_cost(shop_resource_nature_season, 25),
            cost_exp: 1.3,
            max_count: 5,
            upgrade_attributes: 
            {
                nature_vial_max_charges: 1
            }
        },
        nature_vial_progress_multiplier: 
        {
            index: 301,
            name: __s("Faster Vial"),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_icon_vial_of_life,
            cost: build_resource_cost(shop_resource_nature_season, 40),
            cost_exp: 1.2,
            max_count: 10,
            upgrade_attributes: 
            {
                nature_vial_progress_multiplier: 0.2
            }
        },
        nature_vial_seed_spawn_count: 
        {
            index: 302,
            name: __s("Quality Vial"),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_icon_vial_of_life,
            cost: build_resource_cost(shop_resource_nature_season, 350),
            cost_exp: 1.3,
            max_count: 3,
            upgrade_attributes: 
            {
                nature_vial_seed_spawn_count: 1
            }
        },
        nature_vial_rarity_seed_spawn_chance: 
        {
            index: 303,
            name: __s("Better Vial"),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_icon_vial_of_life,
            cost: build_resource_cost(shop_resource_nature_season, 30),
            cost_exp: 1.1,
            max_count: 20,
            upgrade_attributes: 
            {
                nature_vial_rarity_seed_spawn_chance: 0.025
            }
        },
        nature_vial_seed_spawn_crit_chance: 
        {
            index: 304,
            name: __s("Critical Vial"),
            description_prefix: __("Critical spawns double the seed count."),
            
            description: function()
            {
                return get_general_description();
            },
            
            sprite: spr_icon_vial_of_life,
            cost: build_resource_cost(shop_resource_nature_season, 75),
            cost_exp: 1.4,
            max_count: 5,
            upgrade_attributes: 
            {
                nature_vial_seed_spawn_crit_chance: 0.05
            }
        },
        nature_vial_clover3_spawn_chance: 
        {
            index: 305,
            name: __s("Lucky Vial %s", "3c"),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            description_dynamic: function()
            {
                return __s("Current spawn chance: %s", number_format_percent(global.season_pass.nature.get_vial_clover3_spawn_chance()));
            },
            
            sprite: spr_resource_clover3,
            cost: build_resource_cost(shop_resource_nature_season, 75),
            cost_exp: 1.3,
            max_count: 5,
            upgrade_attributes: 
            {
                nature_vial_clover3_spawn_chance: 0.02
            }
        },
        nature_vial_clover4_spawn_chance: 
        {
            index: 306,
            name: __s("Lucky Vial %s", "4c"),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            description_dynamic: function()
            {
                return __s("Current spawn chance: %s", number_format_percent(global.season_pass.nature.get_vial_clover4_spawn_chance()));
            },
            
            sprite: spr_resource_clover4,
            cost: build_resource_cost(shop_resource_nature_season, 100),
            cost_exp: 1.4,
            max_count: 5,
            upgrade_attributes: 
            {
                nature_vial_clover4_spawn_chance: 0.01
            }
        },
        unlock_butterflies: 
        {
            index: 400,
            name: __s("Unlock %s", __("Butterflies")),
            description: __s("Butterflies provide useful bonuses to plants."),
            sprite: spr_butterfly_meadowdance,
            cost: build_resource_cost(shop_resource_nature_season, 500),
            max_count: 1
        },
        nature_butterfly_xp_multiplier_global: 
        {
            index: 401,
            name: __s("Butterfly Hugger"),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_butterfly_meadowdance,
            cost: build_resource_cost(shop_resource_nature_season, 80),
            cost_exp: 1.5,
            max_count: 10,
            upgrade_attributes: 
            {
                nature_butterfly_xp_multiplier_global: 0.02
            },
            
            is_obfuscated: function()
            {
                return !is_unlocked_butterflies();
            }
        },
        nature_butterfly_affects_butterfly_xp: 
        {
            index: 402,
            name: __s("Self-esteem"),
            description: __("Butterfly XP multiplier also affects butterflies."),
            sprite: spr_butterfly_meadowdance,
            cost: build_resource_cost(shop_resource_nature_season, 500),
            max_count: 1,
            
            is_obfuscated: function()
            {
                return !is_unlocked_butterflies();
            }
        },
        nature_plant_harvest_bfly_chance: 
        {
            index: 403,
            name: __s("Butterfly Cuddler"),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_butterfly_meadowdance,
            cost: build_resource_cost(shop_resource_nature_season, 50),
            cost_exp: 1.75,
            max_count: 10,
            upgrade_attributes: 
            {
                nature_plant_harvest_bfly_chance: 0.02
            },
            
            is_obfuscated: function()
            {
                return !is_unlocked_butterflies();
            }
        },
        nature_bfly_synergy: 
        {
            index: 410,
            name: __s("Butterfly Synergy"),
            description: __s("Unleashes the power of butterfly synergy, where each butterfly augments the plant bonus within their respective field location."),
            sprite: spr_butterfly_meadowdance,
            cost: build_resource_cost(shop_resource_nature_season, 500),
            max_count: 1,
            
            is_obfuscated: function()
            {
                return !is_unlocked_butterflies() || get_upgrade_count(global.shops.event_nature.nature_plant_synergy) == 0;
            },
            
            func: function()
            {
                global.season_pass.nature.check_upgrade_attributes();
            }
        }
    };
}
