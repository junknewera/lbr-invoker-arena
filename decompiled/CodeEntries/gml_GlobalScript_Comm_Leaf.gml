function Comm_Leaf(arg0) constructor
{
    name = "";
    description = "-";
    index = 0;
    key = "";
    sprite = spr_leaf_comm_happy;
    game_item_type = UnknownEnum.Value_3;
    data = 
    {
        collected: 0,
        count: 0,
        drowned: 0,
        shown: false,
        unlocked: false
    };
    upgrade_attributes = {};
    
    init = function()
    {
        self.upgrade_attributes.leaf_hard_multiplier = 0.05;
    };
    
    add_stat = function(arg0, arg1)
    {
        add_to_struct_value(self.data, arg0, arg1);
    };
    
    can_apply_bonus = function()
    {
        return self.data.count > 0;
    };
    
    can_spawn = function()
    {
        return self.data.count == 0;
    };
    
    check_max_count = function()
    {
        return self.can_spawn();
    };
    
    collect = function(arg0 = 1)
    {
        self.data.collected += arg0;
        self.data.count += arg0;
        self.data.unlocked = true;
        global.refresh_game_vars = true;
    };
    
    draw_exclamation_mark = function()
    {
        return self.data.count > 0 && !self.data.shown;
    };
    
    get_name = function()
    {
        return get_value_ext(self, self.name, false);
    };
    
    get_description = function()
    {
        var desc = get_value_ext(self, self.description, false);
        if (is_unlocked_fishing())
        {
            desc += ("\n\n" + __s("Drowned: %s", number_format(get_default_struct_value(self.data, "drowned", 0))));
        }
        return desc;
    };
    
    get_tooltip = function()
    {
        if (!self.data.unlocked)
        {
            return "?";
        }
        var text = [self.get_name(), "------", self.get_description()];
        return implode("\n", text);
    };
    
    is_obfuscated = function()
    {
        return self.data.count == 0;
    };
    
    set_local_vars(arg0);
    set_sprite_data(self);
    init();
}

enum UnknownEnum
{
    Value_3 = 3
}
