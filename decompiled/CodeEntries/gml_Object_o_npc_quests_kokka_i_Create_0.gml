event_inherited();
titles = 
{
    title: __("Inga"),
    subtitle: __("Welcome to our small town!")
};
talk_text = "";

init_actions = function()
{
    actions = [new Gui_Item(UnknownEnum.Value_38, id, 
    {
        quests: global.quests.kokka_i
    })];
};

init_actions();

enum UnknownEnum
{
    Value_38 = 38
}
