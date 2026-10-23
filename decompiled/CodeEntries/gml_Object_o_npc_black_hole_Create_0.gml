event_inherited();
refresh_actions_on_click = true;
titles = 
{
    title: __("Black Leaf Hole"),
    subtitle: __("")
};

init_actions = function()
{
    actions = [];
    if (!o_game.data.flags.black_leaf_hole)
    {
        actions = [new Gui_Item(UnknownEnum.Value_54, id, 
        {
            is_visible: function()
            {
                return true;
            },
            
            text: __("A magical sphere protects the Black Leaf Hole.")
        }), new Gui_Item(UnknownEnum.Value_40, id, 
        {
            is_visible: function()
            {
                return true;
            },
            
            resources: global.costs.unlock_black_leaf_hole
        }), new Gui_Item(UnknownEnum.Value_51, id), new Gui_Item(UnknownEnum.Value_5, id, 
        {
            button_text: __("Use Shards Shield"),
            
            check: function()
            {
                return has_enough_resources(global.costs.unlock_black_leaf_hole);
            },
            
            func: function()
            {
                dec_resources(global.costs.unlock_black_leaf_hole);
                global.areas.biotite_forest.data.count = 1;
                global.areas.exalted_bridge.data.count = 1;
                o_game.data.flags.black_leaf_hole = true;
                global.resources.sacred.data.unlocked = true;
                with (o_npc_black_hole)
                {
                    step_into_black_leaf_hole();
                }
            }
        })];
    }
    else
    {
        actions = [new Gui_Item(UnknownEnum.Value_54, id, 
        {
            is_visible: function()
            {
                return true;
            },
            
            text: __("Your shield of Shards broke the magical sphere! You can now enter the Black Leaf Hole.")
        }), new Gui_Item(UnknownEnum.Value_5, id, 
        {
            button_text: __("Step into the Black Leaf Hole"),
            
            func: function()
            {
                with (o_npc_black_hole)
                {
                    step_into_black_leaf_hole();
                }
            }
        })];
    }
};

init_actions();

step_into_black_leaf_hole = function()
{
    gui_dialog_close();
    fx_black_leaf_hole();
    instance_destroy(o_npc_black_hole);
    delay("black_leaf_hole_teleport", sec(5), function()
    {
        change_area(global.areas.biotite_forest);
        notify(__("You have discovered a new galaxy: Sacred Nebula"));
    });
};

enum UnknownEnum
{
    Value_5 = 5,
    Value_40 = 40,
    Value_51 = 51,
    Value_54 = 54
}
