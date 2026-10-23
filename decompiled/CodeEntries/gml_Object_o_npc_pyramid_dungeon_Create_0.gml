event_inherited();
refresh_actions_on_click = true;
titles = 
{
    title: __("THE - CURSED - PYRAMID"),
    subtitle: __("")
};

init_actions = function()
{
    actions_dialog_simple(gui_item_pyramid, titles, 
    {
        add_draw: gui_item_pyramid_add_draw
    });
};
