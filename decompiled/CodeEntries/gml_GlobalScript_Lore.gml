function Lore(arg0) constructor
{
    name = "";
    description = "";
    index = 0;
    key = "";
    data = 
    {
        shown: false,
        unlocked: false
    };
    
    init = function()
    {
    };
    
    _check = function()
    {
        var res = self.check();
        if (res)
        {
            self.unlock();
        }
        return res;
    };
    
    check = function()
    {
        return false;
    };
    
    get_name = function()
    {
        if (!self.data.unlocked && !self._check())
        {
            return "?";
        }
        return self.name;
    };
    
    get_description = function()
    {
        if (!self.data.unlocked && !self._check())
        {
            return "?";
        }
        var desc = [];
        if (self.data.collected > 0)
        {
            array_push(desc, get_value_ext(self, self.description, false));
        }
        return implode(" ", desc);
    };
    
    is_button_enabled = function()
    {
        return !self.is_obfuscated();
    };
    
    is_obfuscated = function()
    {
        return !self.data.unlocked && !self._check();
    };
    
    unlock = function()
    {
        self.data.unlocked = true;
    };
    
    set_local_vars(arg0);
    init();
}
