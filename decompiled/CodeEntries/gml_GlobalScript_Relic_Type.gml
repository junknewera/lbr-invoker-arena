function Relic_Type(arg0 = undefined) constructor
{
    name = "";
    index = 0;
    level = 1;
    spawn_chance = 0;
    btn_bg_sprite = spr_textbox_9s;
    sprite = spr_placeholder;
    
    init = function()
    {
        self.btn_bg_sprite = self.sprite;
        self.index = self.level;
    };
    
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
    init();
}
