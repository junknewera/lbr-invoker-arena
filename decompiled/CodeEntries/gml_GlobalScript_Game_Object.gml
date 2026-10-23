function Game_Object(arg0 = undefined) : Savable_Object(arg0) constructor
{
    data = {};
    description = "";
    has_upgrade_attributes = false;
    has_upgrades = false;
    index = 0;
    key = "";
    material = undefined;
    name = "";
    paging_id = undefined;
    resource = undefined;
    sprite = spr_placeholder;
    upgrade_attributes = {};
    upgrade_attributes_cache = undefined;
    upgrade_max_level = 1;
    upgrade_refresh_duration = sec(30);
    upgrade_refresh_timer = 0;
    upgrades = {};
    upgrades_array = [];
    
    _init = function()
    {
        self.init();
        self.init_data_upgrades();
        self.upgrades_array = struct_to_sorted_array(self.upgrades);
        self.has_upgrade_attributes = get_struct_length(self.upgrade_attributes) > 0;
        self.has_upgrades = array_length(self.upgrades_array) > 0;
    };
    
    init = __void;
    
    init_data_upgrades = function()
    {
        add_keys_to_struct(self.upgrades);
        var __struct = self.upgrades;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            variable_struct_set(self.data, mkey, 0);
        }
    };
    
    _init_late = function()
    {
        self.init_late();
    };
    
    init_late = __void;
    
    after_salvage = function()
    {
        clear_selected_item(self.paging_id, self);
    };
    
    get_description = function()
    {
        return get_value_ext(self, self.description);
    };
    
    get_name = function()
    {
        return get_value_ext(self, self.name);
    };
    
    get_upgrade_attributes = function(arg0 = false)
    {
        if (is_undefined(self.upgrade_attributes_cache) || arg0 || self.upgrade_refresh_timer >= o_game.data.stats.time_elapsed)
        {
            self.refresh_upgrade_attributes();
        }
        return self.upgrade_attributes_cache;
    };
    
    refresh_cache = __void;
    
    refresh_upgrade_attributes = function()
    {
        self.upgrade_attributes_cache = {};
        var __struct = self.upgrades;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var final_value = self.get_upgrade_value(mkey);
            if (get_default_struct_value(mitem, "add_self_key", false))
            {
                variable_struct_set(self.upgrade_attributes_cache, mkey, {});
                variable_struct_set(variable_struct_get(self.upgrade_attributes_cache, mkey), self.key, final_value);
            }
            else
            {
                variable_struct_set(self.upgrade_attributes_cache, mkey, final_value);
            }
        }
        self.refresh_upgrade_attributes_after();
        self.upgrade_refresh_timer = o_game.data.stats.time_elapsed + self.upgrade_refresh_duration;
    };
    
    refresh_upgrade_attributes_after = __void;
    
    can_upgrade = function(arg0, arg1 = 1)
    {
        var item_level = get_default_struct_value(self.data, arg0, 0);
        var cost = self.get_upgrade_cost(arg0, arg1);
        var max_level = self.get_max_upgrade_level(arg0);
        if (max_level > 0 && item_level >= max_level)
        {
            return false;
        }
        if (!is_undefined(cost) && !has_enough(cost))
        {
            return false;
        }
        return true;
    };
    
    get_max_upgrade_level = function(arg0 = undefined)
    {
        var value = self.upgrade_max_level;
        if (!is_undefined(arg0))
        {
            value = get_default_struct_value(variable_struct_get(self.upgrades, arg0), "max_level", value);
        }
        return value;
    };
    
    get_upgrade_cost = function(arg0, arg1 = 1)
    {
        var upgrade_struct = variable_struct_get(self.upgrades, arg0);
        var base_cost = get_default_struct_value(upgrade_struct, "base_cost", 1);
        var cost_exp = get_default_struct_value(upgrade_struct, "cost_exp", 2);
        var upgrade_level_name = get_default_struct_value(upgrade_struct, "data_name", arg0);
        var upgrade_level = variable_struct_get(self.data, upgrade_level_name);
        var material = get_default_struct_value(upgrade_struct, "cost_material", self.material);
        var resource = get_default_struct_value(upgrade_struct, "cost_resource", self.resource);
        var value = calculate_item_cost_lite(base_cost, cost_exp, arg1, upgrade_level);
        value = rround(value);
        var cost = {};
        if (is_struct(material))
        {
            cost.materials = build_resource_cost(material, value);
        }
        if (is_struct(resource))
        {
            cost.resources = build_resource_cost(resource, value);
        }
        return cost;
    };
    
    get_upgrade_data = function(arg0)
    {
        var upgrade_struct = variable_struct_get(self.upgrades, arg0);
        var data_name = get_default_struct_value(upgrade_struct, "data_name", arg0);
        return variable_struct_get(self.data, data_name);
    };
    
    get_upgrade_description = function(arg0)
    {
        var upgrade_struct = variable_struct_get(self.upgrades, arg0);
        var upgrade_level_name = get_default_struct_value(upgrade_struct, "data_name", arg0);
        var upgrade_text = get_default_struct_value(upgrade_struct, "upgrade_text", undefined);
        if (is_string(upgrade_text))
        {
            upgrade_level_name = upgrade_text;
        }
        return format_upgrade_text(build_struct(upgrade_level_name, upgrade_struct.value));
    };
    
    self.get_upgrade_name = function(arg0)
    {
        var upgrade_struct = variable_struct_get(self.upgrades, arg0);
        var data_name = get_default_struct_value(upgrade_struct, "data_name", upgrade_struct);
        var name = sprintf("%s [%s/%s]", variable_struct_get(self.upgrades, arg0).name, self.get_upgrade_data(arg0), self.get_max_upgrade_level(arg0));
        if (self.get_max_upgrade_level(arg0) == 0)
        {
            name = sprintf("%s [%s]", variable_struct_get(self.upgrades, arg0).name, self.get_upgrade_data(arg0));
        }
        return name;
    };
    
    get_upgrade_value = function(arg0)
    {
        if (is_undefined(variable_struct_get(self.upgrades, arg0)))
        {
            return 0;
        }
        return variable_struct_get(self.upgrades, arg0).value * self.get_upgrade_data(arg0);
    };
    
    upgrade = function(arg0, arg1 = 1)
    {
        var cost = self.get_upgrade_cost(arg0, arg1);
        dec_result(cost);
        var upgrade_struct = variable_struct_get(self.upgrades, arg0);
        var data_name = get_default_struct_value(upgrade_struct, "data_name", arg0);
        variable_struct_set(self.data, data_name, variable_struct_get(self.data, data_name) + arg1);
        self.refresh_upgrade_attributes();
    };
    
    set_local_vars(arg0);
    self._init();
}
