function Enemy(arg0) constructor
{
    name = __("Unknown Enemy");
    description = __("The developer was too lazy to provide an enemy description. Blame him.");
    sprite = spr_placeholder;
    sprite_orig = spr_placeholder;
    armor = 1;
    blend_color = undefined;
    cards = {};
    card_level = -1;
    card_upgrades = undefined;
    card_upgrades_check = undefined;
    card_upgrades_min_type = undefined;
    cost_cache = {};
    damage_player = true;
    damage_type = global.damage_types.regular;
    data = 
    {
        auto_reset_defeat_counter: false,
        auto_reset_defeat_counter_count: 1,
        count: 0,
        db_counter: 0,
        db_enemy_add_damage_multiplier: 0,
        db_kpr_level: 0,
        db_level: 0,
        db_souls_chance_level: 0,
        db_souls_count_level: 0,
        db_souls_offline_level: 0,
        db_souls_pity_counter: 0,
        db_souls_pity_counter_level: 0,
        defeated: 0,
        defeated_offline: 0,
        defeated_run: -1,
        defeat_blower_counter: 0,
        defeat_counter: 0,
        defeat_counter_highest: 0,
        hp: -1,
        seen: false,
        soul_spawns: 0,
        ww: true
    };
    db_multiplier = 1;
    difficulty = 0;
    drop_multiplier = 1;
    drop_resources = [];
    galaxy = undefined;
    has_card = true;
    has_defeat_counter = false;
    has_special_damage = false;
    has_upgrade_attributes = false;
    hp_max = undefined;
    hp = hp_max;
    index = 0;
    include_in_deathbook = true;
    is_boss = false;
    is_event_boss = false;
    is_infinite = false;
    is_moving = false;
    is_persistent = false;
    key = "";
    last_reward_text = "";
    level = 1;
    quark_level = 0;
    quark_shield = 0;
    reset_cost = undefined;
    reward = undefined;
    reward_cache = undefined;
    reward_func = undefined;
    scale = 1;
    spawn_areas = [];
    spawn_areas_text = "";
    tower = false;
    tower_level_range = [-1, -1];
    upgrade_attributes = undefined;
    upgrades = 
    {
        db_level: 
        {
            name: __("Death Book"),
            value: 1
        },
        db_kpr_level: 
        {
            name: __("Kill Count"),
            value: 1
        },
        db_souls_chance_level: 
        {
            name: __("Soul Boost Chance"),
            value: 0.025,
            toggle: true
        },
        db_souls_count_level: 
        {
            name: __("Raw Soul Stone Drop Count"),
            value: 0.1
        },
        db_souls_offline_level: 
        {
            name: __("Passive Soul Boost Chance"),
            value: 0.05
        },
        db_souls_pity_counter_level: 
        {
            name: __("Soul Boost Pity Counter"),
            value: 0.5
        }
    };
    
    init_late = function()
    {
        if (self.card_level == -1)
        {
            self.card_level = self.difficulty;
        }
        if (self.tower)
        {
            array_push(self.spawn_areas, global.areas.tower.key);
        }
        self.spawn_areas_text = build_string_from_struct_keys(global.areas, self.spawn_areas, "get_name_spoiler");
        if (self.is_boss && self.difficulty > 0)
        {
            self.has_upgrade_attributes = true;
        }
        var __struct = self.upgrades;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            variable_struct_set(self.cost_cache, mkey, {});
        }
        self.refresh_upgrade_attributes();
    };
    
    add_offline_kill = function(arg0 = 1)
    {
        self.data.defeated += arg0;
        self.data.defeated_offline += arg0;
        self.data.defeated_run += arg0;
    };
    
    add_reward = function(arg0 = false, arg1 = false)
    {
        if (is_undefined(self.reward) && is_undefined(self.reward_func))
        {
            exit;
        }
        var reward = self.get_reward(1, arg0, arg1);
        if (mp_is_season() && global.game_settings.guilds_enabled && !arg1)
        {
            if (percent_chance(global.game_settings.boss_honor_chance * 100))
            {
                if (is_undefined(struct_get_from_hash(reward, variable_get_hash("resources"))))
                {
                    reward.resources = {};
                }
                var honor_min = max(1, floor(self.difficulty / 3));
                var honor_max = max(1, floor(self.difficulty / 1.5));
                reward.resources.honor = irandom_range(honor_min, honor_max);
            }
        }
        if (arg0 && !arg1)
        {
            var raw_soul_stone_drop_count = self.get_raw_soul_stone_drop_count();
            if (!is_struct(struct_get_from_hash(reward, variable_get_hash("materials"))))
            {
                reward.materials = {};
            }
            add_to_struct_value(reward.materials, global.materials.raw_soul_stone.key, raw_soul_stone_drop_count);
        }
        self.reward_cache = reward;
        notify(add_result(reward, undefined, undefined, true));
    };
    
    can_upgrade = function(arg0, arg1 = 1)
    {
        var item_level = get_default_struct_value(self.data, arg0, 0);
        var item_max_level = self.get_max_db_level(arg0);
        var milestone_count = self.data.defeated;
        var milestone_max_count = self.get_next_db_milestone(arg0);
        var cost_materials = self.get_upgrade_cost(arg0, arg1);
        if (item_max_level > 0 && item_level >= item_max_level)
        {
            return false;
        }
        if (milestone_count < milestone_max_count)
        {
            return false;
        }
        if (!is_undefined(cost_materials) && !has_enough_materials(cost_materials))
        {
            return false;
        }
        return true;
    };
    
    _die = function()
    {
        self.data.defeated++;
        if (self.data.defeated_run < 0)
        {
            self.data.defeated_run = 0;
        }
        self.data.defeated_run++;
        self.data.defeat_counter++;
        self.data.defeat_counter_highest = max(self.data.defeat_counter, self.data.defeat_counter_highest);
        o_game.data.stats.enemies_defeated++;
        self.die();
    };
    
    die = __void;
    
    get_db_level = function()
    {
        return self.data.db_level;
    };
    
    _get_damage = function(arg0, arg1 = "leaf")
    {
        var damage = self.get_damage(arg0, arg1);
        if (!is_undefined(variable_struct_get(global.upgrade_attributes.enemy_add_damage_multiplier, self.key)))
        {
            damage *= (1 + variable_struct_get(global.upgrade_attributes.enemy_add_damage_multiplier, self.key));
        }
        return damage;
    };
    
    get_damage = function(arg0, arg1)
    {
        return arg0;
    };
    
    get_final_damage = function(arg0)
    {
        return arg0;
    };
    
    get_final_quark_damage = function(arg0)
    {
        var quark_damage = get_cache("quark_damage", 0);
        arg0 = quark_damage;
        if (!is_undefined(variable_struct_get(global.upgrade_attributes.enemy_add_damage_multiplier, self.key)))
        {
            arg0 *= (1 + variable_struct_get(global.upgrade_attributes.enemy_add_damage_multiplier, self.key));
        }
        return arg0;
    };
    
    get_db_difficulty_multiplier = function()
    {
        return 1 + (self.difficulty / 5) + (self.quark_level / 3);
    };
    
    get_current_defeat_counter = function()
    {
        return self.data.defeated_run;
    };
    
    get_defeat_counter = function()
    {
        return get_default_struct_value(self.data, "defeat_counter", 0);
    };
    
    get_max_db_level = function(arg0 = undefined)
    {
        if (!is_undefined(arg0))
        {
            if (arg0 == "db_enemy_add_damage_multiplier")
            {
                return 0;
            }
        }
        return global.game_settings.enemy_max_db_level;
    };
    
    get_name_spoiler = function()
    {
        return (self.data.seen || self.data.defeated > 0) ? self.name : "?";
    };
    
    get_next_db_milestone = function(arg0)
    {
        var milestone_kills = 25 * power(2, get_default_struct_value(self.data, arg0, 0));
        if (arg0 == "db_enemy_add_damage_multiplier")
        {
            milestone_kills = 15 * power(1.2, get_default_struct_value(self.data, arg0, 0));
        }
        milestone_kills = ceil(milestone_kills);
        return milestone_kills;
    };
    
    get_offline_counter = function(arg0 = self.data.db_counter)
    {
        return arg0 * self.get_offline_step_value();
    };
    
    get_offline_kills_count = function(arg0 = 1)
    {
        var value = get_bm_value(arg0 + self.data.db_kpr_level, "offline_boss_kills_base", "offline_boss_kills_multiplier", rround, true);
        return value;
    };
    
    get_offline_step_value = function()
    {
        if (self.data.db_level <= 0 || self.get_current_defeat_counter() <= 0)
        {
            return 0;
        }
        return power(1.75, self.data.db_level - 1) / 10 / secr(3600) / 60;
    };
    
    get_pity_counter = function()
    {
        return min(self.data.db_souls_pity_counter, self.get_next_pity_counter());
    };
    
    get_pity_counter_inc = function()
    {
        var value = self.get_upgrade_value("db_souls_pity_counter_level");
        value *= power(1.1, self.data.db_souls_chance_level);
        return value;
    };
    
    get_next_pity_counter = function()
    {
        var value = global.game_settings.enemy_db_pity_counter;
        return max(1, value);
    };
    
    get_quark_hp = function(arg0 = 1)
    {
        var value = 200 + (8000 * power(arg0 - 1, 6));
        value = max(1, value);
        value = apply_max_number(rround(value));
        return value;
    };
    
    get_raw_soul_stone_drop_count = function()
    {
        if (self.data.db_souls_chance_level <= 0)
        {
            return 0;
        }
        var value_base = self.difficulty;
        value_base *= (1 + self.data.db_souls_count_level);
        var value = get_bm_value(value_base, undefined, "db_souls_count_multiplier", undefined, true);
        value = max(1, ceil(value));
        return value;
    };
    
    get_reward = function(arg0 = 1, arg1 = false, arg2 = false, arg3 = false)
    {
        var reward = get_value_ext(self, self.reward);
        if (!is_undefined(self.reward_func))
        {
            reward = self.reward_func();
        }
        var reward_ua = get_default_struct_value(global.upgrade_attributes.enemy_add_reward_single, self.key, undefined);
        if (!is_undefined(reward_ua))
        {
            var chance = get_default_struct_value(global.upgrade_attributes.enemy_add_reward_single_chance, self.key, 0);
            if (percent_chance(chance * 100))
            {
                add_struct_to_struct(reward, reward_ua);
            }
        }
        if (arg2)
        {
            var soul_offline_count = self.get_soul_boost_offline_count(arg0);
            add_struct_to_struct(reward, 
            {
                materials: 
                {
                    raw_soul_stone: soul_offline_count
                }
            });
        }
        var final_multiplier = arg0;
        if (arg3)
        {
            final_multiplier *= self.db_multiplier;
        }
        if (final_multiplier != 1 && is_struct(reward))
        {
            reward = multiply_struct_values(reward, final_multiplier, true);
        }
        return reward;
    };
    
    get_reward_count = function(arg0)
    {
        var offline_counter = self.get_offline_counter(self.data.db_counter + arg0);
        var reward_count = floor(offline_counter);
        if (reward_count > 0)
        {
            reward_count *= self.get_offline_kills_count(1);
        }
        reward_count = rround(reward_count);
        return reward_count;
    };
    
    get_soul_boost_chance = function()
    {
        if (!is_unlocked_death_book())
        {
            return 0;
        }
        if (!self.is_boss)
        {
            return 0;
        }
        var value = self.data.db_souls_chance_level * self.upgrades.db_souls_chance_level.value;
        value = get_bm_value(value, undefined, "db_souls_chance_level_multiplier", undefined, true);
        return value;
    };
    
    get_soul_boost_offline_count = function(arg0 = 1)
    {
        var soul_boost_count = self.get_raw_soul_stone_drop_count();
        var soul_boost_chance = self.get_soul_boost_chance();
        var soul_count_avg = soul_boost_count * soul_boost_chance;
        var soul_offline_chance = self.data.db_souls_offline_level * self.upgrades.db_souls_offline_level.value;
        var soul_offline_count = ceil(soul_count_avg * soul_offline_chance);
        return soul_offline_count;
    };
    
    get_spawn_seed = function()
    {
        return self.data.defeated + (self.data.soul_spawns * 10000);
    };
    
    get_upgrade_cost = function(arg0, arg1 = 1)
    {
        if (is_struct(variable_struct_get(variable_struct_get(self.cost_cache, arg0), arg1)))
        {
            return variable_struct_get(variable_struct_get(self.cost_cache, arg0), arg1);
        }
        var cost = {};
        var current_level = get_default_struct_value(self.data, arg0, 0);
        var max_level = min(self.get_max_db_level(arg0), current_level + arg1);
        if (self.get_max_db_level(arg0) == 0)
        {
            max_level = current_level + arg1;
        }
        switch (arg0)
        {
            case "db_enemy_add_damage_multiplier":
                for (var i = current_level; i < max_level; i++)
                {
                    add_to_struct_value(cost, global.materials.raw_soul_stone.key, 2 * power(1.25, i));
                }
                break;
            case "db_level":
                for (var i = current_level; i < max_level; i++)
                {
                    if (i < 4)
                    {
                        add_to_struct_value(cost, global.materials.essence_light.key, 30 * power(2.5, i));
                    }
                    else if (i < 8)
                    {
                        add_to_struct_value(cost, global.materials.essence_strange.key, 100 * power(1.6, i - 4));
                    }
                    else
                    {
                        add_to_struct_value(cost, global.materials.essence_iridescent.key, 75 * power(1.5, i - 8));
                    }
                }
                break;
            case "db_kpr_level":
                for (var i = current_level; i < max_level; i++)
                {
                    if (i < 4)
                    {
                        add_to_struct_value(cost, global.materials.essence_strange.key, 500 * power(1.5, i));
                    }
                    else if (i < 8)
                    {
                        add_to_struct_value(cost, global.materials.essence_iridescent.key, 450 * power(1.4, i - 4));
                    }
                    else
                    {
                        add_to_struct_value(cost, global.materials.raw_soul_stone.key, 25 * power(2, i - 8));
                    }
                }
                break;
            case "db_souls_chance_level":
                for (var i = current_level; i < max_level; i++)
                {
                    if (i < 4)
                    {
                        add_to_struct_value(cost, global.materials.essence_iridescent.key, 350 * power(1.4, i));
                    }
                    else
                    {
                        add_to_struct_value(cost, global.materials.raw_soul_stone.key, 15 * power(1.5, i - 4));
                    }
                }
                break;
            case "db_souls_count_level":
                for (var i = current_level; i < max_level; i++)
                {
                    if (i < 4)
                    {
                        add_to_struct_value(cost, global.materials.essence_iridescent.key, 750 * power(1.3, i));
                    }
                    else
                    {
                        add_to_struct_value(cost, global.materials.raw_soul_stone.key, 25 * power(1.5, i - 4));
                    }
                }
                break;
            case "db_souls_offline_level":
                for (var i = current_level; i < max_level; i++)
                {
                    if (i < 4)
                    {
                        add_to_struct_value(cost, global.materials.essence_iridescent.key, 1000 * power(1.4, i));
                    }
                    else
                    {
                        add_to_struct_value(cost, global.materials.raw_soul_stone.key, 40 * power(1.6, i - 4));
                    }
                }
                break;
            case "db_souls_pity_counter_level":
                for (var i = current_level; i < max_level; i++)
                {
                    if (i < 4)
                    {
                        add_to_struct_value(cost, global.materials.essence_light.key, 100 * power(2.5, i));
                    }
                    else if (i < 8)
                    {
                        add_to_struct_value(cost, global.materials.essence_strange.key, 80 * power(1.6, i - 4));
                    }
                    else
                    {
                        add_to_struct_value(cost, global.materials.essence_iridescent.key, 60 * power(1.5, i - 8));
                    }
                }
                break;
        }
        _multiply(cost, self.get_db_difficulty_multiplier());
        struct_map(cost, ceil);
        variable_struct_set(variable_struct_get(self.cost_cache, arg0), arg1, cost);
        return cost;
    };
    
    get_upgrade_description = function(arg0)
    {
        var desc = "";
        var max_db_level = self.get_max_db_level(arg0);
        if (variable_struct_get(self.data, arg0) < max_db_level || max_db_level == 0)
        {
            desc += (__s("Required kills: %s (%s)", self.get_next_db_milestone(arg0), self.data.defeated) + "\n");
        }
        if (self.has_upgrade_attributes)
        {
            desc += format_upgrade_text(build_struct(arg0, variable_struct_get(self.upgrade_attributes, arg0)), undefined, undefined, self);
        }
        return desc;
    };
    
    self.get_upgrade_name = function(arg0)
    {
        var name = sprintf("%s [%s/%s]", variable_struct_get(self.upgrades, arg0).name, variable_struct_get(self.data, arg0), self.get_max_db_level(arg0));
        if (self.get_max_db_level(arg0) == 0)
        {
            name = sprintf("%s [%s]", variable_struct_get(self.upgrades, arg0).name, variable_struct_get(self.data, arg0));
        }
        return name;
    };
    
    get_upgrade_value = function(arg0)
    {
        if (is_undefined(variable_struct_get(self.upgrades, arg0)))
        {
            return 0;
        }
        return variable_struct_get(self.upgrades, arg0).value * variable_struct_get(self.data, arg0);
    };
    
    is_main_boss = function()
    {
        return self.is_boss && !self.tower;
    };
    
    is_unlocked = function()
    {
        return self.data.seen || self.data.defeated > 0;
    };
    
    offline_reward = function(arg0 = 1, arg1 = true, arg2 = false)
    {
        arg0 = self.get_offline_kills_count(arg0);
        self.reward_cache = self.get_reward(arg0, false, true, arg2);
        if (arg1)
        {
            self.add_offline_kill(arg0);
            self.last_reward_text = add_result(self.reward_cache, undefined, undefined, true, true);
        }
        return self.reward_cache;
    };
    
    offline_step = function(arg0 = 1, arg1 = true, arg2 = true)
    {
        if (self.data.db_level <= 0)
        {
            exit;
        }
        if (arg2)
        {
            self.data.db_counter += arg0;
        }
        var offline_counter = self.get_offline_counter();
        var reward_count = floor(offline_counter);
        var reward_result = undefined;
        if (reward_count >= 1)
        {
            reward_result = self.offline_reward(reward_count, arg1, true);
            if (arg2)
            {
                self.data.db_counter -= reward_count / self.get_offline_step_value();
            }
        }
        return reward_result;
    };
    
    prestige_player = function(arg0)
    {
        if (arg0 < global.prestige_levels.ulc.level)
        {
            exit;
        }
        self.data.defeat_counter = 0;
        self.data.defeated_run = 0;
    };
    
    refresh_upgrade_attributes = function()
    {
        if (!self.has_upgrade_attributes)
        {
            return undefined;
        }
        self.upgrade_attributes = {};
        var __struct = self.upgrades;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var final_value = variable_struct_get(self.data, mkey) * mitem.value;
            if (get_default_struct_value(mitem, "add_self_key", false))
            {
                variable_struct_set(self.upgrade_attributes, mkey, {});
                variable_struct_set(variable_struct_get(self.upgrade_attributes, mkey), self.key, final_value);
            }
            else
            {
                variable_struct_set(self.upgrade_attributes, mkey, final_value);
            }
        }
    };
    
    can_reset_defeat_counter = function(arg0 = false)
    {
        if (self.data.defeat_counter == 0)
        {
            return false;
        }
        if (self.get_defeat_counter() == 0)
        {
            return false;
        }
        if (!has_enough(self.reset_cost))
        {
            return false;
        }
        return true;
    };
    
    reset_defeat_counter = function()
    {
        if (!has_enough(self.reset_cost))
        {
            return false;
        }
        dec_result(self.reset_cost);
        self.data.defeat_counter = 0;
    };
    
    reset_hp = function()
    {
        if (!self.is_persistent)
        {
            exit;
        }
        self.data.hp = get_value_ext(self, self.hp_max);
    };
    
    update_hp = function(arg0)
    {
        self.data.hp = arg0;
    };
    
    upgrade = function(arg0, arg1)
    {
        if (!self.can_upgrade(arg0, arg1))
        {
            return false;
        }
        dec_materials(self.get_upgrade_cost(arg0, arg1));
        add_to_struct_value(self.data, arg0, arg1);
        variable_struct_set(self.cost_cache, arg0, {});
        self.refresh_upgrade_attributes();
    };
    
    load_data = function(arg0)
    {
        apply_struct_to_struct(self.data, arg0);
        self.refresh_upgrade_attributes();
        if (self.data.defeated_run == -1)
        {
            self.data.defeated_run = self.data.defeated;
        }
    };
    
    set_local_vars(arg0);
    set_sprite_data(self);
}
