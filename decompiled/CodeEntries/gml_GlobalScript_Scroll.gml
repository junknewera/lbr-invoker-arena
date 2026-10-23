function Scroll(arg0) : Collectable_Usable_Object(arg0) constructor
{
    name = "";
    description = "";
    game_item_type = UnknownEnum.Value_12;
    index = 0;
    key = "";
    sprite = spr_placeholder;
    autouse_tooltip = __("Auto use");
    bonus_value = 0;
    cancellable = true;
    data_start = struct_clone(data);
    droppable = true;
    expire_duration = 30;
    has_autouse = true;
    is_usable = true;
    max_count = 0;
    type = UnknownEnum.Value_0;
    upgrade_attributes = {};
    upgrade_attributes_apply_early = false;
    use_auto_description = false;
    init = __void;
    
    init_late = function()
    {
        if (self.use_auto_description)
        {
            self.build_description();
        }
    };
    
    _activate = function()
    {
        if (!get_value_ext(self, self.can_activate))
        {
            exit;
        }
        global.active_scroll_count++;
        self.data.active = true;
        self.data.count--;
        self.data.expire = o_game.data.stats.time_elapsed + self.get_expire_duration();
        global.refresh_game_vars = true;
        self.activate();
    };
    
    activate = function()
    {
    };
    
    build_description = function()
    {
        self.description = __s("%s for %s", format_upgrade_text(self.upgrade_attributes), "[duration]");
    };
    
    _can_activate = function()
    {
        if (global.active_scroll_count >= get_max_active_scroll_count())
        {
            return false;
        }
        if (self.data.count == 0 || !self.data.unlocked || self.data.active)
        {
            return false;
        }
        return get_value_ext(self, self.can_activate);
    };
    
    can_activate = __return_true;
    
    can_autouse = function()
    {
        return true;
    };
    
    check_expire = function()
    {
        if (!self.data.active)
        {
            exit;
        }
        if (self.data.expire > o_game.data.stats.time_elapsed)
        {
            exit;
        }
        self._expire();
    };
    
    check_max_count = function()
    {
        if (self.max_count == 0)
        {
            return true;
        }
        return self.data.count < self.max_count;
    };
    
    deactivate = function()
    {
        self.data.active = false;
        self.data.expire = 0;
    };
    
    _expire = function()
    {
        global.active_scroll_count = max(0, --global.active_scroll_count);
        self.data.active = false;
        self.data.expire = 0;
        refresh_ua_section("scrolls");
        self.expire();
        notify(sprintf(__("%s has expired."), self.name));
    };
    
    expire = function()
    {
    };
    
    forward_time = function(arg0)
    {
        if (!self.data.active)
        {
            exit;
        }
        self.data.expire -= arg0;
        self.check_expire();
    };
    
    get_expire_duration = function()
    {
        var duration = self.expire_duration * global.game_settings.scrolls_expire_duration_multiplier;
        duration *= (1 + global.upgrade_attributes.scrolls_duration);
        return sec(duration);
    };
    
    get_expire_time = function()
    {
        return secr(self.data.expire - o_game.data.stats.time_elapsed);
    };
    
    get_name = function()
    {
        if (!self.data.unlocked)
        {
            return "?";
        }
        var name = sprintf("%s [%s]", get_value_ext(self, self.name, false), number_format(self.data.count));
        if (self.data.active)
        {
            name += sprintf(" [%s]", __("Active"));
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
        if (self.data.active)
        {
            desc += sprintf("\n%s %s", __("Expires in:"), format_time(self.get_expire_time()));
        }
        desc = textr(desc, 
        {
            duration: format_time(secr(self.get_expire_duration())),
            value: number_format(self.bonus_value * 100)
        });
        return desc;
    };
    
    is_obfuscated = function()
    {
        return false;
    };
    
    is_unlocked = function()
    {
        return self.data.unlocked;
    };
    
    _cancel = self._expire;
    can_cancel = self.is_active;
    _func = self._activate;
    
    load_data = function(arg0)
    {
        apply_struct_to_struct(self.data, arg0);
        if (self.data.active)
        {
            global.active_scroll_count++;
        }
        self.init();
    };
    
    set_local_vars(arg0);
    set_sprite_data(self);
    init();
}

enum UnknownEnum
{
    Value_0,
    Value_12 = 12
}
