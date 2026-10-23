event_inherited();
refresh_actions_on_click = true;
titles = 
{
    title: __("Soul Temple"),
    subtitle: ""
};

init_actions = function()
{
    actions_dialog_simple(gui_item_soul_crypt, titles, 
    {
        add_draw: gui_item_soul_crypt_add_draw
    });
};
