function Milestone(arg0) constructor
{
    name = "";
    description = "";
    index = 0;
    key = "";
    sprite = spr_placeholder;
    area = undefined;
    bonus_value = 1;
    defeat_count = 0;
    defeat_count_max = 0;
    enemy = undefined;
    enemy_data_key = "defeated";
    has_area = false;
    has_enemy = false;
    index = undefined;
    index_add = undefined;
    level = 0;
    reward = 
    {
        resources: 
        {
            gems: 5
        }
    };
    sprite = spr_icon_milestone;
    data = 
    {
        claimed: false,
        count: 0,
        shown: false
    };
    upgrade_attributes = undefined;
    
    init = function()
    {
        self.has_area = !is_undefined(self.area);
        self.has_enemy = !is_undefined(self.enemy);
        if (is_undefined(self.index))
        {
            self.index = self.level;
        }
        if (is_numeric(self.index_add))
        {
            self.index = self.index_add + self.level;
        }
    };
    
    can_apply_bonus = function()
    {
        return self._is_completed() && self.data.claimed;
    };
    
    _check = function()
    {
        if (self._is_completed())
        {
            return false;
        }
        if (!self.check())
        {
            return false;
        }
        if (self.has_area)
        {
            if (self.area.type.key == global.area_types.horde.key)
            {
                self.area.prepare_horde_stats(self.level);
                if (variable_struct_get(self.area.data.floors_stats, self.level).max < self.defeat_count_max)
                {
                    return false;
                }
            }
            else if (self.area.data.highest_floor_stats < self.level)
            {
                return false;
            }
        }
        if (self.has_enemy && variable_struct_get(self.enemy.data, self.enemy_data_key) < self.level)
        {
            return false;
        }
        self._complete();
        return true;
    };
    
    check = __return_true;
    
    can_claim = function()
    {
        if (self._is_obfuscated())
        {
            return false;
        }
        if (self.is_claimed())
        {
            return false;
        }
        if (is_undefined(self.reward))
        {
            return false;
        }
        return true;
    };
    
    claim = function()
    {
        if (self.data.claimed || is_undefined(self.reward))
        {
            exit;
        }
        notify(add_result(self.reward, undefined, undefined, true, true));
        self.data.claimed = true;
        self.data.shown = true;
        variable_struct_set(o_game.data.milestones_claimed, self.key, true);
    };
    
    is_claimed = function()
    {
        return self.data.claimed || get_default_struct_value(o_game.data.milestones_claimed, self.key, false);
    };
    
    _complete = function()
    {
        self.data.count = 1;
        self.complete();
    };
    
    complete = __void;
    
    get_name = function()
    {
        return get_value_ext(self, self.name, false);
    };
    
    get_description = function()
    {
        if (self._is_obfuscated())
        {
            return "";
        }
        var desc = [];
        var desc_default = get_value_ext(self, self.description, false);
        if (!is_empty(desc_default))
        {
            array_push(desc, desc_default);
        }
        if (!is_undefined(self.upgrade_attributes))
        {
            array_push(desc, __s("Bonus: %s", format_upgrade_text(self.upgrade_attributes, 1, true, self)));
        }
        return implode("\n", desc);
    };
    
    get_bonus_value = function()
    {
        if (!self._is_completed())
        {
            return 0;
        }
        return self.bonus_value;
    };
    
    get_tooltip = function()
    {
        return self.get_name();
    };
    
    _is_completed = function()
    {
        if (self.data.count == 0)
        {
            return false;
        }
        return self.is_completed();
    };
    
    is_completed = __return_true;
    
    _is_obfuscated = function()
    {
        if (!self._is_completed())
        {
            return true;
        }
        return self.is_obfuscated();
    };
    
    is_obfuscated = __return_false;
    
    set_name = function()
    {
        self.init();
        if (self.has_area)
        {
            if (self.area.type.key == global.area_types.horde.key)
            {
                self.name = __s("Defeat %s %s in %s in a single run on floor %s.", self.defeat_count_max, pluralize(self.defeat_count_max, __("enemy"), __("enemies")), self.area.name, self.level);
            }
            else
            {
                var floor_sign = (self.area.key == global.areas.inner_pyramid.key) ? "-" : "";
                self.name = __s("Beat floor %s%s", floor_sign, self.level);
            }
        }
        else if (self.has_enemy)
        {
            switch (self.enemy_data_key)
            {
                case "defeated":
                    self.name = __s("Defeat %s %s %s.", self.enemy.name, self.level, pluralize(self.level, __("time"), __("times")));
                    break;
                case "defeat_counter_highest":
                    self.name = __s("Defeat %s %s in a row.", self.enemy.name, self.level);
                    break;
            }
        }
    };
    
    load_data = function(arg0)
    {
        var new_data = struct_clone(self.data);
        struct_apply_defaults(arg0, new_data);
        self.data = struct_clone(arg0);
        if (self.data.claimed)
        {
            variable_struct_set(o_game.data.milestones_claimed, self.key, true);
        }
        self.init();
    };
    
    set_local_vars(arg0);
    set_sprite_data(self);
    init();
}
