function init_enemies()
{
    global.enemies_sorted = [];
    global.enemies = 
    {
        alb: new Enemy(
        {
            name: __("ALB"),
            index: 10,
            scale: 3,
            sprite: spr_autoblower_red,
            drop_multiplier: 0.01,
            card_upgrades: 
            {
                alb_enemy_damage_multiplier_cards: 0.01
            }
        }),
        angry_leaf: new Enemy(
        {
            name: __("Angry Leaf"),
            index: 20,
            scale: 1,
            sprite: spr_enemy_leaf,
            drop_resources: [global.resources.celestial],
            drop_multiplier: 3,
            card_upgrades: 
            {
                resources_multiplier: 
                {
                    celestial: 0.1
                }
            }
        }),
        bat: new Enemy(
        {
            name: __("Bat"),
            index: 30,
            description: __("Definitely not a man."),
            scale: 3,
            sprite: spr_enemy_bat,
            card_upgrades: 
            {
                claw_curses: 0.01
            }
        }),
        bee: new Enemy(
        {
            name: __("Bee"),
            index: 40,
            description: __("The Evil Bee."),
            scale: 3,
            sprite: spr_enemy_bee,
            card_upgrades: 
            {
                blc_value_multiplier_craft: 0.02
            }
        }),
        bird: new Enemy(
        {
            name: __("Bird"),
            index: 50,
            scale: 3,
            sprite: spr_enemy_bird,
            card_upgrades: 
            {
                tower_floor_pct: 0.0025
            },
            card_upgrades_check: [
            {
                type: "min_tower_floor",
                value: 750
            }]
        }),
        bug: new Enemy(
        {
            name: __("Bug"),
            index: 60,
            scale: 3,
            sprite: spr_enemy_bug,
            card_upgrades: 
            {
                claw_equipment: 0.001
            }
        }),
        carrot: new Enemy(
        {
            name: __("Carrot"),
            index: 70,
            scale: 2,
            sprite: spr_enemy_carrot,
            drop_multiplier: 0.5,
            card_upgrades: 
            {
                cursed_autocollect_multiplier: 0.001
            },
            card_upgrades_check: [
            {
                type: "min_tower_floor",
                value: 500
            }]
        }),
        crab: new Enemy(
        {
            name: __("Crab"),
            index: 80,
            scale: 3,
            sprite: spr_enemy_crab,
            card_upgrades: 
            {
                gem_leaf_multiplier_cards: 0.002
            },
            card_upgrades_check: [
            {
                type: "min_tower_floor",
                value: 500
            }]
        }),
        elk: new Enemy(
        {
            name: __("Elk"),
            index: 90,
            scale: 3,
            sprite: spr_enemy_elk,
            card_upgrades: 
            {
                offline_tower_floors: 0.01
            },
            card_upgrades_check: [
            {
                type: "min_tower_floor",
                value: 2000
            }]
        }),
        frog: new Enemy(
        {
            name: __("Frog"),
            index: 100,
            scale: 3,
            sprite: spr_enemy_frog,
            card_upgrades: 
            {
                skip_tower_floor_chance_multiplier: 0.001
            },
            card_upgrades_check: [
            {
                type: "min_tower_floor",
                value: 1000
            }]
        }),
        hare: new Enemy(
        {
            name: __("Hare"),
            index: 110,
            scale: 2,
            sprite: spr_enemy_hare,
            card_upgrades: 
            {
                offline_crunches: 0.01
            },
            card_upgrades_check: [
            {
                type: "min_tower_floor",
                value: 250
            }]
        }),
        hyena: new Enemy(
        {
            name: __("Hyena"),
            index: 120,
            scale: 4,
            sprite: spr_enemy_hyena,
            card_upgrades: 
            {
                offline_mlc: 0.01
            },
            card_upgrades_check: [
            {
                type: "min_tower_floor",
                value: 2500
            }]
        }),
        ice_leaf: new Enemy(
        {
            name: __("Ice Leaf"),
            index: 130,
            scale: 1,
            sprite: spr_enemy_ice_leaf,
            card_upgrades: 
            {
                trade_resources_multiplier_cards: 0.003
            }
        }),
        scorpion: new Enemy(
        {
            name: __("Scorpion"),
            index: 150,
            description: __("Ouch!"),
            scale: 4,
            sprite: spr_enemy_scorpion,
            card_upgrades: 
            {
                scrolls_duration: 0.01
            },
            card_upgrades_check: [
            {
                type: "unlock_scrolls",
                value: true
            }]
        }),
        snowman: new Enemy(
        {
            name: __("Snowman"),
            index: 160,
            scale: 3,
            sprite: spr_enemy_snowman,
            card_upgrades: 
            {
                alchemy_brew_crit_chance: 0.0005
            },
            card_upgrades_check: [
            {
                type: "unlock_alchemy",
                value: true
            }]
        }),
        skull: new Enemy(
        {
            name: __("Skull"),
            index: 170,
            description: __("Of course it has to be a skull."),
            scale: 4,
            sprite: spr_enemy_skull,
            card_upgrades: 
            {
                printer_multiplier_cards: 0.05
            }
        }),
        vulture: new Enemy(
        {
            name: __("Vulture"),
            index: 180,
            scale: 3,
            sprite: spr_enemy_vulture,
            card_upgrades: 
            {
                seed_value_add_global: 0.0005
            }
        }),
        tower_frog: new Enemy(
        {
            name: __("Frog"),
            index: 200,
            scale: 3,
            sprite: spr_enemy_frog,
            tower: true,
            tower_level_range: [0, 9],
            card_upgrades: 
            {
                leaf_pub_counter_autocount: 0.001
            }
        }),
        boss_frog: new Enemy(
        {
            name: __("Frog"),
            index: 210,
            scale: 6,
            sprite: spr_boss_frog,
            tower: true,
            tower_level_range: [10, 10],
            is_boss: true
        }),
        evil_bat: new Enemy(
        {
            name: __("Bat"),
            index: 220,
            scale: 2,
            sprite: spr_enemy_bat_evil,
            tower: true,
            tower_level_range: [11, 19],
            card_upgrades: 
            {
                leaf_pub_counter: 0.1
            }
        }),
        boss_bat: new Enemy(
        {
            name: __("Bat"),
            index: 230,
            scale: 6,
            sprite: spr_boss_bat,
            tower: true,
            tower_level_range: [20, 20],
            is_boss: true
        }),
        evil_hare: new Enemy(
        {
            name: __("Hare"),
            index: 240,
            scale: 2,
            sprite: spr_enemy_hare_evil,
            tower: true,
            tower_level_range: [21, 29]
        }),
        boss_hare: new Enemy(
        {
            name: __("Hare"),
            index: 250,
            scale: 6,
            sprite: spr_boss_hare,
            tower: true,
            tower_level_range: [30, 30],
            is_boss: true
        }),
        evil_crab: new Enemy(
        {
            name: __("Crab"),
            index: 260,
            scale: 2,
            sprite: spr_enemy_crab,
            tower: true,
            tower_level_range: [31, 39]
        }),
        boss_crab: new Enemy(
        {
            name: __("Crab"),
            index: 270,
            scale: 6,
            sprite: spr_boss_crab,
            tower: true,
            tower_level_range: [40, 40],
            is_boss: true
        }),
        evil_scorpion: new Enemy(
        {
            name: __("Scorpion"),
            index: 280,
            scale: 2,
            sprite: spr_enemy_scorpion,
            tower: true,
            tower_level_range: [41, 49]
        }),
        boss_scorpion: new Enemy(
        {
            name: __("Scorpion"),
            index: 290,
            scale: 6,
            sprite: spr_boss_scorpion,
            tower: true,
            tower_level_range: [50, 50],
            is_boss: true
        }),
        evil_snowman: new Enemy(
        {
            name: __("Snowman"),
            index: 300,
            scale: 2,
            sprite: spr_enemy_snowman,
            tower: true,
            tower_level_range: [51, 59]
        }),
        boss_snowman: new Enemy(
        {
            name: __("Snowman"),
            index: 310,
            scale: 6,
            sprite: spr_boss_snowman,
            tower: true,
            tower_level_range: [60, 60],
            is_boss: true
        }),
        evil_brain: new Enemy(
        {
            name: __("Brain"),
            index: 320,
            scale: 2,
            sprite: spr_enemy_brain,
            tower: true,
            tower_level_range: [61, 69]
        }),
        boss_brain: new Enemy(
        {
            name: __("Brain"),
            index: 330,
            scale: 6,
            sprite: spr_boss_brain,
            tower: true,
            tower_level_range: [70, 70],
            is_boss: true
        }),
        evil_bird: new Enemy(
        {
            name: __("Bird"),
            index: 340,
            scale: 2,
            sprite: spr_enemy_bird,
            tower: true,
            tower_level_range: [71, 79]
        }),
        boss_dragon: new Enemy(
        {
            name: __("Dragon"),
            index: 350,
            scale: 6,
            sprite: spr_boss_dragon,
            tower: true,
            tower_level_range: [80, 80],
            is_boss: true
        }),
        evil_carrot: new Enemy(
        {
            name: __("Carrot"),
            index: 360,
            scale: 2,
            sprite: spr_enemy_carrot,
            tower: true,
            tower_level_range: [81, 89]
        }),
        boss_lavagolem: new Enemy(
        {
            name: __("Lava Golem"),
            index: 370,
            scale: 6,
            sprite: spr_boss_lavagolem,
            tower: true,
            tower_level_range: [90, 90],
            is_boss: true
        }),
        evil_skull: new Enemy(
        {
            name: __("Skull"),
            index: 380,
            scale: 2,
            sprite: spr_enemy_skull,
            tower: true,
            tower_level_range: [91, 99]
        }),
        boss_bob: new Enemy(
        {
            name: __("Bob"),
            index: 390,
            scale: 6,
            sprite: spr_boss_bob,
            tower: true,
            tower_level_range: [100, 100],
            is_boss: true,
            card_upgrades: 
            {
                mlc_value_multiplier_cards: 0.01
            }
        }),
        evil_stone: new Enemy(
        {
            name: __("Stone"),
            index: 400,
            scale: 2,
            sprite: spr_enemy_stone,
            tower: true,
            tower_level_range: [101, 109]
        }),
        boss_stonegolem: new Enemy(
        {
            name: __("Stone Golem"),
            index: 410,
            scale: 6,
            sprite: spr_boss_stonegolem,
            tower: true,
            tower_level_range: [110, 110],
            is_boss: true
        }),
        evil_factory: new Enemy(
        {
            name: __("Factory"),
            index: 420,
            scale: 2,
            sprite: spr_enemy_factory,
            tower: true,
            tower_level_range: [111, 119]
        }),
        boss_factory: new Enemy(
        {
            name: __("Factory"),
            index: 430,
            scale: 6,
            sprite: spr_boss_factory,
            tower: true,
            tower_level_range: [120, 120],
            is_boss: true
        }),
        evil_fire: new Enemy(
        {
            name: __("Fire"),
            index: 440,
            scale: 2,
            sprite: spr_enemy_fire,
            tower: true,
            tower_level_range: [121, 129]
        }),
        boss_fire: new Enemy(
        {
            name: __("Fire"),
            index: 450,
            scale: 6,
            sprite: spr_boss_fire,
            tower: true,
            tower_level_range: [130, 130],
            is_boss: true
        }),
        evil_ghast: new Enemy(
        {
            name: __("Ghast"),
            index: 460,
            scale: 2,
            sprite: spr_enemy_ghast,
            tower: true,
            tower_level_range: [131, 139]
        }),
        boss_ghast: new Enemy(
        {
            name: __("Ghast"),
            index: 470,
            scale: 6,
            sprite: spr_boss_ghast,
            tower: true,
            tower_level_range: [140, 140],
            is_boss: true
        }),
        evil_head: new Enemy(
        {
            name: __("Head"),
            index: 480,
            scale: 2,
            sprite: spr_enemy_head,
            tower: true,
            tower_level_range: [141, 149]
        }),
        boss_head: new Enemy(
        {
            name: __("Head"),
            index: 490,
            scale: 6,
            sprite: spr_boss_head,
            tower: true,
            tower_level_range: [150, 150],
            is_boss: true
        }),
        evil_hulk: new Enemy(
        {
            name: __("Hulk"),
            index: 500,
            scale: 2,
            sprite: spr_enemy_hulk,
            tower: true,
            tower_level_range: [151, 159]
        }),
        boss_hulk: new Enemy(
        {
            name: __("Hulk"),
            index: 510,
            scale: 6,
            sprite: spr_boss_hulk,
            tower: true,
            tower_level_range: [160, 160],
            is_boss: true
        }),
        evil_klackon: new Enemy(
        {
            name: __("Klackon"),
            index: 520,
            scale: 2,
            sprite: spr_enemy_klackon,
            tower: true,
            tower_level_range: [161, 169]
        }),
        boss_klackon: new Enemy(
        {
            name: __("Klackon"),
            index: 530,
            scale: 6,
            sprite: spr_boss_klackon,
            tower: true,
            tower_level_range: [170, 170],
            is_boss: true
        }),
        evil_lurker: new Enemy(
        {
            name: __("Lurker"),
            index: 540,
            scale: 2,
            sprite: spr_enemy_lurker,
            tower: true,
            tower_level_range: [171, 179]
        }),
        boss_lurker: new Enemy(
        {
            name: __("Lurker"),
            index: 550,
            scale: 6,
            sprite: spr_boss_lurker,
            tower: true,
            tower_level_range: [180, 180],
            is_boss: true
        }),
        evil_mask: new Enemy(
        {
            name: __("Mask"),
            index: 560,
            scale: 2,
            sprite: spr_enemy_mask,
            tower: true,
            tower_level_range: [181, 189]
        }),
        boss_mask: new Enemy(
        {
            name: __("Mask"),
            index: 570,
            scale: 6,
            sprite: spr_boss_mask,
            tower: true,
            tower_level_range: [190, 190],
            is_boss: true
        }),
        evil_skull02: new Enemy(
        {
            name: __("Bad Skull"),
            index: 580,
            scale: 2,
            sprite: spr_enemy_skull02,
            tower: true,
            tower_level_range: [191, 199]
        }),
        boss_bob02: new Enemy(
        {
            name: sprintf("%s %s", __("Bob"), 2),
            index: 590,
            scale: 6,
            sprite: spr_boss_bob02,
            tower: true,
            tower_level_range: [200, 200],
            is_boss: true,
            card_upgrades: 
            {
                mlc_value_multiplier_cards: 0.01
            }
        }),
        boss_bob03: new Enemy(
        {
            name: sprintf("%s %s", __("Bob"), 3),
            index: 600,
            scale: 6,
            sprite: spr_boss_bob03,
            tower: true,
            tower_level_range: [300, 300],
            is_boss: true,
            card_upgrades: 
            {
                mlc_value_multiplier_cards: 0.01
            }
        }),
        boss_bob04: new Enemy(
        {
            name: sprintf("%s %s", __("Bob"), 4),
            index: 610,
            scale: 6,
            sprite: spr_boss_bob04,
            tower: true,
            tower_level_range: [400, 400],
            is_boss: true,
            card_upgrades: 
            {
                mlc_value_multiplier_cards: 0.01
            }
        }),
        boss_bob05: new Enemy(
        {
            name: sprintf("%s %s", __("Bob"), 5),
            index: 620,
            scale: 6,
            sprite: spr_boss_bob05,
            tower: true,
            tower_level_range: [500, 500],
            is_boss: true,
            card_upgrades: 
            {
                mlc_value_multiplier_cards: 0.01
            }
        }),
        boss_witch: new Enemy(
        {
            name: __("Witch"),
            index: 630,
            scale: 6,
            sprite: spr_boss_witch,
            is_boss: true,
            difficulty: 1,
            
            reward: function()
            {
                var cursed_count = rround(get_bm_value(222, "witch_cursed_count", "witch_cursed_count_multiplier", undefined, true));
                var essence_count = rround(get_bm_value(5, "witch_essence_count", "witch_essence_count_multiplier", undefined, true));
                return 
                {
                    stats: 
                    {
                        cursed_count: cursed_count
                    },
                    materials: 
                    {
                        essence_cosmic: essence_count,
                        essence_earth: essence_count,
                        essence_leaf: essence_count,
                        essence_water: essence_count
                    }
                };
            },
            
            die: function()
            {
            },
            
            card_upgrades: 
            {
                witch_cursed_count: 0.05,
                witch_essence_count_multiplier: 0.001
            }
        }),
        boss_centaur: new Enemy(
        {
            name: __("Centaur"),
            index: 640,
            scale: 6,
            sprite: spr_boss_centaur,
            is_boss: true,
            difficulty: 2,
            
            reward: function()
            {
                var drop_shards_count = get_enemy_drop_shards_count(irandom_range(3, 6));
                return 
                {
                    resources: 
                    {
                        ancient: irandom_range(100000000, 10000000000),
                        shards: ceil(drop_shards_count)
                    }
                };
            },
            
            die: function()
            {
                enemy_drop_relic([global.relic_types.common, global.relic_types.uncommon]);
            },
            
            card_upgrades: 
            {
                enemy_shards_drop_multiplier: 0.025
            }
        }),
        boss_vile_creature: new Enemy(
        {
            name: __("Vile Creature"),
            index: 650,
            scale: 6,
            sprite: spr_boss_vile_creature,
            is_boss: true,
            difficulty: 3,
            
            reward: function()
            {
                var drop_shards_count = get_enemy_drop_shards_count(irandom_range(10, 20));
                return 
                {
                    resources: 
                    {
                        ancient: irandom_range(1000000000000, 100000000000000),
                        sacred: irandom_range(10000, 1000000),
                        shards: ceil(drop_shards_count)
                    }
                };
            },
            
            die: function()
            {
                enemy_drop_relic([global.relic_types.common, global.relic_types.uncommon, global.relic_types.rare]);
            },
            
            card_upgrades: 
            {
                enemy_shards_drop_multiplier: 0.025
            }
        }),
        boss_air_elemental: new Enemy(
        {
            name: __("Air Elemental"),
            index: 660,
            scale: 6,
            sprite: spr_boss_air_elemental,
            is_boss: true,
            difficulty: 4,
            
            reward: function()
            {
                var drop_shards_count = get_enemy_drop_shards_count(irandom_range(30, 40));
                return 
                {
                    resources: 
                    {
                        ancient: irandom_range(100000000000000, 10000000000000000),
                        sacred: irandom_range(1000000, 100000000),
                        shards: ceil(drop_shards_count)
                    }
                };
            },
            
            die: function()
            {
                enemy_drop_relic([global.relic_types.uncommon, global.relic_types.rare, global.relic_types.epic]);
            },
            
            card_upgrades: 
            {
                enemy_shards_drop_multiplier: 0.025
            }
        }),
        boss_spark_bubble: new Enemy(
        {
            name: __("Spark Bubble"),
            index: 670,
            scale: 4,
            sprite: spr_boss_spark_bubble,
            is_boss: true,
            is_moving: true,
            damage_type: global.damage_types.exotic,
            difficulty: 5,
            
            reward: function()
            {
                var drop_shards_count = get_enemy_drop_shards_count(irandom_range(50, 60));
                return 
                {
                    resources: 
                    {
                        shards: ceil(drop_shards_count)
                    }
                };
            },
            
            die: function()
            {
                enemy_drop_relic([global.relic_types.rare, global.relic_types.epic, global.relic_types.mythical]);
            },
            
            card_upgrades: 
            {
                enemy_shards_drop_multiplier: 0.025
            }
        }),
        boss_terror_blue: new Enemy(
        {
            name: __("Terror Blue"),
            index: 700,
            scale: 0.8,
            sprite: spr_boss_terror,
            blend_color: 16711680,
            is_boss: true,
            damage_type: global.damage_types.ice,
            difficulty: 6,
            reward_func: get_boss_reward_terror,
            
            die: function()
            {
                enemy_drop_relic([global.relic_types.epic, global.relic_types.mythical]);
            },
            
            card_upgrades: 
            {
                relics_base_damage_multiplier_cards: 0.01
            }
        }),
        boss_terror_green: new Enemy(
        {
            name: __("Terror Green"),
            index: 701,
            scale: 1,
            sprite: spr_boss_terror,
            blend_color: 32768,
            is_boss: true,
            damage_type: global.damage_types.platinum,
            difficulty: 6,
            reward_func: get_boss_reward_terror,
            
            die: function()
            {
                enemy_drop_relic([global.relic_types.epic, global.relic_types.mythical]);
            },
            
            card_upgrades: 
            {
                relics_base_damage_multiplier_cards: 0.01
            }
        }),
        boss_terror_red: new Enemy(
        {
            name: __("Terror Red"),
            index: 702,
            scale: 1,
            sprite: spr_boss_terror,
            blend_color: 255,
            is_boss: true,
            damage_type: global.damage_types.lava,
            difficulty: 6,
            reward_func: get_boss_reward_terror,
            
            die: function()
            {
                enemy_drop_relic([global.relic_types.epic, global.relic_types.mythical]);
            },
            
            card_upgrades: 
            {
                relics_base_damage_multiplier_cards: 0.01
            }
        }),
        boss_terror_purple: new Enemy(
        {
            name: __("Terror Purple"),
            index: 703,
            scale: 1,
            sprite: spr_boss_terror,
            blend_color: 8388736,
            is_boss: true,
            damage_type: global.damage_types.gold,
            difficulty: 6,
            reward_func: get_boss_reward_terror,
            
            die: function()
            {
                enemy_drop_relic([global.relic_types.epic, global.relic_types.mythical]);
            },
            
            card_upgrades: 
            {
                relics_base_damage_multiplier_cards: 0.01
            }
        }),
        boss_terror_super: new Enemy(
        {
            name: __("Super-Terror"),
            index: 704,
            scale: 1.5,
            sprite: spr_boss_terror_super,
            is_boss: true,
            is_moving: true,
            damage_type: global.damage_types.cosmic,
            difficulty: 7,
            
            reward: function()
            {
                var drop_shards_count = get_enemy_drop_shards_count(irandom_range(100, 125));
                var reward = 
                {
                    resources: 
                    {
                        shards: ceil(drop_shards_count)
                    }
                };
                var drop_additional_shards_chance = 0.1;
                if (percent_chance(drop_additional_shards_chance * 100))
                {
                    reward.resources.ascension_shards = irandom_range(1, 3);
                }
                if (percent_chance(drop_additional_shards_chance * 100))
                {
                    reward.resources.fusion_shards = irandom_range(1, 3);
                }
                if (percent_chance(drop_additional_shards_chance * 100))
                {
                    reward.resources.transformation_shards = irandom_range(1, 3);
                }
                var drop_leafscended_leaves_chance = 0.1;
                if (percent_chance(drop_leafscended_leaves_chance * 100))
                {
                    var res = array_random_item(global.resources_leaves);
                    var leafscension_level = 1;
                    reward.resources_leafscended = {};
                    variable_struct_set(reward.resources_leafscended, res.key, {});
                    variable_struct_set(variable_struct_get(reward.resources_leafscended, res.key), leafscension_level, irandom_range(2, 3));
                }
                return reward;
            },
            
            die: function()
            {
                enemy_drop_relic([global.relic_types.mythical]);
            },
            
            card_upgrades: 
            {
                relics_base_damage_multiplier_cards: 0.01
            }
        }),
        boss_energy_guard: new Enemy(
        {
            name: __("Energy Guard"),
            index: 710,
            scale: 6,
            sprite: spr_boss_energy_guard,
            is_boss: true,
            is_moving: true,
            damage_type: global.damage_types.cursed,
            difficulty: 8,
            
            reward: function()
            {
                var drop_shards_count = get_enemy_drop_shards_count(irandom_range(150, 200));
                var reward = 
                {
                    resources: 
                    {
                        shards: ceil(drop_shards_count)
                    }
                };
                var drop_additional_shards_chance = 0.1;
                if (percent_chance(drop_additional_shards_chance * 100))
                {
                    reward.resources.ascension_shards = irandom_range(2, 3);
                }
                if (percent_chance(drop_additional_shards_chance * 100))
                {
                    reward.resources.fusion_shards = irandom_range(2, 3);
                }
                if (percent_chance(drop_additional_shards_chance * 100))
                {
                    reward.resources.transformation_shards = irandom_range(2, 3);
                }
                var drop_leafscended_leaves_chance = 0.1;
                if (percent_chance(drop_leafscended_leaves_chance * 100))
                {
                    var res = array_random_item(global.resources_leaves);
                    var leafscension_level = 2;
                    reward.resources_leafscended = {};
                    variable_struct_set(reward.resources_leafscended, res.key, {});
                    variable_struct_set(variable_struct_get(reward.resources_leafscended, res.key), leafscension_level, irandom_range(1, 2));
                }
                return reward;
            },
            
            die: function()
            {
                enemy_drop_relic([global.relic_types.mythical]);
            },
            
            card_upgrades: 
            {
                relics_base_damage_multiplier_cards: 0.01
            }
        }),
        boss_green_flame: new Enemy(
        {
            name: __("Green Flame"),
            index: 800,
            scale: 6,
            sprite: spr_icon_green_flame,
            difficulty: 9,
            has_defeat_counter: true,
            is_boss: true,
            is_persistent: true,
            reset_cost: 
            {
                resources: 
                {
                    borb_token: 1000
                }
            },
            
            die: function()
            {
                o_game.data.stats.boss_green_flame_counter++;
            },
            
            get_damage: function(arg0)
            {
                return 1;
            },
            
            hp_max: function()
            {
                return 30000 + (self.get_defeat_counter() * 15000);
            },
            
            reward: function()
            {
                var drop_shards_count = get_enemy_drop_shards_count(irandom_range(200, 250));
                var juice_count = irandom_range(50, 100);
                var reward = 
                {
                    borbventure_item: {},
                    resources: 
                    {
                        borb_juice: juice_count,
                        shards: ceil(drop_shards_count)
                    }
                };
                var item_drop_chance = 0.5;
                if (percent_chance(item_drop_chance * 100))
                {
                    reward.borbventure_item = 
                    {
                        common: 
                        {
                            random_item: 1
                        }
                    };
                }
                return reward;
            },
            
            has_card: true,
            card_upgrades: 
            {
                resources_multiplier: 
                {
                    coal: 0.001
                }
            }
        }),
        boss_spectralseeker: new Enemy(
        {
            name: __("Spectralseeker"),
            index: 810,
            scale: 2,
            sprite: spr_boss_chimera,
            difficulty: 10,
            has_defeat_counter: true,
            is_boss: true,
            reset_cost: 
            {
                resources: 
                {
                    borb_token: 3000
                }
            },
            
            die: function()
            {
                o_game.data.stats.boss_green_flame_counter = 0;
                global.enemies.boss_green_flame.data.defeat_counter = 0;
                o_game.data.stats.boss_spectralseeker_counter++;
                notify(__s("%s vulnerability level was reset.", self.name));
            },
            
            get_damage: function(arg0)
            {
                return 1 + (global.enemies.boss_green_flame.get_defeat_counter() * get_upgrade_attribute_value(global.upgrade_attributes.spectralseeker_green_flame_multiplier));
            },
            
            hp_max: function()
            {
                return 2000000 + (self.get_defeat_counter() * 1000000);
            },
            
            reward: function()
            {
                var drop_shards_count = get_enemy_drop_shards_count(irandom_range(250, 300));
                var juice_count = irandom_range(100, 150);
                var reward = 
                {
                    borbventure_item: {},
                    resources: 
                    {
                        borb_juice: juice_count,
                        shards: ceil(drop_shards_count)
                    }
                };
                var item_drop_chance = 0.5;
                if (percent_chance(item_drop_chance * 100))
                {
                    reward.borbventure_item = 
                    {
                        uncommon: 
                        {
                            random_item: 1
                        }
                    };
                }
                return reward;
            },
            
            card_upgrades: 
            {
                borbventure_increase_reward: 0.001
            }
        }),
        sc_monolith: new Enemy(
        {
            name: __("Soul Monolith"),
            index: 900,
            sprite: spr_enemy_soul_monolith,
            scale: 3,
            card_upgrades: 
            {
                soul_crypt_bonus_reward_multiplier: 0.001
            }
        }),
        sc_mummy: new Enemy(
        {
            name: __("Soul Mummy"),
            index: 901,
            sprite: spr_enemy_soul_mummy,
            scale: 3,
            card_upgrades: 
            {
                soul_keys_crypt_multiplier: 0.001
            }
        }),
        sc_puddle: new Enemy(
        {
            name: __("Soul Puddle"),
            index: 902,
            sprite: spr_enemy_soul_puddle,
            scale: 3,
            card_upgrades: 
            {
                soul_particles_crypt_multiplier: 0.001
            }
        }),
        boss_soul_mirage: new Enemy(
        {
            name: __("Soul Mirage"),
            index: 990,
            scale: 3,
            sprite: spr_boss_soul_mirage,
            is_boss: true,
            difficulty: 15,
            
            reward: function()
            {
                var drop_soul_entities_count = irandom_range(30, 40);
                var drop_soul_particles_count = irandom_range(300, 400);
                var drop_soul_keys_count = irandom_range(150, 200);
                var reward = 
                {
                    resources: 
                    {
                        soul_entities: drop_soul_entities_count,
                        soul_keys: drop_soul_keys_count,
                        soul_particles: drop_soul_particles_count
                    }
                };
                return reward;
            },
            
            card_upgrades: 
            {
                alchemy_brew_multiplier: 0.0001
            }
        }),
        boss_fabric_warden: new Enemy(
        {
            name: __("Fabric Warden"),
            index: 1000,
            scale: 2,
            sprite: spr_boss_fabric_warden,
            is_boss: true,
            difficulty: 20,
            has_card: false,
            
            reward: function()
            {
                var drop_soul_count_base = get_soul_forge_complete_count();
                var drop_soul_count = irandom_range(drop_soul_count_base, drop_soul_count_base * 2);
                var rss_count = irandom_range(100, 200);
                var reward = 
                {
                    materials: 
                    {
                        refined_soul_stone: rss_count
                    },
                    resources: 
                    {
                        soul: drop_soul_count
                    }
                };
                return reward;
            }
        }),
        boss_weaver_of_worlds: new Enemy(
        {
            name: __("Weaver of Worlds"),
            index: 1010,
            scale: 2,
            sprite: spr_boss_weaver_of_worlds,
            is_boss: true,
            difficulty: 25,
            has_card: false,
            
            reward: function()
            {
                var drop_soul_count_base = get_soul_forge_complete_count();
                var drop_soul_count = irandom_range(drop_soul_count_base * 5, drop_soul_count_base * 10);
                var rss_count = irandom_range(500, 1000);
                var reward = 
                {
                    materials: 
                    {
                        refined_soul_stone: rss_count
                    },
                    resources: 
                    {
                        soul: drop_soul_count
                    }
                };
                return reward;
            }
        }),
        quark_stone: new Enemy(
        {
            name: __s("%s Stone", __("Quark")),
            index: 1100,
            sprite: spr_enemy_quark_stone,
            scale: 3,
            card_level: 1,
            quark_level: 1,
            drop_resources: [global.resources.quark],
            card_upgrades: 
            {
                quark_reactor_size_multiplier_cards: 0.0001
            }
        }),
        quarkling: new Enemy(
        {
            name: __s("Quarkling"),
            index: 1101,
            sprite: spr_enemy_quarkling,
            scale: 3,
            card_level: 1,
            quark_level: 1,
            drop_resources: [global.resources.quark],
            card_upgrades: 
            {
                quark_energy_charge_multiplier: 0.00001
            }
        }),
        boss_atomic_arbiter: new Enemy(
        {
            name: __s("Atomic Arbiter"),
            index: 1200,
            sprite: spr_boss_atomic_arbiter,
            scale: 4,
            difficulty: 22,
            card_level: 1,
            drop_resources: [global.resources.quark],
            is_boss: true,
            card_upgrades: 
            {
                quark_damage_multiplier_cards: 0.00001
            },
            
            reward: function()
            {
                var drop_quark_count = irandom_range(500, 1000);
                var reward = 
                {
                    resources: 
                    {
                        quark: drop_quark_count
                    }
                };
                return reward;
            }
        }),
        boss_cosmic_dragon: new Enemy(
        {
            name: __s("Cosmic Dragon"),
            index: 1201,
            sprite: spr_boss_cosmic_dragon,
            scale: 1,
            difficulty: 23,
            card_level: 1,
            quark_level: 1,
            drop_resources: [global.resources.quark],
            is_boss: true,
            card_upgrades: 
            {
                quark_reactor_inc_count_multiplier_cards: 0.0001
            },
            
            reward: function()
            {
                var drop_quark_count = irandom_range(5000, 10000);
                var reward = 
                {
                    resources: 
                    {
                        quark: drop_quark_count
                    }
                };
                return reward;
            }
        }),
        boss_quantum_artificer: new Enemy(
        {
            name: __s("Quantum Artificer"),
            index: 1202,
            sprite: spr_boss_quantum_artificer,
            scale: 1,
            has_card: true,
            difficulty: 24,
            card_level: 1,
            quark_level: 1,
            drop_resources: [global.resources.quark],
            is_boss: true,
            
            reward: function()
            {
                var drop_quark_count = irandom_range(50000, 100000);
                var reward = 
                {
                    resources: 
                    {
                        quark: drop_quark_count
                    }
                };
                return reward;
            },
            
            card_upgrades: 
            {
                banks_boss_card_rarity_multiplier_cards: 0.000005
            }
        }),
        shadow_fiend: new Enemy(
        {
            name: __("Shadow Fiend"),
            index: 2000,
            sprite: spr_enemy_shadowfiend,
            scale: 2,
            drop_resources: [global.resources.dusk],
            card_upgrades: 
            {
                shadow_crystal_attack_damage_multiplier: 0.000003
            }
        }),
        boss_shadow_tyrant: new Enemy(
        {
            name: __s("Shadow Tyrant"),
            index: 2010,
            sprite: spr_boss_shadow_tyrant,
            scale: 2,
            has_card: true,
            difficulty: 26,
            drop_resources: [global.resources.dusk],
            db_multiplier: 0.0001,
            is_boss: true,
            
            reward: function()
            {
                var reward = 
                {
                    materials: 
                    {
                        essence_shadow: irandom_range(5, 10)
                    }
                };
                return reward;
            },
            
            card_upgrades: 
            {
                slap_critical_multiplier: 0.00000001
            }
        }),
        boss_verdraxis: new Enemy(
        {
            name: __s("Verdraxis"),
            index: 2020,
            sprite: spr_boss_verdraxis,
            scale: 2,
            has_card: true,
            difficulty: 27,
            drop_resources: [global.resources.dusk],
            is_boss: true,
            db_multiplier: 0.0001,
            
            reward: function()
            {
                var reward = 
                {
                    materials: 
                    {
                        essence_shadow: irandom_range(50, 100)
                    }
                };
                return reward;
            },
            
            card_upgrades: 
            {
                slap_critical_chance: 0.000000002
            }
        }),
        boss_omnipresence: new Enemy(
        {
            name: __("Omnipresence"),
            index: 2030,
            sprite: spr_boss_omnipresence,
            scale: 2,
            has_card: true,
            difficulty: 28,
            is_boss: true,
            db_multiplier: 0.0001,
            
            reward: function()
            {
                var reward = 
                {
                    materials: 
                    {
                        shadow_crystal: irandom_range(3, 6)
                    }
                };
                return reward;
            }
        }),
        boss_krevlok: new Enemy(
        {
            name: __("Krevlok"),
            index: 2040,
            sprite: spr_boss_krevlok,
            scale: 2,
            has_card: true,
            difficulty: 28,
            is_boss: true,
            db_multiplier: 0.0001,
            
            reward: function()
            {
                var reward = 
                {
                    materials: 
                    {
                        shadow_crystal: irandom_range(10, 20)
                    }
                };
                return reward;
            }
        }),
        boss_cursed_cheese: new Enemy(
        {
            name: __("The Cursed Cheese"),
            index: 100000,
            scale: 4,
            sprite: spr_icon_cursed_cheese,
            
            hp_max: function()
            {
                return 500 + (self.data.defeated * 250);
            },
            
            is_boss: true,
            is_event_boss: true,
            include_in_deathbook: false,
            
            get_damage: function(arg0)
            {
                return 1;
            },
            
            has_special_damage: true,
            reward_func: get_halloween_cursed_cheese_reward,
            has_card: false
        }),
        boss_doomed_tree: new Enemy(
        {
            name: __("The Doomed Tree"),
            index: 100100,
            scale: 2,
            sprite: spr_boss_doomed_tree,
            
            hp_max: function(arg0)
            {
                if (!instance_exists(arg0))
                {
                    return 500;
                }
                var hp = 250 + (200 * arg0.infinite_counter);
                return hp;
            },
            
            is_boss: true,
            is_event_boss: true,
            is_infinite: true,
            include_in_deathbook: false,
            
            get_damage: function(arg0)
            {
                return 1;
            },
            
            has_special_damage: true,
            
            reward: function()
            {
                var drop_result = [
                {
                    resources: 
                    {
                        nature_gems: 3
                    }
                }, 
                {
                    resources: 
                    {
                        magic_mulch: 10
                    }
                }, 
                {
                    resources: 
                    {
                        nature_time_sphere: 1
                    }
                }, 
                {
                    resources: build_resource_cost(global.season_pass.nature.get_random_plant_seed(), 1)
                }];
                var reward = array_random_item(drop_result);
                if (!is_struct(struct_get_from_hash(reward, variable_get_hash("resources"))))
                {
                    reward.resources = {};
                }
                reward.resources.clover_basic3 = irandom_range(1, 2);
                if (percent_chance(5))
                {
                    reward.resources.clover_basic4 = 1;
                }
                return reward;
            },
            
            has_card: false
        })
    };
    add_keys_to_struct(global.enemies);
    global.enemies_tower = [];
    global.enemies_tower_bosses = [];
    global.enemies_tower_mobs = [];
    global.enemies_bosses = [];
    global.enemies_death_book = [];
    global.enemies_resettable = [];
    _map(global.enemies, function(arg0, arg1, arg2)
    {
        arg0.key = arg1;
        if (arg0.is_boss)
        {
            arg0.index = arg0.index + 10000000000;
            arg0.name = sprintf("%s %s", __("Boss"), arg0.name);
            if (!arg0.tower)
            {
                array_push(global.enemies_bosses, arg0);
                if (arg0.include_in_deathbook)
                {
                    array_push(global.enemies_death_book, arg0);
                }
            }
        }
        if (arg0.tower)
        {
            arg0.name = sprintf("%s %s", __("Tower"), arg0.name);
        }
        array_push(global.enemies_sorted, arg0);
        if (arg0.tower)
        {
            array_push(global.enemies_tower, arg0);
            if (!arg0.is_boss)
            {
                array_push(global.enemies_tower_mobs, arg0);
            }
            else
            {
                array_push(global.enemies_tower_bosses, arg0);
            }
        }
        if (arg0.has_defeat_counter)
        {
            array_push(global.enemies_resettable, arg0);
        }
    }, false);
    global.enemies_sorted = struct_to_sorted_array(global.enemies);
    sort_array_by_index(global.enemies_bosses, true);
    sort_array_by_index(global.enemies_death_book, true);
}
