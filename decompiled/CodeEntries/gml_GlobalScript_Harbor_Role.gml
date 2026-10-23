function Harbor_Role(arg0 = undefined) : Type_Object(arg0) constructor
{
    unlocked = false;
    data = 
    {
        count: 0,
        unlocked: false
    };
    
    init = function()
    {
        var desc = [self.description, format_upgrade_text(self.upgrade_attributes)];
        self.description_cache = implode("\n", desc);
    };
    
    add = function(arg0 = 1)
    {
        self.data.count += arg0;
        self.set_count(self.data.count);
    };
    
    is_obfuscated = function()
    {
        return !self.is_unlocked();
    };
    
    is_unlocked = function()
    {
        return self.data.unlocked || self.unlocked;
    };
    
    set_count = function(arg0)
    {
        var max_count = min(self.get_max_count(), get_harbor_roles_max_count() - (global.harbor_roles_current_count - self.data.count));
        self.data.count = clamp(arg0, 0, max_count);
        self.refresh_upgrade_attributes();
        global.harbor_roles_current_count = get_struct_sum(global.harbor_roles);
    };
    
    get_max_count = function()
    {
        return 999;
    };
    
    refresh_upgrade_attributes = function()
    {
        self.upgrade_attributes_cache = multiply_struct_values(self.upgrade_attributes, self.data.count);
        init_game_vars(true);
    };
    
    set_local_vars(arg0);
    self.init();
}
