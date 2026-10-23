function Fishing_Tournament(arg0 = undefined) : Savable_Object(arg0) constructor
{
    name = "";
    description = "";
    description_locked = __s("Win the previous tournament %s times.", 5);
    key = "";
    last_length = 0;
    leaderboard_cache = undefined;
    max_participants = 10;
    max_turns = 15;
    previous_tournament = undefined;
    turn_log = [];
    type = undefined;
    upgrade_attributes = 
    {
        fishing_catch_credits_multiplier: 0
    };
    choice_types = 
    {
        fishing_spot: 
        {
            title: __("Fishing Spot"),
            text_prefix: "+",
            text_suffix: "m",
            has_value: true
        },
        eliminate_players: 
        {
            title: __("Drown"),
            chance: 0.75,
            description: __s("Eliminates the highest ranked opponent from the tournament."),
            has_value: false,
            special: true
        },
        fish_credits: 
        {
            title: __("Fish Credits"),
            description: __s("Instantly adds %s.", global.resources.fish_credits.name_plural),
            chance: 0.75,
            result: 
            {
                resources: 
                {
                    fish_credits: 50
                }
            },
            scale: true,
            can_boost: true,
            has_value: false,
            special: true
        },
        fishing_albs: 
        {
            title: __("Fishing ALBs"),
            description: __s("Increases your fish length every turn."),
            text_prefix: "+",
            can_boost: true,
            has_value: true,
            special: true,
            min_value: 0.25,
            max_value: 0.5,
            format_value: number_format_percent
        },
        increase_rod_value: 
        {
            title: __("Rod Upgrade"),
            description: __("Increases rod value for the current tournament."),
            text_prefix: "+",
            can_boost: true,
            has_value: true,
            special: true
        },
        tournament_success_chance: 
        {
            title: __("Fishpertise"),
            description: __("Increases base chance of all actions for the current tournament."),
            text_prefix: "+",
            can_boost: true,
            has_value: true,
            special: true,
            min_value: 0.02,
            max_value: 0.05,
            format_value: number_format_percent
        }
    };
    add_keys_to_struct(self.choice_types);
    special_actions = _filter(self.choice_types, function(arg0)
    {
        return get_default_struct_value(arg0, "special", false);
    });
    risk_types = 
    {
        low: 
        {
            index: 0,
            chance_min: 0.75,
            chance_max: 0.95,
            range_min: 0,
            range_max: 0.1
        },
        mid: 
        {
            index: 1,
            chance_min: 0.45,
            chance_max: 0.65,
            range_min: 0.4,
            range_max: 0.6
        },
        high: 
        {
            index: 2,
            chance_min: 0.25,
            chance_max: 0.35,
            range_min: 0.9,
            range_max: 1
        }
    };
    add_keys_to_struct(self.risk_types);
    risk_types_array = struct_to_sorted_array(self.risk_types);
    data = 
    {
        auto: false,
        auto_wins: 0,
        auto_win_timeout: 0,
        best_rank: 0,
        buffs: {},
        choices: [],
        last_choice_success: false,
        rank: 0,
        participants: [],
        reward: undefined,
        started: 0,
        status: "idle",
        time_end: 0,
        total_length: 0,
        turn: 0,
        type_key: "",
        won: 0
    };
    
    init = function()
    {
        if (!is_struct(self.type))
        {
            self.type = global.fishing_tournament_types.novice;
        }
        self.data.type_key = self.type.key;
        self.name = sprintf("%s %s", self.type.name, __("Tournament"));
    };
    
    add_buff = function(arg0, arg1)
    {
        add_to_struct_value(self.data.buffs, arg0, arg1);
    };
    
    cancel = function()
    {
        self.data.status = "idle";
        global.active_fishing_tournament = undefined;
        self.set_end_time();
    };
    
    can_claim = function()
    {
        if (self.data.status != "finished")
        {
            return false;
        }
        return true;
    };
    
    can_start = function()
    {
        if (self.data.status != "idle")
        {
            return false;
        }
        if (o_game.data.stats.time_elapsed < self.data.time_end)
        {
            return false;
        }
        if (is_struct(self.previous_tournament) && self.previous_tournament.data.won < 5)
        {
            return false;
        }
        return has_enough(self.type.cost);
    };
    
    claim = function()
    {
        if (!self.can_claim())
        {
            return false;
        }
        add_result_lite(self.data.reward);
        self.data.status = "idle";
        self.set_end_time();
        global.active_fishing_tournament = undefined;
        refresh_ua_section("fishing");
    };
    
    can_auto_win = function()
    {
        return self.data.won >= global.game_settings.fishing_tournaments_auto_wins && has_bought_shop_item_safe(global.shops.fish.unlock_fishing_tournaments_auto_win);
    };
    
    check_auto_win = function()
    {
        if (!self.can_auto_win())
        {
            exit;
        }
        if (self.data.auto_win_timeout > o_game.data.stats.time_elapsed)
        {
            exit;
        }
        self.data.won++;
        self.data.auto_wins++;
        self.data.auto_win_timeout = o_game.data.stats.time_elapsed + self.get_auto_win_delay();
        add_result_lite(self.get_reward(1));
        refresh_ua_section("fish");
    };
    
    check = function()
    {
        self.check_auto_win();
    };
    
    get_auto_win_delay = function()
    {
        var timeout = sec(3600) * 6;
        if (self.data.won >= 50)
        {
            timeout *= 0.5;
        }
        if (self.data.won >= 100)
        {
            timeout *= 0.25;
        }
        if (self.data.won >= 200)
        {
            timeout *= 0.1;
        }
        return timeout;
    };
    
    finish = function()
    {
        var __array = self.data.participants;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (!mitem.bot)
            {
                self.data.rank = __i + 1;
                break;
            }
        }
        if (self.data.best_rank == 0)
        {
            self.data.best_rank = self.data.rank;
        }
        self.data.best_rank = min(self.data.best_rank, self.data.rank);
        if (self.data.rank == 1)
        {
            self.data.won++;
        }
        self.data.reward = self.get_reward(self.data.rank);
        if (self.data.rank > 3)
        {
            self.data.reward.materials = undefined;
        }
        self.data.status = "finished";
        refresh_ua_section("fish");
    };
    
    generate_choices = function()
    {
        self.data.choices = [];
        var min_length = self.get_min_fish_length();
        var max_length = self.get_max_fish_length();
        var range = max_length - min_length;
        var special_choice_chance = 0.25;
        if (global.debug)
        {
            special_choice_chance = 1;
        }
        var add_chance = global.fishing_tournament_rod.get_upgrade_value("tournament_success_chance") + self.get_buff("tournament_success_chance");
        var boost_chance = 0.05 + global.fishing_tournament_rod.get_upgrade_value("tournament_boost_chance");
        var __array = self.risk_types_array;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            var boost = percent_chance(boost_chance * 100);
            var chance = add_chance + random_range(mitem.chance_min, mitem.chance_max);
            chance = min(chance, 1);
            var type = "fishing_spot";
            var value = random_range(min_length + (range * mitem.range_min), min_length + (range * mitem.range_max));
            if (boost && is_numeric(value))
            {
                value *= 1.5;
            }
            array_push(self.data.choices, 
            {
                boost: boost,
                chance: chance,
                value: value,
                type: type
            });
        }
        var special_choice_count = multi_chance(special_choice_chance * 100, undefined, undefined, 3);
        repeat (special_choice_count)
        {
            var choice = array_random_item(self.special_actions);
            var boost = false;
            var base_chance = random_range(0.25, 0.75);
            var chance = get_default_struct_value(choice, "chance", base_chance);
            chance = min(chance, 1);
            var result = get_default_struct_value(choice, "result");
            var min_value = get_default_struct_value(choice, "min_value", 0.01);
            var max_value = get_default_struct_value(choice, "max_value", 1);
            var value = get_default_struct_value(choice, "value", random_range(min_value, max_value));
            if (get_default_struct_value(choice, "scale", false))
            {
                value *= (1 + random_range(self.type.difficulty, self.type.difficulty * 2));
            }
            if (is_struct(result))
            {
                var result_multiplier = get_default_struct_value(choice, "scale", false) ? self.type.difficulty : 1;
                value = multiply_struct_values(choice.result, result_multiplier, true);
            }
            if (boost && is_numeric(value))
            {
                value *= 1.5;
            }
            array_push(self.data.choices, 
            {
                boost: boost,
                chance: chance,
                result: result,
                value: value,
                type: choice.key
            });
        }
    };
    
    generate_participants = function()
    {
        self.data.participants = [];
        var participants = array_random_items(global.community_leaves_fishing, self.max_participants - 1, true);
        var __array = participants;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            array_push(self.data.participants, 
            {
                bot: true,
                key: mitem.key,
                name: mitem.name,
                length: 0,
                risk: array_random_item_key(self.risk_types_array)
            });
        }
        array_push(self.data.participants, 
        {
            name: __("You"),
            length: 0,
            bot: false
        });
    };
    
    get_buff = function(arg0)
    {
        return get_default_struct_value(self.data.buffs, arg0, 0);
    };
    
    get_choice_count = function()
    {
        return 2;
    };
    
    get_reward = function(arg0)
    {
        if (arg0 == 0)
        {
            exit;
        }
        var multiplier = 1 / arg0;
        var reward = multiply_struct_values(self.type.reward, multiplier, true);
        return reward;
    };
    
    get_timeout_duration = function()
    {
        return global.game_settings.fishing_tournament_end_timeout;
    };
    
    get_min_fish_length = function()
    {
        return global.fishing_tournament_rod.get_min_fish_length(self.get_buff("increase_rod_value"));
    };
    
    get_max_fish_length = function()
    {
        return global.fishing_tournament_rod.get_max_fish_length(self.get_buff("increase_rod_value"));
    };
    
    get_min_fish_length_bot = function()
    {
        return 1 + (5 * power(self.type.difficulty - 1, 2));
    };
    
    get_max_fish_length_bot = function()
    {
        return self.get_min_fish_length_bot() * (self.type.difficulty + 2);
    };
    
    get_upgrade_attributes = function()
    {
        self.upgrade_attributes.fishing_catch_credits_multiplier = sqrt((self.data.won * self.type.difficulty) / 50);
        return self.upgrade_attributes;
    };
    
    is_started = function()
    {
        return self.data.status == "started";
    };
    
    select_choice = function(arg0)
    {
        self.last_length = 0;
        var fish_length_value = 0;
        var increase_fish_length = false;
        var success = percent_chance(arg0.chance * 100);
        self.data.last_choice_success = success;
        if (success)
        {
            switch (arg0.type)
            {
                case "eliminate_players":
                    if (array_length(self.data.participants) >= 2)
                    {
                        var delete_index = 0;
                        var __array = self.data.participants;
                        var __prop_len = array_length(__array);
                        var __i = __prop_len - 1;
                        while (__i >= 0)
                        {
                            var mitem = __array[__i];
                            var __ireal = __prop_len - 1 - __i;
                            if (!mitem.bot)
                            {
                            }
                            else
                            {
                                delete_index = __i;
                            }
                            __i--;
                        }
                        var comm_leaf_key = struct_get_from_hash(@@array_get@@(self.data.participants, delete_index), variable_get_hash("key")) ?? undefined;
                        if (is_string(comm_leaf_key) && is_struct(variable_struct_get(global.community_leaves, comm_leaf_key)))
                        {
                            (variable_struct_get(global.community_leaves, comm_leaf_key)).add_stat("drowned", 1);
                        }
                        array_delete(self.data.participants, delete_index, 1);
                    }
                    break;
                case "fish_credits":
                    add_result_lite(arg0.value);
                    break;
                case "fishing_albs":
                    self.add_buff("fishing_albs", arg0.value);
                    break;
                case "fishing_spot":
                    increase_fish_length = success;
                    fish_length_value = arg0.value;
                    break;
                case "increase_rod_value":
                    self.add_buff("increase_rod_value", arg0.value);
                    break;
                case "tournament_success_chance":
                    self.add_buff("tournament_success_chance", arg0.value);
                    break;
            }
        }
        var fishing_albs_value = self.get_buff("fishing_albs");
        if (fishing_albs_value > 0)
        {
            fish_length_value += fishing_albs_value;
            increase_fish_length = true;
        }
        if (increase_fish_length)
        {
            var __array = self.data.participants;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                if (!mitem.bot)
                {
                    mitem.length += fish_length_value;
                }
            }
        }
        self.update_bots();
        if (self.data.last_choice_success)
        {
            array_push(self.turn_log, __s("Success"));
        }
        else
        {
            array_push(self.turn_log, __s("Fail"));
        }
        self.data.turn++;
        self.update_leaderboard();
        if (self.data.turn >= self.max_turns)
        {
            self.finish();
        }
        else
        {
            self.generate_choices();
        }
    };
    
    set_end_time = function()
    {
        self.data.time_end = o_game.data.stats.time_elapsed + self.get_timeout_duration();
    };
    
    start = function()
    {
        dec_result(self.type.cost);
        global.active_fishing_tournament = self;
        self.turn_log = [];
        self.data.buffs = {};
        self.data.rod_value = 0;
        self.data.status = "started";
        self.data.started++;
        self.data.total_length = 0;
        self.data.turn = 0;
        self.generate_choices();
        self.generate_participants();
        self.update_leaderboard();
    };
    
    get_description = function()
    {
        if (self.is_obfuscated())
        {
            return self.description_locked;
        }
        var best_rank_text = (self.data.best_rank == 0) ? "-" : self.data.best_rank;
        self.description = "\n" + __s("Best rank: %s", best_rank_text);
        self.description += ("\n" + __s("Won: %s", number_format(self.data.won)));
        self.description += ("\n" + __s("Opponents fish length: %s", sprintf("%sm - %sm", self.get_min_fish_length_bot(), self.get_max_fish_length_bot())));
        if (self.data.won > 0)
        {
            self.description += ("\n" + __s("Bonus: %s", format_upgrade_text(self.get_upgrade_attributes())));
        }
        if (self.can_auto_win())
        {
            self.description += ("\n" + __s("Next auto win: %s", format_remaining_time(self.data.auto_win_timeout, undefined, true, "-")));
        }
        return self.description;
    };
    
    is_obfuscated = function()
    {
        if (is_struct(self.previous_tournament) && self.previous_tournament.data.won < 5)
        {
            return true;
        }
        return false;
    };
    
    update_bots = function()
    {
        var min_length = self.get_min_fish_length_bot();
        var max_length = self.get_max_fish_length_bot();
        var range = max_length - min_length;
        var bot_choices = {};
        var __array = self.risk_types_array;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            variable_struct_set(bot_choices, mitem.key, 
            {
                chance: random_range(mitem.chance_min, mitem.chance_max),
                value: random_range(min_length + (range * mitem.range_min), min_length + (range * mitem.range_max)),
                type: "fishing_spot"
            });
        }
        __array = self.data.participants;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (mitem.bot)
            {
                var bot_choice = variable_struct_get(bot_choices, mitem.risk);
                if (percent_chance(bot_choice.chance * 100))
                {
                    mitem.length += bot_choice.value;
                }
            }
        }
    };
    
    update_leaderboard = function()
    {
        sort_array_by(self.data.participants, "length", false);
        self.leaderboard_cache = [];
        var __array = self.data.participants;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            var name = mitem.name;
            if (!mitem.bot)
            {
                name = "-- " + name;
            }
            array_push(self.leaderboard_cache, [sprintf("#%s", __i + 1), name, sprintf("%sm", mitem.length)]);
        }
    };
    
    load_data = function(arg0)
    {
        apply_struct_to_struct(self.data, arg0);
        self.load_data_after();
        self.update_leaderboard();
    };
    
    load_data_after = __void;
    set_local_vars(arg0);
    self.init();
}
