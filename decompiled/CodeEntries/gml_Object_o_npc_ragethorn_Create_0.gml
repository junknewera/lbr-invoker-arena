event_inherited();
refresh_actions_on_click = true;
titles = 
{
    title: __("Ragethorn"),
    subtitle: __("")
};

init_actions = function()
{
    actions = [];
    var riddle_solved = o_game.data.flags.ff_prison_solved;
    var mount_moltenfury_visited = get_upgrade_count(global.areas.mount_moltenfury) > 0;
    if (!riddle_solved)
    {
        actions = [new Gui_Item(UnknownEnum.Value_54, id, 
        {
            text: string_upper(concat([__("Hey! You! Please help me! My brother was kidnapped but I'm too afraid to leave the cavern!"), mount_moltenfury_visited ? __("He is in a magical prison at Mount Moltenfury. We captured a chimera called Spectralseeker a long time ago, but it was able to flee. The prison was locked by a magic lock with a unique code that could only be deciphered with an item crafted by Borbs... The Borbcipherer.") : "", mount_moltenfury_visited ? __("Please find the Borbcipherer and rescue my brother! It can be found in uncommon Borbventures.") : ""], "\n\n"))
        })];
    }
    else
    {
        actions = [new Gui_Item(UnknownEnum.Value_54, id, 
        {
            text: string_upper(__s("Thanks so much! I love you!"))
        })];
    }
};

init_actions();

enum UnknownEnum
{
    Value_54 = 54
}
