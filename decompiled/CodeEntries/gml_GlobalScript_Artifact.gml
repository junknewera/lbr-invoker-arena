function Artifact(arg0) : Collectable_Usable_Object(arg0) constructor
{
    name = __("Unknown Artifact");
    description = __("The developer was too lazy to provide a description. Blame him.");
    description_locked = "";
    index = 0;
    instance = -1;
    key = "";
    sprite = spr_placeholder;
    sprite_orig = spr_placeholder;
    data_defaults = 
    {
        autouse: false,
        collected: 0,
        count: 0,
        shown: false,
        spawn_time_raw: -1
    };
    auto_use_delay = 0;
    cancellable = false;
    can_spawn = true;
    can_use_in_restricted_areas = false;
    destroy_time_key = "";
    game_item_type = UnknownEnum.Value_1;
    generatable_in_quests = true;
    has_autouse = true;
    is_event = false;
    max_count = 0;
    instance_expire_time = sec(60);
    is_usable = true;
    multiple_use = false;
    offline = true;
    persist_prestige = global.prestige_levels.mlc;
    spawn_area = global.areas.garden;
    spawn_delay = 1800;
    spawn_time = -1;
    upgrade_attributes = {};
    use_delay = 1;
    winnable = false;
    button_use_width = gui_col_x(2.8);
    button_use_width_multi = gui_col_x(2.8);
    
    init = function()
    {
        self.destroy_time_key = sprintf("artifact_destroy_time_%s", self.key);
        self.timeout_key = sprintf("artifact_%s", self.key);
        self.generate_spawn_time();
        if (!self.is_usable)
        {
            self.has_autouse = false;
        }
    };
    
    add_draw = function(arg0, arg1)
    {
        if (self.data.collected == 0)
        {
            exit;
        }
        if (is_struct(self.spawn_area) && self.spawn_area.can_teleport())
        {
            if (gui_button_sprite(arg0 + gui_col_x(21.15), arg1 + gui_col_y(0.5), spr_flag, true, undefined, 
            {
                tooltip: __("Teleport to spawn area")
            }))
            {
                change_area(self.spawn_area);
            }
        }
        var artifacts_input = global.game_settings.shardify_artifacts_input;
        var shards_output = global.game_settings.shardify_artifacts_output + get_upgrade_attribute_value(global.upgrade_attributes.shardify_increase_output);
        if (get_upgrade_count(global.shops.malachite.unlock_shardify_artifacts) > 0 && (self.get_max_count() >= artifacts_input || self.get_max_count() == 0))
        {
            var can_shardify = self.data.count >= artifacts_input;
            if (gui_button_tl(arg0 + gui_col_x(12), arg1, __("Shardify"), can_shardify, gui_col_x(3), true, 
            {
                tooltip: __s("Get %s Shards for %s %s.", shards_output, artifacts_input, self.name)
            }))
            {
                self.data.count -= artifacts_input;
                add_resources(
                {
                    shards: shards_output
                });
            }
        }
    };
    
    _can_activate = function()
    {
        if (self.data.count <= 0 || !self.is_usable)
        {
            return false;
        }
        if (!self.is_event && !get_value_ext(o_game.area, o_game.area.can_use_artifacts) && !get_value_ext(self, self.can_use_in_restricted_areas))
        {
            return false;
        }
        if (self.data.use_delay_timer > o_game.data.stats.time_elapsed)
        {
            return false;
        }
        return self.can_activate();
    };
    
    can_activate = __return_true;
    
    _can_spawn = function()
    {
        return get_value_ext(self, self.can_spawn);
    };
    
    check_max_count = function()
    {
        if (self.get_max_count() == 0)
        {
            return true;
        }
        return self.data.count < self.get_max_count();
    };
    
    check_spawn = function()
    {
        if (!self._can_spawn())
        {
            return false;
        }
        var next_expire_time = date_inc_second_compat(self.spawn_time, secr(self.get_expire_duration()));
        var now = date_current_datetime();
        var diff = date_second_span(now, next_expire_time);
        if (diff > 259200)
        {
        }
        if (date_compare_datetime(now, next_expire_time) == 1 && global.game_settings.artifacts_expire)
        {
            self.generate_spawn_time(true);
            return false;
        }
        if (!self.check_max_count())
        {
            return false;
        }
        if (date_compare_datetime(date_current_datetime(), self.spawn_time) != 1)
        {
            return false;
        }
        if (o_game.area.key != self.spawn_area.key)
        {
            return false;
        }
        if (self.get_max_count() != 0 && self.data.count >= self.get_max_count())
        {
            return false;
        }
        return true;
    };
    
    collect = function(arg0 = false, arg1 = 1)
    {
        self.data.collected += arg1;
        self.data.count += arg1;
        self.data.unlocked = true;
        if (self.get_max_count() > 0)
        {
            self.data.count = min(self.data.count, self.get_max_count());
        }
        if (!arg0)
        {
            self.generate_spawn_time(true);
        }
        o_game.data.stats.artifacts_collected += arg1;
    };
    
    destroy_instance = function()
    {
        self.instance = -1;
    };
    
    activate = function(arg0 = 1)
    {
        add_game_log(sprintf("Use Artifact %s (%s)", self.key, self.data.count), "artifacts");
        repeat (arg0)
        {
            self.func();
        }
        global.refresh_game_vars = true;
        set_timeout(self.timeout_key, self.use_delay);
    };
    
    func = function()
    {
    };
    
    get_expire_duration = function()
    {
        if (!global.game_settings.artifacts_expire)
        {
            return 1;
        }
        return (self.instance_expire_time + sec(global.upgrade_attributes.artifact_expire_duration)) * (1 + global.upgrade_attributes.artifact_expire_duration_multiplier);
    };
    
    get_expire_time = function()
    {
        return rround(date_second_span(self.spawn_time, date_current_datetime()));
    };
    
    get_expire_time_formatted = function()
    {
        var seconds_diff = self.get_expire_time();
        var time_left = rround(secr(self.get_expire_duration()) - seconds_diff) + 1;
        var time_formatted = format_time(time_left);
        return time_formatted;
    };
    
    get_instance_expire_time = function()
    {
        if (self.instance == -1)
        {
            return 0;
        }
        return secr(self.instance.expire_duration - self.instance.expire_timer);
    };
    
    get_offline_count = function(arg0, arg1)
    {
        arg1 = get_default_value(arg1, false);
        if (!self.can_spawn)
        {
            return 0;
        }
        if (!self.check_max_count())
        {
            return 0;
        }
        var count = arg0 / self.get_spawn_delay() / global.game_settings.artifacts_offline_divisor;
        if (!arg1)
        {
            count = floor(count);
        }
        count *= get_upgrade_attribute_value(global.upgrade_attributes.artifact_collect_offline);
        return count;
    };
    
    generate_spawn_time = function(arg0 = false)
    {
        var new_spawn_time;
        if (!is_struct(self.data.spawn_time_raw) || arg0)
        {
            if (is_struct(self.data.spawn_time_raw))
            {
                var now = date_current_datetime();
                if (date_compare_datetime(now, self.spawn_time) == 1)
                {
                    var diff = date_second_span(now, self.spawn_time);
                    var spawn_delay = self.get_spawn_delay();
                    var diff_time = date_inc_second_compat(now, -diff);
                    self.spawn_time = date_inc_second_compat(now, self.get_spawn_delay());
                }
                new_spawn_time = self.spawn_time;
            }
            else
            {
                new_spawn_time = date_current_datetime();
                new_spawn_time = date_inc_second_compat(new_spawn_time, self.get_spawn_delay());
            }
            self.data.spawn_time_raw = get_time_object_from_datetime(new_spawn_time);
        }
        else
        {
            new_spawn_time = get_date_from_object(self.data.spawn_time_raw);
        }
        self.spawn_time = new_spawn_time;
    };
    
    get_next_spawn_time = function()
    {
        if (!self.check_max_count())
        {
            return "";
        }
        if (!is_struct(self.data.spawn_time_raw))
        {
            return "";
        }
        var seconds_diff = self.get_expire_time();
        if (self.is_spawned())
        {
            var text = __s("Spawned, expires in %s", self.get_expire_time_formatted());
            return text;
        }
        return __s("Spawns in %s", format_time(seconds_diff));
    };
    
    get_max_count = function()
    {
        var count = self.max_count;
        var add_count = get_upgrade_attribute_value(variable_struct_get(global.upgrade_attributes.artifact_max_count_add, self.key));
        if (is_numeric(add_count))
        {
            count += add_count;
        }
        if (self.is_event)
        {
            count += global.upgrade_attributes.artifact_max_count_add_event;
        }
        if (self.max_count > 1)
        {
            count += get_upgrade_attribute_value(global.upgrade_attributes.artifact_max_count_add_global);
        }
        return count;
    };
    
    get_name = function()
    {
        if (self.data.collected == 0)
        {
            return "?";
        }
        var text;
        if (self.get_max_count() != 0)
        {
            text = sprintf("%s (%s/%s)", self.name, number_format(get_upgrade_count(self)), number_format(self.get_max_count()));
        }
        else
        {
            text = sprintf("%s (%s)", self.name, number_format(get_upgrade_count(self)));
        }
        return text;
    };
    
    get_description = function()
    {
        if (self.data.collected == 0)
        {
            var return_text = get_value_ext(self, self.description_locked);
            if (self._can_spawn())
            {
                if (global.artifacts.compass.data.count > 0)
                {
                    return_text += sprintf("\n%s", self.get_location_description());
                }
                if (global.artifacts.time_crystal.data.count > 0)
                {
                    return_text += sprintf("\n%s.", self.get_next_spawn_time());
                }
            }
            return return_text;
        }
        var desc = [];
        array_push(desc, get_value_ext(self, self.description, false));
        if (global.artifacts.compass.data.count > 0)
        {
            array_push(desc, self.get_location_description());
        }
        if (global.artifacts.time_crystal.data.count > 0 && self.check_max_count())
        {
            array_push(desc, sprintf("%s.", self.get_next_spawn_time()));
        }
        if (!self.offline)
        {
            array_push(desc, __("Disabled in offline rewards."));
        }
        if (self.is_event && !get_option(global.options.enable_events))
        {
            array_push(desc, sprintf("!! %s !!", __s("Events disabled in options.")));
        }
        var add_text = [sprintf("Collected: %s", number_format(self.data.collected))];
        if (self.offline)
        {
            if (get_upgrade_count(global.shops.blc.unlock_artifacts) > 0 && get_upgrade_attribute_value(global.upgrade_attributes.artifact_collect_offline) > 0)
            {
                var offline_count = self.get_offline_count(3600, true);
                if (offline_count > 0)
                {
                    array_push(add_text, sprintf("Offline count/h: %s", number_format(offline_count)));
                }
            }
        }
        array_push(desc, implode(" | ", add_text));
        return implode("\n", desc);
    };
    
    get_location_description = function()
    {
        return __s("Located in %s.", self.spawn_area.name);
    };
    
    get_spawn_delay = function()
    {
        var spawn_delay = self.spawn_delay;
        if (variable_global_exists("upgrade_attributes"))
        {
            spawn_delay = self.spawn_delay * (1 - global.upgrade_attributes.artifact_spawn_time_reduction);
        }
        spawn_delay *= (1 - global.game_settings.artifact_spawn_time_reduction);
        spawn_delay = max(global.game_settings.artifact_spawn_delay_min, spawn_delay);
        return spawn_delay;
    };
    
    _has_autouse = function()
    {
        if (get_upgrade_count(global.shops.mlc.auto_use_artifacts) == 0)
        {
            return false;
        }
        return get_value_ext(self, self.has_autouse);
    };
    
    is_active = function()
    {
        return false;
    };
    
    is_obfuscated = function()
    {
        return self.data.collected == 0;
    };
    
    is_spawned = function()
    {
        return date_compare_datetime(date_current_datetime(), self.spawn_time) == 1;
    };
    
    is_unlocked = function()
    {
        return self.data.collected > 0;
    };
    
    reduce_spawn_time_relative = function(arg0)
    {
        if (self.is_spawned())
        {
            exit;
        }
        var seconds_dec = self.spawn_delay * arg0;
        var new_spawn_time = date_inc_second_compat(self.spawn_time, -seconds_dec);
        self.data.spawn_time_raw = get_time_object_from_datetime(new_spawn_time);
        self.spawn_time = get_date_from_object(self.data.spawn_time_raw);
    };
    
    reduce_spawn_time_seconds = function(arg0)
    {
        if (self.is_spawned())
        {
            exit;
        }
        self.spawn_time = date_inc_second_compat(self.spawn_time, -arg0);
        self.data.spawn_time_raw = get_time_object_from_datetime(self.spawn_time);
    };
    
    spawn = function(arg0 = undefined, arg1 = undefined)
    {
        arg0 = is_undefined(arg0) ? random_range(120, room_width - 120) : arg0;
        arg1 = is_undefined(arg1) ? random_range(120, room_height - 120) : arg1;
        var o = instance_create_layer(arg0, arg1, global.layers.leaves, o_artifact);
        o.artifact = self;
        o.sprite_index = self.sprite;
        with (o)
        {
            init();
        }
        self.instance = o;
        return o;
    };
    
    load_data_after = function()
    {
    };
    
    set_local_vars(arg0);
    set_sprite_data(self);
    _init();
}

enum UnknownEnum
{
    Value_1 = 1
}
