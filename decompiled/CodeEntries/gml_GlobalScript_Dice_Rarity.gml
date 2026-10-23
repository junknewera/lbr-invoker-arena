function Dice_Rarity(arg0 = undefined) : Rarity(arg0) constructor
{
    name = "";
    index = 0;
    key = "";
    level = 1;
    min_level = 0;
    spawn_chance = 0;
    btn_bg_sprite = spr_placeholder;
    color = 16777215;
    next_rarity_type = undefined;
    sprite = spr_placeholder;
    stacked_sprites = undefined;
    upgrade_multiplier = 1;
    
    init = function()
    {
        self.btn_bg_sprite = self.sprite;
        self.index = self.level;
        self.upgrade_multiplier = 1 + ((self.level - 1) / 5);
        if (!is_undefined(variable_struct_get(global.rarity_colors, self.key)))
        {
            self.color = variable_struct_get(global.rarity_colors, self.key);
        }
        self.stacked_sprites = [
        {
            sprite: spr_icon_die_blank,
            blend_color: self.color,
            scale: 1.1
        }, 
        {
            sprite: spr_icon_die,
            offset_x: 2,
            offset_y: 2
        }];
    };
    
    get_salvage_resources = function(arg0 = 1)
    {
        var value = 10 + ((self.level - 1) * 30);
        value *= arg0;
        return 
        {
            resources: 
            {
                dice: value
            }
        };
    };
    
    get_name = function()
    {
        return get_value_ext(self, self.name);
    };
    
    set_local_vars(arg0);
    set_sprite_data(self);
}
