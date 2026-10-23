function Leafscender(arg0) : Process_Object(arg0) constructor
{
    game_item_type = UnknownEnum.Value_6;
    autofinish = true;
    autouse_tooltip = __("Auto Leafscend");
    button_text_use = __("Leafscend");
    button_text_using = __("Leafscending...");
    button_use_width = gui_col_x(3);
    buy_unlock = false;
    can_brew = true;
    cancellable = false;
    decrease_count_on_use = false;
    duration = global.game_settings.leafscend_convert_time;
    is_usable = true;
    max_count = 1;
    output = undefined;
    output_has_materials = false;
    output_materials = undefined;
    skip_material_count_check = false;
    unlocked = true;
    use_duration = true;
    resource = global.resources.leaves;
    
    init = function()
    {
        self.data.unlocked = self.unlocked;
        self.name = sprintf("%s %s %s", self.resource.name_single, __("Level"), self.level);
        self.sprite = self.resource.sprite;
        self.input_resources_options = 
        {
            leafscend_level: self.level - 1
        };
        self.output_resources_options = 
        {
            leafscend_level: self.level
        };
    };
    
    activate = function(arg0 = 1)
    {
        var crit_chance = 0;
        dec_resources(self.get_input_resources(), undefined, undefined, 
        {
            leafscend_level: self.level - 1
        });
    };
    
    get_input_available_count = function()
    {
        if (self.level <= 1)
        {
            return floor(self.resource.data.count);
        }
        return floor(get_default_struct_value(self.resource.data.leafscend_count, self.level - 1, 0));
    };
    
    can_activate = function(arg0 = 1, arg1 = false)
    {
        if (!has_enough_resources(self.get_input_resources(), self.level - 1))
        {
            return false;
        }
        if (arg1 && !get_option(global.options.leafscenders_autouse_bot))
        {
            return false;
        }
        if (arg1 && get_option(global.options.leafscenders_safe_mode) && has_bought_shop_item(global.shops.coal.leafscenders_safe_mode))
        {
            var input_required = self.get_input_resource_count() * arg0;
            if ((self.get_input_available_count() - input_required) < 1)
            {
                return false;
            }
        }
        return true;
    };
    
    can_autouse = function()
    {
        return can_autouse_leafscenders();
    };
    
    check = function()
    {
        if (self.data.autouse && self.can_autouse() && !self.is_active() && self._can_activate(1, true))
        {
            self._activate(1, true);
        }
        if (!self.is_finished())
        {
            exit;
        }
        if (self.autofinish)
        {
            self._finish();
        }
    };
    
    finish = function()
    {
        var count = self.get_output_resource_count();
        add_to_struct_value(self.resource.data.leafscend_count, self.level, count);
        add_to_struct_value(self.resource.data.leafscend_collected, self.level, count);
        add_to_struct_value(self.resource.data.leafscend_collected_total, self.level, count);
        refresh_ua_section("relics");
    };
    
    get_input_resources = function()
    {
        return build_resource_cost(self.resource, self.get_input_resource_count());
    };
    
    get_input_resource_count = function()
    {
        var count;
        if (self.level == 1)
        {
            count = global.game_settings.leafscend_input_count_start;
        }
        else
        {
            count = global.game_settings.leafscend_input_count;
        }
        if (self.level > 1)
        {
            count -= get_upgrade_attribute_value(global.upgrade_attributes.leafscender_decrease_input_cost);
            count *= (1 - get_upgrade_attribute_value(global.upgrade_attributes.leafscender_decrease_input_cost_multiplier));
        }
        count = max(1, ceil(count));
        return count;
    };
    
    get_output_resources = function()
    {
        return build_resource_cost(self.resource, self.get_output_resource_count());
    };
    
    get_output_resource_count = function()
    {
        var count = get_bm_value(1, "leafscender_output_count");
        return count;
    };
    
    get_duration = function()
    {
        var duration = self.duration;
        duration *= (1 - get_upgrade_attribute_value(global.upgrade_attributes.leafscender_decrease_convert_time));
        duration = max(sec(1), duration);
        if (global.debug)
        {
            duration = 60;
        }
        return duration;
    };
    
    get_name = function()
    {
        var name = get_value_ext(self, self.name);
        return name;
    };
    
    get_description = function()
    {
        var desc = " ";
        if (self.is_active())
        {
            desc = __s("Time remaining: %s", self.get_expire_time_formatted());
        }
        return desc;
    };
    
    get_crit_resources = function()
    {
    };
    
    has_autouse = __return_true;
    
    is_obfuscated = function()
    {
        return false;
    };
    
    load_data = function(arg0)
    {
        self.data = struct_clone(self.data_start);
        apply_struct_to_struct(self.data, arg0);
        self.init();
    };
    
    set_local_vars(arg0);
    self.sprite = self.resource.sprite;
    set_sprite_data(self);
    init();
}

enum UnknownEnum
{
    Value_6 = 6
}
