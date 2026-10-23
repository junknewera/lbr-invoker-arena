function Quest(arg0) constructor
{
    name = "";
    description = "";
    index = 0;
    key = "";
    data = 
    {
        active: false,
        claimed: false,
        count: 0,
        finished: false,
        id: guid(),
        index: -1,
        refresh_delay: 0,
        reward: undefined,
        stage: 0,
        stage_steps: [],
        tracker_count: 0,
        tracker_key: undefined,
        type_key: undefined
    };
    data_start = struct_clone(data);
    auto_finish = false;
    auto_start = false;
    cancellable = true;
    current_stage_step = undefined;
    _difficulty = 0;
    difficulty = 0;
    generate_random = false;
    is_daily = false;
    max_stage = 1;
    parent_struct = undefined;
    random_reward = false;
    refreshable = true;
    refresh_delay_duration = sec(60);
    repeatable = false;
    requirements = {};
    reward = undefined;
    reward_collection = undefined;
    reward_count = 1;
    sort_index = 0;
    sprite = spr_solid;
    stage_steps = undefined;
    type = undefined;
    type_key = undefined;
    
    init = function(arg0 = false)
    {
        if (is_undefined(self.type_key) || is_undefined(variable_struct_get(global.quest_types, self.type_key)))
        {
            return log("INVALID QUEST TYPE", self.type_key);
        }
        self.type = variable_struct_get(global.quest_types, self.type_key);
        self.data.type_key = self.type_key;
        self._difficulty = get_value_ext(self, self.difficulty);
        if (!arg0)
        {
            if (self.generate_random)
            {
                self.generate_random_steps();
            }
            if (self.random_reward)
            {
                self.generate_random_reward();
            }
            if (!is_undefined(self.stage_steps))
            {
                self.data.stage_steps = self.stage_steps;
            }
        }
        self.data.stage = clamp(self.data.stage, 0, array_length(self.data.stage_steps) - 1);
        self.current_stage_step = self.data.stage_steps[self.data.stage];
        if (self.auto_start && self._can_start())
        {
            self.set_active();
        }
    };
    
    _can_cancel = function()
    {
        if (!self.cancellable || !self.is_active() || self.is_finished())
        {
            return false;
        }
        if (o_game.data.stats.time_elapsed < self.data.refresh_delay)
        {
            return false;
        }
        return true;
    };
    
    can_cancel = function()
    {
        return true;
    };
    
    _can_finish = function()
    {
        if (!self.check_all_stages())
        {
            return false;
        }
        return self.is_active() && !self.is_finished() && self.data.stage >= self.max_stage && self.can_finish();
    };
    
    can_finish = function()
    {
        return true;
    };
    
    _can_refresh = function()
    {
        if (!self.refreshable)
        {
            return false;
        }
        if (self.is_active())
        {
            return false;
        }
        if (self.data.refresh_delay > o_game.data.stats.time_elapsed)
        {
            return false;
        }
        return self.can_refresh();
    };
    
    can_refresh = __return_true;
    
    _can_start = function()
    {
        if (self.is_active() || !self.can_start())
        {
            return false;
        }
        if (!self.repeatable && self.data.count > 0)
        {
            return false;
        }
        return true;
    };
    
    can_start = function()
    {
        return true;
    };
    
    cancel = function()
    {
        if (!self.can_cancel())
        {
            exit;
        }
        self.data.finished = false;
        self.data.stage = 0;
        self.set_refresh_delay_time();
        self.set_inactive();
    };
    
    check_quest = function()
    {
        if (self.is_finished())
        {
            exit;
        }
        if (self.is_daily && (in_challenge() || mp_is_season()))
        {
            exit;
        }
        var _auto_finish = self.auto_finish;
        if (self.is_daily && has_bought_shop_item_safe(global.shops.gems.daily_quest_auto_claim) && get_option(global.options.daily_quest_auto_claim))
        {
            _auto_finish = true;
        }
        if (self._can_finish() && _auto_finish)
        {
            self.finish();
        }
    };
    
    check_stage = function()
    {
        self.check_stage_step();
    };
    
    check_all_stages = function()
    {
        var __array = self.data.stage_steps;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (!self.type.is_stage_step_fulfilled(self, mitem))
            {
                return false;
            }
        }
        return true;
    };
    
    check_stage_step = function()
    {
        if (is_undefined(self.current_stage_step))
        {
            return false;
        }
        var stage_requirement_fulfilled = self.type.is_stage_step_fulfilled(self);
        if (!stage_requirement_fulfilled)
        {
            self.data.stage = 0;
            return false;
        }
        self.data.stage++;
        self.check_quest();
    };
    
    is_stage_step_fulfilled = function(arg0 = self, arg1 = undefined)
    {
        return self.type.is_stage_step_fulfilled(arg0, arg1);
    };
    
    finish = function(arg0 = false)
    {
        if ((!self._can_finish() && !arg0) || self.is_finished())
        {
            exit;
        }
        self.type.finish(self.current_stage_step);
        if (is_struct(self.reward))
        {
            var res_text = add_result(self.reward, __("Quest finished"), undefined, true);
            notify(res_text);
        }
        self.data.count++;
        self.data.finished = true;
        self.data.refresh_delay = 0;
        if (self.repeatable)
        {
            self.data.stage = 0;
        }
        if (self.is_daily)
        {
            self.sort_index = 1;
            o_game.data.stats.daily_quests++;
            check_daily_streak();
        }
        self.set_inactive();
    };
    
    generate_random_steps = function()
    {
        self.data.stage_steps = [self.type.get_random_data(self._difficulty, self)];
        self.current_stage_step = @@array_get@@(self.data.stage_steps, 0);
        var __array = self.data.stage_steps;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            mitem.start_value = self.type.get_start_value(self, mitem);
        }
    };
    
    generate_random_reward = function()
    {
        var reward = {};
        if (is_array(struct_get_from_hash(self.reward_collection, variable_get_hash("resources"))))
        {
            reward.resources = {};
            var reward_resource = array_random_item(self.reward_collection.resources);
            variable_struct_set(reward.resources, reward_resource.key, self.reward_count);
        }
        self.reward = reward;
        self.data.reward = reward;
    };
    
    get_display_materials = function()
    {
        return get_default_struct_value(self.current_stage_step, "materials", undefined);
    };
    
    get_display_resources = function()
    {
        return get_default_struct_value(self.current_stage_step, "resources", undefined);
    };
    
    get_reward = function()
    {
        return self.reward;
    };
    
    is_active = function()
    {
        return self.data.active;
    };
    
    is_finished = function()
    {
        return self.data.finished;
    };
    
    _is_visible = function()
    {
        if (!self.is_visible())
        {
            return false;
        }
        if (self.is_daily)
        {
            return true;
        }
        if (self.repeatable)
        {
            return true;
        }
        return self.data.count == 0;
    };
    
    is_visible = __return_true;
    
    refresh = function()
    {
        self.cancel();
    };
    
    set_active = function()
    {
        self.data.active = true;
        array_push(global.active_quests, self);
        if (!is_undefined(self.parent_struct))
        {
            self.parent_struct.data = self.data;
        }
    };
    
    set_inactive = function()
    {
        self.data.active = false;
        remove_item_from_array_by_id(global.active_quests, self.data.id);
        if (self.repeatable)
        {
            if (self.generate_random)
            {
                self.generate_random_steps();
            }
            if (self.random_reward)
            {
                self.generate_random_reward();
            }
            if (!is_undefined(self.parent_struct))
            {
                self.parent_struct.data = self.data;
            }
        }
    };
    
    set_parent = function(arg0)
    {
        self.parent_struct = arg0;
        if (self.data.active)
        {
            self.set_active();
        }
    };
    
    set_refresh_delay_time = function()
    {
        self.data.refresh_delay = o_game.data.stats.time_elapsed + self.refresh_delay_duration;
    };
    
    start = function()
    {
        self.data.finished = false;
        self.data.stage = 0;
        self.set_active();
    };
    
    get_name = function(arg0 = false)
    {
        var name = get_value_ext(self, self.name, false);
        if (arg0)
        {
            return name;
        }
        return name;
    };
    
    get_description = function(arg0 = false)
    {
        var type_desc = self.type.get_description(self, self.current_stage_step);
        if (arg0)
        {
            return type_desc;
        }
        var desc = get_value_ext(self, self.description, false);
        desc += sprintf("\n%s: ", __("Quest"));
        desc += type_desc;
        if (is_struct(self.get_reward()))
        {
            desc += ("\n" + sprintf("%s: ", __("Reward")) + format_result_text(self.get_reward(), ""));
        }
        if (self.data.refresh_delay > 0 && !self._can_refresh())
        {
            var next_refresh_text = __("Next refresh");
            if (self.cancellable && !self._can_cancel())
            {
                next_refresh_text += ("/" + __("cancel"));
            }
            desc += ("\n" + sprintf("%s: %s", next_refresh_text, format_time(secr(self.data.refresh_delay - o_game.data.stats.time_elapsed))));
        }
        return desc;
    };
    
    is_obfuscated = function()
    {
        return false;
    };
    
    load_data = function(arg0)
    {
        self.data.reward = undefined;
        apply_struct_to_struct(self.data, arg0);
        var init_soft = true;
        if (is_string(struct_get_from_hash(self.data, variable_get_hash("type_key"))))
        {
            self.type_key = self.data.type_key;
        }
        else
        {
            init_soft = false;
        }
        if (self.is_active())
        {
            array_push(global.active_quests, self);
        }
        else
        {
            remove_item_from_array_by_id(global.active_quests, self.data.id);
        }
        self.init(init_soft);
        if (is_struct(self.data.reward))
        {
            self.reward = self.data.reward;
        }
        if (self.is_finished())
        {
            self.sort_index = 1;
        }
    };
    
    set_local_vars(arg0);
    set_sprite_data(self);
    init();
}
