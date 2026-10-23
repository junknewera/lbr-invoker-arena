event_inherited();
titles = 
{
    title: __("Cuvje"),
    subtitle: __("Always follow the light!")
};
talk_text = "";

init_actions = function()
{
    actions = [new Gui_Item(UnknownEnum.Value_38, id, 
    {
        quests: global.quests.kokka_c
    })];
};

init_actions();

enum UnknownEnum
{
    Value_38 = 38
}
