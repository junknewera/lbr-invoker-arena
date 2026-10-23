function Hotkey(arg0, arg1 = undefined) constructor
{
    key = arg0;
    hotkey = -1;
    hotkey_default = -1;
    hotkey_func = open_nav;
    is_nav_hotkey = true;
    name = "";
    option = undefined;
    
    init = function()
    {
        self.hotkey_default = self.hotkey;
    };
    
    if (is_struct(arg1))
    {
        set_local_vars(arg1);
    }
    init();
}
