event_inherited();
hovering = true;
refresh_actions_on_click = true;
titles = 
{
    title: __("Ragethorn"),
    subtitle: __("")
};

init_actions = function()
{
    actions = [];
    if (area_bought(global.areas.shadow_cavern) == 0)
    {
        actions = [new Gui_Item(UnknownEnum.Value_54, id, 
        {
            is_visible: __return_true,
            text: __("HEY, YOU! YES, YOU! PLEASE HELP ME! FOLLOW ME THROUGH THE PORTAL! QUICK!!!")
        }), new Gui_Item(UnknownEnum.Value_40, id, 
        {
            is_visible: __return_true,
            resources: global.costs.unlock_ff_portal
        }), new Gui_Item(UnknownEnum.Value_51, id), new Gui_Item(UnknownEnum.Value_5, id, 
        {
            obj_index: object_index,
            button_text: __("Use Borb shield"),
            
            check: function()
            {
                return has_enough_resources(global.costs.unlock_ff_portal);
            },
            
            func: function()
            {
                dec_resources(global.costs.unlock_ff_portal);
                with (self.obj_index)
                {
                    step_into_portal();
                }
            }
        })];
    }
    else if (get_upgrade_count(global.areas.shadow_cavern) > 0)
    {
        actions = [new Gui_Item(UnknownEnum.Value_54, id, 
        {
            is_visible: function()
            {
                return true;
            },
            
            text: __("Your Borb shield protected you from the portal anomalies! You can now enter the Fire Fields portal.")
        }), new Gui_Item(UnknownEnum.Value_5, id, 
        {
            obj_index: object_index,
            button_text: __("Step into the Fire Fields portal"),
            
            func: function()
            {
                with (self.obj_index)
                {
                    step_into_portal();
                }
            }
        })];
    }
};

init_actions();

step_into_portal = function()
{
    global.areas.shadow_cavern.data.count = 1;
    global.areas.mount_moltenfury.data.count = 1;
    global.resources.coal.data.unlocked = true;
    gui_dialog_close();
    fx_ff_portal();
    instance_destroy(object_index);
    delay("black_leaf_hole_teleport", sec(5), function()
    {
        change_area(global.areas.shadow_cavern);
        notify(__s("You have discovered a new galaxy: %s", __("Fire Fields")));
    });
};

enum UnknownEnum
{
    Value_5 = 5,
    Value_40 = 40,
    Value_51 = 51,
    Value_54 = 54
}
