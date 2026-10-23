function Resource(arg0, arg1) constructor
{
    key = arg0;
    armor = 1;
    data = 
    {
        count: 0,
        collected: 0,
        collected_total: 0,
        level: 0,
        unlocked: false,
        unlocked_fruit: false
    };
    data_start = struct_clone(data);
    calculate_single = false;
    calculate_single_upgrade = false;
    calculate_special = false;
    can_lose_resource = false;
    can_trade = false;
    description = "";
    discountable = true;
    droppable = false;
    format_value = true;
    has_fruits = false;
    has_seeds = false;
    include_in_stats = true;
    is_leaf = false;
    is_prestige_resource = false;
    merge_check = false;
    merge_check_active = false;
    merge_check_passive = false;
    name = __("Unknown Leaf");
    name_single = __("Unknown");
    name_plural = __("Unknown Leaves");
    offline_reward = false;
    persist_prestige = false;
    persist_prestige_level = 0;
    prestige_value = 0;
    printable = false;
    print_cost_multiplier = 1;
    print_value_multiplier = 1;
    reward = key;
    reward_value_multiplier = 1;
    scale = 1;
    show_in_nav = true;
    show_in_nav_check = true;
    spawn_chance = 0;
    spawn_chance_seed = -1;
    sprite = spr_placeholder;
    sprite_seed = spr_placeholder;
    
    init = function()
    {
        if (self.spawn_chance_seed == -1)
        {
            self.spawn_chance_seed = self.spawn_chance;
        }
    };
    
    get_name = function()
    {
        return get_value_ext(self, self.name, false);
    };
    
    get_description = function()
    {
        return get_value_ext(self, self.description, false);
    };
    
    is_obfuscated = function()
    {
        return self.data.collected_total == 0;
    };
    
    set_local_vars(arg1);
    set_sprite_data(self);
    init();
}
