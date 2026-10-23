function Mine_Rarity(arg0) : Rarity(arg0) constructor
{
    name_full = "";
    sprite = spr_icon_mine;
    
    init = function()
    {
        self.name_full = self.name + " " + __s("Mine Item");
        self.upgrade_multiplier = 1 + ((self.level - 1) * 0.5);
        self.stacked_sprites = [
        {
            sprite: spr_icon_die_blank,
            blend_color: self.color,
            scale: 1.1
        }, 
        {
            sprite: spr_icon_mine,
            offset_x: 2,
            offset_y: 2
        }];
    };
}
