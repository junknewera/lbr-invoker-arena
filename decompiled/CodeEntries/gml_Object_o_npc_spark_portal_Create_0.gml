event_inherited();
refresh_actions_on_click = true;
titles = 
{
    title: __("Spark Portal"),
    subtitle: __("")
};

init_actions = function()
{
    actions = [];
    if (area_bought(global.areas.plasma_forest) == 0)
    {
        actions = [new Gui_Item(UnknownEnum.Value_54, id, 
        {
            is_visible: __return_true,
            text: __("An electric shield protects the Spark Portal.")
        }), new Gui_Item(UnknownEnum.Value_40, id, 
        {
            is_visible: __return_true,
            resources: global.costs.unlock_spark_portal
        }), new Gui_Item(UnknownEnum.Value_51, id), new Gui_Item(UnknownEnum.Value_5, id, 
        {
            button_text: __("Use Super Shards Shield"),
            
            check: function()
            {
                return has_enough_resources(global.costs.unlock_spark_portal);
            },
            
            func: function()
            {
                dec_resources(global.costs.unlock_spark_portal);
                with (o_npc_spark_portal)
                {
                    step_into_portal();
                }
            }
        })];
    }
    else if (get_upgrade_count(global.areas.plasma_forest) > 0)
    {
        actions = [new Gui_Item(UnknownEnum.Value_54, id, 
        {
            is_visible: function()
            {
                return true;
            },
            
            text: __("Your shield of Shards broke the magical sphere! You can now enter the Spark Portal.")
        }), new Gui_Item(UnknownEnum.Value_5, id, 
        {
            button_text: __("Step into the Spark Portal"),
            
            func: function()
            {
                with (o_npc_spark_portal)
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
    global.areas.energy_shrine.data.count = 1;
    global.areas.plasma_forest.data.count = 1;
    global.resources.plasma.data.unlocked = true;
    gui_dialog_close();
    fx_spark_portal();
    instance_destroy(o_npc_spark_portal);
    delay("black_leaf_hole_teleport", sec(5), function()
    {
        change_area(global.areas.energy_shrine);
        notify(__("You have discovered a new galaxy: Energy Belt"));
    });
};

enum UnknownEnum
{
    Value_5 = 5,
    Value_40 = 40,
    Value_51 = 51,
    Value_54 = 54
}
