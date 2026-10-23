function Unique_Leaf(arg0) : Upgradable_Item(arg0) constructor
{
    armor = 9999999;
    description_cache = "";
    description_locked = "";
    generatable_in_quests = true;
    init_index = 0;
    max_count = 0;
    required_amount = 0;
    required_area = undefined;
    required_floor = undefined;
    required_pet = undefined;
    required_resource = undefined;
    required_tool = undefined;
    sprite = spr_placeholder;
    sprite_orig = spr_placeholder;
    spawn_area = global.areas.garden;
    upgrade_value = 0;
    upgrade_value_text = 0;
    apply_upgrade_attributes_when_active = true;
    button_text_use = __("Activate");
    button_text_using = __("Deactivate");
    button_use_width = gui_col_x(2.5);
    can_use_when_active = true;
    decrease_count_on_use = false;
    fractional = false;
    use_duration = false;
    use_toggle = true;
    add_bonus_upgrade_multiplier = true;
    add_upgrade_multiplier = true;
    max_upgrade_level = global.game_settings.unique_max_upgrade_level_base;
    max_upgrade_multiplier = 10;
    unlock_cost_base = global.game_settings.unique_unlock_cost_base;
    upgrade_attributes_apply_early = false;
    upgrade_cost_base = global.game_settings.unique_upgrade_cost_base;
    upgrade_cost_exp = global.game_settings.unique_upgrade_cost_exp;
    upgrade_cost_special_divider = 70;
    upgrade_cost_special_level = 10;
    upgrade_count_max = {};
    upgrade_material = global.materials.essence_cosmic;
    upgrade_attributes_apply_mid = true;
    upgrade_attributes_apply_mid_index = 0;
    upgrade_multiplier = global.game_settings.unique_upgrade_multiplier;
    set_sprite_data(self);
    
    init = function()
    {
        if (self.data.count > 0)
        {
            self.data.unlocked = true;
        }
        var __struct = self.upgrade_attributes;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            if (is_struct(mitem))
            {
                if (is_undefined(variable_struct_get(self.upgrade_count_max, mkey)))
                {
                    variable_struct_set(self.upgrade_count_max, mkey, {});
                }
                var __struct2 = mitem;
                var __prop_names2 = struct_get_names(__struct2);
                var __prop_len2 = array_length(__prop_names2);
                for (var __i2 = 0; __i2 < __prop_len2; __i2++)
                {
                    var mkey2 = __prop_names2[__i2];
                    var mitem2 = variable_struct_get(__struct2, mkey2);
                    variable_struct_set(variable_struct_get(self.upgrade_count_max, mkey), mkey2, 10);
                }
            }
            else
            {
                variable_struct_set(self.upgrade_count_max, mkey, 10);
            }
        }
    };
    
    activate = function(arg0 = true)
    {
        self.set_active();
        global.refresh_game_vars = true;
        self.func();
    };
    
    deactivate = function(arg0 = true)
    {
        self.set_inactive();
        global.refresh_game_vars = true;
        self.func();
    };
    
    button_text_use = function()
    {
        return iif(self.is_active(), __("Deactivate"), __("Activate"));
    };
    
    can_activate = function()
    {
        if (self.data.count == 0)
        {
            return false;
        }
        if (self.is_active())
        {
            return true;
        }
        var ul_active = _sum(global.unique_leaves_sorted, function(arg0)
        {
            return arg0.is_active();
        });
        var max_unique_leaves = get_max_concurrent_unique_leaves();
        return ul_active < max_unique_leaves;
    };
    
    check = function()
    {
        return false;
    };
    
    func = function()
    {
    };
    
    progress = function()
    {
        return 0;
    };
    
    get_max_upgrade_level = function()
    {
        return self.max_upgrade_level + get_upgrade_attribute_value(global.upgrade_attributes.unique_max_upgrade_level);
    };
    
    get_bonus_upgrade_attributes = function()
    {
        if (!self.is_upgrade_unlocked())
        {
            exit;
        }
        var level = self.get_upgrade_level();
        var upgrade_attributes = self.upgrade_attributes_upgrade;
        if (level >= 10)
        {
            upgrade_attributes.blower_enemy_damage_multiplier_blower = floor(level / 4) * (1 + get_upgrade_attribute_value(global.upgrade_attributes.unique_damage_upgrade));
            upgrade_attributes.material_autocollect = ((level / 20) * 0.02) / level;
        }
        else
        {
            upgrade_attributes.blower_enemy_damage_multiplier_blower = undefined;
        }
        return upgrade_attributes;
    };
    
    is_upgrade_unlock_visible = function()
    {
        return self.data.count > 0;
    };
    
    build_description = function()
    {
        var desc = get_value_ext(self, self.description);
        var area_name = get_key2_from_struct(global.areas, self.required_area, "name", "");
        var pet_name = get_key2_from_struct(global.pets, self.required_pet, "name", "");
        var resource_name = get_key2_from_struct(global.resources, self.required_resource, "name", "");
        var tool_name = get_key2_from_struct(global.shops.weapons, self.required_tool, "name", "");
        if (is_empty(tool_name))
        {
            tool_name = __("any tool");
        }
        if (is_empty(desc))
        {
            desc = __("You used [thetool] in [area]");
            if (!is_undefined(self.required_floor))
            {
                desc += (" " + __("floor [tower_floor]"));
            }
            if (!is_undefined(self.required_amount) && !is_undefined(self.required_resource))
            {
                desc += (" " + __("while having [amount] [resource]"));
            }
            if (!is_undefined(self.required_pet))
            {
                desc += (" " + __("while [pet] is active"));
            }
            desc += ".\n[upgrade_text]";
        }
        desc = textr(desc, 
        {
            amount: number_format(self.required_amount),
            area: area_name,
            pet: pet_name,
            resource: resource_name,
            thetool: text_the(tool_name, true),
            tool: tool_name,
            tower_floor: self.required_floor,
            upgrade_text: format_upgrade_text(self.upgrade_attributes),
            value: self.upgrade_value_text
        });
        self.description_cache = desc;
    };
    
    get_description = function()
    {
        if (get_upgrade_count(self) == 0)
        {
            return self.description_locked;
        }
        self.build_description();
        return self.description_cache;
    };
    
    get_name = function()
    {
        if (!self.is_unlocked())
        {
            return "?";
        }
        return self._get_name();
    };
    
    set_local_vars(arg0);
    _init();
}
