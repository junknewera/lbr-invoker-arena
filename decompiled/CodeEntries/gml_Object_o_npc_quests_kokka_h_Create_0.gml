event_inherited();
titles = 
{
    title: __("Heikki"),
    subtitle: ""
};
talk_text = "";
if (global.enemies.boss_witch.get_current_defeat_counter() > 0)
{
    titles.subtitle = __("You defeated the Evil Witch, the curse is lifted! Thank you! You are a real Leaf Blower!");
}
else
{
    titles.subtitle = __("- I - D O N T - F E E L - S O - W E L L -");
}

init_actions = function()
{
    actions = [new Gui_Item(UnknownEnum.Value_38, id, 
    {
        quests: global.quests.kokka_h,
        
        is_visible: function()
        {
            return global.enemies.boss_witch.get_current_defeat_counter() > 0;
        }
    })];
};

init_actions();

enum UnknownEnum
{
    Value_38 = 38
}
