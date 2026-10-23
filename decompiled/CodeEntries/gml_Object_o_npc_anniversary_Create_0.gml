event_inherited();

check_spawn = function()
{
    return is_event_active(global.events.anniversary);
};

refresh_actions_on_click = true;
xscale = 2;
yscale = 2;

init_actions = function()
{
    actions_dialog_simple(gui_item_anniversary_candle, global.titles.minigame_candle, 
    {
        add_draw: gui_item_anniversary_candle_add_draw
    }, "event_shop");
};
