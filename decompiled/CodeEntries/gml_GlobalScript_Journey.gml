function Journey(arg0) constructor
{
    name = "";
    description = "";
    index = 0;
    key = "";
    max_level = 20;
    sprite = spr_placeholder;
    data_key = "";
    data = 
    {
        finished: 0,
        level: 0,
        rewards_claimed: {},
        tier: 1,
        xp: 0,
        xp_total: 0
    };
    items = {};
    items_array = [];
    items_data = [];
    page_key = "";
    remaining_reward = undefined;
    repeatable = false;
    selection_key = "";
    static_upgrade_attributes = {};
    tiers = 3;
    upgrade_attributes = {};
    upgrade_attributes_cache = undefined;
    upgrade_text_cache = "";
    xp_table_base = 5;
    xp_table_exp = 2;
    xp_table_finish_multiplier = 1.1;
    xp_table = [];
    
    _init = function()
    {
        self.page_key = $"journey_page_{self.key}";
        self.selection_key = $"journey_{self.key}";
        self.init();
    };
    
    init = function()
    {
        for (var tier = 1; tier <= self.tiers; tier++)
        {
            variable_struct_set(self.items, tier, {});
            for (var level = 1; level <= self.max_level; level++)
            {
                variable_struct_set(variable_struct_get(self.items, tier), level, undefined);
            }
        }
        var __array = self.items_data;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            var frequency = get_default_struct_value(mitem, "frequency", 0);
            var item_tier = get_default_struct_value(mitem, "tier", -1);
            var fixed_level = get_default_struct_value(mitem, "level");
            var multiplier = get_default_struct_value(mitem, "multiplier", 0);
            var offset = get_default_struct_value(mitem, "offset", 0);
            for (var tier = 1; tier <= self.tiers; tier++)
            {
                if (item_tier != -1 && item_tier != tier)
                {
                    continue;
                }
                if (frequency > 0)
                {
                    var count = floor(self.max_level / frequency);
                    for (var i = 1; i <= count; i++)
                    {
                        var level = (i * frequency) + offset;
                        var row_multiplier = 1 + (multiplier * (i - 1));
                        self.add_journey_item(tier, level, mitem, row_multiplier);
                    }
                }
                if (is_numeric(fixed_level))
                {
                    fixed_level = [fixed_level];
                }
                if (is_array(fixed_level))
                {
                    var __array2 = fixed_level;
                    var __prop_len2 = array_length(__array2);
                    for (var __i2 = 0; __i2 < __prop_len2; __i2++)
                    {
                        var mitem2 = __array2[__i2];
                        self.add_journey_item(tier, mitem2, mitem);
                    }
                }
            }
        }
        if (is_struct(self.remaining_reward))
        {
            var add_count = 0;
            var sprite = get_default_struct_value(self.remaining_reward, "sprite", spr_solid);
            var ua = get_default_struct_value(self.remaining_reward, "upgrade_attributes");
            for (var tier = 1; tier <= self.tiers; tier++)
            {
                for (var level = 1; level <= self.max_level; level++)
                {
                    if (is_struct(variable_struct_get(variable_struct_get(self.items, tier), level)))
                    {
                        continue;
                    }
                    var multiplier = 1 + (add_count * get_default_struct_value(self.remaining_reward, "multiplier", 1));
                    self.add_journey_item(tier, level, self.remaining_reward, multiplier);
                    add_count++;
                }
            }
        }
    };
    
    _init_late = function()
    {
        apply_struct_to_struct(variable_struct_get(o_game.data.journeys, self.data_key), self.data, true);
        self.data = variable_struct_get(o_game.data.journeys, self.data_key);
        self.init_late();
        self.init_xp_table();
        self.check_level();
        self.check_auto_finish();
    };
    
    init_late = __void;
    
    init_data = function()
    {
        apply_struct_to_struct(variable_struct_get(o_game.data.journeys, self.data_key), self.data);
    };
    
    init_xp_table = function()
    {
        self.xp_table = [];
        var last_xp = 0;
        for (var i = 0; i <= self.max_level; i++)
        {
            array_push(self.xp_table, self.get_level_xp(i, self.data.tier, self.data.finished));
        }
    };
    
    add_journey_item = function(arg0, arg1, arg2, arg3 = 1)
    {
        var item = 
        {
            id: sprintf("%s_%s_%s", self.key, arg0, arg1),
            level: arg1,
            description: get_default_struct_value(arg2, "description"),
            result: multiply_struct_values(get_default_struct_value(arg2, "result"), arg3, true),
            sprite: get_default_struct_value(arg2, "sprite", spr_solid),
            rarity_key: get_default_struct_value(arg2, "rarity_key"),
            tier: arg0,
            type: "f2p",
            upgrade_attributes: get_default_struct_value(arg2, "upgrade_attributes")
        };
        variable_struct_set(variable_struct_get(self.items, arg0), arg1, item);
        array_push(self.items_array, item);
    };
    
    add_xp = function(arg0, arg1 = true)
    {
        self.data.xp += arg0;
        self.data.xp_total += arg0;
        if (arg1)
        {
            self.check_level();
        }
        self.check_auto_finish();
    };
    
    ascend_tier = function()
    {
        if (!self.can_ascend_tier())
        {
            exit;
        }
        self.data.level = 0;
        self.data.tier++;
        self.data.xp = 0;
        self.init_xp_table();
    };
    
    can_ascend_tier = function()
    {
        if (self.data.level < self.max_level)
        {
            return false;
        }
        if (self.data.tier >= self.tiers)
        {
            return false;
        }
        return true;
    };
    
    _can_claim = function(arg0)
    {
        if (!is_struct(arg0))
        {
            return false;
        }
        if (self.is_claimed(arg0))
        {
            return false;
        }
        if (self.data.level < arg0.level)
        {
            return false;
        }
        if (self.data.tier < arg0.tier)
        {
            return false;
        }
        if (arg0.type == "premium" && !self.has_premium())
        {
            return false;
        }
        return self.can_claim();
    };
    
    can_claim = __return_true;
    
    can_finish = function()
    {
        return self.data.level >= self.max_level;
    };
    
    check_auto_finish = function()
    {
        if (get_upgrade_count(global.shops.gems.auto_journey_finish) <= 0)
        {
            exit;
        }
        if (!get_option(global.options.auto_journey_finish))
        {
            exit;
        }
        if (self.data.finished < 1)
        {
            exit;
        }
        if (self.can_finish())
        {
            self.finish();
        }
    };
    
    check_level = function()
    {
        if (self.data.level < self.max_level)
        {
            var level_xp = self.get_level_xp(self.data.level, self.data.tier, self.data.finished);
            if (self.data.xp >= level_xp)
            {
                self.data.xp -= level_xp;
                self.data.level++;
                self.check_level();
                exit;
            }
        }
        self.check_upgrade_attributes();
    };
    
    check_upgrade_attributes = function()
    {
        var ua_multiplier = sqrt(self.data.finished);
        self.upgrade_attributes_cache = multiply_struct_values(self.upgrade_attributes, ua_multiplier);
        if (ua_multiplier > 0)
        {
            var __struct = self.static_upgrade_attributes;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                variable_struct_set(self.upgrade_attributes_cache, mkey, mitem);
            }
        }
        self.upgrade_text_cache = format_upgrade_text(self.upgrade_attributes_cache, undefined, undefined, undefined, "\n");
    };
    
    claim_all = function()
    {
        var __array = self.items_array;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (self._can_claim(mitem))
            {
                self.claim(mitem);
            }
        }
    };
    
    claim = function(arg0)
    {
        if (!is_struct(variable_struct_get(self.data.rewards_claimed, arg0.tier)))
        {
            variable_struct_set(self.data.rewards_claimed, arg0.tier, {});
        }
        variable_struct_set(variable_struct_get(self.data.rewards_claimed, arg0.tier), arg0.level, true);
        notify(add_result_lite(arg0.result));
        self.check_upgrade_attributes();
    };
    
    finish = function()
    {
        self.claim_all();
        self.data.finished++;
        self.data.level = 0;
        self.data.rewards_claimed = {};
        self.data.xp = 0;
        self.init_xp_table();
        variable_struct_set(global.selected_inventory_item, self.selection_key, undefined);
        self.check_upgrade_attributes();
    };
    
    _game_loop_second = function(arg0 = 1, arg1 = false)
    {
        self.game_loop_second(arg0, arg1);
    };
    
    game_loop_second = __void;
    has_premium = __return_false;
    
    is_claimed = function(arg0)
    {
        if (!is_struct(variable_struct_get(self.data.rewards_claimed, arg0.tier)))
        {
            return false;
        }
        return !is_undefined(variable_struct_get(variable_struct_get(self.data.rewards_claimed, arg0.tier), arg0.level));
    };
    
    get_level_xp = function(arg0, arg1 = self.data.tier, arg2 = 0)
    {
        var xp_last_tier = 0;
        if (arg1 > 1)
        {
            xp_last_tier = max(0, self.get_level_xp(self.max_level, arg1 - 1, arg2));
        }
        var xp_value = round(self.xp_table_base + (power(arg0, self.xp_table_exp) * power(1.2, arg1) * power(self.xp_table_finish_multiplier, self.data.finished)));
        return xp_last_tier + xp_value;
    };
    
    get_level = function(arg0)
    {
        if (arg0 < self.xp_table[0])
        {
            return 0;
        }
        var __array = self.xp_table;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (arg0 < mitem)
            {
                return __i;
            }
        }
        return self.max_level;
    };
    
    get_next_xp = function(arg0)
    {
        if (arg0 > array_length(self.xp_table))
        {
            return global.max_num;
        }
        return self.xp_table[arg0];
    };
    
    get_xp = function(arg0)
    {
        return arg0;
    };
    
    get_xp_multiplier = function()
    {
        return 1;
    };
    
    get_upgrade_attributes = function()
    {
        if (is_undefined(self.upgrade_attributes_cache))
        {
            self.check_upgrade_attributes();
        }
        return self.upgrade_attributes_cache;
    };
    
    has_premium = __return_false;
    
    _offline_step = function(arg0 = 1, arg1 = false)
    {
        self.offline_step(arg0, arg1);
    };
    
    offline_step = __void;
    set_local_vars(arg0);
}
