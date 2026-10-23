function Harbor_Job_Type(arg0 = undefined) : Type_Object(arg0) constructor
{
    fuel_multiplier = 1;
    xp_multiplier = 1;
    
    _init = function()
    {
        if (self.key == "regular")
        {
            self.upgrade_cache_text = "-";
        }
        else
        {
            self.upgrade_cache_text = format_upgrade_text(self.upgrade_attributes, undefined, undefined, undefined, "\n");
        }
    };
    
    set_local_vars(arg0);
    self._init();
}
