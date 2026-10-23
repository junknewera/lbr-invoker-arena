function Equipment_Item(arg0) : Upgradable_Item(arg0) constructor
{
    game_item_type = UnknownEnum.Value_5;
    diggable = true;
    drop_areas = [global.areas.tower];
    droppable = true;
    drop_tower_floor = 0;
    fractional = false;
    is_usable = false;
    max_count = 100;
    unlocked = true;
    upgrade_attributes = {};
    upgrade_value_single = 0;
    add_bonus_upgrade_multiplier = true;
    add_upgrade_multiplier = true;
    max_upgrade_level = global.game_settings.equipment_max_upgrade_level_base;
    max_upgrade_multiplier = 10;
    unlock_cost_base = global.game_settings.equipment_unlock_cost_base;
    upgrade_cost_base = global.game_settings.equipment_upgrade_cost_base;
    upgrade_cost_exp = global.game_settings.equipment_upgrade_cost_exp;
    upgrade_cost_special_divider = 70;
    upgrade_cost_special_level = 10;
    upgrade_count_max = {};
    upgrade_material = global.materials.essence_water;
    upgrade_multiplier = global.game_settings.equipment_upgrade_multiplier;
    upgrades = {};
    
    init = function()
    {
        if (self.max_count != 0)
        {
            var __struct = self.upgrade_attributes;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                variable_struct_set(self.upgrade_count_max, mkey, 10);
            }
        }
    };
    
    _can_drop = function()
    {
        if (!self.droppable)
        {
            return false;
        }
        return self.can_drop();
    };
    
    can_drop = function()
    {
        if (global.current_tower_floor < self.drop_tower_floor)
        {
            return false;
        }
        if (!self.check_max_count())
        {
            return false;
        }
        return true;
    };
    
    check_max_count = function()
    {
        if (self.max_count == 0)
        {
            return true;
        }
        return self.data.count < self.max_count;
    };
    
    collect = function(arg0 = 1)
    {
        arg0 = round(arg0);
        self.data.collected += arg0;
        self.data.count += arg0;
        if (self.max_count != 0)
        {
            self.data.count = clamp(self.data.count, 0, self.max_count);
        }
    };
    
    get_bonus_upgrade_attributes = function()
    {
        if (!self.is_upgrade_unlocked())
        {
            exit;
        }
        var level = self.get_upgrade_level();
        var upgrade_attributes = self.upgrade_attributes_upgrade;
        if (level >= 1)
        {
            upgrade_attributes.blower_enemy_damage_multiplier_blower = ceil(level / 4) * (1 + get_upgrade_attribute_value(global.upgrade_attributes.equipment_damage_upgrade));
        }
        else
        {
            upgrade_attributes.blower_enemy_damage_multiplier_blower = undefined;
        }
        return upgrade_attributes;
    };
    
    get_max_upgrade_level = function()
    {
        return self.max_upgrade_level + get_upgrade_attribute_value(global.upgrade_attributes.equipment_max_upgrade_level);
    };
    
    is_obfuscated = function()
    {
        return !self.is_unlocked();
    };
    
    is_unlocked = function()
    {
        return self.data.collected > 0;
    };
    
    is_upgrade_unlock_visible = function()
    {
        return self.data.count > 0;
    };
    
    get_name = function()
    {
        if (!self.is_unlocked())
        {
            return "?";
        }
        var text = sprintf("%s [%s]", get_value_ext(self, self.name, false), number_format(get_upgrade_count(self)));
        if (self.max_count != 0)
        {
            text = sprintf("%s [%s/%s]", get_value_ext(self, self.name, false), number_format(get_upgrade_count(self)), number_format(self.max_count));
        }
        if (self.is_upgrade_unlocked() > 0)
        {
            text += sprintf(" [LVL %s/%s]", self.get_upgrade_level(), self.get_max_upgrade_level());
        }
        return text;
    };
    
    get_description = function()
    {
        if (!self.is_unlocked())
        {
            return "?";
        }
        var desc = get_value_ext(self, self.description, false);
        return desc;
    };
    
    set_local_vars(arg0);
    set_sprite_data(self);
    init();
}

enum UnknownEnum
{
    Value_5 = 5
}
