function Type_Object(arg0) constructor
{
    cache_late = false;
    cache_upgrades_array = undefined;
    description = "";
    description_cache = "";
    key = "";
    name = "";
    sprite = spr_placeholder;
    upgrade_attributes = undefined;
    upgrade_attributes_cache = undefined;
    upgrade_cache_text = "";
    
    _init = function()
    {
        if (!cache_late)
        {
            self.cache_upgrades();
        }
        self.init();
    };
    
    init = __void;
    init_late = __void;
    can_generate = __return_true;
    
    cache_upgrades = function()
    {
        if (!is_array(self.cache_upgrades_array))
        {
            exit;
        }
        var text = [];
        var __array = self.cache_upgrades_array;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            var upgrade_multiplier = get_default_struct_value(mitem, "upgrade_multiplier", 1);
            var t = sprintf("[%s]\n%s", mitem.name, format_upgrade_text(self.get_upgrade_attributes(), upgrade_multiplier));
            array_push(text, t);
        }
        self.upgrade_cache_text = implode("\n\n", text);
    };
    
    get_upgrade_attributes = function()
    {
        if (is_undefined(self.upgrade_attributes_cache))
        {
            self.refresh_upgrade_attributes();
        }
        return self.upgrade_attributes_cache;
    };
    
    refresh_upgrade_attributes = function()
    {
        self.upgrade_attributes_cache = self.upgrade_attributes;
    };
    
    set_local_vars(arg0);
    self.init();
}
