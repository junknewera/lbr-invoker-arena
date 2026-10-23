event_inherited();
refresh_actions_on_click = true;
xscale = 2;
yscale = 2;

init_actions = function()
{
    actions_dialog_simple(gui_item_booster_game, 
    {
        title: __("Booster Game")
    }, 
    {
        add_draw: gui_item_booster_game_add_draw
    }, "booster_game");
};
