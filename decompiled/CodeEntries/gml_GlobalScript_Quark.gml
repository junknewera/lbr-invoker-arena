function Quark(arg0) : Game_Object(arg0) constructor
{
    data = undefined;
    key = "";
    name = "";
    name_full = "";
    data_start = 
    {
        count: 0,
        fail: 0,
        success: 0
    };
    cost_cache = undefined;
    upgrade_attributes = {};
    upgrade_attributes_cache = {};
    
    init = function()
    {
        self.name_full = sprintf("%s %s", self.name, __("Quark"));
    };
    
    init_late = function()
    {
        self.data = variable_struct_get(o_game.data.quarks.quarks, self.key);
        struct_apply_defaults(self.data, self.data_start, true);
        self.refresh_cache();
    };
    
    add = function(arg0 = 1, arg1 = true, arg2 = false)
    {
        self.data.count += arg0;
        if (arg1)
        {
            var text = sprintf("%s +%s", self.name_full, arg0);
            if (arg2)
            {
                text = sprintf("%s! %s", __s("Multi add"), text);
            }
            notify(text);
        }
        self.refresh_cache();
    };
    
    add_by_chance = function(arg0 = 1, arg1 = true)
    {
        random_set_seed(o_game.data.quarks.quark_seed + ++o_game.data.quarks.quark_add_counter + self.data.count + (self.data.fail * 42) + (self.data.success * 69));
        var c = arg0;
        arg0 = get_bm_value(arg0, "quark_reactor_add_quark", "quark_reactor_add_quark_multiplier", undefined, true);
        var multi = multi_chance(self.get_add_chance() * 100, undefined, 100);
        arg0 *= multi;
        var success = arg0 > 0;
        var cost = self.get_add_cost();
        dec_result(cost);
        o_game.data.quarks.reactor.count -= min(o_game.data.quarks.reactor.count, get_cache("quark_reactor_size", 1));
        if (success)
        {
            self.data.success++;
            self.add(arg0, arg1, multi > 1);
        }
        else
        {
            self.data.fail++;
            if (arg1)
            {
                notify(__s("%s addition failed.", self.name_full));
            }
        }
        randomize();
        return success;
    };
    
    can_add = function()
    {
        if (o_game.data.quarks.reactor.count < 0.1)
        {
            return false;
        }
        if (!has_enough(self.cost_cache))
        {
            return false;
        }
        return true;
    };
    
    get_add_chance = function()
    {
        var reactor_value = min(o_game.data.quarks.reactor.count, get_cache("quark_reactor_size", 1));
        reactor_value *= (1 + (global.game_settings.quark_quantum_blob_add_chance * global.resources.quantum_blob.data.count));
        var value = get_bm_value(reactor_value / max(1, self.data.count), "quark_reactor_add_chance", "quark_reactor_add_chance_multiplier", undefined, true);
        value = min(5, value);
        return value;
    };
    
    get_add_cost = function()
    {
        if (is_struct(self.cost_cache))
        {
            return self.cost_cache;
        }
        var value = self.get_add_cost_value();
        var cost = 
        {
            resources: 
            {
                quark: value
            }
        };
        self.cost_cache = cost;
        return self.cost_cache;
    };
    
    get_add_cost_value = function()
    {
        var value = 300 + (300 * power(self.data.count, 1.5));
        return value;
    };
    
    get_next_add_count = function(arg0 = 1)
    {
        var value = arg0 + self.data.count;
        return value;
    };
    
    refresh_cache = function()
    {
        var value = self.data.count;
        self.upgrade_attributes_cache = 
        {
            quark_damage: value
        };
        self.cost_cache = undefined;
        self.get_add_cost();
    };
    
    set_local_vars(arg0);
    self.init();
}
