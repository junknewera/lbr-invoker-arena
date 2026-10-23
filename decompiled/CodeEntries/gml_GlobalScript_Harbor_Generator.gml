function Harbor_Generator(arg0 = undefined) constructor
{
    index = 0;
    name = __("Generator");
    sprite = spr_icon_ship_fuel_generator;
    data = 
    {
        count: 0,
        result: undefined,
        status: UnknownEnum.Value_0,
        time_end: 0
    };
    
    init = function()
    {
    };
    
    add = function(arg0)
    {
        var add_count = max(0, min(arg0, self.get_max_storage() - self.data.count));
        self.data.count += add_count;
        global.harbor.container.decrease(add_count);
        return add_count;
    };
    
    can_add = function()
    {
        return global.harbor.container.data.count > 0 && self.data.count < self.get_max_storage();
    };
    
    can_claim = function()
    {
        if (self.data.status == UnknownEnum.Value_0)
        {
            return false;
        }
        if (o_game.data.stats.time_elapsed < self.data.time_end)
        {
            return false;
        }
        return true;
    };
    
    can_generate = function()
    {
        if (self.data.status != UnknownEnum.Value_0)
        {
            return false;
        }
        if (self.data.count < self.get_conversion_input_cost())
        {
            return false;
        }
        return true;
    };
    
    check = function()
    {
        var has_auto_generate = false;
        if (has_auto_generate)
        {
            if (self.data.status == UnknownEnum.Value_0 && self.can_generate())
            {
                self.generate();
            }
            else if (self.data.status == UnknownEnum.Value_1 && o_game.data.stats.time_elapsed >= self.data.time_end)
            {
                self.claim();
            }
        }
    };
    
    claim = function()
    {
        self.data.status = UnknownEnum.Value_0;
        add_result_lite(self.data.result);
    };
    
    generate = function()
    {
        var input_cost = max(1, self.get_conversion_input_cost());
        var output_count = floor(self.data.count / input_cost);
        self.data.count -= input_cost * output_count;
        self.data.result = self.get_fuel_result(output_count);
        self.data.status = UnknownEnum.Value_1;
        self.data.time_end = o_game.data.stats.time_elapsed + self.get_duration();
    };
    
    get_max_add_count = function()
    {
        return max(0, min(global.harbor.container.data.count, self.get_max_storage() - self.data.count));
    };
    
    get_max_storage = function()
    {
        return get_cache("harbor_generator_max_storage", 300);
    };
    
    get_conversion_input_cost = function()
    {
        return get_cache("harbor_generator_input_cost", 300);
    };
    
    get_fuel_output = function()
    {
        var value = 1;
        value *= (1 + global.upgrade_attributes.harbor_generator_output_multiplier);
        return value;
    };
    
    get_fuel_result = function(arg0 = 1)
    {
        var fuel_count = self.get_fuel_output() * arg0;
        var result = 
        {
            resources: 
            {
                ship_fuel: fuel_count
            }
        };
        return result;
    };
    
    get_duration = function()
    {
        var duration = global.debug ? sec(3) : sec(30);
        duration = max(sec(1), duration);
        return duration;
    };
    
    get_status_text = function()
    {
        var text = "";
        switch (self.data.status)
        {
            case UnknownEnum.Value_0:
                text = __("Idle");
                break;
            case UnknownEnum.Value_1:
                text = __("Generating");
                break;
        }
        return text;
    };
    
    init_data = function()
    {
        apply_struct_to_struct(o_game.data.harbor.generators[self.index], self.data);
    };
    
    set_local_vars(arg0);
    self.init();
}

enum UnknownEnum
{
    Value_0,
    Value_1
}
