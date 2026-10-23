function init_pets()
{
    global.pets = 
    {
        alb: new Pet(
        {
            index: -300,
            name: __("Autoblowo"),
            sprite: spr_autoblower,
            scale_sign: -1,
            description: __("Your companion, BFF, and soulmate. Increases ALB enemy damage by 25%."),
            upgrade_attributes: 
            {
                alb_enemy_damage_multiplier: 0.25
            }
        }),
        batto: new Pet(
        {
            index: -220,
            name: __("Batto"),
            sprite: spr_pet_bat,
            sprite_walk: spr_pet_bat_walk,
            sprite_speed: 2,
            scale: 2,
            description_locked: global.text_unlock_descriptions.unlock_shadow_crystal,
            description_prefix: __s("Most bats use echolocation to navigate and hunt in the dark."),
            
            description: function()
            {
                return get_general_description();
            },
            
            generatable_in_quests: false,
            
            is_buyable: function()
            {
                return is_unlocked_shadow_crystal();
            },
            
            upgrade_attributes: 
            {
                shadow_crystal_attack_damage_multiplier: 0.5,
                shadow_crystal_player_hp_multiplier: 0.2,
                shadow_crystal_player_rest_stamina_value: 1,
                shadow_crystal_player_rest_hp_value_multiplier: 0.2
            }
        }),
        bearo: new Pet(
        {
            index: -210,
            name: __("Bearo"),
            sprite: spr_pet_bear,
            sprite_walk: spr_pet_bear_walk,
            sprite_speed: 2,
            scale: 2,
            description: __s("It's a bear market! Bearo accepts %s new trades and collects %s finished trades every minute, and reduces trade input resources by %s.", 2, 2, number_format_percent(0.5)),
            upgrade_attributes: 
            {
                trade_decrease_input_count: 1,
                trade_auto_collect: 2,
                trade_auto_start: 2
            }
        }),
        beeo: new Pet(
        {
            index: -205,
            name: __("Beeo"),
            sprite: spr_enemy_bee,
            sprite_walk: spr_enemy_bee,
            scale_sign_x: -1,
            description_locked: __s("Unlocks on event: %s", __("Nature Season")),
            description_prefix: __s("Bees have 5 eyes, 6 legs, 7 cute and 8 important for harvesting crops."),
            
            description: function()
            {
                return get_general_description();
            },
            
            generatable_in_quests: false,
            
            is_buyable: function()
            {
                return is_event_active(global.events.nature_season);
            },
            
            upgrade_attributes: 
            {
                nature_plant_xp_multiplier_global: 0.05,
                nature_vial_progress_multiplier: 0.02,
                nature_plant_grow_duration: 0.01
            }
        }),
        borbo: new Pet(
        {
            index: -200,
            name: __("Borbo"),
            sprite: spr_pet_borb,
            sprite_walk: spr_pet_borb_walk,
            sprite_speed: 2,
            description: "Borb, borb, borb. Borb borb +borb borb/borb.",
            add_upgrade_description: true,
            upgrade_attributes: 
            {
                resources_leaf_add: 
                {
                    borbs: 50
                },
                borbventure_increase_reward: 0.1,
                borbventure_increase_xp: 0.05,
                borbventure_increase_time: -0.02
            }
        }),
        butterflyo: new Pet(
        {
            index: -190,
            name: __("Butterflyo"),
            sprite: spr_pet_butterflyo,
            sprite_walk: spr_pet_butterflyo,
            description: sprintf(__("Look at this beautiful butterfly. Pet and Unique Leaves bonuses are beautifully increased by %s%."), number_format(20)),
            upgrade_attributes: 
            {
                upgrade_section_multiplier: 
                {
                    pets: 0.2,
                    unique: 0.2
                }
            }
        }),
        bunny: new Pet(
        {
            index: -100,
            name: __("Bunnyo"),
            sprite: spr_pet_bunny,
            description: sprintf(__("Cute, fuzzy, fluffy. Doubles converter speed and increases converter crits by %s%. Also adds %s player HP."), 1000, 100),
            upgrade_attributes: 
            {
                converter_speed: 1,
                converter_crit_value_multiplier: 10,
                player_hp: 100
            }
        }),
        camelo: new Pet(
        {
            index: -50,
            name: __("Camelo"),
            sprite: spr_pet_camel,
            sprite_walk: spr_pet_camel_walk,
            scale: 2,
            
            is_buyable: function()
            {
                return global.areas.inner_pyramid.data.highest_floor_stats > 1;
            },
            
            description: __s("Camels can completely shut their nostrils during sandstorms. Camelo increases chest spawn chance by %s and increases Ancient Leaf reward by %s.", number_format_percent(0.02), number_format_percent(0.05)),
            description_locked: __s("Unlocks after clearing Pyramid Floor level %s.", 2),
            upgrade_attributes: 
            {
                chest_spawn_chance: 0.02,
                resources_multiplier: 
                {
                    ancient: 0.05
                }
            }
        }),
        cat: new Pet(
        {
            index: 0,
            name: __("Catto"),
            sprite: spr_pet_cat,
            description: __("You may serve as their pet. Enemy resource awards increased by +200%."),
            upgrade_attributes: 
            {
                enemy_drop_multiplier: 2
            }
        }),
        cheesetor: new Pet(
        {
            index: 20,
            name: __("Cheesetor"),
            sprite: spr_icon_cheese,
            scale_sign_x: -1,
            description_prefix: __s("Yep, this is me. I farm %s cheese every %s minutes for you. Triple cheese if we're on the moon. Cheddar > Gruyere.", 1, 2),
            
            description: function()
            {
                return get_general_description();
            },
            
            upgrade_attributes: 
            {
                dice_battlefield_damage_multiplier_pets: 0.03,
                leaf_multiplier_pets: 0.05,
                mines_mine_power_multiplier_pets: 0.03,
                nature_global_upgrade_bonus_value: 0.03,
                relics_base_damage_multiplier_pets: 0.03,
                resources_auto_collect: 
                {
                    cheese: function()
                    {
                        var mins = 2;
                        var val = (o_game.area.key == global.areas.moon.key) ? 3 : 1;
                        var collect_val = val / (60 * mins);
                        return collect_val;
                    }
                }
            },
            
            offline_reward: function(arg0)
            {
                var mins = 2;
                var val = (o_game.area.key == global.areas.moon.key) ? 3 : 1;
                var collect_val = val / (60 * mins);
                return 
                {
                    resources: 
                    {
                        cheese: floor(collect_val * arg0)
                    }
                };
            }
        }),
        cursed_cheese: new Pet(
        {
            index: 21,
            name: __("The Cursed Cheese"),
            sprite: spr_icon_cursed_cheese,
            
            is_buyable: function()
            {
                return o_game.data.stats.cursed_count >= 666;
            },
            
            scale_sign_x: -1,
            description: sprintf(__("The Cursed Cheese will haunt your dreams. You get %s curses every minute. Needs %s curses to unlock."), 3, 666),
            description_locked: __s("Unlocks after unlocking %s.", sprintf("%s %s", 666, __("Curses"))),
            upgrade_attributes: 
            {
                cursed_autocollect: 0.05
            },
            
            offline_reward: function(arg0)
            {
                return 
                {
                    stats: 
                    {
                        cursed_count: floor(0.05 * arg0)
                    }
                };
            }
        }),
        crabbo: new Pet(
        {
            index: 25,
            name: __("Crabbo"),
            sprite: spr_enemy_crab,
            description: sprintf(__("You mess with Crabbo, you get a stabbo. Increases global blowing damage by %s%."), 50),
            upgrade_attributes: 
            {
                blower_enemy_damage_multiplier_global: 0.5
            }
        }),
        deer: new Pet(
        {
            index: 50,
            name: __("Deero"),
            sprite: spr_pet_deer,
            description: __("When most deer are born, they have white spots which disappear as they mature. Increases Printer rewards by 1000%."),
            upgrade_attributes: 
            {
                printer_multiplier_multiplier: 10
            }
        }),
        dog: new Pet(
        {
            index: 100,
            name: __("Doggo"),
            sprite: spr_pet_dog,
            description: __("Who is a good boy? You're a good boy! Increases combo multiplier by 50%."),
            upgrade_attributes: 
            {
                combo_max_multiplier: 0.5
            }
        }),
        ducko: new Pet(
        {
            index: 110,
            name: __("Ducko"),
            sprite: spr_pet_ducko,
            sprite_walk: spr_pet_ducko_walk,
            description: sprintf(__("Ducko doesn't quack around. Quacking is serious business. Thus, material base spawn rate is increased by %s."), number_format_percent(0.01)),
            description_locked: __("Unlocks after unlocking Materials."),
            generatable_in_quests: false,
            
            is_buyable: function()
            {
                return is_unlocked_materials();
            },
            
            upgrade_attributes: 
            {
                material_spawn_chance_add_base: 0.01
            }
        }),
        elephanto: new Pet(
        {
            index: 115,
            name: __("Elephanto"),
            sprite: spr_pet_elephant,
            sprite_walk: spr_pet_elephant,
            add_upgrade_description: true,
            description: __("Elephants are the largest land animals on Earth."),
            description_locked: __s("Unlocks after unlocking %s.", __("Dice")),
            generatable_in_quests: false,
            
            is_buyable: function()
            {
                return is_unlocked_cards();
            },
            
            upgrade_attributes: 
            {
                dice_battlefield_die_drop_chance: 0.0025
            }
        }),
        fish: new Pet(
        {
            index: 120,
            name: __("Fisho"),
            sprite: spr_pet_fish,
            sprite_walk: spr_pet_fish_walk,
            scale: 2,
            description: sprintf(__("The Fisho slaps you around with a large trout. The Fisho increases blower enemy damage by %s, enemy resource awards by %s and slap damage by %s."), number_format_percent(0.15), number_format_percent(0.5), number_format_percent(0.05)),
            upgrade_attributes: 
            {
                blower_enemy_damage_multiplier: 0.15,
                enemy_drop_multiplier: 0.5,
                slap_multiplier: 0.05
            }
        }),
        flamingo: new Pet(
        {
            index: 123,
            name: __("Flamingoo"),
            sprite: spr_pet_flamingo,
            sprite_walk: spr_pet_flamingo_walk,
            description: sprintf(__("Some flamingos live in extreme environments. That's why Flamingoo works as a lightning arrester. It acquires +%s the energy in certain areas for you."), number_format_percent(1)),
            description_locked: sprintf(__("Unlocks after unlocking %s"), global.resources.energy_electrical.name),
            upgrade_attributes: 
            {
                energy_base_charge_value_multiplier: 1
            },
            upgrade_multiplier: 0.05,
            generatable_in_quests: false,
            
            is_buyable: function()
            {
                return is_unlocked_energy_electrical();
            }
        }),
        flocko: new Pet(
        {
            index: 125,
            name: __("Flocko"),
            sprite: spr_enemy_bird_mirror,
            description: __("Birds of a feather flock together, and this Flocko works for you! Reduces Artifact spawn time by 20% (applies after the next Artifact spawn)."),
            upgrade_attributes: 
            {
                artifact_spawn_time_reduction: 0.2
            },
            upgrade_multiplier: 0.02
        }),
        fox: new Pet(
        {
            index: 150,
            name: __("Foxo"),
            sprite: spr_pet_fox,
            description: __("Foxes are extremely playful. That's why BLC rewards are increased by 200%."),
            upgrade_attributes: 
            {
                blc_value_multiplier_adder: 2
            }
        }),
        hippo: new Pet(
        {
            index: 160,
            name: __("Hippo"),
            sprite: spr_pet_hippo,
            sprite_walk: spr_pet_hippo_walk,
            scale: 2,
            description: sprintf(__("Hippo stirs the cauldron for you. Decreases alchemy brew time by %s and increases critical brews by %s."), number_format_percent(0.15), number_format_percent(0.01)),
            description_locked: __("Unlocks after unlocking Alchemy."),
            upgrade_attributes: 
            {
                alchemy_brew_crit_chance: 0.01,
                alchemy_brew_time_reduction: 0.15
            },
            
            is_buyable: function()
            {
                return is_unlocked_alchemy();
            }
        }),
        moleo: new Pet(
        {
            index: 165,
            name: __("Moleo"),
            sprite: spr_pet_mole,
            sprite_walk: spr_pet_mole_walk,
            description_locked: __s("Unlocks after unlocking %s", __("Mines")),
            description_prefix: __s("Moles have poor eyesight but possess a highly developed sense of touch."),
            
            description: function()
            {
                return get_general_description();
            },
            
            generatable_in_quests: false,
            
            is_buyable: function()
            {
                return is_unlocked_mines();
            },
            
            upgrade_attributes: 
            {
                mines_mine_power_multiplier: 0.2,
                mines_reward_multiplier: 0.1,
                mines_rarity_multiplier: 0.1
            }
        }),
        monkey: new Pet(
        {
            index: 170,
            name: __("Monkeyo"),
            sprite: spr_pet_monkey,
            description: __("Monkeyo like leaf go poof. Add leaf blow power 1000%."),
            upgrade_attributes: 
            {
                nuclear_fuel_multiplier: 10
            }
        }),
        mouseo: new Pet(
        {
            index: 175,
            name: __("Mouseo"),
            sprite: spr_pet_mouseo,
            description: sprintf(__("The second mouse gets the cheese: Mouseo has a %s% chance to steal 1 cheese from a defeated enemy."), 5, 1),
            upgrade_attributes: 
            {
                enemy_add_reward: 
                {
                    cheese: 1
                },
                enemy_add_reward_chance: 
                {
                    cheese: 5
                }
            }
        }),
        owlo: new Pet(
        {
            index: 180,
            name: __("Owlo"),
            sprite: spr_pet_owl,
            sprite_walk: spr_pet_owl_walk,
            scale: 1.5,
            description: __s("A group of owls is called a parliament. Increases merged leaves count by %s.", 2),
            upgrade_attributes: 
            {
                leaf_merge_count_add: 2
            }
        }),
        panthero: new Pet(
        {
            index: 185,
            name: __("Panthero"),
            sprite: spr_pet_panther,
            sprite_walk: spr_pet_panther_walk,
            scale: 2,
            description: sprintf(__("Panthers are incredibly quick, they can run up to 80km/h. Panthero gives a %s chance to skip a tower floor though it can't skip bosses."), number_format_percent(0.025)),
            description_locked: sprintf(__("Unlocks at Tower Floor level %s"), 500),
            upgrade_attributes: 
            {
                skip_tower_floor_chance: 0.025
            },
            
            is_buyable: function()
            {
                return global.areas.tower.data.highest_floor_stats >= 500;
            }
        }),
        penguino: new Pet(
        {
            index: 190,
            name: __("Penguino"),
            sprite: spr_pet_penguin,
            scale: 1,
            description: __("Penguins spend around half their time in water, the other half on land, and the other half doing trades. Decreases trade delivery time by 25% and refresh time by 10%."),
            upgrade_attributes: 
            {
                trade_duration_decrease_timer: 0.25,
                trade_refresh_decrease_timer: 0.1
            }
        }),
        pig: new Pet(
        {
            index: 195,
            name: __("Piggo"),
            sprite: spr_pet_pig,
            scale: 1.5,
            description: __("Pigs have powerful noses. They are around 2000 times more sensitive than a human's."),
            description_locked: __("The Bartender lets you use this pet."),
            add_upgrade_description: true,
            upgrade_attributes: 
            {
                leaf_pub_counter_autocount: 0.005,
                leaf_pub_counter: 3,
                leaf_pub_counter_multiplier: 0.05,
                leaf_pub_counter_bet_chance: 0.05,
                leaf_pub_counter_bet_multiplier: 0.25
            },
            
            is_buyable: function()
            {
                return area_bought(global.areas.cheese_pub);
            }
        }),
        raccoon: new Pet(
        {
            index: 200,
            name: __("Raccoono"),
            sprite: spr_pet_raccoon,
            description: __("Raccoons use up to 20 den sites at a time, from sheds to sewers. Increases seed spawn chance by 1% and seed spawn count by 1."),
            upgrade_attributes: 
            {
                seed_spawn_chance: 0.01,
                seed_spawn_count: 1
            }
        }),
        sealo: new Pet(
        {
            index: 290,
            name: __("Sealo"),
            sprite: spr_pet_seal,
            sprite_walk: spr_pet_seal_walk,
            scale: 1.5,
            description: sprintf(__("Seals are just Sea Doggos. Decreases Leafscender input cost by %s and duration by %s. Sealo can't reduce the initial leafscension cost, though."), number_format_percent(0.05), number_format_percent(0.1)),
            description_locked: __("Unlocks after unlocking Leafscension."),
            
            is_buyable: function()
            {
                return is_unlocked_leafscension();
            },
            
            upgrade_attributes: 
            {
                leafscender_decrease_input_cost_multiplier: 0.05,
                leafscender_decrease_convert_time: 0.1
            }
        }),
        sharko: new Pet(
        {
            index: 295,
            name: __("Sharko"),
            sprite: spr_pet_shark,
            sprite_walk: spr_pet_shark_walk,
            scale: 2.5,
            description: __s("Sharko modifies probabilities to their favor. Increases drop chance of cards by %s.", number_format_percent(0.005)),
            description_locked: __("Unlocks after unlocking Cards."),
            generatable_in_quests: false,
            
            is_buyable: function()
            {
                return is_unlocked_cards(true);
            },
            
            upgrade_attributes: 
            {
                cards_enemy_drop_chance: 0.005
            }
        }),
        snake: new Pet(
        {
            index: 300,
            name: __("Snekko"),
            sprite: spr_pet_snake,
            sprite_walk: spr_pet_snake_walk,
            scale: 1.5,
            description: __("Snekko isssss your friend. Increasesssss your max hp by 30%."),
            upgrade_attributes: 
            {
                player_hp_multiplier: 0.3
            }
        }),
        spider: new Pet(
        {
            index: 400,
            name: __("Spider Bro"),
            sprite: spr_pet_spider,
            sprite_walk: spr_pet_spider_walk,
            scale: 1.5,
            description: __s("Look at this cute little spider! Increases your hp regeneration by %s and reduces incoming damage by %s.", number_format_percent(0.2), number_format_percent(0.1)),
            upgrade_attributes: 
            {
                player_hp_reg_multiplier: 0.2,
                damage_resistance: 0.1
            }
        }),
        squirrelo: new Pet(
        {
            index: 500,
            name: __("Squirrelo"),
            sprite: spr_pet_squirrel,
            sprite_walk: spr_pet_squirrel_walk,
            description: __s("Squirrelo increases Celestial Leaves rewards by %s.", number_format_percent(4)),
            upgrade_attributes: 
            {
                resources_multiplier_pet: 
                {
                    celestial: 4
                }
            }
        }),
        toucano: new Pet(
        {
            index: 600,
            name: __("Toucano"),
            sprite: spr_pet_toucan,
            sprite_walk: spr_pet_toucan_walk,
            scale_sign_x: -1,
            generatable_in_quests: false,
            
            is_buyable: function()
            {
                return is_unlocked_materials();
            },
            
            description: sprintf(__("Toucano is trained to 'collect' %s materials each minute for you from other people. Justice can't sue birds, right."), 2),
            description_locked: __("Unlocks after unlocking Materials."),
            upgrade_attributes: 
            {
                material_autocollect: 1/30
            },
            
            offline_reward: function(arg0)
            {
                var count = floor((1/30) * arg0);
                if (count < 1)
                {
                    exit;
                }
                var materials_collected = {};
                if (count < 100)
                {
                    repeat (count)
                    {
                        var material = get_random_droppable_material();
                        add_to_struct_value(materials_collected, material.key, 1);
                    }
                }
                else
                {
                    var value = floor(count / array_length(global.materials_spawnable));
                    var __array = global.materials_spawnable;
                    var __prop_len = array_length(__array);
                    for (var __i = 0; __i < __prop_len; __i++)
                    {
                        var mitem = __array[__i];
                        add_to_struct_value(materials_collected, mitem.key, value);
                    }
                }
                return 
                {
                    materials: materials_collected
                };
            }
        }),
        trouto: new Pet(
        {
            index: 650,
            name: __("Trouto"),
            sprite: spr_weapon_trout,
            
            is_buyable: function()
            {
                return global.shops.weapons.trout.data.count > 0;
            },
            
            description: __("Trout, like most other fish, cannot regulate their body temperature.") + " " + __s("Trouto automatically slaps enemies for you every %s seconds.", 10),
            description_locked: __s("Unlocks after unlocking %s.", __("Trout")),
            upgrade_attributes: 
            {
                slap_multiplier: 0.01
            },
            
            game_loop_second: function()
            {
                var timeout_duration = sec(10);
                var timeout_key = "trouto_slap";
                if (has_timeout(timeout_key))
                {
                    exit;
                }
                pet_slap();
                set_timeout(timeout_key, timeout_duration);
            }
        }),
        witcho: new Pet(
        {
            index: 700,
            name: __("Witcho"),
            sprite: spr_boss_witch,
            sprite_walk: spr_boss_witch,
            scale_sign_x: -1,
            scale: 1.5,
            
            is_buyable: function()
            {
                return global.enemies.boss_witch.data.defeated >= 10;
            },
            
            description: sprintf(__("What a lovely pet! Witcho yields %s more Witch curses and %s more essence."), 10, 1),
            description_locked: sprintf(__("Unlocks after defeating The Witch %s times."), 10),
            upgrade_attributes: 
            {
                witch_cursed_count: 10,
                witch_essence_count: 1
            }
        })
    };
    global.pets_generatable = [];
    global.pets_sorted = [];
    global.pets_sorted_prio = [];
    global.pets_upgrade_early = [];
    global.pets_upgrade_late = [];
    var __struct = global.pets;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        mitem.key = mkey;
        if (!is_undefined(struct_get_from_hash(mitem.upgrade_attributes, variable_get_hash("upgrade_section_multiplier"))))
        {
            mitem.upgrade_attributes_apply_early = true;
            array_push(global.pets_upgrade_early, mitem);
        }
        else
        {
            array_push(global.pets_upgrade_late, mitem);
        }
        if (mitem.generatable_in_quests)
        {
            array_push(global.pets_generatable, mitem);
        }
        array_push(global.pets_sorted, mitem);
        array_push(global.pets_sorted_prio, mitem);
    }
    array_sort(global.pets_sorted, function(arg0, arg1)
    {
        return arg0.index - arg1.index;
    });
}

function init_shop_pets()
{
    global.shops_prestige_levels.pets = global.prestige_levels.inf;
    global.shops.pets = {};
    _map(global.pets, function(arg0, arg1, arg2)
    {
        var shop_key = "pet_" + arg1;
        variable_struct_set(global.shops.pets, shop_key, 
        {
            index: arg0.index,
            
            name: function()
            {
                return self.item.get_name();
            },
            
            description: function()
            {
                return self.item.get_description();
            },
            
            description_locked: arg0.description_locked,
            sprite: arg0.sprite,
            cost: 
            {
                blc: 2000000
            },
            is_buyable: arg0.is_buyable,
            is_obfuscated: arg0.is_obfuscated,
            is_upgradable: true,
            is_usable: true,
            item: arg0,
            max_count: 1,
            cost_exp: 3,
            pet: arg0,
            
            func: function()
            {
                if (!self.pet.data.active)
                {
                    if (!self.pet.can_activate_max_count())
                    {
                        exit;
                    }
                    self.pet.activate();
                }
                else
                {
                    self.pet.deactivate(true, true);
                }
                self.pet.data.count++;
            }
        });
    }, false);
}
