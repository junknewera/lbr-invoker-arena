function Transmuter(arg0 = undefined) : Game_Object(arg0) constructor
{
    child = undefined;
    key = "";
    key_reverse = "";
    has_reverse = true;
    input = undefined;
    is_reverse = false;
    output = undefined;
    parent = undefined;
    reverse_ratio = 0.5;
    section = "other";
    transmute_duration = sec(0);
    data = 
    {
        auto: false,
        timeout: 0,
        transmuted: 0
    };
    
    _init = function()
    {
        self.key_reverse = sprintf("%s_reverse", self.key);
        if (self.is_reverse)
        {
            self.output = multiply_struct_values(self.output, self.reverse_ratio);
        }
    };
    
    init = __void;
    
    can_transmute = function(arg0 = 1)
    {
        return has_enough(self.input, arg0) && self.data.timeout <= o_game.data.stats.time_elapsed;
    };
    
    check = function()
    {
        var transmute_count = 1;
        if (self.data.auto && self.can_transmute())
        {
            if (transmute_count == "max")
            {
                self.transmute_max(false);
            }
            else
            {
                self.transmute(transmute_count, false);
            }
        }
    };
    
    toggle_auto = function()
    {
        self.data.auto = !self.data.auto;
        if (self.data.auto)
        {
            if (is_struct(self.child))
            {
                self.child.data.auto = false;
            }
            else if (is_struct(self.parent))
            {
                self.parent.data.auto = false;
            }
        }
    };
    
    transmute = function(arg0 = 1, arg1 = true)
    {
        if (!self.can_transmute(arg0))
        {
            exit;
        }
        var count_input = [arg0];
        if (is_struct(struct_get_from_hash(self.output, variable_get_hash("materials"))))
        {
            var __struct = self.output.materials;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                var mat = variable_struct_get(global.materials, mkey);
                var max_storage = mat.get_max_count() - mat.data.count;
                var max_count = floor(divide_safe(max_storage, mitem));
                array_push(count_input, max_count);
            }
        }
        var transmute_count = array_lowest(count_input);
        if (transmute_count < 1)
        {
            if (arg1)
            {
                notify(__s("Transmute failed: %s", __("Material storage full.")));
            }
            exit;
        }
        convert_lite(self.input, self.output, self.key, undefined, arg0);
        self.data.timeout = o_game.data.stats.time_elapsed + self.transmute_duration;
        self.data.transmuted++;
    };
    
    transmute_max = function(arg0 = true)
    {
        var count_input = [];
        if (is_struct(struct_get_from_hash(self.input, variable_get_hash("resources"))))
        {
            var __struct = self.input.resources;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                var res = variable_struct_get(global.resources, mkey);
                var max_count = floor(divide_safe(res.data.count, mitem));
                array_push(count_input, max_count);
            }
        }
        if (is_struct(struct_get_from_hash(self.input, variable_get_hash("materials"))))
        {
            var __struct = self.input.materials;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                var mat = variable_struct_get(global.materials, mkey);
                var max_count = floor(divide_safe(mat.data.count, mitem));
                array_push(count_input, max_count);
            }
        }
        if (is_struct(struct_get_from_hash(self.output, variable_get_hash("materials"))))
        {
            var __struct = self.output.materials;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                var mat = variable_struct_get(global.materials, mkey);
                var max_storage = mat.get_max_count() - mat.data.count;
                var max_count = floor(divide_safe(max_storage, mitem));
                array_push(count_input, max_count);
            }
        }
        var transmute_count = array_lowest(count_input);
        self.transmute(transmute_count, arg0);
        return transmute_count;
    };
    
    set_local_vars(arg0);
}
