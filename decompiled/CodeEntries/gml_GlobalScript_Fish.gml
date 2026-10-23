function Fish(arg0) : Collectable_Usable_Object(arg0) constructor
{
    data_defaults = 
    {
        max_length: 0
    };
    last_max_length = 0;
    is_usable = false;
    min_rarity = global.fishing_rods_rarity.common;
    
    init = function()
    {
        self.name_full = sprintf("%s %s", self.rarity.name, self.name);
    };
    
    can_catch = function(arg0 = global.fishing_rods_rarity.common)
    {
        if (self.min_rarity.level > arg0.level)
        {
            return false;
        }
        return true;
    };
    
    can_craft = function(arg0 = 1)
    {
        if (!has_enough_resources(self.get_craft_cost(arg0)))
        {
            return false;
        }
        if (!self.can_craft_count(arg0))
        {
            return false;
        }
        return true;
    };
    
    can_craft_count = function(arg0 = 1)
    {
        return (self.data.collected + arg0) <= self.get_max_count();
    };
    
    collect = function(arg0 = 0.1, arg1 = 1)
    {
        self.last_max_length = self.data.max_length;
        self.data.max_length = max(arg0, self.data.max_length);
        self.data.collected += arg1;
        self.data.count += arg1;
        self.data.unlocked = true;
        o_game.data.stats.fish_caught += arg1;
        o_game.data.stats.fish_length_max = max(o_game.data.stats.fish_length_max, arg0);
        self.refresh_upgrade_attributes();
    };
    
    craft = function(arg0, arg1 = 1)
    {
        if (!self.can_craft(arg1))
        {
            exit;
        }
        dec_resources(self.get_craft_cost(arg1));
        self.collect(arg0, arg1);
    };
    
    get_craft_cost = function(arg0 = 1)
    {
        var cost = 
        {
            materials: 
            {
                tide_crystal: (100 + (power(self.rarity.level - 1, 2) * 150)) * arg0
            }
        };
        return cost;
    };
    
    get_upgrade_attributes = function()
    {
        if (is_undefined(self.upgrade_attributes_cache))
        {
            self.refresh_upgrade_attributes();
        }
        return self.upgrade_attributes_cache;
    };
    
    refresh_upgrade_attributes = function()
    {
        var multiplier = sqrt0(sqrt0(self.data.max_length) * power(self.rarity.level, 1.75));
        self.upgrade_attributes_cache = multiply_struct_values(self.upgrade_attributes, multiplier);
        refresh_ua_section("fish");
    };
    
    is_unlocked = function()
    {
        return self.data.collected > 0;
    };
    
    get_btn_bg_color = function()
    {
        if (!self.is_unlocked())
        {
            return 16777215;
        }
        return variable_struct_get(global.rarity_colors, self.rarity.key);
    };
    
    get_name = function()
    {
        if (!self.is_unlocked())
        {
            return "?";
        }
        return self.name_full;
    };
    
    get_tooltip = self.get_name;
    set_local_vars(arg0);
}
