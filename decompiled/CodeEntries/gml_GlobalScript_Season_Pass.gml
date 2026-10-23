function Season_Pass(arg0) constructor
{
    name = "";
    description = "";
    index = 0;
    key = "";
    max_level = 100;
    sprite = spr_placeholder;
    data_key = "";
    data = {};
    items_all = [];
    items_f2p = [];
    items_premium = [];
    items_final_f2p = {};
    items_final_premium = {};
    upgrade_attributes = {};
    xp_table_base = 3;
    xp_table_exp = 2;
    xp_table = [];
    
    init = function()
    {
        for (var i = 0; i < self.max_level; i++)
        {
            variable_struct_set(self.items_final_f2p, i, undefined);
            variable_struct_set(self.items_final_premium, i, undefined);
        }
        var __array = self.items_f2p;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            variable_struct_set(self.items_final_f2p, mitem.level, mitem);
            apply_struct_to_struct(variable_struct_get(self.items_final_f2p, mitem.level), 
            {
                id: sprintf("nature_%s_%s", "f2p", mitem.level),
                level: mitem.level,
                result: get_default_struct_value(mitem, "result"),
                type: "f2p",
                upgrade_attributes: get_default_struct_value(mitem, "upgrade_attributes")
            });
            array_push(self.items_all, variable_struct_get(self.items_final_f2p, mitem.level));
        }
        __array = self.items_premium;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            variable_struct_set(self.items_final_premium, mitem.level, mitem);
            apply_struct_to_struct(variable_struct_get(self.items_final_premium, mitem.level), 
            {
                id: sprintf("nature_%s_%s", "premium", mitem.level),
                level: mitem.level,
                result: get_default_struct_value(mitem, "result"),
                type: "premium",
                upgrade_attributes: get_default_struct_value(mitem, "upgrade_attributes")
            });
            array_push(self.items_all, variable_struct_get(self.items_final_premium, mitem.level));
        }
        self.init_xp_table();
    };
    
    _init_late = function()
    {
        self.data = variable_struct_get(o_game.data, self.data_key);
        self.init_late();
        self.check_level();
    };
    
    init_late = __void;
    
    init_xp_table = function()
    {
        self.xp_table = [];
        var last_xp = 0;
        for (var i = 0; i <= self.max_level; i++)
        {
            array_push(self.xp_table, self.get_level_xp(i));
        }
    };
    
    add_xp = function(arg0, arg1 = true)
    {
        self.data.xp += arg0;
        self.data.xp_total += arg0;
        if (arg1)
        {
            self.check_level();
        }
    };
    
    check_level = function()
    {
        if (self.data.level < self.max_level)
        {
            var level_xp = self.get_level_xp(self.data.level);
            if (self.data.xp >= level_xp)
            {
                self.data.xp -= level_xp;
                self.data.level++;
                self.check_level();
                exit;
            }
        }
        self._check_upgrade_attributes();
    };
    
    _check_upgrade_attributes = function()
    {
        self.upgrade_attributes = {};
        var __array = self.items_all;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (is_undefined(mitem.upgrade_attributes))
            {
                continue;
            }
            if (!self.is_claimed(mitem))
            {
                continue;
            }
            add_struct_to_struct(self.upgrade_attributes, mitem.upgrade_attributes);
        }
        self.check_upgrade_attributes();
    };
    
    check_upgrade_attributes = __void;
    
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
        if (arg0.type == "premium" && !self.has_premium())
        {
            return false;
        }
        if (self.data.level < arg0.level)
        {
            return false;
        }
        return self.can_claim();
    };
    
    can_claim = __return_true;
    
    claim = function(arg0)
    {
        variable_struct_set(variable_struct_get(o_game.data.nature_season.rewards_claimed, arg0.type), arg0.level, true);
        notify(add_result(arg0.result, undefined, undefined, true, true));
        self._check_upgrade_attributes();
    };
    
    _game_loop_second = function(arg0 = 1, arg1 = false)
    {
        self.game_loop_second(arg0, arg1);
    };
    
    game_loop_second = __void;
    has_premium = __return_false;
    
    is_claimed = function(arg0)
    {
        return !is_undefined(variable_struct_get(variable_struct_get(o_game.data.nature_season.rewards_claimed, arg0.type), arg0.level));
    };
    
    get_level_xp = function(arg0)
    {
        return round(self.xp_table_base + power(arg0, self.xp_table_exp));
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
        return self.upgrade_attributes;
    };
    
    has_premium = __return_false;
    
    _offline_step = function(arg0 = 1, arg1 = false)
    {
        self.offline_step(arg0, arg1);
    };
    
    offline_step = __void;
    set_local_vars(arg0);
    set_sprite_data(self);
    init();
}
