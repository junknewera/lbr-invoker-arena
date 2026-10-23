event_inherited();
refresh_actions_on_click = true;
titles = 
{
    title: "Borbiana Jones",
    subtitle: ""
};
riddle_solved = o_game.data.flags.ff_prison_solved;
if (!riddle_solved)
{
    instance_destroy();
}

init_actions = function()
{
    actions = [new Gui_Item(UnknownEnum.Value_18, id, 
    {
        func: gui_item_npc_borbjones
    })];
};

init_actions();

enum UnknownEnum
{
    Value_18 = 18
}
