function Boost(arg0) : Game_Object(arg0) constructor
{
    cost = {};
    data = 
    {
        active: false,
        auto: false,
        expire: 0,
        used: 0
    };
    duration_multiplier = 1;
    index = 0;
    name_full = "";
    upgrade_attributes = {};
    
    init = function()
    {
        self.name_full = sprintf("%s %s", self.name, __("Booster"));
    };
    
    activate = function()
    {
        if (!self.can_activate())
        {
            return false;
        }
        self.data.active = true;
        self.data.expire = o_game.data.stats.time_elapsed + self.get_duration();
        self.data.used++;
        dec_result(self.cost);
        refresh_ua_section("booster");
        refresh_game_vars_soft();
        return true;
    };
    
    can_activate = function()
    {
        if (self.data.active)
        {
            return false;
        }
        if (!has_enough(self.cost))
        {
            return false;
        }
        return true;
    };
    
    check = function()
    {
        if (o_game.data.stats.time_elapsed >= self.data.expire)
        {
            self.expire();
        }
        if (get_option(global.options.auto_boosters_enabled) && self.data.auto)
        {
            self.activate();
        }
    };
    
    expire = function()
    {
        self.data.active = false;
    };
    
    get_duration = function()
    {
        var value = sec(3600) * self.duration_multiplier;
        value *= (1 + global.upgrade_attributes.booster_duration_multiplier);
        return value;
    };
    
    get_upgrade_attributes = function()
    {
        return self.upgrade_attributes;
    };
    
    is_active = function()
    {
        return self.data.active;
    };
    
    _is_obfuscated = function()
    {
        if (self.data.used > 0)
        {
            return false;
        }
        return self.is_obfuscated();
    };
    
    is_obfuscated = __return_false;
    set_local_vars(arg0);
}
