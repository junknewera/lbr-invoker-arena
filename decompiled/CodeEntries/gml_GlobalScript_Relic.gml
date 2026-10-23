function Relic(arg0) : Upgradable_Item(arg0) constructor
{
    name = "";
    description = "";
    description_locked = "";
    index = 0;
    instance = -1;
    key = "";
    sprite = spr_placeholder;
    sprite_orig = spr_placeholder;
    btn_bg_sprite = spr_relic_common;
    cancellable = false;
    can_spawn = false;
    game_item_type = UnknownEnum.Value_10;
    instance_expire_time = sec(60);
    is_fractional = false;
    is_usable = false;
    material = global.materials.relic_fragment;
    multiple_use = false;
    resource = global.resources.leaves;
    type = global.relic_types.common;
    type_key = global.relic_types.common.key;
    upgrade_attributes = {};
    winnable = false;
    data_defaults = 
    {
        transmute_count: 0,
        transmute_count_total: 0
    };
    upgrades = 
    {
        damage: 
        {
            index: 0,
            name: __("Relic damage"),
            ua_key: "relics_base_damage_multiplier",
            value: 3,
            max_level: 20,
            base_cost: 10,
            cost_exp: 1.4,
            cost_material: global.materials.relic_fragment
        },
        quark_damage_multiplier: 
        {
            index: 1,
            name: __("Quark damage"),
            ua_key: "quark_damage_multiplier",
            value: 0.01,
            max_level: 10,
            base_cost: 20,
            cost_exp: 1.4,
            cost_material: global.materials.relic_fragment,
            is_unlocked: is_unlocked_quarks
        },
        mirror_drop_relic_fragments_chance: 
        {
            index: 5,
            name: __("Mirror Fragments"),
            ua_key: "mirror_drop_relic_fragments_chance",
            value: 0.002,
            max_level: 1,
            base_cost: 25,
            cost_material: global.materials.relic_fragment,
            is_unlocked: is_unlocked_mirror_fragments
        },
        max_energy_storage: 
        {
            index: 10,
            name: __("Energy Storage"),
            ua_key: "max_energy_storage",
            value: 25,
            max_level: 10,
            base_cost: 5,
            cost_exp: 1.2,
            cost_material: global.materials.relic_fragment
        },
        material_max_count: 
        {
            index: 20,
            name: __("Material Storage"),
            ua_key: "material_max_count",
            value: 100,
            max_level: 10,
            base_cost: 5,
            cost_exp: 1.2,
            cost_material: global.materials.relic_fragment
        },
        artifact_max_count_add_le: 
        {
            index: 30,
            name: __("LE Storage"),
            ua_key: "artifact_max_count_add",
            ua_sub_key: "leafscension_exploit",
            value: 1,
            max_level: 10,
            base_cost: 10,
            cost_exp: 1.4,
            cost_material: global.materials.relic_fragment
        },
        leafscender_decrease_convert_time: 
        {
            index: 31,
            name: __("LE Duration"),
            ua_key: "leafscender_decrease_convert_time",
            value: 0.0002,
            max_level: 5,
            base_cost: 10,
            cost_exp: 1.3,
            cost_material: global.materials.relic_fragment
        },
        offline_boss_kills_multiplier: 
        {
            index: 40,
            name: __("Offline Kills"),
            ua_key: "offline_boss_kills_multiplier",
            value: 0.001,
            max_level: 5,
            base_cost: 5,
            cost_exp: 1.2,
            cost_material: global.materials.relic_fragment,
            is_unlocked: is_unlocked_death_book
        }
    };
    upgrade_max_level = 10;
    add_keys_to_struct(self.upgrades);
    upgrades_array = struct_to_sorted_array(self.upgrades);
    
    init = function()
    {
        var __struct = self.upgrades;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            set_struct_value(self.data, mkey, 0, true);
        }
        self.sprite = self.resource.sprite;
        self.upgrade_attributes.blower_enemy_damage_multiplier_relics = 0;
        self.upgrade_attributes.resources_multiplier = {};
        variable_struct_set(self.upgrade_attributes.resources_multiplier, self.resource.key, 0);
        self.upgrade_attributes.resources_multiplier.sacred = 0;
    };
    
    add_draw = function(arg0, arg1)
    {
    };
    
    destroy_instance = function()
    {
        self.instance = -1;
    };
    
    get_btn_bg_sprite = function()
    {
        if (!self.data.unlocked)
        {
            return spr_relic_locked;
        }
        return self.type.btn_bg_sprite;
    };
    
    get_description = function(arg0 = false)
    {
        if (!self.data.unlocked)
        {
            return "?";
        }
        var delimiter = "\n";
        var leafscend_count = self.get_leafscend_count();
        var text = [];
        if (arg0)
        {
            var name = self.get_name();
            array_push(text, name);
        }
        array_push(text, __s("Leafscended %s: %s", self.resource.name_plural, number_format(leafscend_count)));
        if (!arg0)
        {
            array_push(text, "");
            if (self.data.count > 0)
            {
                array_push(text, format_upgrade_text(self.get_upgrade_attributes(), 1, true, self, delimiter));
            }
        }
        return implode(delimiter, text);
    };
    
    get_display_count = function()
    {
        var text = number_format(self.data.count);
        text += ("\n" + sprintf("Lx%s", number_format(self.get_leafscend_count(), 1)));
        return text;
    };
    
    get_display_count_height = function()
    {
        return global.is_mobile ? 24 : 12;
    };
    
    get_leafscend_count = function()
    {
        var count = variable_struct_get(self.resource.data.leafscend_count, self.type.level);
        if (is_undefined(count))
        {
            count = 0;
        }
        return count;
    };
    
    get_max_count = function()
    {
        return ceil(global.game_settings.relics_max_count_base + get_upgrade_attribute_value(global.upgrade_attributes.relics_max_count));
    };
    
    get_name = function()
    {
        var name = sprintf("%s [%s/%s]", self.name, self.data.count, self.get_max_count());
        return name;
    };
    
    get_spawn_chance = function()
    {
        return self.type.get_spawn_chance();
    };
    
    get_tooltip = function()
    {
        return self.get_description(true);
    };
    
    get_upgrade_attributes = function()
    {
        var leafscend_count = self.get_leafscend_count();
        if (!is_numeric(leafscend_count) || leafscend_count <= 0)
        {
            exit;
        }
        var damage_base_value = global.game_settings.relics_base_damage + get_upgrade_attribute_value(global.upgrade_attributes.relics_base_damage);
        var damage_value = damage_base_value * power(40, self.type.level - 1) * leafscend_count * global.game_settings.relics_base_damage_multiplier;
        damage_value *= get_cache("relics_base_damage_multiplier");
        var __struct = global.resources_energy;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            damage_value *= (1 + ((get_upgrade_attribute_value(global.upgrade_attributes.relics_base_damage_multiplier_energy) * mitem.data.count) / 1000));
        }
        if (self.resource.is_gem_leaf || self.resource.spawn_chance == 0)
        {
            damage_value *= global.game_settings.relics_base_damage_multiplier_special;
        }
        damage_value *= (1 + self.get_upgrade_value("damage"));
        self.upgrade_attributes.blower_enemy_damage_multiplier_relics = damage_value * self.data.count;
        if (is_unlocked_master_relics())
        {
        }
        var leaf_base_value = global.game_settings.relics_base_resource_leaf_value + get_upgrade_attribute_value(global.upgrade_attributes.relics_base_resource_leaf_value);
        var leaf_value_sacred = leaf_base_value * power(40, self.type.level - 1) * leafscend_count * global.game_settings.relics_base_resource_leaf_multiplier * (1 + get_upgrade_attribute_value(global.upgrade_attributes.relics_base_resource_leaf_multiplier));
        self.upgrade_attributes.resources_multiplier.sacred = leaf_value_sacred * self.data.count;
        self.upgrade_attributes.quark_damage_multiplier_relics = self.get_upgrade_value("quark_damage_multiplier");
        self.upgrade_attributes.mirror_drop_relic_fragments_chance = self.get_upgrade_value("mirror_drop_relic_fragments_chance");
        self.upgrade_attributes.max_energy_storage = self.get_upgrade_value("max_energy_storage");
        self.upgrade_attributes.material_max_count = self.get_upgrade_value("material_max_count");
        self.upgrade_attributes.artifact_max_count_add = 
        {
            leafscension_exploit: self.get_upgrade_value("artifact_max_count_add_le")
        };
        self.upgrade_attributes.leafscender_decrease_convert_time = self.get_upgrade_value("leafscender_decrease_convert_time");
        self.upgrade_attributes.offline_boss_kills_multiplier = self.get_upgrade_value("offline_boss_kills_multiplier");
        return self.upgrade_attributes;
    };
    
    max_count = function()
    {
        return global.game_settings.relics_max_count_base + get_upgrade_attribute_value(global.upgrade_attributes.relics_max_count);
    };
    
    spawn = function(arg0 = undefined, arg1 = undefined)
    {
        arg0 = is_undefined(arg0) ? random_range(120, room_width - 120) : arg0;
        arg1 = is_undefined(arg1) ? random_range(120, room_height - 120) : arg1;
        var o = instance_create_layer(arg0, arg1, global.layers.leaves, o_relic);
        o.item = self;
        o.sprite_index = self.sprite;
        with (o)
        {
            init();
        }
        return o;
    };
    
    can_transmute_power_fragments = function()
    {
        var input_count = self.get_transmute_power_fragments_input_count();
        var leafscend_count = self.get_leafscend_count();
        var can_transmute = leafscend_count > input_count;
        return can_transmute;
    };
    
    get_transmute_power_fragments_input_count = function()
    {
        var input_count = rround(20 * power(1 + self.data.transmute_count, 1.5));
        return input_count;
    };
    
    get_transmute_power_fragments_output = function()
    {
        var output = 
        {
            power_fragment: ceil(power(1 + self.type.level, 1.8))
        };
        return output;
    };
    
    transmute_power_fragments = function()
    {
        if (!self.can_transmute_power_fragments())
        {
            return 0;
        }
        add_materials(self.get_transmute_power_fragments_output());
        variable_struct_set(self.resource.data.leafscend_count, self.type.level, variable_struct_get(self.resource.data.leafscend_count, self.type.level) - self.get_transmute_power_fragments_input_count());
        self.data.transmute_count += 1;
        self.data.transmute_count_total += 1;
        return 1;
    };
    
    transmute_power_fragments_max = function()
    {
        if (!self.can_transmute_power_fragments())
        {
            return 0;
        }
        var can_transmute = true;
        var transmute_count = 0;
        do
        {
            var input_count = self.get_transmute_power_fragments_input_count();
            var leafscend_count = self.get_leafscend_count();
            can_transmute = leafscend_count > input_count;
            if (!can_transmute)
            {
                break;
            }
            add_materials(self.get_transmute_power_fragments_output());
            variable_struct_set(self.resource.data.leafscend_count, self.type.level, variable_struct_get(self.resource.data.leafscend_count, self.type.level) - self.get_transmute_power_fragments_input_count());
            self.data.transmute_count += 1;
            self.data.transmute_count_total += 1;
            transmute_count++;
        }
        until (!can_transmute);
        return transmute_count;
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

enum UnknownEnum
{
    Value_10 = 10
}
