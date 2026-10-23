function Crafted_Leaf(arg0, arg1 = {}, arg2 = undefined) constructor
{
    name = __("Unknown");
    description = "";
    game_item_type = UnknownEnum.Value_1;
    sprite = spr_placeholder;
    type = arg0;
    fusion_cost = {};
    transformation_cost = {};
    info_cache = undefined;
    info_cache_lite = undefined;
    info_cache_table = undefined;
    max_level = 20;
    min_ascend_craft_level = 30;
    min_ascend_craft_ascend_level = 11;
    props_sorted = [];
    quality_base = irandom_range(0.01, 100);
    quality = 0;
    rarity_index = 0;
    resource = undefined;
    selected_prop = undefined;
    selected_prop_index = -1;
    upgrade_attributes = {};
    data = 
    {
        ascend_level: 1,
        color_id: "def",
        id: -1,
        level: 1,
        locked: false,
        props: {},
        quality_base: 0,
        quality: 0,
        rand: irandom_range(100, 999),
        reroll_props_count: 0,
        reroll_rng_count: 0,
        reroll_shards_count: 0,
        shards: {},
        shards_added: 0,
        shards_added_r: 0,
        tier: 1,
        type_key: self.type.key
    };
    
    init = function(arg0)
    {
        self.data.id = generate_crafted_leaf_id();
        self.data.quality_base = clamp(round(self.quality_base), 1, 100);
        self.set_type();
        if (self.quality == 0 && self.data.quality == 0)
        {
            self.set_rng_quality();
        }
        else
        {
            self.data.quality = self.quality;
        }
        self.set_props();
        self.set_prop_values();
        self.set_upgrade_attributes();
        var inv_add = global.craft_leaves_inventory;
        if (array_length(inv_add) >= get_craft_inventory_size())
        {
            inv_add = global.craft_leaves_backpack;
        }
        if (!is_undefined(arg0))
        {
            inv_add = arg0;
        }
        array_push(inv_add, self);
    };
    
    add_shard = function(arg0 = 1, arg1 = false)
    {
        var added = 0;
        repeat (arg0)
        {
            var prop_key;
            if (!is_undefined(self.selected_prop) && !arg1)
            {
                prop_key = self.selected_prop;
            }
            else
            {
                self.data.shards_added_r++;
                random_set_seed((self.data.id * 10) + (self.data.reroll_shards_count * 20) + (self.data.shards_added_r * 30) + (self.data.rand * 40));
                prop_key = struct_random_key(self.data.props);
                var safe_random_n = 0;
                while (self.get_shards_count(prop_key) >= self.get_shards_max_count_single() && ++safe_random_n < 100)
                {
                    prop_key = struct_random_key(self.data.props);
                }
                randomize();
                if (self.get_shards_count(prop_key) >= self.get_shards_max_count_single())
                {
                    if (arg0 == 1)
                    {
                        notify(__("Failed to add a shard due to randomness."));
                    }
                    break;
                }
            }
            var value_before, upgrade_text;
            if (is_struct(variable_struct_get(self.data.props, prop_key)))
            {
                var prop_key_key;
                if (!is_undefined(struct_get_from_hash(variable_struct_get(self.data.props, prop_key), variable_get_hash("__resource_key"))))
                {
                    prop_key_key = variable_struct_get(self.data.props, prop_key).__resource_key;
                }
                else if (!is_undefined(struct_get_from_hash(variable_struct_get(self.data.props, prop_key), variable_get_hash("__collection_key"))))
                {
                    prop_key_key = variable_struct_get(self.data.props, prop_key).__collection_key;
                }
                else
                {
                    exit;
                }
                if (is_undefined(variable_struct_get(self.data.shards, prop_key)))
                {
                    variable_struct_set(self.data.shards, prop_key, {});
                }
                add_to_struct_value(variable_struct_get(self.data.shards, prop_key), prop_key_key, 1);
                value_before = variable_struct_get(variable_struct_get(self.data.props, prop_key), prop_key_key);
                upgrade_text = get_upgrade_text(prop_key, 1, prop_key_key, true);
            }
            else
            {
                add_to_struct_value(self.data.shards, prop_key, 1);
                value_before = variable_struct_get(self.data.props, prop_key);
                upgrade_text = get_upgrade_text(prop_key, 1, undefined, true);
            }
            if (!arg1)
            {
                var shards_cost = self.get_shards_cost();
                self.data.shards_added += shards_cost.shards;
                dec_resources(shards_cost);
            }
            self.set_prop_values(true, true);
            self.set_upgrade_attributes();
            var value_new;
            if (is_struct(variable_struct_get(self.data.props, prop_key)))
            {
                var prop_key_key;
                if (!is_undefined(struct_get_from_hash(variable_struct_get(self.data.props, prop_key), variable_get_hash("__resource_key"))))
                {
                    prop_key_key = variable_struct_get(self.data.props, prop_key).__resource_key;
                }
                else if (!is_undefined(struct_get_from_hash(variable_struct_get(self.data.props, prop_key), variable_get_hash("__collection_key"))))
                {
                    prop_key_key = variable_struct_get(self.data.props, prop_key).__collection_key;
                }
                value_new = variable_struct_get(variable_struct_get(self.data.props, prop_key), prop_key_key);
            }
            else
            {
                value_new = variable_struct_get(self.data.props, prop_key);
            }
            var value_diff_pct = value_new / value_before;
            if (!arg1 && arg0 == 1)
            {
                notify(sprintf(__("Shard increased %s by %s"), upgrade_text, number_format_percent(value_diff_pct, undefined, true)));
            }
            added++;
        }
        if (!arg1 && added > 1)
        {
            notify(sprintf(__("%s shards added."), added));
        }
        if (!arg1 && global.cloud_data.is_season)
        {
            save_game();
        }
    };
    
    ascend = function()
    {
        if (!self.can_ascend())
        {
            exit;
        }
        dec_resources(self.get_ascend_cost());
        self.data.level = 1;
        self.data.ascend_level++;
        self.set_rng_quality();
        self.set_prop_values(true);
    };
    
    build_fusion_cost = function()
    {
        self.fusion_cost = {};
        variable_struct_set(self.fusion_cost, self.resource.key, 10000000);
        self.transformation_cost = {};
        variable_struct_set(self.transformation_cost, self.resource.key, 100000);
        variable_struct_set(self.transformation_cost, self.resource.key, variable_struct_get(self.transformation_cost, self.resource.key) * (1 - get_upgrade_attribute_value(variable_struct_get(global.upgrade_attributes.transformation_cost_reduction_leaves, self.resource.key))));
        variable_struct_set(self.transformation_cost, self.resource.key, max(1, variable_struct_get(self.transformation_cost, self.resource.key)));
        if (between(self.type.rarity_index, 0, 6))
        {
            self.fusion_cost.cheese = 10 + ceil(power(2.5, self.type.rarity_index));
            self.transformation_cost.cheese = 5 + ceil(power(2, self.type.rarity_index));
        }
        else if (between(self.type.rarity_index, 7, 15))
        {
            self.fusion_cost.beer = 5 + ceil(power(2.5, self.type.rarity_index - 4));
            self.transformation_cost.beer = 5 + ceil(power(2, self.type.rarity_index - 4));
        }
        else if (between(self.type.rarity_index, 16, 22))
        {
            self.fusion_cost.fusion_shards = 3 + ceil(power(2, self.type.rarity_index - 15));
            self.transformation_cost.transformation_shards = 1 + ceil((self.type.rarity_index - 15) * 2);
        }
        else if (self.type.rarity_index >= 23)
        {
            self.fusion_cost.soul_entities = 500 * power(2, self.type.rarity_index - 20);
            self.transformation_cost.soul_entities = 50 * ceil((self.type.rarity_index - 20) * 2);
        }
        if (!is_undefined(global.craft_leaves_transform_output_var))
        {
            self.transformation_cost = multiply_struct_values(self.transformation_cost, 10);
        }
        return self.fusion_cost;
    };
    
    can_add_shard = function(arg0 = 1)
    {
        if (!global.resources.shards.data.unlocked)
        {
            return false;
        }
        var cost = self.get_shards_cost();
        cost = multiply_struct_values(cost, arg0);
        if (!has_enough_resources(cost))
        {
            return false;
        }
        if (self.selected_prop_index >= 0)
        {
            if ((self.get_shards_count(self.selected_prop) + arg0) > self.get_shards_max_count_single())
            {
                return false;
            }
        }
        if ((self.get_shards_count() + arg0) > self.get_shards_max_count())
        {
            return false;
        }
        return true;
    };
    
    can_ascend = function()
    {
        return has_enough_resources(self.get_ascend_cost()) && self.can_ascend_level();
    };
    
    can_ascend_level = function()
    {
        return self.data.level >= self.get_max_level() && self.data.level >= global.game_settings.crafted_leaves_ascend_base_level && self.data.ascend_level <= get_max_ascend_level();
    };
    
    can_reclaim_shards = function()
    {
        if (get_upgrade_count(global.shops.ancient.unlock_shards) == 0)
        {
            return false;
        }
        if (self.get_shards_count() == 0)
        {
            return false;
        }
        return (!self.is_locked() || get_option(global.options.reroll_locked_leaves)) && has_enough_materials(self.get_reclaim_shards_cost());
    };
    
    can_reroll = function()
    {
        if (self.data.quality >= 100 && is_shop_item_enabled(global.shops.gems.craft_improve_rng))
        {
            return false;
        }
        return (!self.is_locked() || get_option(global.options.reroll_locked_leaves)) && has_enough_resources(self.get_reroll_cost());
    };
    
    can_reroll_craft_quality = function()
    {
        if (self.data.quality_base >= 100 && is_shop_item_enabled(global.shops.gems.craft_improve_rng))
        {
            return false;
        }
        return (!self.is_locked() || get_option(global.options.reroll_locked_leaves)) && has_enough_resources(self.get_reroll_craft_quality_cost());
    };
    
    can_reroll_props = function()
    {
        if (get_upgrade_count(global.shops.blc.unlock_materials) == 0)
        {
            return false;
        }
        return (!self.is_locked() || get_option(global.options.reroll_locked_leaves)) && has_enough_materials(self.get_reroll_props_cost());
    };
    
    can_reroll_shards = function()
    {
        if (get_upgrade_count(global.shops.ancient.unlock_shards) == 0)
        {
            return false;
        }
        if (self.get_shards_count() == 0)
        {
            return false;
        }
        return (!self.is_locked() || get_option(global.options.reroll_locked_leaves)) && has_enough_materials(self.get_reroll_shards_cost());
    };
    
    can_salvage = function()
    {
        return !self.is_locked() || get_option(global.options.salvage_locked_leaves);
    };
    
    can_transform = function()
    {
        if (!has_enough_resources(self.transformation_cost))
        {
            return false;
        }
        if (self.selected_prop_index == -1)
        {
            return false;
        }
        if (global.craft_leaves_transform_output_index >= 0 && (is_struct(global.craft_leaves_transform_output_var) && is_undefined(variable_struct_get(o_game.data.stats.crafted_vars_transform_unlocked, global.craft_leaves_transform_output_var.key))))
        {
            return false;
        }
        if (is_struct(global.craft_leaves_transform_output_var) && !is_undefined(variable_struct_get(self.data.props, global.craft_leaves_transform_output_var.key)))
        {
            if (global.craft_leaves_transform_output_var.key == self.selected_prop && (global.craft_leaves_transform_output_var.has_resources || !is_undefined(global.craft_leaves_transform_output_var.collection)))
            {
                return true;
            }
            return false;
        }
        return true;
    };
    
    can_upgrade = function(arg0 = 1)
    {
        if (self.data.level >= self.get_max_level())
        {
            return false;
        }
        var upgrade_resources = self.get_upgrade_cost(arg0);
        return has_enough_resources(upgrade_resources);
    };
    
    get_ascend_level = function()
    {
        return self.data.ascend_level;
    };
    
    get_level = function()
    {
        return self.data.level;
    };
    
    get_max_level = function()
    {
        return self.max_level + get_upgrade_attribute_value(global.upgrade_attributes.craft_item_max_level);
    };
    
    get_ascend_cost = function()
    {
        var resource = global.resources.ancient;
        var base_cost = 500;
        var cost_multiplier = 1.75;
        var cost = base_cost + (2 * (1 + power(self.type.craft_bonus, cost_multiplier)));
        if (self.type.rarity_index >= 17)
        {
            resource = global.resources.ascension_shards;
            base_cost = 2;
            cost_multiplier = 1.005;
            cost = base_cost + ceil(power(1.5, self.type.rarity_index - 14));
        }
        cost *= self.data.ascend_level;
        cost = max(1, ceil(cost));
        return build_resource_cost(resource, cost);
    };
    
    get_fusion_cost = function()
    {
        return self.fusion_cost;
    };
    
    get_reclaim_shards_cost = function()
    {
        var material = global.materials.essence_light;
        var cost_divider = 40;
        if (self.type.rarity_index >= 17)
        {
            cost_divider = 7;
        }
        var cost = self.type.craft_bonus / cost_divider;
        cost = max(1, ceil(cost));
        return build_resource_cost(material, cost);
    };
    
    get_reroll_cost = function()
    {
        var resource = global.resources.beer;
        var cost_scaling = 1.03;
        var cost = power(self.type.craft_bonus, cost_scaling);
        cost = max(1, ceil(cost));
        return build_resource_cost(resource, cost);
    };
    
    get_reroll_craft_quality_cost = function()
    {
        var resource = global.resources.shards;
        var cost = self.type.craft_bonus / 10;
        cost = max(1, ceil(cost));
        return build_resource_cost(resource, cost);
    };
    
    get_reroll_shards_cost = function()
    {
        var material = global.materials.essence_water;
        var cost = self.type.craft_bonus / 20;
        cost = max(1, ceil(cost));
        return build_resource_cost(material, cost);
    };
    
    get_reroll_props_cost = function()
    {
        var material = global.materials.essence_water;
        var cost_divider = 40;
        if (self.type.rarity_index >= 17)
        {
            cost_divider = 5;
        }
        var cost = self.type.craft_bonus / cost_divider;
        cost = max(1, ceil(cost));
        return build_resource_cost(material, cost);
    };
    
    get_salvage_resources = function()
    {
        var resource = global.resources.cheese;
        var cheese_count = 1 + ((self.type.craft_bonus / 10) * power(self.get_level() + ((self.get_ascend_level() - 1) * global.game_settings.crafted_leaves_ascend_base_level), 1.2));
        cheese_count *= (1 + get_upgrade_attribute_value(global.upgrade_attributes.craft_salvage_reward));
        if (self.get_level() == 1 && self.get_ascend_level() == 1)
        {
            cheese_count = 2 * (1 + get_upgrade_attribute_value(global.upgrade_attributes.craft_salvage_reward));
        }
        cheese_count = max(1, cheese_count);
        return build_resource_cost(resource, floor(cheese_count));
    };
    
    get_shards_cost = function()
    {
        var shards_count = self.get_shards_count();
        var shards_cost = 1;
        var shards_selected_cost = 10;
        if (self.type.rarity_index >= 17)
        {
            shards_cost = 10;
            shards_selected_cost = 100;
        }
        if (!is_undefined(self.selected_prop))
        {
            shards_cost = rround(shards_selected_cost - get_upgrade_attribute_value(global.upgrade_attributes.shards_reduce_selection_cost));
        }
        shards_cost = max(1, rround(shards_cost));
        return build_resource_cost(global.resources.shards, shards_cost);
    };
    
    get_shards_count = function(arg0 = undefined)
    {
        if (is_string(arg0))
        {
            if (is_undefined(variable_struct_get(self.data.shards, arg0)))
            {
                return 0;
            }
            if (is_struct(variable_struct_get(self.data.shards, arg0)))
            {
                var shards_struct_key = get_first_key_from_struct(variable_struct_get(self.data.shards, arg0));
                return variable_struct_get(variable_struct_get(self.data.shards, arg0), shards_struct_key);
            }
            return variable_struct_get(self.data.shards, arg0);
        }
        var shards_count = 0;
        var __struct = self.data.shards;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            if (is_struct(mitem))
            {
                var __struct2 = mitem;
                var __prop_names2 = struct_get_names(__struct2);
                var __prop_len2 = array_length(__prop_names2);
                for (var __i2 = 0; __i2 < __prop_len2; __i2++)
                {
                    var mkey2 = __prop_names2[__i2];
                    var mitem2 = variable_struct_get(__struct2, mkey2);
                    shards_count += mitem2;
                }
            }
            else
            {
                shards_count += mitem;
            }
        }
        return shards_count;
    };
    
    get_shards_max_count = function()
    {
        return global.game_settings.shards_max_count + get_upgrade_attribute_value(global.upgrade_attributes.shards_max_count);
    };
    
    get_shards_max_count_single = function()
    {
        return global.game_settings.shards_max_count_single + get_upgrade_attribute_value(global.upgrade_attributes.shards_max_count_single);
    };
    
    get_preset_transformation_cost = function(arg0)
    {
        global.craft_leaves_transform_output_index = -1;
        global.craft_leaves_transform_output_var = undefined;
        self.build_fusion_cost();
        var diff_props_count = get_different_struct_keys_count(self.data.props, arg0);
        var cost = self.get_transformation_cost(diff_props_count * 10);
        return cost;
    };
    
    get_transformation_cost = function(arg0 = 1)
    {
        var cost = self.transformation_cost;
        if (arg0 != 1)
        {
            cost = multiply_struct_values(cost, abs(arg0));
        }
        return cost;
    };
    
    get_upgrade_cost = function(arg0 = 1)
    {
        var upgrade_resource = global.resources.cheese;
        var total_cost = self.get_upgrade_cost_count(self.get_level(), arg0);
        if (self.type.rarity_index >= 17)
        {
            upgrade_resource = global.resources.shards;
        }
        var resource_cost = build_resource_cost(upgrade_resource, total_cost);
        return resource_cost;
    };
    
    get_upgrade_cost_count = function(arg0 = self.get_level(), arg1 = 1)
    {
        var i = 0;
        var base_cost = self.type.craft_bonus / 2;
        var total_cost = 0;
        var upgrade_resource_multiplier = 1.2;
        var upgrade_ascend_level_multiplier = 2;
        if (self.rarity_index >= 17)
        {
            base_cost = self.type.rarity_index - 16;
            upgrade_resource_multiplier = 1.005;
            upgrade_ascend_level_multiplier = 1.05;
        }
        repeat (arg1)
        {
            var cost = base_cost * power(arg0 + i, upgrade_resource_multiplier) * power(self.data.ascend_level, upgrade_ascend_level_multiplier);
            cost *= (1 - get_upgrade_attribute_value(global.upgrade_attributes.craft_upgrade_decrease_cost));
            cost = max(1, ceil(cost));
            total_cost += cost;
            i++;
        }
        return total_cost;
    };
    
    is_locked = function()
    {
        return self.data.locked;
    };
    
    move_selected_prop = function(arg0 = 1)
    {
        var props_length = array_length(self.props_sorted);
        if (props_length == 0)
        {
            exit;
        }
        self.selected_prop_index += arg0;
        if (self.selected_prop_index < 0)
        {
            self.selected_prop = undefined;
            self.selected_prop_index = -1;
        }
        self.selected_prop_index = clamp(self.selected_prop_index, -1, props_length - 1);
        if (self.selected_prop_index >= 0)
        {
            self.selected_prop = @@array_get@@(self.props_sorted, self.selected_prop_index);
        }
        self.build_fusion_cost();
        self.refresh_info_text();
        instance_destroy(o_tooltip);
    };
    
    toggle_lock = function()
    {
        self.data.locked = !self.data.locked;
    };
    
    upgrade = function(arg0 = 1)
    {
        repeat (arg0)
        {
            if (!self.can_upgrade())
            {
                exit;
            }
            dec_resources(self.get_upgrade_cost());
            self.data.level++;
            self.set_prop_values(true);
        }
    };
    
    generate_prop_value = function(arg0, arg1, arg2, arg3, arg4)
    {
        var quality_avg = (self.data.quality_base + self.data.quality) / 2;
        var quality_value = quality_avg;
        var craft_bonus = power(self.type.craft_bonus, 1.6);
        var level = self.data.level;
        if (self.data.ascend_level > 1)
        {
            level += (self.data.ascend_level * global.game_settings.crafted_leaves_ascend_base_level * 2);
        }
        var level_value = max(1, 1 + (level / 5));
        var prop_base_value = get_crafted_leaf_prop_base_value(arg0, arg4);
        var shard_multiplier = 3;
        var value = (prop_base_value * level_value * craft_bonus * (1 + (arg3 * shard_multiplier)) * (quality_value * 10)) / 100;
        value = value * self.get_tier_value_multiplier();
        value = max(0.0001, value);
        if (!is_undefined(arg0.value_func))
        {
            value = arg0.value_func(value);
        }
        value = apply_max_number(value);
        return value;
    };
    
    generate_rng_quality = function()
    {
        var old_quality = self.data.quality;
        self.quality = irandom_range(0.01, 100);
        var rng_quality = round(self.quality) + (get_upgrade_attribute_value(global.upgrade_attributes.craft_min_rng_quality) * 100);
        if (get_upgrade_count(global.shops.gems.craft_improve_rng) > 0 && global.shops.gems.craft_improve_rng.data.toggle)
        {
            rng_quality = max(old_quality, rng_quality) + 1;
        }
        return clamp(rng_quality, 1, 100);
    };
    
    generate_rng_craft_quality = function()
    {
        var old_quality = self.data.quality_base;
        self.quality_base = irandom_range(0.01, 100);
        var rng_quality = round(self.quality_base) + (get_upgrade_attribute_value(global.upgrade_attributes.craft_min_rng_quality) * 100);
        if (get_upgrade_count(global.shops.gems.craft_improve_rng) > 0 && global.shops.gems.craft_improve_rng.data.toggle)
        {
            rng_quality = max(old_quality, rng_quality) + 1;
        }
        return clamp(rng_quality, 1, 100);
    };
    
    get_available_props = function()
    {
        var props = [];
        var __array = global.craft_leaf_upgrade_vars_array;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (self.type.craft_level < mitem.min_rarity)
            {
                continue;
            }
            array_push(props, mitem);
        }
        return props;
    };
    
    get_info = function(arg0 = false)
    {
        if (is_undefined(self.info_cache))
        {
            self.refresh_info_text();
        }
        return arg0 ? self.info_cache_lite : self.info_cache;
    };
    
    refresh_info_text = function()
    {
        var level_text = sprintf(__("Level: %s/%s"), self.data.level, self.get_max_level());
        if (self.data.ascend_level > 1)
        {
            level_text = sprintf(__("Level: %s/%s | Ascend Level: %s/%s"), self.data.level, self.get_max_level(), self.data.ascend_level - 1, get_max_ascend_level());
        }
        var quality_text = sprintf(__("Craft Quality: %s% | RNG Quality: %s%"), self.data.quality_base, self.data.quality);
        var info = [self.get_name(), "--------------", level_text, quality_text];
        if (get_upgrade_count(global.shops.ancient.unlock_shards) > 0)
        {
            array_push(info, sprintf(__("Shards: %s/%s (%s)"), self.get_shards_count(), self.get_shards_max_count(), self.data.shards_added));
        }
        self.info_cache_table = [];
        var stats_info = [];
        var selected_prop_text = "";
        var __struct = self.data.props;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var text, name, value;
            if (is_struct(mitem) && !is_undefined(struct_get_from_hash(mitem, variable_get_hash("__resource_key"))))
            {
                name = get_upgrade_name(mkey, mitem.__resource_key);
                text = get_upgrade_text(mkey, variable_struct_get(mitem, mitem.__resource_key), mitem.__resource_key);
                value = get_upgrade_text(mkey, variable_struct_get(mitem, mitem.__resource_key), mitem.__resource_key, undefined, undefined, true);
                if (is_struct(variable_struct_get(self.data.shards, mkey)) && !is_undefined(variable_struct_get(variable_struct_get(self.data.shards, mkey), mitem.__resource_key)))
                {
                    text += sprintf(" [%ss]", variable_struct_get(variable_struct_get(self.data.shards, mkey), mitem.__resource_key));
                }
            }
            else if (is_struct(mitem) && !is_undefined(struct_get_from_hash(mitem, variable_get_hash("__collection_key"))))
            {
                name = get_upgrade_name(mkey, mitem.__collection_key);
                text = get_upgrade_text(mkey, variable_struct_get(mitem, mitem.__collection_key), mitem.__collection_key);
                value = get_upgrade_text(mkey, variable_struct_get(mitem, mitem.__collection_key), mitem.__collection_key, undefined, undefined, true);
                if (is_struct(variable_struct_get(self.data.shards, mkey)) && !is_undefined(variable_struct_get(variable_struct_get(self.data.shards, mkey), mitem.__collection_key)))
                {
                    text += sprintf(" [%ss]", variable_struct_get(variable_struct_get(self.data.shards, mkey), mitem.__collection_key));
                }
            }
            else
            {
                name = get_upgrade_name(mkey);
                text = get_upgrade_text(mkey, mitem);
                value = get_upgrade_text(mkey, mitem, undefined, undefined, undefined, true);
                if (!is_undefined(variable_struct_get(self.data.shards, mkey)))
                {
                    text += sprintf(" [%ss]", variable_struct_get(self.data.shards, mkey));
                }
            }
            array_push(stats_info, 
            {
                prop_key: mkey,
                text: text
            });
            array_push(self.info_cache_table, [name, value]);
        }
        array_push(info, "");
        self.props_sorted = [];
        sort_array_by(stats_info, "text", true);
        var __array = stats_info;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (!is_undefined(self.selected_prop) && self.selected_prop == mitem.prop_key)
            {
                mitem.text = sprintf("---> %s", mitem.text);
            }
            array_push(info, mitem.text);
            array_push(self.props_sorted, mitem.prop_key);
        }
        var info_lite = [];
        array_copy(info_lite, 0, info, 2, array_length(info) - 1);
        self.info_cache = implode("\n", info);
        self.info_cache_lite = implode("\n", info_lite);
        return self.info_cache;
    };
    
    get_name = function()
    {
        var name = self.type.resource.name;
        if (self.data.tier > 1)
        {
            name += sprintf(" [T%s]", self.data.tier);
        }
        return name;
    };
    
    get_sprite = function()
    {
        return self.resource.sprite;
    };
    
    max_leaf = function()
    {
        var has_craft_improve_rng_upgrade = get_upgrade_count(global.shops.gems.craft_improve_rng) > 0 && global.shops.gems.craft_improve_rng.data.toggle;
        if (self.can_ascend())
        {
            self.ascend();
            self.max_leaf();
        }
        else if (self.can_upgrade())
        {
            self.upgrade();
            self.max_leaf();
        }
        else if (has_craft_improve_rng_upgrade && self.can_reroll())
        {
            self.reroll_rng();
            self.max_leaf();
        }
        else if (has_craft_improve_rng_upgrade && self.can_reroll_craft_quality())
        {
            self.reroll_craft_rng();
            self.max_leaf();
        }
    };
    
    reclaim_shards = function(arg0 = false)
    {
        var text = "";
        var shards_count = self.get_shards_count();
        self.data.shards = {};
        if (shards_count > 0)
        {
            var shards_added = self.data.shards_added;
            if (shards_added == 0)
            {
                shards_added = shards_count;
            }
            add_resources(
            {
                shards: shards_added
            }, false, true);
            text = sprintf(__("%s %s reclaimed."), shards_added, pluralize(shards_added, global.resources.shards.name_single, global.resources.shards.name_plural));
        }
        if (arg0)
        {
            dec_materials(self.get_reclaim_shards_cost());
        }
        self.data.shards_added = 0;
        self.refresh_props();
        if (text != "")
        {
            notify(text);
        }
    };
    
    refresh_props = function()
    {
        self.set_prop_values();
        self.set_upgrade_attributes();
        self.set_crafted_vars_seen();
    };
    
    reroll_props = function()
    {
        var text = __("Properties rerolled.");
        self.reclaim_shards();
        self.selected_prop = undefined;
        self.selected_prop_index = -1;
        self.data.reroll_props_count++;
        self.data.props = {};
        self.set_props();
        self.refresh_props();
        dec_materials(self.get_reroll_props_cost());
        notify(text);
        if (global.cloud_data.is_season)
        {
            save_game();
        }
    };
    
    reroll_rng = function()
    {
        var old_quality = self.data.quality;
        self.data.reroll_rng_count++;
        self.set_rng_quality();
        self.set_prop_values(false, true);
        dec_resources(self.get_reroll_cost());
        var quality_diff = self.data.quality - old_quality;
        var color = (quality_diff >= 0) ? global.colors.green : global.colors.red;
        if (quality_diff == 0)
        {
            color = global.colors.black;
        }
        notify(sprintf(__("Quality changed from %s% to %s% (%s%)"), old_quality, self.data.quality, number_format(quality_diff, 0, true)), undefined, color);
    };
    
    reroll_craft_rng = function()
    {
        var old_quality = self.data.quality_base;
        self.data.reroll_rng_count++;
        self.set_rng_craft_quality();
        self.set_prop_values(false, true);
        dec_resources(self.get_reroll_craft_quality_cost());
        var quality_diff = self.data.quality_base - old_quality;
        var color = (quality_diff >= 0) ? global.colors.green : global.colors.red;
        if (quality_diff == 0)
        {
            color = global.colors.black;
        }
        notify(sprintf(__("Craft Quality changed from %s% to %s% (%s%)"), old_quality, self.data.quality_base, number_format(quality_diff, 0, true)), undefined, color);
    };
    
    reroll_shards = function()
    {
        var shards_count = self.get_shards_count();
        if (shards_count == 0)
        {
            exit;
        }
        self.data.reroll_shards_count++;
        self.data.shards = {};
        repeat (shards_count)
        {
            self.add_shard(1, true);
        }
        self.refresh_info_text();
        dec_materials(self.get_reroll_shards_cost());
        notify(sprintf(__("%s %s rerolled."), shards_count, pluralize(shards_count, global.resources.shards.name_single, global.resources.shards.name_plural)));
        if (global.cloud_data.is_season)
        {
            save_game();
        }
    };
    
    salvage = function()
    {
        if (self.data.locked && !get_option(global.options.salvage_locked_leaves))
        {
            exit;
        }
        self.reclaim_shards();
        var salvage_resources = self.get_salvage_resources();
        if (global.selected_craft_item_id == self.data.id)
        {
            global.selected_craft_item_id = -1;
        }
        var res = delete_crafted_leaf(self.data.id);
        clear_selected_item("crafting", self);
        if (!res)
        {
            exit;
        }
        add_resources(salvage_resources);
        refresh_ua_section("crafted_leaves");
    };
    
    salvage_confirm = function()
    {
        global.selected_inventory_item.crafted_leaf = self;
        if (!get_option(global.options.show_salvage_confirm_dialog))
        {
            self.salvage();
        }
        else
        {
            confirm_dialog(__s("Do you want to salvage %s?", self.get_name()), function()
            {
                global.selected_inventory_item.crafted_leaf.salvage();
            }, undefined, undefined, 
            {
                parent_nav: "crafting"
            });
        }
    };
    
    set_props = function(arg0 = undefined)
    {
        if (is_struct(arg0))
        {
            var new_props_length = get_struct_length(arg0);
            if (new_props_length == 0)
            {
                exit;
            }
            var cost = self.get_preset_transformation_cost(arg0);
            if (!has_enough_resources(cost))
            {
                exit;
            }
            dec_resources(cost);
            self.data.props = struct_clone(arg0);
            var overflow = get_struct_length(self.data.props) - self.type.prop_count;
            if (overflow > 0)
            {
                log("overflow", overflow);
                repeat (overflow)
                {
                    var key = struct_get_first_key(self.data.props);
                    log("delete prop", key);
                    variable_struct_remove(self.data.props, key);
                }
            }
            else if (overflow < 0)
            {
                var n = 0;
                var props = self.get_available_props();
                props = array_shuffle(props);
                var props_length = array_length(props);
                while (get_struct_length(self.data.props) < self.type.prop_count && n < props_length)
                {
                    var prop = props[n];
                    var prop_key = prop.key;
                    n++;
                    if (!is_undefined(variable_struct_get(self.data.props, prop_key)))
                    {
                        continue;
                    }
                    self.set_prop(prop);
                }
            }
            self.refresh_props();
        }
        else
        {
            var props = self.get_available_props();
            props = array_shuffle(props);
            var props_length = array_length(props);
            for (var i = 0; i < self.type.prop_count; i++)
            {
                if (i >= props_length)
                {
                    break;
                }
                self.set_prop(@@array_get@@(props, i));
            }
        }
    };
    
    set_prop = function(arg0, arg1 = undefined)
    {
        if (arg0.has_resources)
        {
            var variants = arg0.resources;
            if (!is_undefined(arg1) && get_struct_length(variants) > 1)
            {
                variants = struct_clone(variants);
                variable_struct_remove(variants, arg1);
            }
            var random_resource = struct_random(variants);
            if (!is_gt(variable_struct_get(global.resources, random_resource.key).data.collected_total, 0))
            {
                random_resource = global.resources.leaves;
            }
            if (self.type.craft_level < get_default_struct_value(random_resource, "min_rarity", 0))
            {
                random_resource = global.resources.leaves;
            }
            var resource_value = get_cloned_struct_value(random_resource, "value");
            variable_struct_set(self.data.props, arg0.key, 
            {
                __resource_key: random_resource.key
            });
            variable_struct_set(variable_struct_get(self.data.props, arg0.key), random_resource.key, resource_value);
        }
        else if (is_struct(arg0.collection))
        {
            var variants = arg0.collection_items;
            if (!is_undefined(arg1) && get_struct_length(variants) > 1)
            {
                variants = struct_clone(variants);
                variable_struct_remove(variants, arg1);
            }
            var random_item = struct_random(variants, arg0.collection_exclude_keys);
            variable_struct_set(self.data.props, arg0.key, 
            {
                __collection_key: random_item.key
            });
            variable_struct_set(variable_struct_get(self.data.props, arg0.key), random_item.key, get_cloned_struct_value(arg0, "value"));
        }
        else
        {
            variable_struct_set(self.data.props, arg0.key, get_cloned_struct_value(arg0, "value"));
        }
    };
    
    set_prop_values = function(arg0 = false)
    {
        var __struct = self.data.props;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            self.set_prop_value(mkey, mitem, arg0);
        }
        self.refresh_info_text();
    };
    
    set_prop_value = function(arg0, arg1, arg2 = false)
    {
        var prop = variable_struct_get(global.craft_leaf_upgrade_vars, arg0);
        if (prop.has_resources)
        {
            var prop_value = get_default_value(variable_struct_get(arg1, arg1.__resource_key), 0);
            var old_value = prop_value;
            var shard_value = 0;
            if (!is_undefined(variable_struct_get(self.data.shards, arg0)) && !is_undefined(variable_struct_get(variable_struct_get(self.data.shards, arg0), arg1.__resource_key)))
            {
                shard_value = variable_struct_get(variable_struct_get(self.data.shards, arg0), arg1.__resource_key);
            }
            var value = self.generate_prop_value(prop, prop_value, arg2, shard_value, arg1);
            variable_struct_set(variable_struct_get(self.data.props, arg0), arg1.__resource_key, value);
        }
        else if (!is_undefined(prop.collection))
        {
            var prop_value = get_default_value(variable_struct_get(arg1, arg1.__collection_key), 0);
            var old_value = prop_value;
            var shard_value = 0;
            if (!is_undefined(variable_struct_get(self.data.shards, arg0)) && !is_undefined(variable_struct_get(variable_struct_get(self.data.shards, arg0), arg1.__collection_key)))
            {
                shard_value = variable_struct_get(variable_struct_get(self.data.shards, arg0), arg1.__collection_key);
            }
            var value = self.generate_prop_value(prop, prop_value, arg2, shard_value, arg1);
            variable_struct_set(variable_struct_get(self.data.props, arg0), arg1.__collection_key, value);
        }
        else
        {
            var prop_value = prop.value;
            var shard_value = 0;
            if (!is_undefined(variable_struct_get(self.data.shards, arg0)))
            {
                shard_value = variable_struct_get(self.data.shards, arg0);
            }
            var old_value = arg1;
            var value = self.generate_prop_value(prop, prop_value, arg2, shard_value, arg1);
            variable_struct_set(self.data.props, arg0, value);
        }
    };
    
    set_rng_quality = function(arg0 = undefined)
    {
        if (is_undefined(arg0))
        {
            arg0 = self.generate_rng_quality();
        }
        self.data.quality = arg0;
        self.refresh_info_text();
    };
    
    set_rng_craft_quality = function(arg0 = undefined)
    {
        if (is_undefined(arg0))
        {
            arg0 = self.generate_rng_craft_quality();
        }
        self.data.quality_base = arg0;
        self.refresh_info_text();
    };
    
    set_type = function()
    {
        self.type = variable_struct_get(global.craft_leaf_types, self.data.type_key);
        self.rarity_index = self.type.rarity_index;
        self.resource = variable_struct_get(global.resources, self.data.type_key);
        if (is_undefined(self.resource))
        {
            self.resource = global.resources.leaves;
        }
        self.build_fusion_cost();
    };
    
    set_upgrade_attributes = function()
    {
        self.upgrade_attributes = self.data.props;
    };
    
    transform_reroll_prop = function()
    {
        if (self.selected_prop_index == -1 || is_undefined(variable_struct_get(self.data.props, self.selected_prop)))
        {
            log("invalid transform reroll", self.selected_prop_index, self.selected_prop);
            return false;
        }
        if (!self.can_transform())
        {
            exit;
        }
        var old_variant_key = undefined;
        var old_prop_data = variable_struct_get(self.data.props, self.selected_prop);
        if (is_struct(old_prop_data))
        {
            old_variant_key = struct_get_from_hash(old_prop_data, variable_get_hash("__resource_key")) ?? struct_get_from_hash(old_prop_data, variable_get_hash("__collection_key"));
        }
        var props = self.get_available_props();
        var __struct = self.data.props;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            if (variable_struct_get(global.craft_leaf_upgrade_vars, mkey).has_resources || !is_undefined(variable_struct_get(global.craft_leaf_upgrade_vars, mkey).collection))
            {
                continue;
            }
            remove_from_array_by_key(props, mkey);
        }
        props = array_shuffle(props);
        var new_prop;
        if (is_struct(global.craft_leaves_transform_output_var))
        {
            var prop_in_available_props = _find(props, function(arg0)
            {
                return arg0.key == global.craft_leaves_transform_output_var.key;
            });
            if (is_undefined(prop_in_available_props))
            {
                return notify(__("Can't transform to this property."));
            }
            if (!is_undefined(variable_struct_get(self.data.props, global.craft_leaves_transform_output_var.key)) && global.craft_leaves_transform_output_var.key != self.selected_prop)
            {
                return notify(__("Can't transform to this property."));
            }
            new_prop = prop_in_available_props;
        }
        else
        {
            new_prop = array_random_item(props);
            while (!is_undefined(variable_struct_get(self.data.props, new_prop.key)))
            {
                new_prop = array_random_item(props);
            }
        }
        dec_resources(self.transformation_cost);
        variable_struct_remove(self.data.shards, self.selected_prop);
        variable_struct_remove(self.data.props, self.selected_prop);
        var new_prop_name = get_upgrade_name(new_prop.key);
        self.set_prop(new_prop, (new_prop.key == self.selected_prop) ? old_variant_key : undefined);
        self.set_prop_value(new_prop.key, variable_struct_get(self.data.props, new_prop.key), false);
        self.refresh_info_text();
        self.selected_prop = undefined;
        self.selected_prop_index = -1;
        for (var i = 0; i < array_length(self.props_sorted); i++)
        {
            self.move_selected_prop();
            if (self.selected_prop == new_prop.key)
            {
                break;
            }
        }
        self.refresh_info_text();
        notify(sprintf(__("Transformed property: %s"), new_prop_name));
    };
    
    upgrade_quality = function()
    {
    };
    
    set_crafted_vars_seen = function()
    {
        var __struct = self.data.props;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            variable_struct_set(o_game.data.stats.crafted_vars_seen, mkey, 1);
        }
    };
    
    can_increase_tier = function()
    {
        if (self.data.level < self.min_ascend_craft_level || self.data.ascend_level < self.min_ascend_craft_ascend_level)
        {
            return false;
        }
        if (self.data.tier >= self.get_max_tier())
        {
            return false;
        }
        if (!has_enough(self.get_tier_upgrade_cost()))
        {
            return false;
        }
        return true;
    };
    
    get_max_tier = function()
    {
        return get_bm_value(global.game_settings.craft_leaves_max_tier, "craft_max_tier");
    };
    
    get_tier_value_multiplier = function()
    {
        return power(self.data.tier, 1.5);
    };
    
    get_tier_upgrade_cost = function()
    {
        var cost = 
        {
            materials: {}
        };
        if (self.data.tier < 3)
        {
            cost.materials.essence_shadow = 150 * power(self.data.tier, 2);
        }
        else if (self.data.tier < 6)
        {
            cost.materials.shadow_crystal = 50 * power(self.data.tier - 2, 1.5);
        }
        else
        {
            cost.materials.light_rod = 25 * power(self.data.tier - 5, 1.4);
        }
        call_struct_func(cost.materials, rround);
        return cost;
    };
    
    upgrade_tier = function()
    {
        dec_result(self.get_tier_upgrade_cost());
        self.data.tier++;
        notify(__s("Crafted Leaf upgrade to tier %s!", self.data.tier));
        self.set_prop_values();
    };
    
    get_bg_color = function()
    {
        var color = variable_struct_get(global.custom_colors, self.data.color_id);
        if (is_undefined(color))
        {
            return global.custom_colors.def.color;
        }
        return color.color;
    };
    
    get_bg_sprite = function()
    {
        var color = variable_struct_get(global.custom_colors, self.data.color_id);
        if (is_undefined(color))
        {
            return global.custom_colors.def.sprite;
        }
        return color.sprite;
    };
    
    load_data = function(arg0)
    {
        self.data.props = {};
        self.data.shards = {};
        apply_struct_to_struct(self.data, arg0);
        self.set_type();
        self.set_upgrade_attributes();
        self.set_crafted_vars_seen();
    };
    
    set_local_vars(arg1);
    set_sprite_data(self);
    self.init(arg2);
}

enum UnknownEnum
{
    Value_1 = 1
}
