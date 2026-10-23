function Trade(arg0) constructor
{
    if (is_undefined(arg0))
    {
        arg0 = {};
    }
    name = __("Standard Delivery");
    description = __("");
    index = 0;
    key = "";
    sprite = spr_placeholder;
    data = 
    {
        id: -1,
        delivery_time_raw: -1,
        delivery_time_frames: -1,
        finished: false,
        input: {},
        level: 1,
        requirements: [],
        reward: {},
        started: false,
        type: global.trade_types.def.key
    };
    data_start = struct_clone(data);
    max_count = 0;
    notification_shown = false;
    delivery_time = -1;
    type = global.trade_types.def;
    
    init = function()
    {
        self.data.level = irandom_range(get_min_trade_level(), get_max_trade_level());
        var input_base_resource = array_random_item(global.resources_trades);
        while (!input_base_resource.data.unlocked)
        {
            input_base_resource = array_random_item(global.resources_trades);
        }
        var reward_resource;
        if (percent_chance(40))
        {
            self.type = get_random_trade_type();
            reward_resource = self.type.reward_resource;
            self.data.type = reward_resource.key;
        }
        else
        {
            reward_resource = get_random_unlocked_resource(global.resources_trades);
            while (!reward_resource.data.unlocked)
            {
                reward_resource = array_random_item(global.resources_trades);
            }
        }
        var input_resource_count = self.get_input_resource_count(input_base_resource);
        var reward_count = self.get_reward_count(reward_resource, input_base_resource, input_resource_count);
        self.build_trade_data(input_base_resource, input_resource_count, reward_resource, reward_count);
        self.get_input_resource_count_after();
        if (self.data.delivery_time_frames == -1)
        {
            self.data.id = generate_trade_id();
            self.generate_delivery_time();
        }
        if (self.data.id == -1)
        {
            self.data.id = generate_trade_id();
        }
    };
    
    boost = function()
    {
        if (!self.can_boost())
        {
            return false;
        }
        dec_materials(self.get_boost_cost());
        self.data.level = get_max_trade_level();
        var input_resource_key = get_first_key_from_struct(self.data.input);
        var input_resource = variable_struct_get(global.resources, input_resource_key);
        var input_resource_count = variable_struct_get(self.data.input, input_resource_key);
        var reward_resource_key = get_first_key_from_struct(self.data.reward);
        var reward_resource = variable_struct_get(global.resources, reward_resource_key);
        var reward_count_before = variable_struct_get(self.data.reward, reward_resource_key);
        var reward_count = self.get_reward_count(reward_resource, input_resource, variable_struct_get(self.data.input, input_resource_key));
        reward_count = max(reward_count_before, reward_count);
        self.build_trade_data(input_resource, input_resource_count, reward_resource, reward_count);
        self.get_input_resource_count_after();
    };
    
    build_trade_data = function(arg0, arg1, arg2, arg3)
    {
        self.data.input = {};
        variable_struct_set(self.data.input, arg0.key, apply_max_leaf_storage(arg1));
        self.data.reward = {};
        variable_struct_set(self.data.reward, arg2.key, apply_max_leaf_storage(arg3));
    };
    
    can_boost = function()
    {
        if (!has_enough_materials(self.get_boost_cost()))
        {
            return false;
        }
        if (get_upgrade_count(global.shops.blc.unlock_materials) == 0)
        {
            return false;
        }
        if (!self.data.started)
        {
            return false;
        }
        return self.data.level < get_max_trade_level();
    };
    
    can_boost_display = function()
    {
        if (get_upgrade_count(global.shops.blc.unlock_materials) == 0)
        {
            return false;
        }
        if (!self.data.started)
        {
            return false;
        }
        return self.data.level < get_max_trade_level();
    };
    
    check = function()
    {
        if (!self.notification_shown && self.is_finished())
        {
            self.notification_shown = true;
            if (get_option(global.options.enable_trade_notifications))
            {
                notify(__("Trade ready!"));
            }
        }
    };
    
    forward_time = function(arg0)
    {
        self.delivery_time -= arg0;
        self.data.delivery_time_frames -= arg0;
    };
    
    get_boost_cost = function()
    {
        var material = global.materials.essence_earth;
        var cost = (get_max_trade_level() - self.data.level) / 10;
        cost = max(1, ceil(cost));
        return build_resource_cost(material, cost);
    };
    
    get_input_resource_count = function(arg0)
    {
        var count = power(10, irandom_range(5 * self.data.level, 9 * self.data.level)) * random_range(1, 2) * arg0.print_value_multiplier;
        count = max(1, ceil(count));
        return count;
    };
    
    get_input_resource_count_after = function()
    {
        var __struct = self.data.input;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var old = mitem;
            variable_struct_set(__struct, mkey, variable_struct_get(__struct, mkey) * power(0.5, get_upgrade_attribute_value(global.upgrade_attributes.trade_decrease_input_count)));
            variable_struct_set(__struct, mkey, max(1, ceil(variable_struct_get(__struct, mkey))));
        }
    };
    
    get_reward_count = function(arg0, arg1, arg2)
    {
        var reward_count_base = random_range(self.data.level, self.data.level + 3);
        if (!is_struct(arg0))
        {
            arg0 = global.resources.leaves;
        }
        var ua_base_add = get_upgrade_attribute_value(variable_struct_get(global.upgrade_attributes.trade_resources_add, arg0.key));
        var ua_base_add_global = get_upgrade_attribute_value(global.upgrade_attributes.trade_resources_add_global);
        var ua_base_add_special_enabled = true;
        reward_count_base += (ua_base_add + ua_base_add_global);
        var exclude_limit_max_collected = false;
        var reward_count = arg2 * reward_count_base * (arg0.print_value_multiplier / arg1.print_value_multiplier);
        reward_count = ceil(reward_count);
        var trade_type = variable_struct_get(global.trade_types, self.data.type);
        switch (self.data.type)
        {
            case global.trade_types.borbs.key:
            case global.trade_types.beer.key:
            case global.trade_types.cheese.key:
            case global.trade_types.mulch.key:
                exclude_limit_max_collected = true;
                self.name = trade_type.name;
                arg0 = trade_type.reward_resource;
                reward_count = irandom_range(self.data.level * trade_type.reward_count_base, self.data.level * trade_type.reward_count_base * 2);
                self.data.type = trade_type.key;
                ua_base_add_special_enabled = true;
                break;
            case global.trade_types.gems.key:
                arg0 = global.resources.gems;
                var gems_min = max(1, self.data.level / 10);
                var gems_max = max(1, self.data.level / 5);
                var gems_max_final = 10 + get_upgrade_attribute_value(global.upgrade_attributes.trade_gems_max_value);
                var d = get_daily_data_today();
                var gems_traded_today = get_default_struct_value(d.data, "trade_gems", 0);
                var trade_max_gems_trades_per_day = get_max_gems_trades_today();
                if (gems_traded_today >= trade_max_gems_trades_per_day)
                {
                    gems_min = clamp(gems_min, 1, 2);
                    gems_max = 2;
                }
                reward_count = irandom_range(gems_min, gems_max);
                reward_count = min(reward_count, gems_max_final);
                self.data.type = global.trade_types.gems.key;
                ua_base_add_special_enabled = false;
                break;
        }
        if (ua_base_add_special_enabled)
        {
            var ua_base_add_special = get_upgrade_attribute_value(variable_struct_get(global.upgrade_attributes.trade_resources_add, arg0.key));
            reward_count += (ua_base_add_special + ua_base_add_global);
        }
        if (ua_base_add_special_enabled)
        {
            var ua_base_multi = get_upgrade_attribute_value(variable_struct_get(global.upgrade_attributes.trade_resources_multiplier, arg0.key));
            var reward_count_before = reward_count;
            reward_count *= (1 + ua_base_multi);
            reward_count *= get_trade_global_multiplier();
        }
        reward_count = ceil(reward_count);
        var max_reward_count_value = global.game_settings.trade_resource_cap_count;
        if (arg0.type == global.resource_types.flask)
        {
            max_reward_count_value = global.game_settings.trade_flask_cap_count;
        }
        max_reward_count_value *= power(10, get_upgrade_attribute_value(global.upgrade_attributes.trade_cap_increase));
        if (!exclude_limit_max_collected)
        {
            max_reward_count_value = max(max_reward_count_value, apply_max_number(arg0.data.collected_total));
        }
        reward_count = min(reward_count, max_reward_count_value);
        reward_count = max(1, reward_count);
        return reward_count;
    };
    
    get_trade_type = function()
    {
        var type = variable_struct_get(global.trade_types, self.data.type);
        if (is_undefined(type))
        {
            type = global.trade_types.def;
        }
        return type;
    };
    
    get_name = function()
    {
        var trade_type = self.get_trade_type();
        var name = sprintf("%s [%s]", trade_type.get_name(), self.data.level);
        return name;
    };
    
    get_description = function()
    {
        if (self.data.started)
        {
            if (self.is_finished())
            {
                return __("Trade finished.");
            }
            var time_left = self.delivery_time - o_game.data.stats.time_elapsed;
            return __s("Trade finished in %s", format_remaining_time(self.delivery_time));
        }
        var res_desc = [];
        var res_reward_desc = [];
        var __struct = self.data.input;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            array_push(res_desc, sprintf("%s %s", number_format(mitem), variable_struct_get(global.resources, mkey).name_plural));
        }
        __struct = self.data.reward;
        __prop_names = struct_get_names(__struct);
        __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            array_push(res_reward_desc, sprintf("%s %s", number_format(mitem), variable_struct_get(global.resources, mkey).name_plural));
        }
        var text = [__s("Deliver: %s", implode(", ", res_desc)), __s("Receive: %s", implode(", ", res_reward_desc))];
        return implode("\n", text);
    };
    
    is_obfuscated = function()
    {
        return false;
    };
    
    is_not_started = function()
    {
        return !self.is_started();
    };
    
    is_started = function()
    {
        return self.data.started;
    };
    
    can_cancel = function()
    {
        if (self.is_finished())
        {
            return false;
        }
        if (!has_enough_resources(self.get_cancel_cost()))
        {
            return false;
        }
        return true;
    };
    
    can_collect = function()
    {
        if (!self.is_finished())
        {
            return false;
        }
        var __struct = self.data.reward;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            if (!is_unlocked_resource(variable_struct_get(global.resources, mkey)))
            {
                return false;
            }
        }
        return true;
    };
    
    can_start_trade = function()
    {
        return !self.data.started && has_enough_resources(self.data.input);
    };
    
    cancel = function()
    {
        dec_resources(self.get_cancel_cost());
        delete_trade(self.data.id);
    };
    
    collect = function(arg0 = false)
    {
        if (!arg0 && !self.is_finished())
        {
            exit;
        }
        self.data.finished = true;
        var cheese_reward = 1;
        if (is_undefined(variable_struct_get(self.data.reward, global.resources.cheese.key)))
        {
            self.data.reward.cheese = 0;
        }
        self.data.reward.cheese += 1;
        add_resources(self.data.reward);
        o_game.data.stats.trades_finished++;
        self.type.__collect(self);
        add_game_log(sprintf("Collect Trade id=%s", self.data.id), "trades");
        delete_trade(self.data.id);
    };
    
    generate_delivery_time = function()
    {
        var new_delivery_time = o_game.data.stats.time_elapsed + self.get_delivery_duration();
        self.data.delivery_time_frames = new_delivery_time;
        self.delivery_time = new_delivery_time;
    };
    
    get_cancel_cost = function()
    {
        var cancel_cost = ceil(self.data.level / 2);
        return 
        {
            cheese: cancel_cost
        };
    };
    
    get_duration = function()
    {
        return global.game_settings.trade_duration;
    };
    
    get_delivery_duration = function()
    {
        var duration = self.get_duration() * (1 - global.upgrade_attributes.trade_duration_decrease_timer);
        return max(global.game_settings.trade_duration_min, duration);
    };
    
    is_finished = function()
    {
        return self.data.started && !self.data.finished && o_game.data.stats.time_elapsed >= self.delivery_time;
    };
    
    load_data = function(arg0)
    {
        var new_data = struct_clone(self.data_start);
        struct_apply_defaults(arg0, new_data);
        self.data = struct_clone(arg0);
        if (is_undefined(struct_get_from_hash(self.data, variable_get_hash("id"))) || self.data.id == -1)
        {
            self.data.id = generate_trade_id();
        }
        if (!is_string(self.data.type))
        {
            self.data.type = global.trade_types.def.key;
        }
        self.type = variable_struct_get(global.trade_types, self.data.type);
        if (!is_struct(self.type))
        {
            self.type = global.trade_types.def;
        }
        if (self.data.delivery_time_frames == -1)
        {
            self.generate_delivery_time();
        }
        self.delivery_time = self.data.delivery_time_frames;
    };
    
    start = function()
    {
        if (!has_enough_resources(self.data.input))
        {
            exit;
        }
        add_game_log(sprintf("Start Trade id=%s %s", self.data.id, self.get_description()), "trades");
        self.generate_delivery_time();
        self.data.started = true;
        add_to_struct_value(o_game.data.trade_types_started, self.type.key, 1);
        dec_resources(self.data.input);
        self.type._start(self);
    };
    
    set_local_vars(arg0);
    set_sprite_data(self);
    init();
}
