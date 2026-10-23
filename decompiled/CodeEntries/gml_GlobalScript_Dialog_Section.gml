function Dialog_Section(arg0) constructor
{
    name = "";
    description = "";
    index = 0;
    key = "";
    sections = {};
    sprite = spr_placeholder;
    is_visible = true;
    
    init = function()
    {
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
        return false;
    };
    
    _is_visible = function()
    {
        return get_value_ext(self, self.is_visible);
    };
    
    set_local_vars(arg0);
    set_sprite_data(self);
    init();
}
