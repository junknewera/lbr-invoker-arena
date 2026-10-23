function Harbor_Worker_Pool(arg0 = undefined) constructor
{
    index = 0;
    name = __("Container");
    data = 
    {
        count: 0,
        transfer_rate_cache: 0,
        last_transfer_tick: 0
    };
    data_start = 
    {
        count: 0,
        transfer_rate_cache: 0,
        last_transfer_tick: 0
    };
    
    init = function()
    {
    };
    
    add = function(arg0)
    {
        arg0 += global.upgrade_attributes.harbor_container_leaf_adder;
        arg0 *= (1 + global.upgrade_attributes.harbor_container_leaf_multiplier);
        arg0 = round(arg0);
        self.data.count += arg0;
        self.data.count = min(self.data.count, self.get_max_storage());
    };
    
    transfer_to_generators = function()
    {
        if (!is_struct(global.harbor.generator_pool))
        {
            return 0;
        }
        var transfer_count = 0;
        var pool_multiplier = global.harbor.generator_pool.get_generator_speed_multiplier();
        var base_transfer_rate = self.get_transfer_rate();
        var transfer_amount = floor(base_transfer_rate * pool_multiplier);
        transfer_amount = min(transfer_amount, self.data.count);
        if (transfer_amount > 0)
        {
            var __array = global.harbor.generators;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                if (mitem.data.count < mitem.get_max_storage())
                {
                    var add_amount = mitem.add(transfer_amount);
                    self.data.count -= add_amount;
                    transfer_count += add_amount;
                    transfer_amount -= add_amount;
                    if (transfer_amount <= 0)
                    {
                        break;
                    }
                }
            }
        }
        return transfer_count;
    };
    
    check = function()
    {
    };
    
    get_generator_speed_multiplier = function()
    {
        return 1;
    };
    
    get_max_count = function()
    {
        return get_cache("harbor_container_max_count", global.game_settings.harbor_container_max_count);
    };
    
    get_max_storage = function()
    {
        return get_cache("harbor_container_max_storage", global.game_settings.harbor_container_max_storage);
    };
    
    get_max_workers = function()
    {
        return 5;
    };
    
    get_ship_reward_multiplier = function()
    {
        return 1;
    };
    
    get_ship_speed_multiplier = function()
    {
        return 1;
    };
    
    get_transfer_rate = function()
    {
        return get_cache("harbor_container_transfer_rate", global.game_settings.harbor_container_transfer_rate) ?? 10;
    };
    
    get_pack_duration = function()
    {
        return global.debug ? sec(2) : sec(5);
    };
    
    is_full = function()
    {
        return self.data.count >= self.get_max_storage();
    };
    
    pack = function()
    {
    };
    
    init_data = function()
    {
        apply_struct_to_struct(o_game.data.harbor.container[self.index], self.data);
    };
    
    set_local_vars(arg0);
    self.init();
}
