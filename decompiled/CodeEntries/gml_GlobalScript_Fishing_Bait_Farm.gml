function Fishing_Bait_Farm(arg0 = undefined) : Savable_Object(arg0) constructor
{
    baits = [];
    fertilizer_cost = 
    {
        resources: 
        {
            tide_crystal: 2
        }
    };
    container_count = 0;
    rarity = undefined;
    sprite = spr_bait_common;
    status = "progress";
    tooltip_cache = undefined;
    data = 
    {
        container: [],
        fertilizer: 0,
        level: 1,
        progress: 0
    };
    
    init = function()
    {
    };
    
    can_fertilize = function()
    {
        if (self.data.fertilizer >= 1)
        {
            return false;
        }
        if (!has_enough(self.fertilizer_cost))
        {
            return false;
        }
        return true;
    };
    
    can_collect = function()
    {
        return self.container_count > 0;
    };
    
    check = function()
    {
        var container_size = get_bait_farm_container_size();
        if (self.container_count < container_size)
        {
            self.progress();
        }
        if (self.data.progress >= 1 && self.container_count < container_size)
        {
            var bait = get_random_rarity(global.fishing_baits_rarity_array_desc, global.upgrade_attributes.fishing_bait_farm_rarity_multiplier);
            array_push(self.data.container, bait.key);
            self.container_count++;
            self.data.progress -= 1;
        }
    };
    
    check_auto = function()
    {
        if (self.container_count > 0 && get_option(global.options.auto_collect_baits) && has_bought_shop_item_safe(global.shops.fish.auto_collect_baits))
        {
            self.collect();
        }
    };
    
    collect = function()
    {
        var reward = 
        {
            fish_baits: {}
        };
        var __array = self.data.container;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            add_to_struct_value(reward.fish_baits, mitem, 1);
        }
        add_result_lite(reward);
        self.data.container = [];
        self.container_count = 0;
    };
    
    collect_slot = function(arg0 = 0)
    {
        if (!between(arg0, 0, array_length(self.data.container) - 1))
        {
            exit;
        }
        var reward = 
        {
            fish_baits: {}
        };
        add_to_struct_value(reward.fish_baits, self.data.container[arg0], 1);
        array_delete(self.data.container, arg0, 1);
        self.container_count--;
        add_result_lite(reward);
    };
    
    fertilize = function()
    {
        self.data.fertilizer += 1;
        self.data.fertilizer = clamp(self.data.fertilizer, 0, 1);
        dec_result(self.fertilizer_cost);
    };
    
    get_progress_value = function()
    {
        var value = get_cache("fishing_bait_farm_progress_value", global.game_settings.fishing_bait_farm_progress_value);
        if (self.data.fertilizer > 0)
        {
            value *= global.game_settings.fishing_bait_fertilizer_multiplier;
        }
        return value;
    };
    
    progress = function(arg0 = self.get_progress_value())
    {
        self.data.progress += arg0;
        self.data.progress = clamp(self.data.progress, 0, 1);
        self.data.fertilizer -= 0.003;
    };
    
    load_data_after = function()
    {
        self.container_count = array_length(self.data.container);
    };
    
    set_local_vars(arg0);
}
