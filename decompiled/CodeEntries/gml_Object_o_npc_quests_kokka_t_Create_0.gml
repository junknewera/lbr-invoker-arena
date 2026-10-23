event_inherited();
titles = 
{
    title: __("Torvald"),
    subtitle: __("Kippis!")
};
talk_text = "";

init_actions = function()
{
    actions = [new Gui_Item(UnknownEnum.Value_38, id, 
    {
        quests: global.quests.kokka_t
    })];
};

init_actions();

enum UnknownEnum
{
    Value_38 = 38
}
