function init_quests()
{
    init_quest_types();
    global.quests = 
    {
        bartender: 
        {
            beer1: new Quest(
            {
                name: __("Beer Supplies"),
                description: __("To keep my customers supplied with beer, please deliver the following materials."),
                type_key: global.quest_types.have_materials.key,
                cancellable: true,
                difficulty: 2,
                repeatable: true,
                reward: 
                {
                    resources: 
                    {
                        beer: 25
                    }
                },
                generate_random: true
            }),
            beer2: new Quest(
            {
                name: __("Beer Supplies Level 2"),
                description: __("To keep my customers supplied with beer, please deliver the following materials."),
                type_key: global.quest_types.have_materials.key,
                cancellable: true,
                difficulty: 7,
                repeatable: true,
                reward: 
                {
                    resources: 
                    {
                        beer: 250
                    }
                },
                generate_random: true
            }),
            cheese1: new Quest(
            {
                name: __("Cheese Supplies"),
                description: __("To keep my customers supplied with cheese, please deliver the following materials."),
                type_key: global.quest_types.have_materials.key,
                cancellable: true,
                difficulty: 2,
                repeatable: true,
                reward: 
                {
                    resources: 
                    {
                        cheese: 250
                    }
                },
                generate_random: true
            }),
            cheese2: new Quest(
            {
                name: __("Cheese Supplies Level 2"),
                description: __("To keep my customers supplied with cheese, please deliver the following materials."),
                type_key: global.quest_types.have_materials.key,
                cancellable: true,
                difficulty: 7,
                repeatable: true,
                reward: 
                {
                    resources: 
                    {
                        cheese: 2500
                    }
                },
                generate_random: true
            })
        },
        bingo: {},
        daily: {},
        kokka_w: 
        {
            mats: new Quest(
            {
                name: __("Materials"),
                type_key: global.quest_types.have_materials.key,
                cancellable: true,
                difficulty: 2,
                repeatable: true,
                reward: 
                {
                    materials: 
                    {
                        dark_matter: 5,
                        cloud: 5
                    }
                },
                generate_random: true
            }),
            mats2: new Quest(
            {
                name: __("Materials"),
                type_key: global.quest_types.have_materials.key,
                cancellable: true,
                difficulty: 5,
                repeatable: true,
                reward: 
                {
                    materials: 
                    {
                        dark_matter: 15,
                        cloud: 15
                    }
                },
                generate_random: true,
                
                is_visible: function()
                {
                    return get_upgrade_attribute_value(global.upgrade_attributes.kokka_more_quests) > 0;
                }
            }),
            mats3: new Quest(
            {
                name: __("Materials"),
                type_key: global.quest_types.have_materials.key,
                cancellable: true,
                difficulty: 8,
                repeatable: true,
                reward: 
                {
                    materials: 
                    {
                        dark_matter: 25,
                        cloud: 25
                    }
                },
                generate_random: true,
                
                is_visible: function()
                {
                    return get_upgrade_attribute_value(global.upgrade_attributes.kokka_more_quests) > 0;
                }
            }),
            mats4: new Quest(
            {
                name: __("Materials"),
                type_key: global.quest_types.have_materials.key,
                cancellable: true,
                difficulty: 11,
                repeatable: true,
                reward: 
                {
                    materials: 
                    {
                        dark_matter: 35,
                        cloud: 35
                    }
                },
                generate_random: true,
                
                is_visible: function()
                {
                    return get_upgrade_attribute_value(global.upgrade_attributes.kokka_more_quests) > 0;
                }
            })
        },
        kokka_i: 
        {
            mats: new Quest(
            {
                name: __("Materials"),
                type_key: global.quest_types.have_materials.key,
                cancellable: true,
                difficulty: 2,
                repeatable: true,
                reward: 
                {
                    materials: 
                    {
                        dark_matter: 5,
                        bone: 5
                    }
                },
                generate_random: true
            }),
            mats2: new Quest(
            {
                name: __("Materials"),
                type_key: global.quest_types.have_materials.key,
                cancellable: true,
                difficulty: 5,
                repeatable: true,
                reward: 
                {
                    materials: 
                    {
                        dark_matter: 15,
                        bone: 15
                    }
                },
                generate_random: true,
                
                is_visible: function()
                {
                    return get_upgrade_attribute_value(global.upgrade_attributes.kokka_more_quests) > 0;
                }
            }),
            mats3: new Quest(
            {
                name: __("Materials"),
                type_key: global.quest_types.have_materials.key,
                cancellable: true,
                difficulty: 8,
                repeatable: true,
                reward: 
                {
                    materials: 
                    {
                        dark_matter: 25,
                        bone: 25
                    }
                },
                generate_random: true,
                
                is_visible: function()
                {
                    return get_upgrade_attribute_value(global.upgrade_attributes.kokka_more_quests) > 0;
                }
            }),
            mats4: new Quest(
            {
                name: __("Materials"),
                type_key: global.quest_types.have_materials.key,
                cancellable: true,
                difficulty: 11,
                repeatable: true,
                reward: 
                {
                    materials: 
                    {
                        dark_matter: 35,
                        bone: 35
                    }
                },
                generate_random: true,
                
                is_visible: function()
                {
                    return get_upgrade_attribute_value(global.upgrade_attributes.kokka_more_quests) > 0;
                }
            })
        },
        kokka_t: 
        {
            mats: new Quest(
            {
                name: __("Materials"),
                type_key: global.quest_types.have_materials.key,
                cancellable: true,
                difficulty: 2,
                repeatable: true,
                reward: 
                {
                    materials: 
                    {
                        dark_matter: 5,
                        scarab: 5
                    }
                },
                generate_random: true
            }),
            mats2: new Quest(
            {
                name: __("Materials"),
                type_key: global.quest_types.have_materials.key,
                cancellable: true,
                difficulty: 5,
                repeatable: true,
                reward: 
                {
                    materials: 
                    {
                        dark_matter: 15,
                        scarab: 15
                    }
                },
                generate_random: true,
                
                is_visible: function()
                {
                    return get_upgrade_attribute_value(global.upgrade_attributes.kokka_more_quests) > 0;
                }
            }),
            mats3: new Quest(
            {
                name: __("Materials"),
                type_key: global.quest_types.have_materials.key,
                cancellable: true,
                difficulty: 8,
                repeatable: true,
                reward: 
                {
                    materials: 
                    {
                        dark_matter: 25,
                        scarab: 25
                    }
                },
                generate_random: true,
                
                is_visible: function()
                {
                    return get_upgrade_attribute_value(global.upgrade_attributes.kokka_more_quests) > 0;
                }
            }),
            mats4: new Quest(
            {
                name: __("Materials"),
                type_key: global.quest_types.have_materials.key,
                cancellable: true,
                difficulty: 11,
                repeatable: true,
                reward: 
                {
                    materials: 
                    {
                        dark_matter: 35,
                        scarab: 35
                    }
                },
                generate_random: true,
                
                is_visible: function()
                {
                    return get_upgrade_attribute_value(global.upgrade_attributes.kokka_more_quests) > 0;
                }
            })
        },
        kokka_c: 
        {
            mats: new Quest(
            {
                name: __("Materials"),
                type_key: global.quest_types.have_materials.key,
                cancellable: true,
                difficulty: 2,
                repeatable: true,
                reward: 
                {
                    materials: 
                    {
                        dark_matter: 5,
                        oyster: 5
                    }
                },
                generate_random: true
            }),
            mats2: new Quest(
            {
                name: __("Materials"),
                type_key: global.quest_types.have_materials.key,
                cancellable: true,
                difficulty: 5,
                repeatable: true,
                reward: 
                {
                    materials: 
                    {
                        dark_matter: 15,
                        oyster: 15
                    }
                },
                generate_random: true,
                
                is_visible: function()
                {
                    return get_upgrade_attribute_value(global.upgrade_attributes.kokka_more_quests) > 0;
                }
            }),
            mats3: new Quest(
            {
                name: __("Materials"),
                type_key: global.quest_types.have_materials.key,
                cancellable: true,
                difficulty: 8,
                repeatable: true,
                reward: 
                {
                    materials: 
                    {
                        dark_matter: 25,
                        oyster: 25
                    }
                },
                generate_random: true,
                
                is_visible: function()
                {
                    return get_upgrade_attribute_value(global.upgrade_attributes.kokka_more_quests) > 0;
                }
            }),
            mats4: new Quest(
            {
                name: __("Materials"),
                type_key: global.quest_types.have_materials.key,
                cancellable: true,
                difficulty: 11,
                repeatable: true,
                reward: 
                {
                    materials: 
                    {
                        dark_matter: 35,
                        oyster: 35
                    }
                },
                generate_random: true,
                
                is_visible: function()
                {
                    return get_upgrade_attribute_value(global.upgrade_attributes.kokka_more_quests) > 0;
                }
            })
        },
        kokka_h: 
        {
            mats: new Quest(
            {
                name: __("Materials"),
                type_key: global.quest_types.have_materials.key,
                cancellable: true,
                difficulty: 300,
                repeatable: true,
                reward: 
                {
                    materials: 
                    {
                        essence_dark: 1
                    }
                },
                generate_random: true
            }),
            mats2: new Quest(
            {
                name: __("Materials"),
                type_key: global.quest_types.have_materials.key,
                cancellable: true,
                difficulty: 1000,
                repeatable: true,
                reward: 
                {
                    materials: 
                    {
                        essence_dark: 5
                    }
                },
                generate_random: true,
                
                is_visible: function()
                {
                    return get_upgrade_attribute_value(global.upgrade_attributes.kokka_more_quests) > 0;
                }
            }),
            mats3: new Quest(
            {
                name: __("Materials"),
                type_key: global.quest_types.have_materials.key,
                cancellable: true,
                difficulty: 2000,
                repeatable: true,
                reward: 
                {
                    materials: 
                    {
                        essence_dark: 10
                    }
                },
                generate_random: true,
                
                is_visible: function()
                {
                    return get_upgrade_attribute_value(global.upgrade_attributes.kokka_more_quests) > 0;
                }
            }),
            mats4: new Quest(
            {
                name: __("Materials"),
                type_key: global.quest_types.have_materials.key,
                cancellable: true,
                difficulty: 5000,
                repeatable: true,
                reward: 
                {
                    materials: 
                    {
                        essence_dark: 25
                    }
                },
                generate_random: true,
                
                is_visible: function()
                {
                    return get_upgrade_attribute_value(global.upgrade_attributes.kokka_more_quests) > 0;
                }
            })
        },
        nature: 
        {
            clover3_plants: new Quest(
            {
                index: 0,
                name: __("Clover Quest"),
                type_key: global.quest_types.have_clovers.key,
                cancellable: true,
                generate_random: true,
                random_reward: true,
                refreshable: true,
                refresh_delay_duration: sec(300),
                requirements: 
                {
                    resources: 
                    {
                        clover_basic3: 10
                    }
                },
                repeatable: true,
                reward_collection: 
                {
                    resources: global.resources_types.plant
                },
                reward_count: 1
            }),
            clover4_plants: new Quest(
            {
                index: 1,
                name: __("Advanced Clover Quest"),
                type_key: global.quest_types.have_clovers.key,
                cancellable: true,
                generate_random: true,
                random_reward: true,
                refreshable: true,
                refresh_delay_duration: sec(300),
                requirements: 
                {
                    resources: 
                    {
                        clover_basic4: 1
                    }
                },
                repeatable: true,
                reward_collection: 
                {
                    resources: global.resources_types.plant
                },
                reward_count: 3
            }),
            clover3_nts: new Quest(
            {
                index: 2,
                name: __("Clover Quest"),
                type_key: global.quest_types.have_clovers.key,
                cancellable: true,
                generate_random: true,
                refreshable: false,
                requirements: 
                {
                    resources: 
                    {
                        clover_basic3: 20
                    }
                },
                repeatable: true,
                reward: 
                {
                    resources: 
                    {
                        nature_time_sphere: 1
                    }
                }
            }),
            clover4_nts: new Quest(
            {
                index: 3,
                name: __("Advanced Clover Quest"),
                type_key: global.quest_types.have_clovers.key,
                cancellable: true,
                generate_random: true,
                refreshable: false,
                requirements: 
                {
                    resources: 
                    {
                        clover_basic4: 5
                    }
                },
                repeatable: true,
                reward: 
                {
                    resources: 
                    {
                        nature_time_sphere: 3
                    }
                }
            }),
            clover3_mm: new Quest(
            {
                index: 4,
                name: __("Clover Quest"),
                type_key: global.quest_types.have_clovers.key,
                cancellable: true,
                generate_random: true,
                refreshable: false,
                refresh_delay_duration: sec(300),
                requirements: 
                {
                    resources: 
                    {
                        clover_basic3: 10
                    }
                },
                repeatable: true,
                reward: 
                {
                    resources: 
                    {
                        magic_mulch: 15
                    }
                }
            }),
            clover4_mm: new Quest(
            {
                index: 5,
                name: __("Advanced Clover Quest"),
                type_key: global.quest_types.have_clovers.key,
                cancellable: true,
                generate_random: true,
                refreshable: false,
                refresh_delay_duration: sec(300),
                requirements: 
                {
                    resources: 
                    {
                        clover_basic4: 1
                    }
                },
                repeatable: true,
                reward: 
                {
                    resources: 
                    {
                        magic_mulch: 50
                    }
                }
            })
        }
    };
    global.active_quests = [];
}

function get_daily_quests_count()
{
    return 5 + get_upgrade_attribute_value(global.upgrade_attributes.daily_quest_slots);
}

function pick_quest_types(arg0, arg1 = [])
{
    var result = [];
    var pool = [];
    var __array = global.quest_types_daily;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (!in_array(mitem, arg1))
        {
            array_push(pool, mitem);
        }
    }
    repeat (arg0)
    {
        if (array_length(pool) == 0)
        {
            array_copy(pool, 0, global.quest_types_daily, 0, array_length(global.quest_types_daily));
        }
        var idx = irandom(array_length(pool) - 1);
        var type = pool[idx];
        array_push(result, type);
        array_delete(pool, idx, 1);
    }
    return result;
}

function generate_daily_quests(arg0 = false)
{
    if (live_auto_call_1())
    {
        var lac_argc = argument_count;
        var lac_args = array_create(lac_argc);
        var lac_argk = 0;
        repeat (lac_argc)
        {
            lac_args[lac_argk] = argument[lac_argk];
            lac_argk++;
        }
        if (live_auto_call_2(lac_args))
        {
            return global.live_result;
        }
    }
    if (in_challenge() || mp_is_season())
    {
        exit;
    }
    var current_count = get_struct_length(global.quests.daily);
    var target_count = get_daily_quests_count();
    var daily_data = get_daily_data_today();
    if (!arg0 && (is_struct(struct_get_from_hash(global.quests, variable_get_hash("daily"))) && current_count > 0))
    {
        if (current_count < target_count)
        {
            var missing_count = target_count - current_count;
            var existing_types = [];
            var __struct = global.quests.daily;
            var __prop_names = struct_get_names(__struct);
            __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                array_push(existing_types, mitem.type);
            }
            quest_types = pick_quest_types(missing_count, existing_types);
            __array = quest_types;
            __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                var quest_key = sprintf("%s_%s", current_count + __i, mitem.key);
                variable_struct_set(global.quests.daily, quest_key, generate_daily_quest(mitem, current_count + __i));
                variable_struct_get(global.quests.daily, quest_key).key = quest_key;
                variable_struct_get(global.quests.daily, quest_key).data.index = current_count + __i;
            }
        }
        daily_data.data.quests = true;
        exit;
    }
    var quest_types = pick_quest_types(target_count);
    global.quests.daily = {};
    global.profiles.def.quests.daily = {};
    var yesterday = get_yesterday_key();
    var today = get_daily_data_today_key();
    if (o_game.data.daily_last_completed_day != yesterday && o_game.data.daily_last_completed_day != today)
    {
        o_game.data.daily_streak = 0;
    }
    var __array = quest_types;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        var quest_key = sprintf("%s_%s", __i, mitem.key);
        variable_struct_set(global.quests.daily, quest_key, generate_daily_quest(mitem, __i));
        variable_struct_get(global.quests.daily, quest_key).key = quest_key;
        variable_struct_get(global.quests.daily, quest_key).data.index = __i;
    }
    daily_data = get_daily_data_today();
    daily_data.data.quests = true;
}

function generate_daily_quest(arg0, arg1 = 0)
{
    var difficulty_min = 1;
    var difficulty_max = 1;
    var difficulty = irandom_range(difficulty_min, difficulty_max);
    var quest = new Quest(
    {
        index: arg1,
        name: arg0.name,
        type_key: arg0.key,
        auto_finish: false,
        auto_start: true,
        cancellable: false,
        difficulty: difficulty,
        generate_random: true,
        is_daily: true,
        refreshable: false,
        requirements: arg0.get_random_data(),
        repeatable: false,
        reward: 
        {
            resources: 
            {
                gems: difficulty * 10
            }
        }
    });
    return quest;
}

function all_daily_quests_finished()
{
    var quests = global.quests.daily;
    if (!is_struct(quests) || get_struct_length(quests) == 0)
    {
        return false;
    }
    var __struct = quests;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        if (!mitem.is_finished())
        {
            return false;
        }
    }
    return true;
}

function daily_streak_threshold_reached()
{
    var quests = global.quests.daily;
    if (!is_struct(quests) || get_struct_length(quests) == 0)
    {
        return false;
    }
    var finished_count = 0;
    var __struct = quests;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        if (mitem.is_finished())
        {
            finished_count++;
        }
    }
    var threshold = global.game_settings.daily_quests_bounty_finish_threshold;
    return finished_count >= threshold;
}

function check_daily_streak()
{
    if (!daily_streak_threshold_reached())
    {
        exit;
    }
    var today = get_daily_data_today_key();
    if (o_game.data.daily_last_completed_day == today)
    {
        exit;
    }
    o_game.data.daily_streak++;
    o_game.data.daily_last_completed_day = today;
    var reward = get_daily_streak_reward(o_game.data.daily_streak);
    add_result_lite(reward);
    if (o_game.data.daily_streak >= global.game_settings.daily_quests_max_bounty_rank)
    {
        o_game.data.daily_streak = 0;
    }
}

function get_daily_streak_reward(arg0)
{
    if (live_auto_call_1())
    {
        var lac_argc = argument_count;
        var lac_args = array_create(lac_argc);
        var lac_argk = 0;
        repeat (lac_argc)
        {
            lac_args[lac_argk] = argument[lac_argk];
            lac_argk++;
        }
        if (live_auto_call_2(lac_args))
        {
            return global.live_result;
        }
    }
    var gems = 0;
    if (arg0 > 0 && (arg0 % global.game_settings.daily_quests_bounty_milestone) == 0)
    {
        gems = 500 + (250 * (floor(arg0 / global.game_settings.daily_quests_bounty_milestone) - 1));
        gems = min(gems, 5000);
    }
    else
    {
        gems = 50 + (10 * (arg0 - 1));
        gems = min(gems, 1000);
    }
    return 
    {
        resources: 
        {
            gems: gems
        }
    };
}
