function Season_Pass_Nature(arg0) : Season_Pass(arg0) constructor
{
    fields_start_count = 3;
    upgrade_attributes_cache = {};
    upgrade_attributes_plants = {};
    
    init_late = function()
    {
        var field_props = {};
        for (var i = 0; i < self.max_fields; i++)
        {
            variable_struct_set(field_props, i, 
            {
                bfly_locked: false,
                bfly_progress: 0,
                locked: false,
                quality: 0,
                quality_timeout: 0,
                position: i,
                progress: 0,
                water: 0
            });
        }
        struct_apply_defaults(o_game.data.nature_season.field_props, field_props, true);
    };
    
    can_enhance_field = function(arg0)
    {
        if (arg0.prop.quality_timeout > o_game.data.stats.time_elapsed)
        {
            return false;
        }
        var max_quality = self.get_max_field_quality();
        if (arg0.prop.quality >= max_quality)
        {
            return false;
        }
        if (!has_enough_resources(self.get_enhance_cost(arg0.prop)))
        {
            return false;
        }
        return true;
    };
    
    can_harvest = function(arg0, arg1 = global.resource_types.plant)
    {
        if (!is_struct(arg0))
        {
            return false;
        }
        if (is_same_key(arg1, global.resource_types.plant))
        {
            if (!arg0.has_plant)
            {
                return false;
            }
            if (arg0.prop.progress < 1)
            {
                return false;
            }
            if (arg0.prop.locked)
            {
                return false;
            }
        }
        else if (is_same_key(arg1, global.resource_types.butterfly))
        {
            if (!arg0.has_butterfly)
            {
                return false;
            }
            if (arg0.prop.bfly_progress < 1)
            {
                return false;
            }
            if (arg0.prop.bfly_locked)
            {
                return false;
            }
        }
        return true;
    };
    
    can_plant = function(arg0, arg1)
    {
        if (arg0.data.count == 0)
        {
            return false;
        }
        if (is_same_key(arg0.type, global.resource_types.butterfly))
        {
            return !arg1.has_butterfly;
        }
        return !arg1.has_plant;
    };
    
    can_use_time_skip = function(arg0, arg1)
    {
        var cost = self.get_time_skip_resources(arg0, arg1);
        if (!has_enough_resources(cost))
        {
            return false;
        }
        if (is_same_key(arg1, global.resource_types.plant))
        {
            if (arg0.has_plant && arg0.prop.progress >= 1 && arg0.prop.quality_timeout <= o_game.data.stats.time_elapsed)
            {
                return false;
            }
            else if (!arg0.has_plant && arg0.prop.quality_timeout <= o_game.data.stats.time_elapsed)
            {
                return false;
            }
        }
        else if (is_same_key(arg1, global.resource_types.butterfly))
        {
            if (!arg0.has_butterfly)
            {
                return false;
            }
            if (!arg0.has_plant)
            {
                return false;
            }
            if (arg0.prop.progress < 1)
            {
                return false;
            }
            if (arg0.prop.bfly_progress >= 1)
            {
                return false;
            }
        }
        return true;
    };
    
    check_upgrade_attributes = function()
    {
        self.upgrade_attributes_cache = {};
        self.upgrade_attributes_plants = {};
        var __array = global.resources_types.plant;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            mitem.synergy_bonus_cache = {};
            mitem.upgrade_attributes_cache = {};
        }
        __array = global.resources_types.butterfly;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            mitem.synergy_bonus_cache = {};
            mitem.upgrade_attributes_cache = {};
        }
        var __struct = o_game.data.nature_season.fields;
        var __prop_names = struct_get_names(__struct);
        __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var field = get_plant_field(__i);
            if (!field.has_plant)
            {
                continue;
            }
            if (field.prop.progress < 1)
            {
                continue;
            }
            if (is_undefined(struct_get_from_hash(field.item, variable_get_hash("upgrade_attributes"))))
            {
                continue;
            }
            variable_struct_set(field.item.synergy_bonus_cache, __i, call_method(field.item, field.item.get_synergy_bonus, __i));
            variable_struct_set(field.item.upgrade_attributes_cache, __i, call_method(field.item, field.item.get_upgrade_attributes, __i));
            add_struct_to_struct(self.upgrade_attributes_plants, variable_struct_get(field.item.upgrade_attributes_cache, __i));
            if (field.has_butterfly && field.prop.bfly_progress >= 1)
            {
                variable_struct_set(field.butterfly.synergy_bonus_cache, __i, call_method(field.butterfly, field.butterfly.get_synergy_bonus, __i));
                variable_struct_set(field.butterfly.upgrade_attributes_cache, __i, call_method(field.butterfly, field.butterfly.get_upgrade_attributes, __i));
                add_struct_to_struct(self.upgrade_attributes_plants, variable_struct_get(field.butterfly.upgrade_attributes_cache, __i));
            }
        }
        add_struct_to_struct(self.upgrade_attributes_cache, self.upgrade_attributes_plants);
        add_struct_to_struct(self.upgrade_attributes_cache, self.upgrade_attributes);
    };
    
    enhance_field = function(arg0)
    {
        dec_resources(self.get_enhance_cost(arg0.prop));
        arg0.prop.quality += self.get_quality_increase_value();
        arg0.prop.quality = clamp(arg0.prop.quality, 0, self.get_max_field_quality());
        arg0.prop.quality_timeout = o_game.data.stats.time_elapsed + self.get_enhance_timeout();
        o_game.data.nature_season.fields_enhanced++;
    };
    
    forward_time = function(arg0, arg1, arg2 = self.get_time_skip_value())
    {
        var cost = self.get_time_skip_resources(arg0, arg1);
        self.progress_field(arg0, arg1, arg2);
        arg0.prop.quality_timeout -= sec(arg2);
        arg0.prop.quality_timeout = max(arg0.prop.quality_timeout, 0);
        dec_resources(cost);
    };
    
    game_loop_second = function(arg0 = 1, arg1 = false)
    {
        if (arg1)
        {
            exit;
        }
        var max_fields = self.get_max_fields();
        var fields = [];
        var active_fields = [];
        var __struct = o_game.data.nature_season.field_props;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var field = get_plant_field(mitem.position);
            array_push(fields, field);
            if (field.has_plant && mitem.position < max_fields)
            {
                array_push(active_fields, field);
            }
        }
        var auto_water_field = array_random_item(active_fields);
        var __array = fields;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            var field = mitem;
            var plant_key = mitem.key;
            if (field.has_plant)
            {
                self.progress_field(field, global.resource_types.plant, arg0);
            }
            if (field.has_butterfly)
            {
                self.progress_field(field, global.resource_types.butterfly, arg0);
            }
            field.prop.water -= self.get_water_decrease_value(plant_key);
            if (is_struct(auto_water_field) && auto_water_field.index == field.index)
            {
                field.prop.water += self.get_water_auto_value();
            }
            field.prop.water = clamp(field.prop.water, 0, 1);
        }
        var max_vial_charges = self.get_max_vial_charges();
        var vial_timer_progress_value = self.get_vial_progress_value(arg0);
        if (o_game.data.nature_season.vial_charges < max_vial_charges)
        {
            o_game.data.nature_season.vial_timer += vial_timer_progress_value;
            if (o_game.data.nature_season.vial_timer >= 1)
            {
                o_game.data.nature_season.vial_charges += 1;
                o_game.data.nature_season.vial_timer -= 1;
            }
        }
        else
        {
            o_game.data.nature_season.vial_timer = 0;
        }
        o_game.data.nature_season.vial_timer = clamp(o_game.data.nature_season.vial_timer, 0, max_vial_charges);
    };
    
    get_enhance_cost = function(arg0)
    {
        var cost = 
        {
            magic_mulch: 2
        };
        cost.magic_mulch *= 1 + power(arg0.quality * 100, 1.3);
        cost.magic_mulch *= 1 - get_upgrade_attribute_value(global.upgrade_attributes.nature_enhance_cost_reduction);
        cost.magic_mulch = round(max(1, cost.magic_mulch));
        return cost;
    };
    
    get_enhance_timeout = function()
    {
        var value = sec(14400);
        value *= (1 - get_upgrade_attribute_value(global.upgrade_attributes.nature_enhance_timeout_multiplier));
        value = max(sec(60), value);
        return value;
    };
    
    get_active_fields = function()
    {
        return self.get_fields(true);
    };
    
    get_fields = function(arg0 = false)
    {
        var max_fields = self.get_max_fields();
        var active_fields = [];
        var fields = [];
        var __struct = o_game.data.nature_season.field_props;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var field = get_plant_field(mitem.position);
            array_push(fields, field);
            if (field.has_plant && mitem.position < max_fields)
            {
                array_push(active_fields, field);
            }
        }
        if (arg0)
        {
            return active_fields;
        }
        return fields;
    };
    
    get_grow_duration = function(arg0, arg1 = undefined)
    {
        var value = arg0.grow_duration;
        value *= (1 - get_upgrade_attribute_value(global.upgrade_attributes.nature_plant_grow_duration));
        value = max(1, value);
        return value;
    };
    
    get_harvest_resources = function(arg0, arg1)
    {
        var res = undefined;
        var value = 0;
        if (is_same_key(arg1, global.resource_types.plant) && arg0.has_plant)
        {
            value = ceil(arg0.item.plant_index_calc * 0.5);
            res = build_resource_cost(global.resources.nature_gems, value);
        }
        else if (is_same_key(arg1, global.resource_types.butterfly) && arg0.has_butterfly)
        {
            value = ceil(arg0.butterfly.plant_index_calc * 1.5);
            res = build_resource_cost(global.resources.nature_gems, value);
        }
        return res;
    };
    
    get_item_spawn_chance = function(arg0)
    {
        var spawn_chance = arg0.spawn_chance;
        spawn_chance += get_upgrade_attribute_value(global.upgrade_attributes.nature_vial_rarity_seed_spawn_chance);
        return spawn_chance;
    };
    
    get_max_fields = function()
    {
        var value = self.fields_start_count + get_upgrade_attribute_value(global.upgrade_attributes.nature_max_fields);
        value = clamp(value, 1, self.max_fields);
        return value;
    };
    
    get_max_field_quality = function()
    {
        var value = get_bm_value(1, "nature_plant_quality_inc_value");
        return value;
    };
    
    get_max_vial_charges = function()
    {
        var value = 1;
        value += get_upgrade_attribute_value(global.upgrade_attributes.nature_vial_max_charges);
        value = floor(max(1, value));
        return value;
    };
    
    get_quality_increase_value = function()
    {
        var value = 0.01;
        return value;
    };
    
    get_random_plant_seed = function()
    {
        var seed = get_random_array_item_by_chance(global.resources_plants_rarity, function(arg0)
        {
            return global.season_pass.nature.get_item_spawn_chance(arg0);
        }, global.resources.plant_hyacinth);
        return seed;
    };
    
    get_butterfly_xp = function(arg0, arg1 = 1, arg2 = undefined)
    {
        var base_xp = 0;
        if (arg0.has_butterfly)
        {
            base_xp = arg0.butterfly.xp_value;
        }
        if (is_numeric(arg2))
        {
            base_xp = arg2;
        }
        var xp = base_xp * arg1;
        xp *= self.get_xp_multiplier();
        return xp;
    };
    
    get_plant_xp = function(arg0, arg1 = 1, arg2 = undefined, arg3 = global.resource_types.plant)
    {
        var is_plant = is_same_key(arg3, global.resource_types.plant);
        var is_bfly = is_same_key(arg3, global.resource_types.butterfly);
        var base_xp = 0;
        if (is_plant && arg0.has_plant)
        {
            base_xp = arg0.item.xp_value;
        }
        if (is_bfly && arg0.has_butterfly)
        {
            base_xp = arg0.butterfly.xp_value;
        }
        if (is_numeric(arg2))
        {
            base_xp = arg2;
        }
        var xp;
        if (is_plant)
        {
            xp = get_bm_value(base_xp * arg1 * (1 + arg0.prop.quality), undefined, "nature_plant_xp_multiplier_global", undefined, true);
        }
        else if (is_bfly)
        {
            xp = base_xp * arg1;
            xp *= (1 + get_upgrade_attribute_value(global.upgrade_attributes.nature_butterfly_xp_multiplier_global));
        }
        if (is_plant || get_upgrade_count(global.shops.event_nature.nature_butterfly_affects_butterfly_xp) > 0)
        {
            var bfly_xp_multiplier = 0;
            var __struct = o_game.data.nature_season.fields;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                var loop_field = get_plant_field(__i);
                if (!loop_field.has_butterfly)
                {
                    continue;
                }
                if (loop_field.prop.bfly_progress < 1)
                {
                    continue;
                }
                bfly_xp_multiplier += loop_field.butterfly.xp_multiplier;
            }
            xp *= (1 + bfly_xp_multiplier);
        }
        xp *= self.get_xp_multiplier();
        return xp;
    };
    
    get_progress_inc_value = function(arg0, arg1 = global.resource_types.plant)
    {
        if (is_same_key(global.resource_types.butterfly, arg1) && !arg0.has_butterfly)
        {
            return 0;
        }
        if (!arg0.has_plant)
        {
            return 0;
        }
        var value = 0;
        if (is_same_key(global.resource_types.butterfly, arg1))
        {
            value = 1 / self.get_grow_duration(arg0.butterfly);
        }
        else if (is_same_key(global.resource_types.plant, arg1))
        {
            value = 1 / self.get_grow_duration(arg0.item);
            value *= (1 + arg0.prop.water);
        }
        return value;
    };
    
    get_random_butterfly = function()
    {
        var bfly = get_random_array_item_by_chance(global.resources_types.butterfly, function(arg0)
        {
            return global.season_pass.nature.get_item_spawn_chance(arg0);
        }, global.resources.butterfly_meadowdance);
        return bfly;
    };
    
    get_salvage_resources = function(arg0, arg1 = 1)
    {
        arg1 = abs(arg1);
        if (is_same_key(arg0.type, global.resource_types.plant))
        {
            var value = arg0.salvage_value * 2;
            value *= arg1;
            return build_resource_cost(global.resources.magic_mulch, value);
        }
        else if (is_same_key(arg0.type, global.resource_types.butterfly))
        {
            var value = arg0.salvage_value * 10;
            value *= arg1;
            return build_resource_cost(global.resources.magic_mulch, value);
        }
        return {};
    };
    
    get_time_skip_resources = function(arg0, arg1)
    {
        var cost = 
        {
            nature_time_sphere: 1
        };
        if (is_same_key(arg1, global.resource_types.butterfly))
        {
            cost.nature_time_sphere = 2;
        }
        return cost;
    };
    
    get_time_skip_value = function(arg0, arg1)
    {
        var value = get_bm_value(global.game_settings.nature_time_skip_value, undefined, "nature_time_skip_value_multiplier");
        return value;
    };
    
    get_upgrade_attributes = function()
    {
        return self.upgrade_attributes_cache;
    };
    
    get_vial_clover3_spawn_chance = function()
    {
        var value = get_bm_value(global.game_settings.nature_vial_clover3_spawn_chance, "nature_vial_clover3_spawn_chance");
        return value;
    };
    
    get_vial_clover4_spawn_chance = function()
    {
        var value = get_bm_value(global.game_settings.nature_vial_clover4_spawn_chance, "nature_vial_clover4_spawn_chance");
        return value;
    };
    
    get_vial_progress_value = function(arg0 = 1)
    {
        var value = 0.0033333333333333335;
        value *= (1 + get_upgrade_attribute_value(global.upgrade_attributes.nature_vial_progress_multiplier));
        value = min(1, value);
        value *= arg0;
        return value;
    };
    
    get_vial_seed_spawn_count = function()
    {
        var value = get_bm_value(1, "nature_vial_seed_spawn_count");
        return value;
    };
    
    get_water_auto_value = function()
    {
        return self.get_water_increase_value() * get_upgrade_attribute_value(global.upgrade_attributes.nature_water_auto);
    };
    
    get_water_decrease_value = function(arg0 = undefined)
    {
        var value = 0.001;
        if (is_string(arg0))
        {
            var res = variable_struct_get(global.resources, arg0);
            value *= (1 + res.water_drain_multiplier);
        }
        value *= (1 - get_upgrade_attribute_value(global.upgrade_attributes.nature_water_decrease_drain_value_multiplier));
        value = max(0, value);
        return value;
    };
    
    get_water_increase_value = function()
    {
        var value = get_bm_value(0.05, "nature_water_increase_value");
        return value;
    };
    
    get_xp_multiplier = function()
    {
        var value = get_bm_value(1, undefined, "nature_xp_multiplier", undefined, true);
        return value;
    };
    
    grown = function(arg0, arg1)
    {
        var name;
        if (is_same_key(arg1, global.resource_types.plant))
        {
            name = arg0.item.name;
        }
        else if (is_same_key(arg1, global.resource_types.butterfly))
        {
            name = arg0.butterfly.name;
        }
        notify(__s("%s has grown.", name));
        self._check_upgrade_attributes();
        refresh_ua_section("season_pass");
    };
    
    harvest = function(arg0, arg1 = false, arg2 = global.resource_types.plant)
    {
        if (!self.can_harvest(arg0, arg2))
        {
            exit;
        }
        var is_plant = is_same_key(arg2, global.resource_types.plant);
        var is_bfly = is_same_key(arg2, global.resource_types.butterfly);
        var xp = self.get_plant_xp(arg0, undefined, undefined, arg2);
        self.add_xp(xp);
        var res = self.get_harvest_resources(arg0, arg2);
        add_resources(res);
        var return_seed_count = 0;
        var harvest_seed_chance = get_upgrade_attribute_value(global.upgrade_attributes.nature_plant_harvest_seed_chance);
        if (percent_chance(harvest_seed_chance * 100))
        {
            return_seed_count = 1;
        }
        var butterfly = undefined;
        var bfly_count = 0;
        var bfly_chance = get_upgrade_attribute_value(global.upgrade_attributes.nature_plant_harvest_bfly_chance);
        if (is_unlocked_butterflies() && percent_chance(bfly_chance * 100))
        {
            bfly_count = 1;
            butterfly = self.get_random_butterfly();
            add_resources(build_resource_cost(butterfly, bfly_count));
        }
        var text = sprintf("%s XP.", xp);
        if (return_seed_count > 0 && arg0.has_plant)
        {
            text += ("\n" + format_resources_text(build_resource_cost(arg0.item, return_seed_count)));
        }
        if (bfly_count > 0)
        {
            text += ("\n" + format_resources_text(build_resource_cost(butterfly, bfly_count)));
        }
        if (is_struct(res))
        {
            text += ("\n" + format_resources_text(res));
        }
        self.remove_plant(arg0.index, return_seed_count, arg2);
        if (is_plant)
        {
            o_game.data.nature_season.plants_harvested++;
        }
        else if (is_bfly)
        {
            o_game.data.nature_season.butterflies_harvested++;
        }
        if (arg1)
        {
            return 
            {
                xp: xp,
                seed_count: return_seed_count,
                bfly_count: bfly_count,
                resources: res
            };
        }
        self.check_upgrade_attributes();
        refresh_ua_section("season_pass");
        notify(text);
    };
    
    has_premium = function()
    {
        return is_dlc_purchase_valid(global.shops.dlc.nature_pack.dlc_id);
    };
    
    offline_step = function(arg0 = 1, arg1 = false)
    {
        if (arg1)
        {
            exit;
        }
        var max_fields = self.get_max_fields();
        var fields = [];
        var active_fields = [];
        var __struct = o_game.data.nature_season.field_props;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var field = get_plant_field(mitem.position);
            array_push(fields, field);
            if (field.has_plant && mitem.position < max_fields)
            {
                array_push(active_fields, field);
            }
        }
        var __array = fields;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            var field = mitem;
            var plant_key = mitem.key;
            if (field.has_plant)
            {
                self.progress_field(field, global.resource_types.plant, arg0);
            }
            if (field.has_butterfly)
            {
                self.progress_field(field, global.resource_types.butterfly, arg0);
            }
            field.prop.quality_timeout -= sec(arg0);
            field.prop.quality_timeout = max(field.prop.quality_timeout, 0);
        }
        var max_vial_charges = self.get_max_vial_charges();
        var vial_timer_progress_value = self.get_vial_progress_value(arg0);
        if (o_game.data.nature_season.vial_charges < max_vial_charges)
        {
            o_game.data.nature_season.vial_timer += vial_timer_progress_value;
            if (o_game.data.nature_season.vial_timer >= 1)
            {
                o_game.data.nature_season.vial_charges += floor(o_game.data.nature_season.vial_timer);
                o_game.data.nature_season.vial_timer -= floor(o_game.data.nature_season.vial_timer);
            }
        }
        o_game.data.nature_season.vial_charges = clamp(o_game.data.nature_season.vial_charges, 0, max_vial_charges);
        o_game.data.nature_season.vial_timer = clamp(o_game.data.nature_season.vial_timer, 0, max_vial_charges);
    };
    
    plant = function(arg0, arg1)
    {
        if (is_same_key(arg0.type, global.resource_types.butterfly))
        {
            if (arg1.has_butterfly)
            {
                return false;
            }
            arg1.prop.bfly_progress = 0;
            variable_struct_set(o_game.data.nature_season.fields_butterflies, arg1.index, arg0.key);
        }
        else if (is_same_key(arg0.type, global.resource_types.plant))
        {
            if (arg1.has_plant)
            {
                return false;
            }
            arg1.prop.progress = 0;
            variable_struct_set(o_game.data.nature_season.fields, arg1.index, arg0.key);
        }
        arg0.data.count--;
        return true;
    };
    
    progress_field = function(arg0, arg1, arg2 = 1)
    {
        var progress_key;
        if (is_same_key(arg1, global.resource_types.plant))
        {
            progress_key = "progress";
        }
        else if (is_same_key(arg1, global.resource_types.butterfly))
        {
            if (!arg0.has_plant || arg0.prop.progress < 1)
            {
                exit;
            }
            progress_key = "bfly_progress";
        }
        var before_progress = variable_struct_get(arg0.prop, progress_key);
        variable_struct_set(arg0.prop, progress_key, variable_struct_get(arg0.prop, progress_key) + (self.get_progress_inc_value(arg0, arg1) * arg2));
        if (before_progress < 1 && variable_struct_get(arg0.prop, progress_key) >= 1)
        {
            self.grown(arg0, arg1);
        }
        variable_struct_set(arg0.prop, progress_key, clamp(variable_struct_get(arg0.prop, progress_key), 0, 1));
    };
    
    remove_plant = function(arg0, arg1 = 0, arg2 = global.resource_types.plant)
    {
        var is_plant = is_same_key(arg2, global.resource_types.plant);
        var is_bfly = is_same_key(arg2, global.resource_types.butterfly);
        var field = get_plant_field(arg0);
        if (is_plant && field.has_plant && arg1 > 0)
        {
            field.item.data.count += arg1;
        }
        if (is_bfly && field.has_butterfly && arg1 > 0)
        {
            field.butterfly.data.count += arg1;
        }
        if (is_plant)
        {
            field.has_plant = false;
            field.prop.progress = 0;
            variable_struct_set(o_game.data.nature_season.fields, arg0, undefined);
        }
        else if (is_bfly)
        {
            field.has_butterfly = false;
            field.prop.bfly_progress = 0;
            variable_struct_set(o_game.data.nature_season.fields_butterflies, arg0, undefined);
        }
    };
    
    salvage = function(arg0, arg1 = 1)
    {
        if (arg0.data.count <= 0)
        {
            exit;
        }
        arg0.data.count -= arg1;
        var salvage_resources = self.get_salvage_resources(arg0, arg1);
        add_resources(salvage_resources);
        return salvage_resources;
    };
}
