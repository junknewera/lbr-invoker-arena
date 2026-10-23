function Harbor_Job(arg0 = undefined) : Savable_Object(arg0) constructor
{
    duration = global.game_settings.harbor_jobs_duration;
    input_multiplier_min = 1;
    input_multiplier_max = 2;
    output_multiplier_min = 1;
    output_multiplier_max = 2;
    type = undefined;
    data = 
    {
        count: 0,
        id: "",
        input_count: 100,
        locked: false,
        output: {},
        started: false,
        time_end: 0,
        type_key: ""
    };
    
    init = function()
    {
        if (is_empty(self.data.type_key))
        {
            if (!is_struct(self.type))
            {
                self.type = array_random_chance_level(global.harbor_job_types_array_sorted);
                self.data.input_count = self.type.input_count;
                self.data.output = self.type.output;
            }
            var input_multiplier = random_range(self.input_multiplier_min, self.input_multiplier_max);
            self.data.input_count *= max(1, input_multiplier);
            self.data.input_count = max(1, round(self.data.input_count));
            var output_multiplier = random_range(self.output_multiplier_min, self.output_multiplier_max);
            output_multiplier *= (1 + global.upgrade_attributes.harbor_jobs_reward_multiplier);
            if (output_multiplier != 1)
            {
                self.data.output = multiply_struct_values(self.data.output, output_multiplier, round, 1);
            }
            self.data.type_key = self.type.key;
        }
        else
        {
            self.type = variable_struct_get(global.harbor_job_types, self.data.type_key);
        }
    };
    
    add = function(arg0)
    {
        var count_before = self.data.count;
        self.data.count += arg0;
        self.data.count = min(self.data.count, self.data.input_count);
        var added = self.data.count - count_before;
        global.harbor.container.decrease(added);
        return added;
    };
    
    can_claim = function()
    {
        return self.data.started && o_game.data.stats.time_elapsed >= self.data.time_end;
    };
    
    can_start = function()
    {
        return self.data.count >= self.data.input_count && !self.data.started;
    };
    
    check_auto_add = function()
    {
        if (self.data.started)
        {
            exit;
        }
        if (self.data.count >= self.data.input_count)
        {
            exit;
        }
        if (global.harbor.container.data.count <= 0)
        {
            exit;
        }
        self.add(global.harbor.container.data.count);
    };
    
    check_auto_start = function()
    {
        if (self.data.started)
        {
            exit;
        }
        if (self.data.count < self.data.input_count)
        {
            exit;
        }
        self.start();
    };
    
    claim = function()
    {
        var harbor_data = get_default_struct_value(o_game.data, "harbor", undefined);
        if (is_struct(harbor_data) && is_struct(harbor_data.stats))
        {
            add_to_struct_value(harbor_data.stats, "jobs_completed", 1);
        }
        add_result_lite(self.data.output);
        remove_self_from_array(global.harbor.jobs, self);
    };
    
    decrease = function(arg0 = 1)
    {
        var decrease_count = min(arg0, self.data.count);
        decrease_count = max(0, decrease_count);
        self.data.count -= decrease_count;
        global.harbor.container.add(decrease_count, true, false);
        return decrease_count;
    };
    
    get_duration = function()
    {
        var base_duration = self.duration;
        base_duration *= power(0.5, global.upgrade_attributes.harbor_jobs_duration_multiplier);
        return base_duration;
    };
    
    start = function()
    {
        self.data.started = true;
        self.data.time_end = o_game.data.stats.time_elapsed + self.get_duration();
    };
    
    set_local_vars(arg0);
}
