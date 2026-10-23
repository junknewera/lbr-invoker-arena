function Challenge(arg0) constructor
{
    name = __("Unknown Challenge");
    description = "";
    index = 0;
    key = "";
    sprite = spr_placeholder;
    data = 
    {
        active: false,
        current_run_finished: false,
        fastest_finish_time: -1,
        fastest_finish_time_frames: -1,
        init: false,
        init_challenge: false,
        last_finish_time: -1,
        last_finish_time_frames: -1,
        finished: 0,
        start_time: -1,
        unlocked: true
    };
    bingo = false;
    category = "regular";
    challenge_seed = undefined;
    difficulty = 0;
    disable_reward = false;
    game_settings = undefined;
    gem_upgrades_enabled = true;
    is_custom_challenge = false;
    quests = undefined;
    requirements = [];
    result_start = undefined;
    reward = 
    {
        cp: 10
    };
    reward_concurrent = 
    {
        cp: 1
    };
    reward_override_concurrent = undefined;
    start_shop_items = undefined;
    type = undefined;
    type_key = undefined;
    type_value = 0;
    upgrade_attributes = {};
    
    init = function()
    {
        if (!self.is_custom_challenge)
        {
            switch (self.difficulty)
            {
                case -1:
                    self.reward.cp = 1;
                    self.reward_concurrent.cp = 0;
                    break;
                case 0:
                    self.reward.cp = 5;
                    self.reward_concurrent.cp = 2;
                    break;
                case 1:
                    self.reward.cp = 10;
                    self.reward_concurrent.cp = 3;
                    break;
                case 2:
                    self.reward.cp = 15;
                    self.reward_concurrent.cp = 5;
                    break;
            }
            if (is_numeric(self.reward_override_concurrent))
            {
                self.reward_concurrent.cp = self.reward_override_concurrent;
            }
        }
        if (self.disable_reward)
        {
            self.reward = {};
            self.reward_concurrent = {};
        }
    };
    
    _after_prestige_func = function()
    {
        self._challenge();
        return self.after_prestige_func();
    };
    
    after_prestige_func = function()
    {
    };
    
    can_apply_bonus = function()
    {
        return !in_challenge() && self.data.finished > 0;
    };
    
    can_start_challenge = function()
    {
        return self.is_unlocked();
    };
    
    _before_load_game = function()
    {
        if (!self.gem_upgrades_enabled)
        {
            global.game_settings.gem_upgrades_enabled = false;
        }
    };
    
    _challenge = function()
    {
        self.maybe_use_seed();
        if (!self.data.init_challenge)
        {
            self.start_challenge();
            self.data.init_challenge = true;
        }
        try
        {
            if (!is_struct(struct_get_from_hash(global.profiles.def.shops, variable_get_hash("skins"))))
            {
                exit;
            }
            var __struct = global.shops.skins;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                mitem.is_buyable = false;
                mitem.data.count = get_default_struct_value(variable_struct_get(global.profiles.def.shops.skins, mkey), "count", 0);
            }
            o_game.data.skins.blower = global.profiles.def.objects.o_game.data.skins.blower;
            o_game.data.skins.autoblower = global.profiles.def.objects.o_game.data.skins.autoblower;
            o_game.data.skins.cursor = global.profiles.def.objects.o_game.data.skins.cursor;
        }
        catch (err)
        {
            log("challenge skins error", err);
        }
        if (!self.gem_upgrades_enabled)
        {
            global.game_settings.gem_upgrades_enabled = false;
        }
        if (self.is_custom_challenge && is_struct(self.game_settings))
        {
            apply_struct_to_struct(global.game_settings, self.game_settings);
        }
        return self.challenge();
    };
    
    challenge = function()
    {
    };
    
    _check = function()
    {
        if (self.is_custom_challenge)
        {
            return self.check_custom();
        }
        else
        {
            return self.check();
        }
    };
    
    check = function()
    {
    };
    
    check_custom = function()
    {
        if (is_array(self.quests))
        {
            var __array = self.quests;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                var fulfilled = mitem.is_stage_step_fulfilled(mitem, mitem.stage_steps[0]);
                if (!fulfilled)
                {
                    return false;
                }
            }
            return true;
        }
        return false;
    };
    
    _complete = function()
    {
        self.data.finished++;
        self.data.current_run_finished = true;
        var t_start = get_date_from_object(self.data.start_time);
        var t_end = date_current_datetime();
        var t_duration = date_second_span(t_start, t_end);
        self.data.last_finish_time = t_duration;
        if (self.data.fastest_finish_time == -1)
        {
            self.data.fastest_finish_time = t_duration;
        }
        else
        {
            self.data.fastest_finish_time = min(self.data.fastest_finish_time, t_duration);
        }
        self.data.last_finish_time_frames = o_game.data.stats.time_elapsed;
        if (self.data.fastest_finish_time_frames == -1)
        {
            self.data.fastest_finish_time_frames = o_game.data.stats.time_elapsed;
        }
        else
        {
            self.data.fastest_finish_time_frames = min(self.data.fastest_finish_time_frames, o_game.data.stats.time_elapsed);
        }
        self.data.start_time = -1;
        self.data.init_challenge = false;
        if (!self.is_custom_challenge)
        {
            add_resources_to_profile(self.get_reward(self.data.finished), global.profile_types.def, true);
        }
        o_game.data.challenge_time_completed_frames = self.data.fastest_finish_time_frames;
        o_game.data.mp_current_run_finished = true;
        return self.complete();
    };
    
    complete = function()
    {
    };
    
    get_challenge_time = function()
    {
        var t_start = get_date_from_object(self.data.start_time);
        var t_end = date_current_datetime();
        var t_duration = date_second_span(t_start, t_end);
        return t_duration;
    };
    
    _get_progress_text = function()
    {
        return self.get_progress_text();
    };
    
    get_progress_text = __return_text;
    
    get_reward = function(arg0)
    {
        return (arg0 <= 1) ? self.reward : self.reward_concurrent;
    };
    
    is_unlocked = __return_true;
    
    _reset = function()
    {
        self.data.active = false;
        self.data.current_run_finished = false;
        self.data.init_challenge = false;
    };
    
    reset = function()
    {
    };
    
    _resume = function()
    {
        global.globalstats.current_challenge_key = self.key;
        global.current_challenge = self;
        change_profile(global.profile_types.challenge);
        return self.resume();
    };
    
    resume = function()
    {
    };
    
    _start = function()
    {
        self.maybe_use_seed();
        var __struct = global.challenges;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            mitem._reset();
        }
        self.data.active = true;
        self.data.start_time = get_time_object();
        global.globalstats.current_challenge_key = self.key;
        global.globalstats.challenge_data.quests = {};
        global.current_challenge = self;
        global.profiles.challenge = -1;
        global.profiles.challenge = get_empty_profile_data(global.profile_types.challenge);
        self.start();
        if (!mp_is_season())
        {
            change_profile(global.profile_types.challenge);
        }
    };
    
    start = __void;
    start_challenge = __void;
    
    _start_init = function()
    {
        self.data.init = true;
        self.maybe_use_seed();
        if (is_struct(self.result_start))
        {
            add_result_lite(self.result_start);
            if (is_struct(struct_get_from_hash(self.result_start, variable_get_hash("converters"))))
            {
                var __array = global.converters_array;
                var __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                }
            }
            if (is_struct(struct_get_from_hash(self.result_start, variable_get_hash("mines"))))
            {
                var __struct = global.mine_items;
                var __prop_names = struct_get_names(__struct);
                var __prop_len = array_length(__prop_names);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mkey = __prop_names[__i];
                    var mitem = variable_struct_get(__struct, mkey);
                }
            }
            if (is_struct(struct_get_from_hash(self.result_start, variable_get_hash("resources"))))
            {
                var __struct = self.result_start.resources;
                var __prop_names = struct_get_names(__struct);
                var __prop_len = array_length(__prop_names);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mkey = __prop_names[__i];
                    var mitem = variable_struct_get(__struct, mkey);
                    if (!is_struct(variable_struct_get(global.resources, mkey)))
                    {
                        continue;
                    }
                    variable_struct_get(global.resources, mkey).data.unlocked = true;
                }
            }
            if (is_struct(struct_get_from_hash(self.result_start, variable_get_hash("unique_leaves"))))
            {
                var __struct = self.result_start.unique_leaves;
                var __prop_names = struct_get_names(__struct);
                var __prop_len = array_length(__prop_names);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mkey = __prop_names[__i];
                    var mitem = variable_struct_get(__struct, mkey);
                    var item = variable_struct_get(global.unique_leaves, mkey);
                    if (!is_struct(item))
                    {
                        continue;
                    }
                    item.activate();
                }
            }
        }
        if (is_struct(self.start_shop_items))
        {
            var __struct = self.start_shop_items;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                var shop = variable_struct_get(global.shops, mkey);
                if (!is_struct(shop))
                {
                    continue;
                }
                var __struct2 = mitem;
                var __prop_names2 = struct_get_names(__struct2);
                var __prop_len2 = array_length(__prop_names2);
                for (var __i2 = 0; __i2 < __prop_len2; __i2++)
                {
                    var mkey2 = __prop_names2[__i2];
                    var mitem2 = variable_struct_get(__struct2, mkey2);
                    var shop_item = variable_struct_get(shop, mkey2);
                    if (!is_struct(shop_item))
                    {
                        continue;
                    }
                    var item_count = real(mitem2);
                    var item_max_count = shop_item.get_max_count();
                    if (item_count == -1 && item_max_count != -1)
                    {
                        item_count = shop_item.get_max_count();
                    }
                    shop_item.data.count = item_count;
                    if (item_count > 0 && shop_item.is_toggle)
                    {
                        shop_item.data.toggle = true;
                    }
                }
            }
        }
        if (!global.game_settings.artifacts_expire)
        {
            var __struct = global.artifacts;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                mitem.reduce_spawn_time_relative(1);
            }
        }
        self.start_init();
    };
    
    start_init = function()
    {
    };
    
    _stop = function()
    {
        var change = in_challenge();
        self.data.active = false;
        self.data.init = false;
        self.data.init_challenge = false;
        self.data.start_time = -1;
        global.globalstats.current_challenge_key = -1;
        global.globalstats.challenge_data.quests = {};
        global.current_challenge = -1;
        self.stop();
        if (change)
        {
            change_profile(global.profile_types.def);
        }
    };
    
    stop = function()
    {
    };
    
    maybe_use_seed = function()
    {
        var seed = undefined;
        if (self.is_custom_challenge)
        {
            if (!is_empty(self.challenge_seed))
            {
                seed = self.challenge_seed;
            }
        }
        else if (!is_empty(global.globalstats.challenge_seed))
        {
            seed = global.globalstats.challenge_seed;
        }
        if (is_empty(seed))
        {
            exit;
        }
        log("use seed", seed);
        random_set_seed(seed);
    };
    
    get_name = function()
    {
        var name = get_value_ext(self, self.name, false);
        if (self.data.active)
        {
            name += sprintf(" [%s]", __("Active"));
        }
        return name;
    };
    
    get_description = function()
    {
        var desc = get_value_ext(self, self.description, false);
        if (!self.gem_upgrades_enabled)
        {
            desc += ("\n" + __("Gem upgrades are disabled.") + "\n");
        }
        if (self.is_custom_challenge)
        {
            return desc;
        }
        var upgrade_attributes_text = [];
        var __struct = self.upgrade_attributes;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            array_push(upgrade_attributes_text, get_upgrade_text(mkey, mitem));
        }
        desc += ("\n" + __s("First completion bonus: %s", implode(", ", upgrade_attributes_text)));
        if (self.data.fastest_finish_time != -1)
        {
            var frames_text = "";
            if (self.data.fastest_finish_time_frames != -1)
            {
                frames_text += sprintf(" | %s | %s frames)", format_time(secr(self.data.fastest_finish_time_frames), false, true), self.data.fastest_finish_time_frames);
            }
            desc += ("\n" + sprintf(__("Fastest time: %s%s | Completed: %s"), format_time(self.data.fastest_finish_time, false, true), frames_text, self.data.finished));
        }
        return desc;
    };
    
    is_obfuscated = function()
    {
        return false;
    };
    
    set_local_vars(arg0);
    set_sprite_data(self);
    init();
}
