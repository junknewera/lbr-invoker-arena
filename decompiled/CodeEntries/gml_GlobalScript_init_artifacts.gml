function init_artifacts()
{
    global.artifacts = 
    {
        time_crystal: new Artifact(
        {
            index: 5,
            name: __("Time Crystal"),
            sprite: spr_artifact_time_crystal,
            description: __("Shows the spawn time of artifacts."),
            is_usable: false,
            max_count: 1,
            spawn_area: global.areas.space,
            spawn_delay: 60,
            persist_prestige: global.prestige_levels.inf
        }),
        compass: new Artifact(
        {
            index: 10,
            name: __("The Compass"),
            sprite: spr_artifact_compass,
            description: __("Shows the location of artifacts."),
            description_locked: __("In the garden where the neighbor's roses bloom, a compass awaits to dispel the gloom. Seek the path where shadows play, and find the guide to light your way."),
            instance_expire_time: sec(1),
            is_usable: false,
            max_count: 1,
            spawn_area: global.areas.neighbors_garden,
            spawn_delay: 60,
            persist_prestige: global.prestige_levels.inf
        }),
        water_seal: new Artifact(
        {
            index: 15,
            name: __("Water Seal"),
            sprite: spr_artifact_seal,
            description: __("This Artifact lifts a seal..."),
            is_usable: false,
            max_count: 1,
            spawn_area: global.areas.abyss,
            spawn_delay: 120
        }),
        zoo: new Artifact(
        {
            index: 17,
            name: __("Zoo Necklace"),
            sprite: spr_artifact_zoo,
            description: __("Pets are friends, pets are life. Allows you to equip another pet."),
            is_usable: false,
            max_count: 1,
            can_spawn: false,
            upgrade_attributes: 
            {
                max_pets: 1
            },
            persist_prestige: global.prestige_levels.inf
        }),
        lantern: new Artifact(
        {
            index: 20,
            name: __("Halloween Lantern"),
            sprite: spr_artifact_lantern,
            description: __s("Magically starts the %s event for %s.", global.events.halloween.name, format_time(secr(global.events.halloween.expire_duration), false)),
            spawn_area: global.areas.moon,
            spawn_delay: 259200,
            winnable: false,
            offline: false,
            is_event: true,
            max_count: 1,
            
            func: function()
            {
                global.events.halloween._activate(true);
            },
            
            can_activate: function()
            {
                return !is_event_active(global.events.halloween) && !in_challenge();
            }
        }),
        nature_rod: new Artifact(
        {
            index: 21,
            name: __("Nature Rod"),
            sprite: spr_artifact_nature_rod,
            description: __s("Magically starts the %s event for %s.", global.events.nature_season.name, format_time(secr(global.events.nature_season.expire_duration), false)),
            generatable_in_quests: false,
            spawn_area: global.areas.pyramid,
            spawn_delay: 2592000,
            winnable: false,
            offline: false,
            is_event: true,
            max_count: 1,
            
            func: function()
            {
                global.events.nature_season._activate(true);
            },
            
            can_activate: function()
            {
                return !is_event_active(global.events.nature_season) && !in_challenge();
            }
        }),
        birthday_cake: new Artifact(
        {
            index: 22,
            name: __("Birthday Cake"),
            sprite: spr_icon_birthday_cake,
            description: __s("Magically starts the %s event for %s.", global.events.anniversary.name, format_time(secr(global.events.anniversary.expire_duration), false)),
            generatable_in_quests: false,
            spawn_area: global.areas.mount_moltenfury,
            spawn_delay: 259200,
            winnable: false,
            offline: false,
            is_event: true,
            max_count: 1,
            
            func: function()
            {
                global.events.anniversary._activate(true);
            },
            
            can_activate: function()
            {
                return !is_event_active(global.events.anniversary) && !in_challenge();
            }
        }),
        blazing_skull: new Artifact(
        {
            index: 30,
            name: __("Blazing Skull"),
            sprite: spr_artifact_skull,
            description: __s("Spawns %s enemies at once.", 5),
            spawn_area: global.areas.void,
            spawn_delay: 10800,
            winnable: true,
            
            func: function()
            {
                var spawn_func = spawn_random_area_enemy;
                if (is_current_area(global.areas.tower) && get_upgrade_count(global.shops.gems.blazing_skull_tower) > 0)
                {
                    spawn_func = spawn_random_tower_enemy;
                }
                repeat (5)
                {
                    spawn_func();
                }
            },
            
            can_activate: function()
            {
                if (is_current_area(global.areas.tower) && is_tower_boss_floor(global.current_tower_floor))
                {
                    return false;
                }
                var area_spawn_array = [global.area_types.def.key];
                if (get_upgrade_count(global.shops.gems.blazing_skull_tower) >= 1 && is_same_key(o_game.area.type, global.areas.tower))
                {
                    return can_spawn_enemy();
                }
                return array_length(o_game.area.enemy) > 0 && can_spawn_enemy() && in_array(o_game.area.type.key, area_spawn_array);
            }
        }),
        fruit: new Artifact(
        {
            index: 50,
            name: __("Enchanted Fruit"),
            sprite: spr_artifact_fruit,
            description: sprintf(__("Spawns %s fruits at once."), 20),
            spawn_area: global.areas.garden,
            spawn_delay: 3600,
            winnable: true,
            
            func: function()
            {
                repeat (20)
                {
                    spawn_fruit();
                }
            },
            
            can_activate: function()
            {
                return can_spawn_fruit();
            }
        }),
        gold_suitcase: new Artifact(
        {
            index: 60,
            name: __("Gold Suitcase"),
            sprite: spr_artifact_gold_suitcase,
            description: __s("Brings the Gold Suitcase to trade meetings to instantly finish a random available trade and keep the input resources."),
            max_count: 100,
            spawn_area: global.areas.desert,
            spawn_delay: 259200,
            winnable: false,
            offline: false,
            
            func: function()
            {
                var trade = array_random_item_check_func(global.trades, "is_not_started");
                if (!is_struct(trade))
                {
                    return false;
                }
                notify(__s("Exploited a trade for %s.", format_resources_text(trade.data.reward)));
                trade.collect(true);
            },
            
            can_activate: function()
            {
                if (!is_unlocked_trading())
                {
                    return false;
                }
                var can_use = _any(global.trades, function(arg0)
                {
                    return call_method(arg0, arg0.is_not_started);
                });
                return can_use;
            }
        }),
        gravity_ball: new Artifact(
        {
            index: 70,
            name: __("Gravity Ball"),
            sprite: spr_artifact_gravity_ball,
            description: __("Spawns a gravity ball which attracts leaves."),
            auto_use_delay: sec(2),
            spawn_area: global.areas.celestial_plane,
            spawn_delay: 14400,
            winnable: true,
            
            func: function()
            {
                spawn_gravity_ball();
            },
            
            can_activate: function()
            {
                return instance_number(o_artifact_gravity_ball) == 0 && o_game.area.type.spawn_leaves;
            }
        }),
        leafscension_exploit: new Artifact(
        {
            index: 80,
            name: __("Leafscension Exploit"),
            sprite: spr_artifact_leafscension_exploit,
            
            description: function()
            {
                var max_level = get_leafscension_exploit_max_level();
                var text = __s("Exploits the leafscension process to instantly finish a random available leafscension and keep the input resources. At least %s leafscensions must be activatable. The max leafscension level depends on the number of defeated %s. Max level: %s.", global.game_settings.artifact_leafscension_exploit_min_leafscenders_activatable, global.enemies.boss_cursed_cheese.name, sprintf("L%s", max_level));
                return text;
            },
            
            description_locked: function()
            {
                return __s("Unlocks after defeating %s %s times. (%s)", global.enemies.boss_cursed_cheese.name, 10, global.enemies.boss_cursed_cheese.data.defeated);
            },
            
            generatable_in_quests: false,
            max_count: 100,
            spawn_area: global.areas.plasma_forest,
            spawn_delay: 604800,
            use_delay: sec(120),
            winnable: false,
            offline: false,
            
            func: function()
            {
                var leafscend_level = "";
                var leafscend_name = "";
                var max_level = get_leafscension_exploit_max_level();
                var __array = global.leafscenders_array;
                var __prop_len = array_length(__array);
                var __prop_order = array_fill_index(__prop_len);
                __prop_order = array_shuffle(__prop_order);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var __sindex = __prop_order[__i];
                    var mitem = __array[__sindex];
                    if (mitem._can_activate() && max_level >= mitem.level)
                    {
                        mitem.finish();
                        leafscend_level = mitem.level;
                        leafscend_name = mitem.resource.name_single;
                        break;
                    }
                }
                notify(__s("Completed leafscension %s L%s.", leafscend_name, leafscend_level));
            },
            
            can_activate: function()
            {
                if (!is_unlocked_leafscension())
                {
                    return false;
                }
                var activatable = 0;
                var max_level = get_leafscension_exploit_max_level();
                var __array = global.leafscenders_array;
                var __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    if (mitem._can_activate() && max_level >= mitem.level)
                    {
                        activatable++;
                        if (activatable >= global.game_settings.artifact_leafscension_exploit_min_leafscenders_activatable)
                        {
                            return true;
                        }
                    }
                }
                return false;
            },
            
            can_spawn: function()
            {
                return global.enemies.boss_cursed_cheese.data.defeated >= 10;
            }
        }),
        mirror: new Artifact(
        {
            index: 100,
            name: __("Mirror"),
            sprite: spr_artifact_mirror,
            description: __s("Places a mirror in an area which will collect area resources. Manage mirrors in the %s.", __("Control Panel")),
            generatable_in_quests: false,
            max_count: 100,
            spawn_area: global.areas.energy_singularity,
            spawn_delay: 21600,
            winnable: false,
            offline: false,
            can_activate: can_place_mirror,
            func: place_mirror
        }),
        orb: new Artifact(
        {
            index: 100,
            name: __("Orb of BLC"),
            sprite: spr_artifact_orb,
            multiple_use: true,
            
            description: function()
            {
                var blc = ceil(global.resources.blc.data.count * 0.05);
                return __s("Gain %s of your current BLC immediately (%s).", number_format_percent(0.05), number_format(blc));
            },
            
            spawn_area: global.areas.volcano,
            spawn_delay: 21600,
            winnable: true,
            
            func: function()
            {
                var res = 
                {
                    blc: ceil(global.resources.blc.data.count * 0.05)
                };
                add_resources(res);
            }
        }),
        seed_bag: new Artifact(
        {
            index: 1000,
            name: __("Strange Seed Bag"),
            sprite: spr_artifact_seed_bag,
            
            description: function()
            {
                var desc = __("Spawns 3 random available seeds.");
                if (array_length(get_available_seeds()) == 0)
                {
                    desc += " !! NO SEEDS AVAILABLE !!";
                }
                return desc;
            },
            
            spawn_area: global.areas.mythical_garden,
            spawn_delay: 7200,
            winnable: true,
            
            func: function()
            {
                var available_seeds = get_available_seeds();
                if (array_length(available_seeds) == 0)
                {
                    exit;
                }
                repeat (3)
                {
                    var seed = array_random_item(available_seeds);
                    spawn_seed(seed);
                }
            },
            
            can_activate: function()
            {
                return array_length(get_available_seeds()) > 0 && can_spawn_seeds();
            }
        }),
        vital_violin: new Artifact(
        {
            index: 1500,
            name: __("Vital Violin"),
            sprite: spr_artifact_vital_violin,
            can_use_in_restricted_areas: true,
            description: __s("Decreases global boss cooldown by %s per use.", format_time(5)),
            generatable_in_quests: false,
            max_count: 100,
            multiple_use: true,
            offline: false,
            spawn_area: global.areas.biotite_forest,
            spawn_delay: 43200,
            winnable: true,
            
            func: function()
            {
                var __struct = global.areas;
                var __prop_names = struct_get_names(__struct);
                var __prop_len = array_length(__prop_names);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mkey = __prop_names[__i];
                    var mitem = variable_struct_get(__struct, mkey);
                    mitem.decrease_boss_delay(sec(5));
                }
            },
            
            can_activate: function()
            {
                return true;
            }
        }),
        vortex: new Artifact(
        {
            index: 2000,
            name: __("Vortex"),
            sprite: spr_artifact_vortex,
            has_autouse: false,
            
            description: function()
            {
                var _floor = min(global.areas.tower.get_highest_floor_current_run(), global.areas.tower.get_max_floor());
                _floor = clamp(_floor - 1, 1, _floor);
                return __s("Skip to the highest tower floor - 1 immediately. (%s)", _floor);
            },
            
            spawn_area: global.areas.antarctica,
            spawn_delay: 10800,
            winnable: true,
            
            func: function()
            {
                if (!is_current_area(global.areas.tower) && global.areas.tower.data.count > 0)
                {
                    change_area(global.areas.tower, true);
                }
                var _floor = min(global.areas.tower.get_highest_floor_current_run(), global.areas.tower.get_max_floor());
                _floor = clamp(_floor - 1, 1, _floor);
                tower_set_floor(_floor);
            },
            
            can_activate: function()
            {
                var _floor = min(global.areas.tower.get_highest_floor_current_run(), global.areas.tower.get_max_floor());
                _floor = clamp(_floor - 1, 1, _floor);
                return global.areas.tower.data.count > 0 && global.current_tower_floor < global.areas.tower.get_highest_floor_current_run() && global.current_tower_floor < _floor;
            }
        }),
        wind: new Artifact(
        {
            index: 3000,
            name: __("Wind"),
            sprite: spr_artifact_wind,
            description: __("Blown leaves respawn instantly."),
            spawn_area: global.areas.hidden_sea,
            spawn_delay: 10800,
            winnable: true,
            
            func: function()
            {
                spawn_artifact_wind();
            },
            
            can_activate: function()
            {
                return instance_number(o_artifact_wind) == 0 && o_game.area.type.spawn_leaves;
            }
        }),
        wings: new Artifact(
        {
            index: 4000,
            name: __("Wobbly Wings"),
            sprite: spr_artifact_wobbly_wings,
            description: __s("Teleports you to a random available boss. If a boss is spawned, this artifact won't be activated.") + " " + __("You can choose what boss this artifact will teleport you to in the Control Panel."),
            max_count: 100,
            offline: false,
            spawn_area: global.areas.dark_glade,
            spawn_delay: 21600,
            winnable: true,
            
            func: function()
            {
                var area = get_random_available_boss_area(true, true);
                if (!is_struct(area))
                {
                    return notify(__("No area to teleport to."));
                }
                change_area(area, false);
            },
            
            can_activate: function()
            {
                if (instance_exists(o_enemy_boss))
                {
                    return false;
                }
                return is_struct(get_random_available_boss_area(false, true));
            }
        })
    };
    add_keys_to_struct(global.artifacts);
    global.artifacts_generatable = [];
    global.artifacts_winnable = [];
    var __struct = global.artifacts;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        if (mitem.winnable)
        {
            array_push(global.artifacts_winnable, mitem);
        }
        if (mitem.generatable_in_quests)
        {
            array_push(global.artifacts_generatable, mitem);
        }
    }
    global.artifacts_sorted = struct_to_sorted_array(global.artifacts);
}
