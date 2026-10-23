function Skill_Node(arg0) constructor
{
    data = 
    {
        level: 0
    };
    description = "";
    description_cache = undefined;
    description_prefix = "";
    has_parent_nodes = false;
    id = "";
    index = 0;
    key = "";
    max_level = 0;
    min_sc_level = 0;
    min_sc_level_start = 0;
    min_sc_level_modifier = 15;
    name = "";
    parent_nodes = [];
    parent_nodes_min_level = 1;
    show_upgrade_description_modifier = true;
    skill_tree = undefined;
    sprite = spr_solid;
    upgrade_attributes = undefined;
    upgrade_attributes_cache = undefined;
    upgrade_base_cost = 10;
    upgrade_cost_exp = 1.2;
    upgrade_cost_material = global.materials.shadow_crystal;
    upgrade_refresh_duration = sec(60);
    upgrade_refresh_timer = 0;
    
    _init = function()
    {
        self.key = self.id;
        var tmp_sprite = self.sprite;
        self.sprite = asset_get_index(tmp_sprite);
        if (self.sprite == -1)
        {
            self.sprite = spr_solid;
        }
        self.has_parent_nodes = array_length(self.parent_nodes) > 0;
        self.min_sc_level_start = self.min_sc_level;
        self.min_sc_level *= self.min_sc_level_modifier;
        if (global.debug)
        {
            self.name += sprintf(" [%s]", self.id);
        }
        self.init();
    };
    
    init = __void;
    
    can_upgrade = function(arg0 = 1)
    {
        if (self.max_level > 0 && self.data.level >= self.max_level)
        {
            return false;
        }
        if (!self.check_min_sc_level())
        {
            return false;
        }
        if (!has_enough(self.get_upgrade_cost(arg0)))
        {
            return false;
        }
        if (self.has_parent_nodes)
        {
            var __array = self.parent_nodes;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                if (mitem.data.level < self.parent_nodes_min_level)
                {
                    return false;
                }
            }
        }
        return true;
    };
    
    check_min_sc_level = function()
    {
        if (self.min_sc_level > 0 && global.shadow_crystal.data.highest_defeat_level < self.min_sc_level)
        {
            return false;
        }
        return true;
    };
    
    get_upgrade_cost = function(arg0 = 1)
    {
        var value = calculate_item_cost_lite(self.upgrade_base_cost * (self.min_sc_level_start + 1), self.upgrade_cost_exp, arg0, self.data.level);
        value = rround(value);
        var ulc_value = calculate_item_cost_lite(15 * (self.min_sc_level_start + 1), 1.5, arg0, self.data.level);
        ulc_value = rround(ulc_value);
        var cost = 
        {
            materials: build_resource_cost(self.upgrade_cost_material, value),
            resources: 
            {
                ulc: ulc_value
            }
        };
        return cost;
    };
    
    upgrade = function(arg0 = 1)
    {
        dec_result(self.get_upgrade_cost(arg0));
        self.data.level += arg0;
        self.refresh_upgrade_attributes();
        self.skill_tree.refresh_upgrade_attributes();
    };
    
    get_name = function()
    {
        return get_general_name(self.name, self.data.level, self.max_level);
    };
    
    get_description = function()
    {
        if (is_undefined(self.description_cache))
        {
            self.description_cache = get_general_description(self);
        }
        return self.description_cache;
    };
    
    get_tooltip = function()
    {
        if (self.min_sc_level > 0 && !self.check_min_sc_level())
        {
            return __s("Defeat %s level %s.", __("Shadow Crystal"), self.min_sc_level);
        }
        if (self.has_parent_nodes)
        {
            var __array = self.parent_nodes;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                if (mitem.data.level < 1)
                {
                    return __s("Unlock all previous nodes.");
                }
            }
        }
        return self.get_name();
    };
    
    get_upgrade_attributes = function(arg0 = false)
    {
        if (is_undefined(self.upgrade_attributes_cache) || arg0)
        {
            self.refresh_upgrade_attributes();
        }
        return self.upgrade_attributes_cache;
    };
    
    is_obfuscated = function()
    {
        if (!self.check_min_sc_level())
        {
            return true;
        }
        if (self.has_parent_nodes)
        {
            var __array = self.parent_nodes;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                if (mitem.data.level < 1)
                {
                    return true;
                }
            }
        }
        return false;
    };
    
    refresh_upgrade_attributes = function()
    {
        self.description_cache = undefined;
        self.upgrade_attributes_cache = multiply_struct_values(self.upgrade_attributes, self.data.level);
    };
    
    load_data = function(arg0)
    {
        apply_struct_to_struct(self.data, arg0);
        self.data.level = min(self.data.level, self.max_level);
        self.load_data_after();
        self.init();
    };
    
    load_data_after = __void;
    set_local_vars(arg0);
    self._init();
}
