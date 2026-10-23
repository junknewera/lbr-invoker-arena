function Upgradable_Item(arg0) : Collectable_Usable_Object(arg0) constructor
{
    add_bonus_upgrade_multiplier = false;
    add_upgrade_multiplier = false;
    bonus_multiplier = 0.1;
    cost_cache = {};
    cost_cache_level = -1;
    max_upgrade_level = 10;
    max_upgrade_multiplier = undefined;
    upgradable = true;
    upgrade_attributes = {};
    upgrade_attributes_upgrade = {};
    upgrade_attributes_max = {};
    upgrade_material = global.materials.screw;
    upgrade_multiplier = 0.1;
    upgrade_override_value = {};
    upgrade_value_add = {};
    unlock_cost_base = 100;
    upgrade_cost_base = 30;
    upgrade_cost_exp = 1.3;
    upgrade_cost_result = 
    {
        materials: {},
        resources: {}
    };
    upgrade_cost_special_divider = 60;
    upgrade_cost_special_level = 0;
    upgrade_cost_special_material = global.materials.essence_dark;
    
    _can_unlock_upgrade = function()
    {
        return get_upgrade_count(self) > 0 && !self.is_upgrade_unlocked() && has_enough_materials(self.get_unlock_upgrade_cost()) && self.can_unlock_upgrade();
    };
    
    can_unlock_upgrade = __return_true;
    
    can_upgrade = function(arg0 = 1)
    {
        if (!self.is_upgrade_unlocked())
        {
            return false;
        }
        if ((self.data.level + arg0) > self.get_max_upgrade_level())
        {
            return false;
        }
        return has_enough_materials(self.get_upgrade_cost(arg0));
    };
    
    get_max_upgrade_level = function()
    {
        return self.max_upgrade_level;
    };
    
    get_unlock_upgrade_cost = function()
    {
        return build_resource_cost(self.upgrade_material, self.unlock_cost_base);
    };
    
    _get_bonus_upgrade_attributes = function()
    {
        if (!self.is_upgrade_unlocked())
        {
            exit;
        }
        return self.get_bonus_upgrade_attributes();
    };
    
    get_bonus_upgrade_attributes = __void;
    
    get_bonus_upgrade_multiplier = function()
    {
        if (!self.is_upgrade_unlocked())
        {
            return 0;
        }
        return self.bonus_multiplier * self.get_upgrade_level();
    };
    
    get_upgrade_attributes = function()
    {
        if (self.data.count == 0)
        {
            exit;
        }
        return self.upgrade_attributes;
    };
    
    get_upgrade_multiplier = function()
    {
        if (!self.is_upgrade_unlocked())
        {
            return 0;
        }
        var multiplier = self.upgrade_multiplier * self.get_upgrade_level();
        if (!is_undefined(self.max_upgrade_multiplier))
        {
            multiplier = min(multiplier, self.upgrade_multiplier * self.max_upgrade_multiplier);
        }
        return multiplier;
    };
    
    _get_upgrade_cost = function(arg0 = 1)
    {
        if (self.cost_cache_level != self.data.level)
        {
            self.cost_cache = {};
            self.cost_cache_level = self.data.level;
        }
        if (!is_undefined(variable_struct_get(self.cost_cache, arg0)))
        {
            return variable_struct_get(self.cost_cache, arg0);
        }
        variable_struct_set(self.cost_cache, arg0, {});
        for (var loop_level = self.data.level; loop_level < (self.data.level + arg0); loop_level++)
        {
            var cost = self.upgrade_cost_base * power(loop_level, self.upgrade_cost_exp);
            if (self.upgrade_cost_special_level > 0 && loop_level > self.upgrade_cost_special_level && ((loop_level + 1) % self.upgrade_cost_special_level) == 0)
            {
                cost = global.costs.blower_upgrade_base * power(loop_level / self.upgrade_cost_special_divider, global.costs.blower_upgrade_exp);
                cost = ceil(cost);
                add_to_struct_value(variable_struct_get(self.cost_cache, arg0), self.upgrade_cost_special_material.key, cost);
            }
            else
            {
                if (!self.fractional)
                {
                    cost = ceil(cost);
                }
                add_to_struct_value(variable_struct_get(self.cost_cache, arg0), self.upgrade_material.key, cost);
            }
        }
        return variable_struct_get(self.cost_cache, arg0);
    };
    
    get_upgrade_cost = self._get_upgrade_cost;
    
    get_upgrade_level = function()
    {
        return self.data.level;
    };
    
    is_upgrade_unlocked = function()
    {
        return self.data.upgrade_unlocked;
    };
    
    is_upgrade_unlock_visible = __return_true;
    
    is_upgradable = function()
    {
        if (self.get_upgrade_level() >= self.get_max_upgrade_level())
        {
            return false;
        }
        return self.upgradable;
    };
    
    unlock_upgrade = function()
    {
        if (!self._can_unlock_upgrade())
        {
            exit;
        }
        dec_materials(self.get_unlock_upgrade_cost());
        self.data.upgrade_unlocked = true;
    };
    
    upgrade = function(arg0 = 1)
    {
        repeat (arg0)
        {
            if (!self.can_upgrade())
            {
                exit;
            }
            dec_materials(self.get_upgrade_cost());
            self.data.level++;
        }
    };
    
    _get_name = function()
    {
        var name = "";
        var prefix = self.get_name_prefix();
        if (!is_undefined(prefix))
        {
            name += prefix;
        }
        name += get_value_ext(self, self.name, false);
        if (self.is_upgrade_unlocked())
        {
            name += sprintf(" [%s/%s]", self.get_upgrade_level(), self.get_max_upgrade_level());
        }
        var suffix = self.get_name_suffix();
        if (!is_undefined(suffix))
        {
            name += suffix;
        }
        return name;
    };
    
    get_name = self._get_name;
    get_name_prefix = __void;
    get_name_suffix = __void;
    
    _get_description = function()
    {
        var desc = get_value_ext(self, self.description, false);
        return desc;
    };
    
    get_description = self._get_description;
    
    get_tooltip = function()
    {
        return self.get_name();
    };
    
    get_upgrade_description = function(arg0 = ", ")
    {
        var desc = "";
        if (self.is_upgrade_unlocked())
        {
            if (self.add_bonus_upgrade_multiplier)
            {
                desc += sprintf("%s", format_upgrade_text(self.get_bonus_upgrade_attributes(), self.get_upgrade_level(), true, self, arg0));
            }
            if (self.add_upgrade_multiplier)
            {
                if (!is_empty(desc))
                {
                    desc += arg0;
                }
                desc += sprintf("%s", format_upgrade_text(self.get_upgrade_attributes(), self.get_upgrade_multiplier(), true, self, arg0));
            }
        }
        return desc;
    };
}
