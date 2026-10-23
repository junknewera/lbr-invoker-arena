event_inherited();
name = __("Blue Leaf Stone");
refresh_actions_on_click = true;
titles = 
{
    title: name,
    subtitle: __("")
};

init_actions = function()
{
    actions = [];
    if (global.enemies.boss_terror_blue.get_current_defeat_counter() == 0)
    {
        image_alpha = 0;
        actions = [new Gui_Item(UnknownEnum.Value_54, id, 
        {
            text: concat([__("There is a small hole inside the statue. Seems like it misses an item..."), __("Hint: Exotic, Gold or Platinum Damage might be useful.")], "\n\n")
        })];
    }
    else
    {
        image_alpha = 1;
        actions = [new Gui_Item(UnknownEnum.Value_54, id, 
        {
            text: __s("The %s has been acquired.", name)
        })];
    }
};

init_actions();

enum UnknownEnum
{
    Value_54 = 54
}
