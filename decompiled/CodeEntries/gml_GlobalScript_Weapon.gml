function Weapon(arg0) : Upgradable_Item(arg0) constructor
{
    name = "";
    description = "";
    index = 0;
    key = "";
    sprite = spr_placeholder;
    data_defaults = 
    {
        auto_upgrade_enabled: false,
        auto_upgrade_prio_user: 1,
        collected: 0,
        count: 0,
        inventory: 0,
        max_buy_user: -1,
        slider_value: 0,
        toggle: false,
        upgrade_level: 0
    };
    action_distance = 0;
    action_timeout = sec(3);
    alb_equippable = true;
    available = false;
    can_blow = true;
    can_damage_enemy = false;
    can_dig = false;
    can_juice = false;
    can_mulch = false;
    cost = 
    {
        leaves: 1
    };
    damage = 1;
    damage_base = 1;
    dig_count = 0;
    dig_level = 0;
    inverse = false;
    size = 1;
    is_buyable = true;
    is_static = true;
    is_sword = false;
    is_usable = true;
    scale = 3.5;
    type = global.weapon_types.blowers;
    add_bonus_upgrade_multiplier = true;
    bonus_multiplier = global.game_settings.blower_bonus_upgrade_multiplier;
    max_upgrade_level = global.game_settings.blower_max_upgrade_level_base;
    max_upgrade_multiplier = 10;
    upgrade_attributes_active = {};
    upgrade_cost_base = global.costs.blower_upgrade_base;
    upgrade_cost_exp = global.costs.blower_upgrade_exp;
    upgrade_cost_special_divider = 80;
    upgrade_cost_special_level = 10;
    upgrade_count_max = {};
    upgrade_material = global.materials.screw;
    
    init = function()
    {
        if (self.available)
        {
            self.data.count = 1;
        }
        if (self.upgrade_material.spawnable)
        {
            self.upgrade_attributes_upgrade.material_spawn_chance_add_base_single = {};
            variable_struct_set(self.upgrade_attributes_upgrade.material_spawn_chance_add_base_single, self.upgrade_material.key, 0.001);
            self.upgrade_override_value.material_spawn_chance_add_base_single = {};
        }
        else
        {
            self.upgrade_attributes_upgrade.material_max_count_single = {};
            variable_struct_set(self.upgrade_attributes_upgrade.material_max_count_single, self.upgrade_material.key, 10);
            self.upgrade_override_value.material_max_count_single = {};
        }
        if (self.can_damage_enemy)
        {
            self.type = global.weapon_types.trouts;
        }
        if (self.can_dig)
        {
            self.type = global.weapon_types.shovels;
            self.upgrade_count_max.dig_count = 10;
        }
        if (self.can_juice)
        {
            self.upgrade_count_max.resources_multiplier = 
            {
                borb_juice: 1
            };
        }
        if (self.can_mulch)
        {
            self.upgrade_count_max.resources_multiplier = 
            {
                mulch: 10
            };
        }
        if (self.is_sword)
        {
            self.type = global.weapon_types.swords;
        }
    };
    
    get_dig_count = function()
    {
        var dig_count = self.dig_count;
        return self.dig_count;
    };
    
    get_max_upgrade_level = function()
    {
        return self.max_upgrade_level + get_upgrade_attribute_value(global.upgrade_attributes.weapon_max_upgrade_level);
    };
    
    get_upgrade_attributes = function()
    {
        if (self.data.count == 0)
        {
            exit;
        }
        if (!instance_exists(o_blower) || o_blower.blower.key != self.key)
        {
            exit;
        }
        var upgrade_attributes = self.upgrade_attributes_active;
        return upgrade_attributes;
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
            if (self.upgrade_material.is_spawnable())
            {
                variable_struct_set(self.upgrade_override_value.material_spawn_chance_add_base_single, self.upgrade_material.key, (variable_struct_get(self.upgrade_attributes_upgrade.material_spawn_chance_add_base_single, self.upgrade_material.key) * 10) + ((variable_struct_get(self.upgrade_attributes_upgrade.material_spawn_chance_add_base_single, self.upgrade_material.key) * (level - 10)) / 5));
            }
            else
            {
                variable_struct_set(self.upgrade_override_value.material_max_count_single, self.upgrade_material.key, (variable_struct_get(self.upgrade_attributes_upgrade.material_max_count_single, self.upgrade_material.key) * 10) + ((variable_struct_get(self.upgrade_attributes_upgrade.material_max_count_single, self.upgrade_material.key) * (level - 10)) / 5));
            }
            upgrade_attributes.blower_enemy_damage_multiplier_blower = floor(level / 10) * (1 + get_upgrade_attribute_value(global.upgrade_attributes.weapon_damage_upgrade));
            if (self.can_damage_enemy)
            {
                upgrade_attributes.slap_multiplier = floor(log10(level)) / 10;
            }
            if (self.can_dig)
            {
                upgrade_attributes.dig_count = floor(log10(level)) / 10;
            }
            if (self.can_mulch)
            {
                if (is_undefined(struct_get_from_hash(upgrade_attributes, variable_get_hash("resources_multiplier"))))
                {
                    upgrade_attributes.resources_multiplier = {};
                }
                upgrade_attributes.resources_multiplier.mulch = floor(log10(level)) / 10;
            }
        }
        else
        {
            if (self.upgrade_material.is_spawnable())
            {
                variable_struct_set(self.upgrade_override_value.material_spawn_chance_add_base_single, self.upgrade_material.key, undefined);
            }
            else
            {
                variable_struct_set(self.upgrade_override_value.material_max_count_single, self.upgrade_material.key, undefined);
            }
            upgrade_attributes.blower_enemy_damage_multiplier_blower = undefined;
            upgrade_attributes.dig_count = undefined;
            upgrade_attributes.resources_multiplier = undefined;
        }
        return upgrade_attributes;
    };
    
    get_unlock_upgrade_cost = function()
    {
        return build_resource_cost(self.upgrade_material, global.game_settings.blower_upgrade_unlock_cost);
    };
    
    get_description = function()
    {
        var desc = get_value_ext(self, self.description);
        if (self.can_blow)
        {
            desc += ("\n" + __s("Blow power: %s", self.damage) + " | " + __s("Range: %s", self.size));
        }
        if (self.can_damage_enemy)
        {
            desc += sprintf(" | %s", sprintf(__("%s damage to bosses."), number_format_percent(global.game_settings.slap_boss_damage_multiplier)));
            desc += sprintf("\n%s: %s | %s: %s | %s: %s", __("Base damage"), self.damage_base, __("Slap multiplier"), number_format_percent(self.damage), __("Range"), self.action_distance);
        }
        if (self.can_dig)
        {
            desc += iif(is_empty(self.description), "", "\n");
            desc += __s("Dig count: %s", self.dig_count);
            desc += " | ";
            desc += __s("Delay: %s", format_time(secr(self.action_timeout), true, true));
        }
        return desc;
    };
    
    is_alb_equippable = function()
    {
        if (self.type.key == global.weapon_types.trouts.key)
        {
            return has_bought_shop_item_safe(global.shops.ulc.albs_slap);
        }
        return self.alb_equippable;
    };
    
    _is_obfuscated = function()
    {
        return self.is_obfuscated();
    };
    
    is_obfuscated = __return_false;
    set_local_vars(arg0);
    set_sprite_data(self);
    _init();
}
