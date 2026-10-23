event_inherited();
if (global.areas.tower.data.highest_floor <= 100)
{
    instance_destroy();
}
titles = 
{
    title: __("Mega Leaf Crunch"),
    subtitle: __("Enter the Big Leaf Crunch Portal to restart your blowing adventure with some BLC Coin(s).")
};
actions = [new Gui_Item(UnknownEnum.Value_54, id, 
{
    is_visible: function()
    {
        return true;
    },
    
    text: __("Restart your leaf blowing adventure with valuable MLC Coins. All upgrades will be reset with some exceptions (shops marked with *** will persist).")
}), new Gui_Item(UnknownEnum.Value_40, id, 
{
    is_visible: function()
    {
        return true;
    },
    
    resources: function()
    {
        return get_prestige_resources(false, global.prestige_levels.mlc.level);
    }
}), new Gui_Item(UnknownEnum.Value_51, id), new Gui_Item(UnknownEnum.Value_5, id, 
{
    button_text: __("Mega Crunch"),
    
    check: function()
    {
        return true;
    },
    
    func: function()
    {
        confirm_dialog(__("Do you want to enter the Mega Leaf Crunch Portal now?"), function()
        {
            prestige_exec(global.prestige_levels.mlc.level);
        });
    }
})];

enum UnknownEnum
{
    Value_5 = 5,
    Value_40 = 40,
    Value_51 = 51,
    Value_54 = 54
}
