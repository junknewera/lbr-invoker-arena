function Guild(arg0) constructor
{
    name = "";
    index = 0;
    key = "";
    sprite = spr_placeholder;
    
    init = function()
    {
        self.cache = {};
        self.data = {};
        self.upgrade_attributes_items = {};
    };
    
    get_name = function()
    {
        return get_value_ext(self, self.name, false);
    };
    
    is_obfuscated = function()
    {
        return false;
    };
    
    load_data = function(arg0)
    {
        self.init();
        apply_struct_to_struct(self, arg0);
    };
    
    apply_struct_to_struct(self, arg0);
    set_sprite_data(self);
    init();
}
