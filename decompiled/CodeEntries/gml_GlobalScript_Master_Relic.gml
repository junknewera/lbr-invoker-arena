function Master_Relic(arg0) : Upgradable_Item(arg0) constructor
{
    name = "";
    description = "";
    description_locked = "";
    index = 0;
    key = "";
    level = 0;
    sprite = spr_material_relic_fragment;
    sprite_orig = spr_material_relic_fragment;
    btn_bg_sprite = spr_relic_common;
    material = global.materials.relic_fragment;
    resource = global.resources.leaves;
    type = global.relic_types.common;
    type_key = global.relic_types.common.key;
    upgrade_attributes = {};
    upgrades = 
    {
        damage: 
        {
            index: 0,
            name: __("Relic damage"),
            ua_key: "relics_base_damage_multiplier",
            value: 10,
            max_level: 0,
            base_cost: 200,
            cost_exp: 1.3,
            cost_material: global.materials.power_fragment,
            scalable: true
        },
        quark_damage_multiplier: 
        {
            index: 1,
            name: __("Quark damage"),
            ua_key: "quark_damage_multiplier",
            value: 0.1,
            max_level: 0,
            base_cost: 300,
            cost_exp: 1.3,
            cost_material: global.materials.power_fragment,
            is_unlocked: is_unlocked_quarks,
            scalable: true
        },
        relics_max_count: 
        {
            index: 10,
            name: __("More Relics"),
            ua_key: "relics_max_count",
            value: 1,
            max_level: 5,
            base_cost: 75,
            cost_exp: 1.2,
            cost_material: global.materials.power_fragment,
            scalable: false
        },
        leafscender_output_count: 
        {
            index: 20,
            name: __("Better Leafscender"),
            ua_key: "leafscender_output_count",
            value: 1,
            max_level: 3,
            base_cost: 1000,
            cost_exp: 1.5,
            cost_material: global.materials.power_fragment,
            scalable: false
        },
        mirror_drop_relic_fragments_count: 
        {
            index: 30,
            name: __("Fragment Count"),
            ua_key: "mirror_drop_relic_fragments_count",
            value: 1,
            max_level: 1,
            base_cost: 300,
            cost_material: global.materials.power_fragment,
            scalable: false
        }
    };
    upgrade_max_level = 10;
    add_keys_to_struct(self.upgrades);
    upgrades_array = struct_to_sorted_array(self.upgrades);
    
    init = function()
    {
        self.name = sprintf("%s %s", self.type.name, __("Master Relic"));
        var __struct = self.upgrades;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            if (get_default_struct_value(mitem, "scalable", false))
            {
                mitem.value = mitem.value * (1 + ((self.type.level - 1) * 0.5));
            }
            set_struct_value(self.data, mkey, 0, true);
        }
    };
    
    get_btn_bg_sprite = function()
    {
        return self.type.btn_bg_sprite;
    };
    
    get_description = function(arg0 = false)
    {
        return "";
    };
    
    get_upgrade_attributes = function()
    {
        self.upgrade_attributes = {};
        var __array = self.upgrades_array;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (!is_string(struct_get_from_hash(mitem, variable_get_hash("ua_key"))))
            {
                continue;
            }
            variable_struct_set(self.upgrade_attributes, mitem.ua_key, self.get_upgrade_value(mitem.key));
        }
        return self.upgrade_attributes;
    };
    
    can_upgrade = function(arg0, arg1 = 1)
    {
        if (!self.is_upgrade_visible(arg0))
        {
            return false;
        }
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
        var value = calculate_item_cost_lite(base_cost, cost_exp, arg1, upgrade_level);
        value *= (1 + ((self.type.level - 1) / 3));
        value = rround(value);
        var cost = 
        {
            materials: build_resource_cost(material, value)
        };
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
        var text = [];
        var upgrade_row = variable_struct_get(self.upgrades, arg0);
        if (is_string(struct_get_from_hash(upgrade_row, variable_get_hash("ua_key"))))
        {
            var desc_key = $"desc_{arg0}";
            if (!self.has_class_cache(desc_key))
            {
                var ua = {};
                if (is_string(struct_get_from_hash(upgrade_row, variable_get_hash("ua_sub_key"))))
                {
                    variable_struct_set(ua, struct_get_from_hash(upgrade_row, variable_get_hash("ua_key")), {});
                    variable_struct_set(variable_struct_get(ua, struct_get_from_hash(upgrade_row, variable_get_hash("ua_key"))), struct_get_from_hash(upgrade_row, variable_get_hash("ua_sub_key")), struct_get_from_hash(upgrade_row, variable_get_hash("value")));
                }
                else
                {
                    variable_struct_set(ua, struct_get_from_hash(upgrade_row, variable_get_hash("ua_key")), struct_get_from_hash(upgrade_row, variable_get_hash("value")));
                }
                self.set_class_cache(desc_key, format_upgrade_text(ua));
            }
            array_push(text, self.get_class_cache(desc_key));
        }
        return implode(" ", text);
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
    
    self.is_unlocked = __return_true;
    
    is_upgrade_visible = function(arg0)
    {
        var upgrade_row = variable_struct_get(self.upgrades, arg0);
        var is_visible = get_default_struct_value(upgrade_row, "is_visible", true);
        if (!is_visible)
        {
            return false;
        }
        var is_obfuscated = get_default_struct_value(upgrade_row, "is_obfuscated", false);
        var is_unlocked = get_default_struct_value(upgrade_row, "is_unlocked", undefined);
        if (is_callable(is_unlocked))
        {
            is_obfuscated = !is_unlocked();
        }
        return !is_obfuscated;
    };
    
    upgrade = function(arg0, arg1 = 1)
    {
        var cost = self.get_upgrade_cost(arg0, arg1);
        dec_result(cost);
        var upgrade_struct = variable_struct_get(self.upgrades, arg0);
        var data_name = get_default_struct_value(upgrade_struct, "data_name", arg0);
        variable_struct_set(self.data, data_name, variable_struct_get(self.data, data_name) + arg1);
        refresh_ua_section("relics");
    };
    
    set_local_vars(arg0);
    set_sprite_data(self);
    init();
}
