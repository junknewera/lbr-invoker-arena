event_inherited();
refresh_actions_on_click = true;
titles = 
{
    title: __("Quark Portal"),
    subtitle: __("")
};

init_actions = function()
{
    actions = [];
    actions = [new Gui_Item(UnknownEnum.Value_54, id, 
    {
        is_visible: function()
        {
            return true;
        },
        
        text: __s("The %s awaits you.", __("Quark Ambit"))
    }), new Gui_Item(UnknownEnum.Value_5, id, 
    {
        button_text: __("Step into the Portal"),
        
        func: function()
        {
            with (o_npc_quark_portal)
            {
                step_into_portal();
            }
        }
    })];
};

init_actions();

step_into_portal = function()
{
    gui_dialog_close();
    fx_quark_portal();
    instance_destroy(o_npc_quark_portal);
    delay("black_leaf_hole_teleport", sec(5), function()
    {
        change_area(global.areas.quark_nexus);
        notify(__s("You have discovered a new galaxy: %s", __("Quark Ambit")));
    });
};

enum UnknownEnum
{
    Value_5 = 5,
    Value_54 = 54
}
