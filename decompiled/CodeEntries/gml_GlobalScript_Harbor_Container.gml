function Harbor_Container(arg0 = undefined) : Savable_Object(arg0) constructor
{
    index = 0;
    name = __("Container");
    data = 
    {
        count: 0
    };
    
    init = function()
    {
    };
    
    add = function(arg0, arg1 = true, arg2 = true)
    {
        if (arg2)
        {
            arg0 += global.upgrade_attributes.harbor_container_leaf_adder;
            arg0 *= (1 + global.upgrade_attributes.harbor_container_leaf_multiplier);
            arg0 *= (1 + get_default_struct_value(global.upgrade_attributes.resources_multiplier, global.resources.water.key, 0));
        }
        if (arg1)
        {
        }
        self.data.count += arg0;
        self.data.count = min(self.data.count, self.get_max_storage());
    };
    
    auto_add = function()
    {
        var value = global.upgrade_attributes.harbor_container_auto_add_count;
        if (value <= 0)
        {
            exit;
        }
        self.add(value, false, false);
    };
    
    auto_transfer_to_generator = function()
    {
        var value = global.upgrade_attributes.harbor_container_to_generator_count;
        if (value > 0 && global.harbor.generator.data.status == UnknownEnum.Value_0)
        {
            var transfer_rate = max(1, self.get_transfer_rate());
            var count = min(self.data.count, transfer_rate * value);
            if (count > 0)
            {
                var transfer_count = count;
                var actual_transfer_count = global.harbor.generator.add(transfer_count);
                self.data.count -= actual_transfer_count;
            }
        }
    };
    
    check = function()
    {
        self.auto_add();
        self.auto_transfer_to_generator();
    };
    
    decrease = function(arg0 = 1)
    {
        self.data.count -= arg0;
        self.data.count = max(0, self.data.count);
    };
    
    get_max_count = function()
    {
        return global.game_settings.harbor_container_max_count + global.upgrade_attributes.harbor_container_max_count;
    };
    
    get_max_storage = function()
    {
        return get_cache("harbor_container_max_storage", global.game_settings.harbor_container_max_storage);
    };
    
    get_transfer_rate = function()
    {
        return get_cache("harbor_container_transfer_rate", global.game_settings.harbor_container_transfer_rate);
    };
    
    get_pack_duration = function()
    {
        return global.debug ? sec(2) : sec(5);
    };
    
    is_full = function()
    {
        return self.data.count >= self.get_max_storage();
    };
    
    set_local_vars(arg0);
    self.init();
}

enum UnknownEnum
{
    Value_0
}
