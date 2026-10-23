function Rarity(arg0 = undefined) constructor
{
    name = "";
    index = 0;
    key = "";
    level = 1;
    min_level = 0;
    spawn_chance = 0;
    btn_bg_sprite = spr_placeholder;
    color = 16777215;
    next_rarity = undefined;
    next_rarity_type = undefined;
    previous_rarity = undefined;
    sprite = spr_placeholder;
    upgrade_multiplier = 1;
    
    _init = function()
    {
        self.index = self.level;
        self.color = get_default_struct_value(global.rarity_colors, self.key, self.color);
        self.upgrade_multiplier = 1 + ((self.level - 1) / 5);
        self.init();
    };
    
    init = __void;
    
    get_spawn_chance = function()
    {
        return self.spawn_chance;
    };
    
    get_name = function()
    {
        return get_value_ext(self, self.name);
    };
    
    set_local_vars(arg0);
    set_sprite_data(self);
}
