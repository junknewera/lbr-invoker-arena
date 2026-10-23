function Harbor_Route_Type(arg0 = undefined) constructor
{
    key = "";
    name = "";
    upgrade_attributes = {};
    upgrade_text = "";
    fuel_multiplier = 1;
    xp_multiplier = 1;
    
    _init = function()
    {
        if (self.key == "regular")
        {
            self.upgrade_text = "-";
        }
        else
        {
            self.upgrade_text = format_upgrade_text(self.upgrade_attributes, undefined, undefined, undefined, "\n");
        }
    };
    
    set_local_vars(arg0);
    self._init();
}
