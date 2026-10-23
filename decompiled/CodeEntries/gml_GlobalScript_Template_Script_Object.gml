function Template_Script_Object(arg0) constructor
{
    name = __("");
    name_plural = name;
    description = __("");
    index = 0;
    key = "";
    sprite = spr_placeholder;
    data = 
    {
        collected: 0,
        count: 0
    };
    max_count = 0;
    
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
    
    load_data = function(arg0)
    {
        apply_struct_to_struct(self.data, arg0);
        self.data = arg0;
        self.init();
    };
    
    set_local_vars(arg0);
    set_sprite_data(self);
    init();
}
