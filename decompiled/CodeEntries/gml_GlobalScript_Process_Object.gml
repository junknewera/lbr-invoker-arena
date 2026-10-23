function Process_Object(arg0) : Collectable_Usable_Object(arg0) constructor
{
    autofinish = true;
    autouse_tooltip = __("Autobrew");
    button_text_use = __("Brew");
    button_text_using = button_text_use;
    buy_unlock = true;
    can_brew = true;
    cancellable = true;
    decrease_count_on_use = false;
    duration = global.game_settings.alchemy_brew_time;
    has_autouse = true;
    input_resources_options = undefined;
    output_resources_options = undefined;
    is_usable = true;
    max_count = 1;
    output = undefined;
    output_has_materials = false;
    output_materials = undefined;
    skip_activate_count = true;
    skip_material_count_check = false;
    static_resources = true;
    unlock_cost = {};
    
    init = function()
    {
        struct_apply_defaults(self.unlock_cost, 
        {
            materials: {},
            resources: {}
        });
        var output = self.output();
        if (is_struct(output))
        {
            if (is_struct(struct_get_from_hash(output, variable_get_hash("materials"))))
            {
                self.output_has_materials = true;
                self.output_materials = output.materials;
            }
        }
    };
    
    activate = function()
    {
        dec_materials(self.get_input_materials());
        dec_resources(self.get_input_resources());
    };
    
    can_activate = function()
    {
        if (!has_enough_materials(self.get_input_materials()))
        {
            return false;
        }
        if (!has_enough_resources(self.get_input_resources()))
        {
            return false;
        }
        if (!get_value_ext(self, self.can_brew))
        {
            return false;
        }
        if (!self.is_autouse_enabled())
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
        return true;
    };
    
    can_autouse = function()
    {
        return get_upgrade_count(global.shops.ancient.autobrew) > 0;
    };
    
    is_autouse_enabled = __return_true;
    
    cancel = function()
    {
        add_materials(self.get_input_materials());
        add_resources(self.get_input_resources());
    };
    
    finish = function()
    {
        var crit_chance = get_brew_crit_chance();
        var is_crit = percent_chance(crit_chance * 100);
        var brew_text = add_result(self.get_output(is_crit), undefined, global.texts.alchemy_brew_titles, true);
        if (is_crit)
        {
            brew_text += sprintf("\n%s", __("CRITICAL BREW!"));
            self.data.completed_crit_count++;
            o_game.data.stats.brews.crits++;
        }
        o_game.data.stats.brews.regular++;
        notify(brew_text);
    };
    
    output = __void;
    
    get_duration = function()
    {
        var duration = self.duration;
        duration = max(1, duration);
        return duration;
    };
    
    get_output = function(arg0 = false)
    {
        var result = self.output();
        if (arg0)
        {
            result = multiply_struct_values(result, 2);
        }
        return result;
    };
    
    get_description = function()
    {
        if (!self.data.unlocked)
        {
            return "";
        }
        var desc = [get_value_ext(self, self.description), sprintf("%s: %s | %s: %s", __("Brews"), number_format(self.data.completed_count), __("Crits"), number_format(self.data.completed_crit_count))];
        if (self.is_active())
        {
            array_push(desc, sprintf(__("Brew time remaining: %s"), self.get_expire_time_formatted()));
        }
        return implode("\n", desc);
    };
    
    set_local_vars(arg0);
    set_sprite_data(self);
    init();
}
