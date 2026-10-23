event_inherited();
var subtitle = global.is_mobile ? __("Stop the Borb hook with a tap.") : __("Stop the Borb hook with left mouse click or spacebar. Quick restart with right mouse click or spacebar.");
titles = 
{
    title: __("Borb Claw Machine"),
    subtitle: subtitle
};
actions = [new Gui_Item(UnknownEnum.Value_21, id, {})];
props = 
{
    add_draw: gui_item_game_borb_claw_machine_add_draw
};

enum UnknownEnum
{
    Value_21 = 21
}
