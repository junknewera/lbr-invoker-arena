function Event(arg0) constructor
{
    name = "";
    name_plural = name;
    description = "";
    index = 0;
    key = "";
    sprite = spr_placeholder;
    areas = [];
    auto_artifact = undefined;
    auto_artifact_key = undefined;
    date_start = 
    {
        year: 0,
        month: 1,
        day: 1,
        hour: 0,
        minute: 0,
        second: 0
    };
    date_end = 
    {
        year: 0,
        month: 1,
        day: 1,
        hour: 0,
        minute: 0,
        second: 0
    };
    date_text = "";
    expire_duration = sec(14400);
    data = 
    {
        activated_manually: false,
        active: false,
        active_count: 0,
        expire_timer: 0
    };
    
    init = function()
    {
        var d1 = date_date_string(get_date_from_object(self.date_start));
        var d2 = date_date_string(get_date_from_object(self.date_end));
        self.date_text = __s("Event date") + sprintf(": %s - %s", d1, d2);
    };
    
    init_late = function()
    {
        if (is_string(self.auto_artifact_key) && is_struct(variable_struct_get(global.artifacts, self.auto_artifact_key)))
        {
            self.auto_artifact = variable_struct_get(global.artifacts, self.auto_artifact_key);
        }
    };
    
    _activate = function(arg0 = false)
    {
        self.data.active = true;
        self.data.active_count++;
        self.data.activated_manually = true;
        self.data.expire_timer = o_game.data.stats.time_elapsed + expire_duration;
        o_game.area.spawn_npc();
        self.activate();
    };
    
    activate = __void;
    
    check = function()
    {
        self.check_expire();
    };
    
    check_expire = function()
    {
        if (!self.data.active)
        {
            exit;
        }
        if (o_game.data.stats.time_elapsed < self.data.expire_timer)
        {
            exit;
        }
        self._expire();
    };
    
    _expire = function()
    {
        self.data.active = false;
        if (!self._is_active() && is_struct(self.auto_artifact) && self.auto_artifact.data.count > 0 && self.auto_artifact.data.autouse)
        {
            self.auto_artifact._activate();
            if (self.data.active)
            {
                exit;
            }
        }
        self.data.activated_manually = false;
        if (is_current_areas(self.areas))
        {
            change_area(global.areas.garden);
            notify(__s("%s has expired.", self.name));
        }
        self.expire();
        instance_destroy(o_npc);
        o_game.area.spawn_npc();
    };
    
    expire = __void;
    
    _game_loop_second = function(arg0 = 1, arg1 = false)
    {
        self.game_loop_second(arg0, arg1);
    };
    
    game_loop_second = __void;
    
    get_name = function()
    {
        return get_value_ext(self, self.name, false);
    };
    
    get_description = function()
    {
        return get_value_ext(self, self.description, false);
    };
    
    get_expire_time_formatted = function()
    {
        var expire_time = 0;
        if (self.data.active)
        {
            expire_time = self.data.expire_timer - o_game.data.stats.time_elapsed;
        }
        else
        {
            expire_time = date_second_span_ext(date_current_datetime(), get_date_from_object(self.date_end)) * sec(1);
        }
        return format_time(secr(expire_time), false, false);
    };
    
    _is_active = function()
    {
        if (self.data.active)
        {
            return true;
        }
        var date_start_date = get_date_from_object(self.date_start);
        var date_end_date = get_date_from_object(self.date_end);
        var now = date_current_datetime();
        if (date_compare_date(now, date_start_date) >= 0 && date_compare_date(now, date_end_date) <= 0)
        {
            return true;
        }
        return self.is_active();
    };
    
    is_active = __return_false;
    
    is_obfuscated = function()
    {
        return false;
    };
    
    offline_step = function(arg0 = 1, arg1 = false)
    {
    };
    
    load_data = function(arg0)
    {
        apply_struct_to_struct(self.data, arg0);
        self.init();
    };
    
    set_local_vars(arg0);
    set_sprite_data(self);
    init();
}
