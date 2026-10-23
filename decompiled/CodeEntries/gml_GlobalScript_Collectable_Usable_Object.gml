function Collectable_Usable_Object(arg0) constructor
{
    name = __("Unknown Item");
    name_plural = undefined;
    description = "";
    description_cache = "";
    description_locked = "";
    index = 0;
    key = "";
    sprite = spr_placeholder;
    cache = {};
    data = 
    {
        active: false,
        ascend_level: 1,
        autouse: false,
        collected: 0,
        completed_count: 0,
        completed_crit_count: 0,
        count: 0,
        expire: 0,
        fav: false,
        level: 1,
        shown: false,
        tier: 1,
        unlocked: false,
        upgrade_unlocked: false,
        use_delay_timer: 0
    };
    data_defaults = {};
    add_draw = __void;
    apply_upgrade_attributes_when_active = false;
    autofinish = false;
    autouse_tooltip = "";
    button_text_use = __("Use");
    button_text_using = button_text_use;
    button_use_width = gui_col_x(2);
    button_use_width_multi = gui_col_x(2);
    buy_unlock = false;
    cancellable = false;
    can_autouse = true;
    can_use_when_active = false;
    count_overflow = false;
    decrease_count_on_use = true;
    display_count_places = 2;
    droppable = false;
    duration = 0;
    fractional = true;
    game_item_type = UnknownEnum.Value_0;
    input_materials = undefined;
    input_materials_text = undefined;
    input_resources = undefined;
    input_resources_text = undefined;
    input_resources_options = undefined;
    is_usable = true;
    is_visible = true;
    list_button_click = __void;
    max_count = 0;
    multiple_use = false;
    negative_count = false;
    rarity = 0;
    rarity_index = 1;
    reward = [];
    skip_activate_count = false;
    timeout_key = "";
    unlock_cost = undefined;
    unlocked = false;
    upgrade_attributes = undefined;
    upgrade_attributes_cache = undefined;
    use_delay = 0;
    use_duration = true;
    use_toggle = false;
    
    _init = function()
    {
        self.data.unlocked = self.unlocked;
        if (!self.fractional)
        {
            self.display_count_places = 0;
        }
        self.timeout_key = sprintf("cuo_%s_%s", self.game_item_type, self.key);
        self._init_data();
        self._init_before();
        self.init();
        self._init_after();
        self.init_after();
    };
    
    init = __void;
    
    _init_after = function()
    {
    };
    
    init_after = __void;
    
    _init_before = function()
    {
        self.init_before();
    };
    
    init_before = __void;
    
    _init_data = function()
    {
        apply_struct_to_struct(self.data, self.data_defaults);
        self.data_start = struct_clone(self.data);
    };
    
    _activate = function(arg0 = 1, arg1 = false)
    {
        arg0 = min(arg0, self.data.count);
        if (!self._can_activate(arg0))
        {
            exit;
        }
        if (arg1 && !self.is_autouse_enabled())
        {
            exit;
        }
        if (self.decrease_count_on_use)
        {
            self.data.count -= arg0;
        }
        var result;
        if (self.use_toggle)
        {
            if (self.is_active())
            {
                result = self.deactivate();
            }
            else
            {
                result = self.activate(arg0);
            }
        }
        else
        {
            self.set_active();
            result = self.activate(arg0);
        }
        self.data.use_delay_timer = o_game.data.stats.time_elapsed + self.use_delay;
        return result;
    };
    
    activate = function(arg0 = 1)
    {
    };
    
    apply_max_count = function()
    {
        if (is_infinity(self.data.count))
        {
            self.data.count = get_max_num();
        }
        var max_count = self.get_max_count();
        if (max_count > 0)
        {
            self.data.count = min(self.data.count, max_count);
        }
    };
    
    build_description = function()
    {
        self.description_cache = get_value_ext(self, self.description);
    };
    
    _can_activate = function(arg0 = 1, arg1 = false, arg2 = true)
    {
        if (!self.data.unlocked)
        {
            return false;
        }
        if (!self.skip_activate_count && self.data.count < arg0)
        {
            return false;
        }
        if (!self.can_use_when_active && self.is_active())
        {
            return false;
        }
        if (self.data.use_delay_timer > o_game.data.stats.time_elapsed)
        {
            return false;
        }
        return self.can_activate(arg0, arg1, arg2);
    };
    
    can_activate = __return_true;
    can_autouse = __return_true;
    
    _can_cancel = function()
    {
        return self.can_cancel();
    };
    
    can_cancel = function()
    {
        return self.is_active();
    };
    
    _can_drop = function()
    {
        if (!self.droppable)
        {
            return false;
        }
        return self.can_drop();
    };
    
    can_drop = function()
    {
        return self.droppable;
    };
    
    _cancel = function()
    {
        self.set_inactive();
        self.cancel();
    };
    
    cancel = __void;
    
    _can_unlock = function()
    {
        if (self.is_unlocked())
        {
            return false;
        }
        if (!self.buy_unlock)
        {
            return false;
        }
        if (!has_enough_materials(self.unlock_cost.materials))
        {
            return false;
        }
        if (!has_enough_resources(self.unlock_cost.resources))
        {
            return false;
        }
        return self.can_unlock();
    };
    
    can_unlock = __return_true;
    
    check = function()
    {
        if (get_value_ext(self, self._has_autouse) && self.data.autouse && self.can_autouse() && !self.is_active() && self._can_activate(undefined, true))
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
    
    collect = function(arg0 = 1, arg1 = undefined)
    {
        self._collect_before(arg0, arg1);
        self.data.count += arg0;
        self.data.collected += arg0;
        self.data.unlocked = true;
        if (!self.fractional)
        {
            self.data.count = rround(self.data.count);
            self.data.collected = rround(self.data.collected);
        }
        self.apply_max_count();
        self._collect_after(arg0, arg1);
    };
    
    _collect_before = function(arg0 = 1, arg1 = undefined)
    {
        self.collect_before(arg0, arg1);
    };
    
    collect_before = __void;
    
    _collect_after = function(arg0 = 1, arg1 = undefined)
    {
        self.collect_after(arg0, arg1);
    };
    
    collect_after = __void;
    
    deactivate = function()
    {
        self.set_inactive();
    };
    
    decrease = function(arg0 = 1)
    {
        self.data.count -= arg0;
        if (!self.fractional)
        {
            self.data.count = rround(self.data.count);
        }
        if (!self.negative_count)
        {
            self.data.count = max(0, self.data.count);
        }
        self.apply_max_count();
    };
    
    _finish = function()
    {
        self.set_inactive();
        self.data.completed_count++;
        self.finish();
    };
    
    finish = __void;
    
    get_class_cache = function(arg0)
    {
        return variable_struct_get(self.cache, arg0);
    };
    
    has_class_cache = function(arg0)
    {
        return !is_undefined(variable_struct_get(self.cache, arg0));
    };
    
    set_class_cache = function(arg0, arg1)
    {
        variable_struct_set(self.cache, arg0, arg1);
    };
    
    get_name = function()
    {
        if (!self.data.unlocked)
        {
            return "?";
        }
        var name = get_value_ext(self, self.name, false);
        if (self.get_max_count() > 1)
        {
            var count = sprintf("%s/%s", self.get_display_count(), number_format(self.get_max_count(), self.get_display_count_places(self.get_max_count())));
            name += sprintf(" [%s]", count);
        }
        return name;
    };
    
    get_description = function()
    {
        if (!self.data.unlocked)
        {
            return "?";
        }
        var desc = get_value_ext(self, self.description, false);
        return desc;
    };
    
    get_autouse_tooltip = function()
    {
        var tooltip = get_value_ext(self, self.autouse_tooltip);
        if (is_undefined(tooltip))
        {
            return "";
        }
        return string_trim(tooltip);
    };
    
    get_display_count = function()
    {
        var places = self.get_display_count_places(self.data.count);
        return number_format(self.data.count, places);
    };
    
    get_display_count_height = function()
    {
        return 0;
    };
    
    get_display_count_places = function(arg0 = 0)
    {
        var num_places_default = iif(self.fractional, 2, 0);
        var number_places = iif(arg0 >= 1000, 2, num_places_default);
        if (keyboard_check(vk_shift))
        {
            number_places = 3;
        }
        return number_places;
    };
    
    get_display_materials = function()
    {
        if (!is_undefined(self.input_materials_text))
        {
            return self.input_materials_text;
        }
        return self.get_input_materials();
    };
    
    get_display_resources = function()
    {
        if (!is_undefined(self.input_resources_text))
        {
            return self.input_resources_text;
        }
        return self.get_input_resources();
    };
    
    get_duration = function()
    {
        return self.duration;
    };
    
    get_duration_formatted = function()
    {
        return format_time(self.get_duration());
    };
    
    get_expire_time = function()
    {
        return self.data.expire - o_game.data.stats.time_elapsed;
    };
    
    get_expire_time_formatted = function()
    {
        return format_time(secr(self.get_expire_time()));
    };
    
    get_input_materials = function(arg0 = 1)
    {
        return get_value_ext(self, self.input_materials, arg0);
    };
    
    get_input_resources = function(arg0 = 1)
    {
        return get_value_ext(self, self.input_resources, arg0);
    };
    
    get_max_count = function()
    {
        return get_value_ext(self, self.max_count);
    };
    
    get_sprite = function()
    {
        return self.sprite;
    };
    
    get_tooltip = __void;
    get_tooltip_func = undefined;
    
    get_upgrade_attributes = function()
    {
        if (self.apply_upgrade_attributes_when_active && !self.is_active())
        {
            return undefined;
        }
        return self.upgrade_attributes;
    };
    
    get_upgrade_multiplier = function()
    {
        if (self.apply_upgrade_attributes_when_active && !self.is_active())
        {
            return 0;
        }
        return 1;
    };
    
    _has_autouse = function()
    {
        return get_value_ext(self, self.has_autouse);
    };
    
    has_autouse = function()
    {
        return false;
    };
    
    is_active = function()
    {
        return self.data.active;
    };
    
    is_autouse_enabled = __return_true;
    
    is_finished = function()
    {
        return self.is_active() && o_game.data.stats.time_elapsed >= self.data.expire;
    };
    
    is_obfuscated = function()
    {
        return !self.is_unlocked();
    };
    
    is_unlocked = function()
    {
        return self.data.unlocked;
    };
    
    refresh_skin = __void;
    
    set_skin = function(arg0)
    {
        self.data.skin = arg0;
        self.refresh_skin();
    };
    
    set_active = function()
    {
        if (self.use_duration)
        {
            if (self.duration != 0)
            {
                self.data.active = true;
                self.data.expire = o_game.data.stats.time_elapsed + self.get_duration();
            }
        }
        else
        {
            self.data.active = true;
        }
    };
    
    set_inactive = function()
    {
        self.data.active = false;
        self.data.expire = 0;
    };
    
    _unlock = function()
    {
        if (!self._can_unlock())
        {
            return false;
        }
        if (is_struct(self.unlock_cost))
        {
            if (!is_undefined(struct_get_from_hash(self.unlock_cost, variable_get_hash("materials"))))
            {
                dec_materials(self.unlock_cost.materials);
            }
            if (!is_undefined(struct_get_from_hash(self.unlock_cost, variable_get_hash("resources"))))
            {
                dec_resources(self.unlock_cost.resources);
            }
        }
        self.data.count = 1;
        self.data.collected++;
        self.data.unlocked = true;
        self.unlock();
    };
    
    unlock = __void;
    _func = self._activate;
    
    load_data = function(arg0)
    {
        self._init_data();
        apply_struct_to_struct(self.data, arg0);
        if (!self.fractional)
        {
            self.data.count = rround(self.data.count);
            self.data.collected = rround(self.data.collected);
        }
        if (!self.negative_count)
        {
            self.data.count = max(0, self.data.count);
            self.data.collected = max(0, self.data.collected);
        }
        self.load_data_after();
        self.init();
    };
    
    load_data_after = __void;
    set_local_vars(arg0);
    set_sprite_data(self);
    if (is_undefined(name_plural))
    {
        name_plural = name;
    }
    _init();
}

enum UnknownEnum
{
    Value_0
}
