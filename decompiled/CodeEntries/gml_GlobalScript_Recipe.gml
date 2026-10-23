function Recipe(arg0) : Process_Object(arg0) constructor
{
    game_item_type = UnknownEnum.Value_9;
    autofinish = true;
    autouse_tooltip = __("Autobrew");
    button_text_use = __("Brew");
    button_use_width = gui_col_x(1.5);
    buy_unlock = true;
    can_brew = true;
    cancellable = true;
    crit_multiplier = 1;
    crit_possible = true;
    decrease_count_on_use = false;
    display_ext = false;
    duration = global.game_settings.alchemy_brew_time;
    ext_info = "";
    has_autouse = true;
    input_resources_options = 
    {
        insufficient_indicator: true
    };
    is_usable = true;
    last_crit_count = 0;
    max_count = 1;
    output = undefined;
    output_has_materials = false;
    output_has_relics = false;
    output_materials = undefined;
    output_max_count = 0;
    output_multiplier = 1;
    output_relics = undefined;
    section = global.dialog_sections.alchemy.general;
    scale_value = 0;
    skip_material_count_check = false;
    skip_relic_count_check = false;
    unlock_cost = {};
    use_auto_description = false;
    
    init = function()
    {
        struct_apply_defaults(self.unlock_cost, 
        {
            materials: {},
            resources: {}
        });
        var output = self.output();
        if (is_struct(struct_get_from_hash(output, variable_get_hash("materials"))))
        {
            self.output_has_materials = true;
            self.output_materials = output.materials;
        }
        if (is_struct(struct_get_from_hash(output, variable_get_hash("relics"))))
        {
            self.output_has_relics = true;
            self.output_relics = output.relics;
        }
    };
    
    activate = function(arg0 = 1)
    {
        dec_materials(self.get_input_materials(arg0));
        dec_resources(self.get_input_resources(arg0));
    };
    
    activate_offline = function(arg0)
    {
        if (!self.can_activate())
        {
            return 0;
        }
        if (!self.can_autouse())
        {
            return 0;
        }
        if (!self.data.autouse)
        {
            return 0;
        }
        arg0 *= (global.game_settings.alchemy_offline_brew_rate + get_upgrade_attribute_value(global.upgrade_attributes.alchemy_offline_brew_rate));
        var max_brew_count = global.game_settings.alchemy_offline_max_brews + get_upgrade_attribute_value(global.upgrade_attributes.alchemy_offline_max_brews);
        var max_brew_count_hard = 5000;
        max_brew_count = min(max_brew_count, max_brew_count_hard);
        var max_input_count = get_max_result_count(
        {
            materials: self.get_input_materials(max_brew_count),
            resources: self.get_input_resources(max_brew_count)
        });
        max_brew_count = min(max_brew_count, max_input_count);
        var max_count_duration = min(max_brew_count, floor(arg0 / self.get_duration()));
        max_brew_count = round(max_count_duration);
        var brew_count = 0;
        if (!self.can_activate(max_input_count))
        {
            return 0;
        }
        if ((self.output_has_materials && !self.skip_material_count_check) || (self.output_has_relics && !self.skip_relic_count_check))
        {
            while (brew_count < max_count_duration && self.can_activate() && brew_count <= max_brew_count)
            {
                self.activate();
                self.data.completed_count++;
                self.finish();
                brew_count++;
            }
        }
        else
        {
            self.activate(max_brew_count);
            self.data.completed_count += max_brew_count;
            self.finish(true, max_brew_count);
        }
        return brew_count;
    };
    
    can_activate = function(arg0 = 1, arg1 = false, arg2 = true)
    {
        if (arg2)
        {
            if (!has_enough_materials(self.get_input_materials()))
            {
                return false;
            }
            if (!has_enough_resources(self.get_input_resources()))
            {
                return false;
            }
        }
        if (!get_value_ext(self, self.can_brew))
        {
            return false;
        }
        if (self.output_has_materials && !self.skip_material_count_check)
        {
            var mats_maxed_count = 0;
            var mats_count = 0;
            var __struct = self.output_materials;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                var material = variable_struct_get(global.materials, mkey);
                if (is_undefined(material))
                {
                    continue;
                }
                mats_count++;
                if (material.data.count >= get_material_max_count())
                {
                    mats_maxed_count++;
                }
            }
            if (mats_maxed_count >= mats_count)
            {
                return false;
            }
        }
        else if (self.output_has_relics && !self.skip_relic_count_check)
        {
            var is_relic_storage_not_full = _any(variable_struct_get(global.relics_rarity_array, self.relic_type_key), function(arg0)
            {
                return arg0.data.count < arg0.get_max_count();
            });
            if (!is_relic_storage_not_full)
            {
                return false;
            }
        }
        return true;
    };
    
    is_autouse_enabled = function()
    {
        return get_cache("alchemy_autobrew_enabled", true);
    };
    
    cancel = function(arg0 = true)
    {
        if (!arg0)
        {
            exit;
        }
        add_materials(self.get_input_materials());
        add_resources(self.get_input_resources());
    };
    
    finish = function(arg0 = false, arg1 = 1)
    {
        var crit_chance = get_brew_crit_chance();
        var is_crit = self.crit_possible ? percent_chance(crit_chance * 100) : false;
        var crit_count = 0;
        if (is_crit)
        {
            crit_count = self.get_crit_count();
        }
        var output = self.get_output(is_crit, 1 + crit_count, arg1);
        var brew_text = add_result(output, undefined, global.texts.alchemy_brew_titles, true);
        if (is_crit)
        {
            var brew_crit_text = __("CRITICAL BREW!");
            if (crit_count > 1)
            {
                brew_crit_text = __s("MULTI-CRITICAL BREW: %s", string(self.last_crit_count) + "x");
            }
            brew_text += sprintf("\n%s", brew_crit_text);
            self.data.completed_crit_count += arg1;
            o_game.data.stats.brews.crits += arg1;
        }
        o_game.data.stats.brews.regular += arg1;
        if (!arg0 && get_option(global.options.enable_brew_notifications))
        {
            notify(brew_text);
        }
    };
    
    get_crit_count = function()
    {
        var crit_count = 1;
        var crit_multi_chance = get_brew_crit_multi_chance() * 100 * self.crit_multiplier;
        crit_count += multi_chance(crit_multi_chance, 0, 100);
        crit_count = min(get_brew_crit_max_count(), crit_count);
        return crit_count;
    };
    
    get_duration = function()
    {
        var duration = self.duration * (1 - get_upgrade_attribute_value(global.upgrade_attributes.alchemy_brew_time_reduction));
        duration = max(1, duration);
        return duration;
    };
    
    get_multiplier = function()
    {
        var multiplier = 1 + get_brew_multiplier();
        multiplier *= self.output_multiplier;
        return multiplier;
    };
    
    get_output = function(arg0 = false, arg1 = 2, arg2 = 1)
    {
        var crit_count = arg1;
        var result = self.output();
        result = multiply_struct_values(result, self.get_multiplier());
        result = multiply_struct_values(result, arg2);
        call_struct_func(result, min1);
        if (arg0)
        {
            arg1 = round(arg1);
            result = multiply_struct_values(result, arg1);
        }
        call_struct_func(result, round);
        if (self.output_max_count > 0)
        {
            call_struct_func(result, [min, self.output_max_count]);
        }
        if (arg0)
        {
            if (self.output_max_count > 0)
            {
                self.last_crit_count = min(arg1, self.output_max_count);
            }
            else
            {
                self.last_crit_count = arg1;
            }
        }
        return result;
    };
    
    get_description = function()
    {
        if (!self.data.unlocked)
        {
            return self.description_locked;
        }
        var desc_heading = "";
        if (self.use_auto_description)
        {
            desc_heading = format_result_text(self.get_output(), __("Create"));
        }
        else
        {
            desc_heading = get_value_ext(self, self.description);
            var multi_value_formatted = number_format(rround(self.get_multiplier() * self.scale_value));
            desc_heading = sprintf(desc_heading, multi_value_formatted);
            desc_heading = string_replace(desc_heading, "[count]", multi_value_formatted);
        }
        var desc = [desc_heading, sprintf("%s: %s | %s: %s", __("Brews"), number_format(self.data.completed_count), __("Crits"), number_format(self.data.completed_crit_count))];
        if (self.output_max_count > 0)
        {
            array_push(desc, __s("Max brew count: %s", self.output_max_count));
        }
        if (self.output_multiplier != 1)
        {
            array_push(desc, __s("Output multiplier: %s", number_format_percent(self.output_multiplier)));
        }
        if (self.crit_multiplier != 1)
        {
            array_push(desc, __s("Crit multiplier: %s", number_format_percent(self.crit_multiplier)));
        }
        if (self.is_active())
        {
            array_push(desc, __s("Brew time remaining: %s", self.get_expire_time_formatted()));
        }
        else
        {
            array_push(desc, " ");
        }
        return implode("\n", desc);
    };
    
    set_local_vars(arg0);
    set_sprite_data(self);
    init();
}

enum UnknownEnum
{
    Value_9 = 9
}
