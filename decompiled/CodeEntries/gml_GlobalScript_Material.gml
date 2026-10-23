function Material(arg0) : Collectable_Usable_Object(arg0) constructor
{
    count_overflow = false;
    daily_reward_modifier = 1;
    decimal = false;
    essence = false;
    fractional = true;
    game_item_type = UnknownEnum.Value_7;
    generatable_in_quests = true;
    is_usable = false;
    material_type = "common";
    max_count = get_material_max_count();
    persist_prestige_level = global.prestige_levels.none.level;
    spawn_area = undefined;
    spawn_chance = global.game_settings.material_spawn_chance_base;
    spawnable = true;
    unlocked = true;
    
    init = function()
    {
        if (is_undefined(self.spawn_area) || !self.spawnable)
        {
            self.generatable_in_quests = false;
            self.spawn_chance = 0;
        }
        if (self.essence)
        {
            self.material_type = "essence";
        }
    };
    
    can_generate_in_quests = function()
    {
        return self.generatable_in_quests;
    };
    
    _can_spawn = function(arg0 = o_game.area)
    {
        if (!self.is_spawnable())
        {
            return false;
        }
        if (self.data.count >= get_material_max_count())
        {
            return false;
        }
        if ((is_undefined(self.spawn_area) || arg0.key != self.spawn_area.key) && arg0.key != global.areas.dark_glade.key)
        {
            return false;
        }
        return self.can_spawn();
    };
    
    can_spawn = __return_true;
    
    get_display_count = function()
    {
        var text = number_format(self.data.count);
        return text;
    };
    
    get_max_count = function()
    {
        return get_material_max_count(self.key);
    };
    
    get_spawn_chance_base = function()
    {
        if (!self.spawnable)
        {
            return 0;
        }
        var spawn_chance_material = self.spawn_chance + get_upgrade_attribute_value(global.upgrade_attributes.material_spawn_chance_add_base) + get_upgrade_attribute_value(variable_struct_get(global.upgrade_attributes.material_spawn_chance_add_base_single, self.key));
        var spawn_chance = spawn_chance_material;
        spawn_chance *= (1 + get_upgrade_attribute_value(global.upgrade_attributes.material_spawn_chance_multiplier));
        spawn_chance *= (1 + get_upgrade_attribute_value(global.upgrade_attributes.material_spawn_chance_multiplier_gems));
        spawn_chance *= (1 + get_upgrade_attribute_value(global.upgrade_attributes.material_spawn_chance_multiplier_scroll));
        spawn_chance = clamp(spawn_chance, 0, 100);
        return spawn_chance;
    };
    
    get_spawn_chance = function()
    {
        if (!self._can_spawn())
        {
            return 0;
        }
        var spawn_chance = self.get_spawn_chance_base();
        if (o_game.area.key == global.areas.dark_glade.key)
        {
            spawn_chance *= 0.25;
        }
        return spawn_chance;
    };
    
    get_spawn_description = function()
    {
        if (get_upgrade_count(global.shops.blc.material_inspector) <= 0)
        {
            return "";
        }
        var desc_info = [];
        if (!is_undefined(self.spawn_area))
        {
            array_push(desc_info, __s("Spawns in %s", self.spawn_area.name));
        }
        if (self.is_spawnable())
        {
            var spawn_chance = self.get_spawn_chance();
            var current_spawn_chance_text = iif(spawn_chance < 0.0001 && spawn_chance != 0, "<0.01%", number_format_percent(spawn_chance));
            if (self.data.count >= self.get_max_count())
            {
                current_spawn_chance_text = sprintf("0% (%s)", __("storage full"));
            }
            var mat_per_hour = 3600 * spawn_chance * (1 + get_upgrade_attribute_value(global.upgrade_attributes.material_spawn_count));
            array_push(desc_info, __s("Base spawn chance: %s", number_format_percent(self.get_spawn_chance_base())));
            array_push(desc_info, __s("Current spawn chance: %s", current_spawn_chance_text));
            array_push(desc_info, __s("Materials per hour: %s", "~" + string(mat_per_hour)));
        }
        else
        {
            array_push(desc_info, __("Does not spawn"));
        }
        return implode("\n", desc_info);
    };
    
    get_tooltip = function()
    {
        var desc = "";
        if (self.data.unlocked)
        {
            desc = self.get_description();
        }
        if (!is_empty(desc))
        {
            desc += "\n";
        }
        desc += self.get_spawn_description();
        var text = concatstr_nl(self.get_name(), "------", desc);
        return text;
    };
    
    is_essence = function()
    {
        return self.essence;
    };
    
    is_spawnable = function()
    {
        return self.spawnable;
    };
    
    list_button_click = function()
    {
        if (!keyboard_check(vk_shift))
        {
            exit;
        }
        if (is_undefined(self.spawn_area) || !self.is_spawnable())
        {
            exit;
        }
        if (!self.spawn_area.can_teleport())
        {
            exit;
        }
        if (get_upgrade_count(global.shops.blc.material_inspector) == 0)
        {
            return false;
        }
        change_area(self.spawn_area);
    };
    
    set_local_vars(arg0);
    set_sprite_data(self);
    _init();
}

enum UnknownEnum
{
    Value_7 = 7
}
