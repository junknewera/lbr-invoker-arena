event_inherited();
titles = 
{
    title: __("Wayland"),
    subtitle: __("Hello, nice to meet you!")
};
talk_text = "";

init_actions = function()
{
    actions = [new Gui_Item(UnknownEnum.Value_38, id, 
    {
        quests: global.quests.kokka_w
    })];
};

init_actions();

enum UnknownEnum
{
    Value_38 = 38
}
