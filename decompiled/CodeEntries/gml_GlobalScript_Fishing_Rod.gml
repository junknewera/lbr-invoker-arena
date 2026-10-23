function Fishing_Rod(arg0 = undefined) : Upgradable_Item2(arg0) constructor
{
    data_defaults = 
    {
        id: 0,
        level: 1,
        quality: 0,
        rarity_key: "common",
        spot_id: 0,
        tier: 1,
        type_key: "regular",
        upgrade_unlocked: true
    };
    change_type_cost = 
    {
        materials: 
        {
            tide_crystal: 50
        }
    };
    fractional = false;
    max_tier = 5;
    rarity = global.fishing_rods_rarity.common;
    refine_value = 0.1;
    spot = undefined;
    sprite = spr_rod_common;
    type = global.fishing_rod_types.regular;
    upgrade_attributes = {};
    upgrade_attributes_cache = undefined;
    upgrade_attributes_text = "";
    upgrade_cost_exp = 1.5;
    upgrade_material = global.materials.tide_crystal;
    use_alternative_cost_calculation = false;
    
    init = function()
    {
        if (self.data.id == 0)
        {
            self.data.id = guid();
        }
        self.sprite = self.rarity.sprite;
        self.upgrade_cost_result = 
        {
            resources: 
            {
                fish_credits: 5
            }
        };
        self.refresh_name();
    };
    
    ascend = function()
    {
        if (!self.can_ascend())
        {
            exit;
        }
        dec_result(self.get_ascend_cost());
        self.rarity = self.rarity.next_rarity;
        self.data.rarity_key = self.rarity.key;
        self.data.level = 1;
        self.refresh_upgrade_attributes();
        self.init();
    };
    
    can_ascend = function()
    {
        if (self.data.level < 5)
        {
            return false;
        }
        if (is_undefined(self.rarity.next_rarity))
        {
            return false;
        }
        if (!has_enough(self.get_ascend_cost()))
        {
            return false;
        }
        return true;
    };
    
    can_change_type = function()
    {
        if (!has_enough(self.get_change_type_cost()))
        {
            return false;
        }
        return true;
    };
    
    can_refine = function()
    {
        if (self.data.quality >= 1)
        {
            return false;
        }
        return has_enough(self.get_refine_cost());
    };
    
    can_transcend = function()
    {
        if (self.rarity != global.fishing_rods_rarity.legendary)
        {
            return false;
        }
        if (self.data.level != self.get_max_upgrade_level())
        {
            return false;
        }
        if (self.data.quality < 1)
        {
            return false;
        }
        return has_enough(self.get_transcend_cost());
    };
    
    change_random_type = function(arg0)
    {
        if (!self.can_change_type())
        {
            return false;
        }
        dec_result(self.change_type_cost);
        var type = array_random_item_exclude(global.fishing_rod_types_array, ["regular", self.type.key]);
        self.set_type(type);
    };
    
    get_ascend_cost = function()
    {
        var cost = 
        {
            materials: 
            {
                tide_crystal: 5 + ((self.rarity.level - 1) * 10)
            }
        };
        return cost;
    };
    
    get_bg_color = function()
    {
        return variable_struct_get(global.rarity_colors_button, self.rarity.key);
    };
    
    get_change_type_cost = function()
    {
        return self.change_type_cost;
    };
    
    get_max_upgrade_level = get_fishing_rods_max_level;
    
    get_min_length = function()
    {
        var tier_value = (((0.25 + ((self.get_max_upgrade_level() - 1) * 0.25)) * power(1.05, global.fishing_rods_rarity.legendary.level - 1)) + ((global.fishing_rods_rarity.legendary.level - 1) * 1.5)) * 1.2 * (self.data.tier - 1);
        var value = ((0.25 + ((self.data.level - 1) * 0.25)) * power(1.05, self.rarity.level - 1)) + ((self.rarity.level - 1) * 1.5) + tier_value;
        value = get_bm_value(value, "fishing_min_fish_length", "fishing_min_fish_length_multiplier", undefined, true);
        value *= (1 + (self.data.quality * 0.2));
        return value;
    };
    
    get_max_length = function()
    {
        var min_length = self.get_min_length();
        var value = min_length * (2 + ((self.rarity.level - 1) * 0.5));
        value = get_bm_value(value, "fishing_max_fish_length", "fishing_max_fish_length_multiplier", undefined, true);
        value *= (1 + (self.data.quality * 0.2));
        return value;
    };
    
    get_refine_cost = function()
    {
        var cost = 
        {
            resources: 
            {
                fish_trash: calculate_item_cost_lite(50, 1.2, 1, floor(self.data.quality * 10))
            }
        };
        return cost;
    };
    
    get_salvage_result = function()
    {
        var result = multiply_struct_values(global.costs.fishing_craft_rod, 0.25 * power(2, self.rarity.level), true);
        return result;
    };
    
    get_status = function()
    {
        return self.data.status;
    };
    
    get_tooltip = function()
    {
        return self.get_name() + "\n" + self.upgrade_attributes_text;
    };
    
    get_transcend_cost = function()
    {
        var cost = 
        {
            materials: {}
        };
        if (self.data.tier < 4)
        {
            cost.materials.tide_crystal = round(250 * power(1.5, self.data.tier - 1));
        }
        else
        {
            cost.materials.tide_crystal_advanced = round(50 * power(1.4, self.data.tier - 4));
        }
        return cost;
    };
    
    get_upgrade_attributes = function()
    {
        if (is_undefined(self.upgrade_attributes_cache))
        {
            self.refresh_upgrade_attributes();
        }
        return self.upgrade_attributes_cache;
    };
    
    refresh_upgrade_attributes = function()
    {
        var multiplier = self.rarity.level * 0.5;
        self.upgrade_attributes_cache = multiply_struct_values(self.type.upgrade_attributes, multiplier);
        self.upgrade_attributes_text = format_upgrade_text(self.upgrade_attributes_cache);
        refresh_ua_section("fish");
    };
    
    get_upgrade_cost_level = function()
    {
        var level = self.data.level + ((self.rarity.level - 1) * self.get_max_upgrade_level());
        level *= self.data.tier;
        return level;
    };
    
    is_available = function()
    {
        if (self.data.spot_id != 0)
        {
            if (is_struct(variable_struct_get(global.fishing_spots_map, self.data.spot_id)))
            {
                return false;
            }
        }
        return true;
    };
    
    refine = function()
    {
        dec_result(self.get_refine_cost());
        self.data.quality += self.refine_value;
        self.data.quality = clamp(self.data.quality, 0, 1);
    };
    
    refresh_name = function()
    {
        self.name = sprintf("%s %s", self.rarity.name, self.type.name);
    };
    
    remove_from_spot = function()
    {
        self.data.spot_id = 0;
        self.spot = undefined;
    };
    
    salvage = function()
    {
        add_result_lite(self.get_salvage_result());
        remove_item_from_array_by_id(global.fishing_rods, self.data.id);
    };
    
    set_quality = function(arg0)
    {
        self.data.quality = clamp(arg0, 0, 1);
        self.refresh_upgrade_attributes();
    };
    
    set_rarity = function(arg0)
    {
        var rarity = arg0;
        if (is_string(arg0))
        {
            rarity = variable_struct_get(global.fishing_rods_rarity, arg0);
        }
        self.rarity = rarity;
        self.data.rarity_key = rarity.key;
        self.refresh_name();
        self.refresh_upgrade_attributes();
    };
    
    set_spot = function(arg0)
    {
        self.data.spot_id = arg0;
        self.spot = variable_struct_get(global.fishing_spots_map, arg0);
    };
    
    set_type = function(arg0)
    {
        var type = arg0;
        if (is_string(arg0))
        {
            type = variable_struct_get(global.fishing_rod_types, arg0);
        }
        self.type = type;
        self.data.type_key = type.key;
        self.refresh_name();
        self.refresh_upgrade_attributes();
    };
    
    transcend = function()
    {
        dec_result(self.get_transcend_cost());
        self.data.tier++;
        self.data.level = 1;
        self.set_quality(0);
        self.set_rarity(global.fishing_rods_rarity.common);
        self.refresh_upgrade_attributes();
        self.init();
    };
    
    get_name = function()
    {
        if (self.data.tier == 1)
        {
            return sprintf("%s [%s/%s]", self.name, self.data.level, get_fishing_rods_max_level());
        }
        else
        {
            return sprintf("%s [%s/%s] [T%s]", self.name, self.data.level, get_fishing_rods_max_level(), self.data.tier);
        }
    };
    
    get_short_name = function()
    {
        return self.name;
    };
    
    get_info = self.get_name;
    set_local_vars(arg0);
    self._init();
}

function Fishing_Rod_Type(arg0) : Type_Object(arg0) constructor
{
    is_special = true;
    set_local_vars(arg0);
}
