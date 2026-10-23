event_inherited();
refresh_actions_on_click = true;
titles = global.titles.shadow_crystal;
xscale = 6;
yscale = 6;
yoffset = 10;

init_actions = function()
{
    actions_dialog_simple(gui_item_shadow_crystal, titles, 
    {
        add_draw: gui_item_shadow_crystal_add_draw
    }, "shadow_crystal");
};
