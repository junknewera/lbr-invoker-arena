function candle_game_init()
{
    global.candle_game_rarities = 
    {
        common: new Rarity(
        {
            name: __("Common"),
            level: 1,
            chance: 1
        }),
        uncommon: new Rarity(
        {
            name: __("Uncommon"),
            level: 2,
            chance: 0.5
        }),
        rare: new Rarity(
        {
            name: __("Rare"),
            level: 3,
            chance: 0.3
        }),
        epic: new Rarity(
        {
            name: __("Epic"),
            level: 4,
            chance: 0.2
        }),
        mythical: new Rarity(
        {
            name: __("Mythical"),
            level: 5,
            chance: 0.1
        }),
        legendary: new Rarity(
        {
            name: __("Legendary"),
            level: 6,
            chance: 0.05
        })
    };
    global.candle_game_rarities_sorted = init_rarities(global.candle_game_rarities);
    global.candle_game_skills_types = 
    {
        candle_attack_damage: 
        {
            name: __("Harder Blow"),
            upgrade_attributes: 
            {
                candle_attack_damage: 0.2
            }
        },
        candle_attack_damage_manual: 
        {
            name: __("Mighty Blow"),
            upgrade_attributes: 
            {
                candle_attack_damage_manual: 0.5
            }
        },
        candle_attack_timer_reduction_multiplier: 
        {
            name: __("Faster Blow"),
            upgrade_attributes: 
            {
                candle_attack_timer_reduction_multiplier: 0.03
            },
            
            can_generate: function()
            {
                return candle_game_get_auto_attack_interval() > 1;
            }
        },
        candle_manual_blow_timer_reduction_multiplier: 
        {
            name: __("Quicker Blow"),
            upgrade_attributes: 
            {
                candle_manual_blow_timer_reduction_multiplier: 0.01
            },
            
            can_generate: function()
            {
                return candle_game_get_manual_blow_max_cooldown() > sec(0.5);
            }
        },
        candle_critical_chance: 
        {
            name: __("Lucky Blow"),
            upgrade_attributes: 
            {
                candle_critical_chance: 0.01
            }
        },
        candle_reward_multiplier: 
        {
            name: __("Generous Blow"),
            upgrade_attributes: 
            {
                candle_reward_multiplier: 0.05
            },
            
            apply_skill: function()
            {
                var old_upgrade_bonus = get_default_struct_value(o_game.data.candle.upgrades, "candle_reward_multiplier", 0);
                var old_multiplier = (1 + global.upgrade_attributes.candle_reward_multiplier) * (1 + old_upgrade_bonus);
                var new_upgrade_bonus = old_upgrade_bonus + self.upgrade_attributes.candle_reward_multiplier;
                var new_multiplier = (1 + global.upgrade_attributes.candle_reward_multiplier) * (1 + new_upgrade_bonus);
                var multiplier_ratio = new_multiplier / old_multiplier;
                o_game.data.candle.reward_full = multiply_struct_values(o_game.data.candle.reward_full, multiplier_ratio);
            }
        },
        candle_stage_time_limit: 
        {
            name: __("Extra Time"),
            upgrade_attributes: 
            {
                candle_stage_time_limit: 0.25
            },
            
            can_generate: function()
            {
                return candle_game_get_stage_time_limit() < sec(30);
            }
        }
    };
    add_keys_to_struct(global.candle_game_skills_types);
    global.candle_game_skills_rarity = {};
    global.candle_game_skills_map = {};
    var __array = global.candle_game_rarities_sorted;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        var rarity = mitem;
        var __struct2 = global.candle_game_skills_types;
        var __prop_names2 = struct_get_names(__struct2);
        var __prop_len2 = array_length(__prop_names2);
        for (var __i2 = 0; __i2 < __prop_len2; __i2++)
        {
            var mkey2 = __prop_names2[__i2];
            var mitem2 = variable_struct_get(__struct2, mkey2);
            var skill_type = mitem2;
            if (!is_array(variable_struct_get(global.candle_game_skills_rarity, rarity.key)))
            {
                variable_struct_set(global.candle_game_skills_rarity, rarity.key, []);
            }
            var key = sprintf("%s_%s", rarity.key, skill_type.key);
            var upgrade_attributes = multiply_struct_values(skill_type.upgrade_attributes, rarity.level);
            var skill = 
            {
                key: key,
                name: skill_type.name,
                rarity: rarity,
                apply_skill: struct_get_from_hash(skill_type, variable_get_hash("apply_skill")),
                can_generate: method(undefined, get_default_struct_value(skill_type, "can_generate", __return_true)),
                text: format_upgrade_text(upgrade_attributes),
                upgrade_attributes: upgrade_attributes
            };
            array_push(variable_struct_get(global.candle_game_skills_rarity, rarity.key), skill);
            variable_struct_set(global.candle_game_skills_map, key, skill);
        }
    }
}

function candle_game_has_autoplay()
{
    return has_bought_shop_item_safe(global.shops.event_anniversary.candle_auto_advance) && get_option(global.options.auto_advance_candle_minigame);
}

function candle_game_get_auto_attack_interval()
{
    var auto_attack_interval_base = sec(1);
    var auto_attack_interval = auto_attack_interval_base * power(0.9, (global.upgrade_attributes.candle_attack_timer_reduction_multiplier * 10) + (get_default_struct_value(o_game.data.candle.upgrades, "candle_attack_timer_reduction_multiplier", 0) * 10));
    return max(1, auto_attack_interval);
}

function candle_game_get_manual_blow_max_cooldown()
{
    var manual_blow_max_cooldown_base = sec(3);
    var manual_blow_max_cooldown = manual_blow_max_cooldown_base * power(0.9, (global.upgrade_attributes.candle_manual_blow_timer_reduction_multiplier + get_default_struct_value(o_game.data.candle.upgrades, "candle_manual_blow_timer_reduction_multiplier", 0)) * 10);
    return max(sec(0.5), manual_blow_max_cooldown);
}

function candle_game_get_stage_time_limit()
{
    var stage_time_limit_base = sec(10);
    var stage_time_limit = stage_time_limit_base + global.upgrade_attributes.candle_stage_time_limit + sec(get_default_struct_value(o_game.data.candle.upgrades, "candle_stage_time_limit", 0));
    return min(stage_time_limit, sec(30));
}

function candle_game_get_damage()
{
    return 1 + global.upgrade_attributes.candle_attack_damage + get_default_struct_value(o_game.data.candle.upgrades, "candle_attack_damage", 0);
}

function candle_game_get_damage_blow()
{
    var damage_blow_multiplier = 2;
    var damage = 1;
    var damage_blow_start = damage * damage_blow_multiplier;
    return damage_blow_start + global.upgrade_attributes.candle_attack_damage_manual + get_default_struct_value(o_game.data.candle.upgrades, "candle_attack_damage_manual", 0);
}

function candle_game_get_critical_chance()
{
    var critical_chance_base = 0.01;
    return critical_chance_base + global.upgrade_attributes.candle_critical_chance + get_default_struct_value(o_game.data.candle.upgrades, "candle_critical_chance", 0);
}

function candle_game_start_game(arg0 = 1)
{
    o_game.data.candle.state = UnknownEnum.Value_0;
    o_game.data.candle.candles = [];
    o_game.data.candle.candles_blown = 0;
    o_game.data.candle.current_level = arg0;
    o_game.data.candle.dead = false;
    if (arg0 <= 1)
    {
        o_game.data.candle.reward = {};
        o_game.data.candle.reward_full = {};
        o_game.data.candle.upgrades = {};
    }
    if (instance_exists(o_minigame_candle))
    {
        o_minigame_candle.refresh_upgrades_text();
    }
    candle_game_start_stage();
}

function candle_game_start_stage()
{
    o_game.data.candle.state = UnknownEnum.Value_1;
    o_game.data.candle.auto_attack_timer = 0;
    o_game.data.candle.candles = [];
    o_game.data.candle.skill_choice_shown = false;
    o_game.data.candle.stage_reward = 
    {
        resources: 
        {
            party_tokens: 0
        }
    };
    o_game.data.candle.stage_timer = 0;
    var reduce_reward_multiplier_base = 0.1;
    var reduce_reward_multiplier = reduce_reward_multiplier_base + global.upgrade_attributes.candle_reduce_reward_multiplier;
    reduce_reward_multiplier = clamp(reduce_reward_multiplier, 0, 1);
    o_game.data.candle.reward = multiply_struct_values(o_game.data.candle.reward_full, reduce_reward_multiplier);
    o_game.data.candle.playing = true;
    var max_candles = 6;
    var candles_count = (3 + o_game.data.candle.current_level) - 1;
    var candle_level = (o_game.data.candle.current_level - 1) div (max_candles - 2);
    var base_hp = ceil(3 + ((candle_level + 1) * power(7 * candle_level, 1.5)));
    if (candles_count > max_candles)
    {
        var level_in_cycle = o_game.data.candle.current_level - (candle_level * (max_candles - 2));
        candles_count = (3 + level_in_cycle) - 1;
        candles_count = min(candles_count, max_candles);
    }
    for (var i = 0; i < candles_count; i++)
    {
        array_push(o_game.data.candle.candles, 
        {
            hp: base_hp,
            max_hp: base_hp,
            blown: false,
            level: candle_level,
            damage_flash: 0,
            shake_intensity: 0
        });
    }
}

function candle_game_complete_stage()
{
    o_game.data.candle.state = UnknownEnum.Value_2;
    var upgrade_reward_multiplier = (1 + global.upgrade_attributes.candle_reward_multiplier) * (1 + get_default_struct_value(o_game.data.candle.upgrades, "candle_reward_multiplier", 0));
    var stage_reward_count = power(o_game.data.candle.current_level, 1.3);
    var stage_reward = 
    {
        journey_xp: 
        {
            anniversary: sqrt(stage_reward_count)
        },
        resources: 
        {
            party_tokens: stage_reward_count
        }
    };
    stage_reward = multiply_struct_values(stage_reward, upgrade_reward_multiplier, false, 1);
    o_game.data.candle.stage_reward = stage_reward;
    o_game.data.candle.highest_stage = max(o_game.data.candle.highest_stage, o_game.data.candle.current_level);
    o_game.data.candle.current_level++;
    o_game.data.candle.stages_completed++;
    add_struct_to_struct(o_game.data.candle.reward_full, stage_reward);
    o_game.data.candle.reward = multiply_struct_values(o_game.data.candle.reward_full, 1);
    o_game.data.candle.playing = true;
    candle_game_generate_skill_choices();
    o_game.data.candle.auto_advance_timer = 0;
}

function candle_game_timeout_stage()
{
    o_game.data.candle.state = UnknownEnum.Value_2;
    o_game.data.candle.dead = true;
    o_game.data.candle.highest_stage = max(o_game.data.candle.highest_stage, o_game.data.candle.current_level);
    o_game.data.candle.stages_completed++;
}

function candle_game_claim_rewards()
{
    add_result_lite(o_game.data.candle.reward);
    o_game.data.candle.playing = false;
    o_game.data.candle.reward = undefined;
    o_game.data.candle.reward_claimed = true;
    o_game.data.candle.reward_full = undefined;
}

function candle_game_advance_stage()
{
    o_game.data.candle.reward_claimed = false;
    candle_game_start_stage();
}

function candle_game_apply_damage(arg0, arg1, arg2)
{
    if (arg0 < 0 || arg0 >= array_length(o_game.data.candle.candles))
    {
        exit;
    }
    var candle = o_game.data.candle.candles[arg0];
    if (candle.hp <= 0 || candle.blown)
    {
        exit;
    }
    var is_critical = random(1) < candle_game_get_critical_chance();
    var critical_multiplier = is_critical ? global.upgrade_attributes.candle_critical_multiplier : 1;
    var final_damage = arg1 * critical_multiplier;
    candle.hp -= final_damage;
    candle.shake_intensity = is_critical ? 1 : 0.5;
    candle.damage_flash = sec(0.2);
    if (candle.hp <= 0)
    {
        candle.blown = true;
        o_game.data.candle.candles_blown++;
        o_game.data.candle.candles_blown_total++;
        var all_blown = true;
        var __array = o_game.data.candle.candles;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (!mitem.blown)
            {
                all_blown = false;
                break;
            }
        }
        if (all_blown)
        {
            candle_game_complete_stage();
        }
    }
}

function candle_game_generate_skill_choices()
{
    o_game.data.candle.available_skills = [];
    for (var i = 0; i < 3; i++)
    {
        var rarity = array_random_chance_level(global.candle_game_rarities_sorted);
        var skill = array_random_item_exclude(variable_struct_get(global.candle_game_skills_rarity, rarity.key), pluck(o_game.data.candle.available_skills), undefined, true);
        array_push(o_game.data.candle.available_skills, skill);
    }
    o_game.data.candle.skill_choice_shown = true;
}

function candle_game_get_best_skill()
{
    if (array_length(o_game.data.candle.available_skills) == 0)
    {
        return undefined;
    }
    var best_skill = o_game.data.candle.available_skills[0];
    var best_rarity_level = best_skill.rarity.level;
    var __array = o_game.data.candle.available_skills;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (mitem.rarity.level > best_rarity_level)
        {
            best_skill = mitem;
            best_rarity_level = mitem.rarity.level;
        }
    }
    return best_skill;
}

function candle_game_apply_skill(arg0)
{
    if (!is_struct(arg0))
    {
        exit;
    }
    if (is_callable(struct_get_from_hash(arg0, variable_get_hash("apply_skill"))))
    {
        call_method(arg0, arg0.apply_skill);
    }
    add_struct_to_struct(o_game.data.candle.upgrades, arg0.upgrade_attributes);
    if (instance_exists(o_minigame_candle))
    {
        o_minigame_candle.refresh_upgrades_text();
    }
}

function candle_game_manual_attack()
{
    var blow_target = -1;
    var __array = o_game.data.candle.candles;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (mitem.hp > 0 && !mitem.blown)
        {
            blow_target = __i;
            break;
        }
    }
    if (blow_target >= 0)
    {
        candle_game_apply_damage(blow_target, candle_game_get_damage_blow(), true);
        o_game.data.candle.manual_blow_cooldown = o_game.data.stats.time_elapsed + candle_game_get_manual_blow_max_cooldown();
    }
}

function candle_game_update(arg0 = global.dtf)
{
    if (o_game.data.candle.state == UnknownEnum.Value_1)
    {
        o_game.data.candle.auto_attack_timer += arg0;
        o_game.data.candle.stage_timer += arg0;
        if (o_game.data.candle.stage_timer >= candle_game_get_stage_time_limit())
        {
            candle_game_timeout_stage();
            exit;
        }
        var has_auto_manual_attack = has_bought_shop_item_safe(global.shops.event_anniversary.candle_auto_manual_attack);
        var auto_manual_attack_enabled = get_option(global.options.auto_blow_candle_minigame);
        if (o_game.data.stats.time_elapsed >= o_game.data.candle.manual_blow_cooldown && has_auto_manual_attack && auto_manual_attack_enabled)
        {
            candle_game_manual_attack();
        }
        var interval = candle_game_get_auto_attack_interval();
        var n = 0;
        while (o_game.data.candle.auto_attack_timer >= interval && o_game.data.candle.state == UnknownEnum.Value_1 && n < 1000)
        {
            n++;
            o_game.data.candle.auto_attack_timer -= interval;
            var blow_target = -1;
            __array = o_game.data.candle.candles;
            __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                if (mitem.hp > 0 && !mitem.blown)
                {
                    blow_target = __i;
                    break;
                }
            }
            if (blow_target >= 0)
            {
                candle_game_apply_damage(blow_target, candle_game_get_damage(), false);
            }
            else
            {
                break;
            }
        }
        var __array = o_game.data.candle.candles;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (mitem.shake_intensity > 0)
            {
                mitem.shake_intensity *= 0.9;
            }
            if (mitem.damage_flash > 0)
            {
                mitem.damage_flash -= arg0;
            }
        }
    }
    if (o_game.data.candle.state == UnknownEnum.Value_2)
    {
        if (candle_game_has_autoplay())
        {
            o_game.data.candle.auto_advance_timer += arg0;
            var auto_advance_timer_max = sec(5);
            if (o_game.data.candle.auto_advance_timer >= auto_advance_timer_max)
            {
                if (o_game.data.candle.dead)
                {
                    candle_game_claim_rewards();
                    candle_game_start_game();
                    o_game.data.candle.auto_advance_timer = 0;
                }
                else if (o_game.data.candle.skill_choice_shown)
                {
                    var best_skill = candle_game_get_best_skill();
                    candle_game_apply_skill(best_skill);
                    candle_game_advance_stage();
                    o_game.data.candle.auto_advance_timer = 0;
                }
            }
        }
    }
}

function check_candle_game()
{
    if (!candle_game_has_autoplay() || !is_event_active(global.events.anniversary))
    {
        exit;
    }
    if (!instance_exists(o_minigame_candle))
    {
        if (o_game.data.candle.playing)
        {
            candle_game_update(sec(global.dtf));
        }
    }
    if (o_game.data.candle.state == UnknownEnum.Value_0)
    {
        candle_game_start_game();
    }
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2
}
