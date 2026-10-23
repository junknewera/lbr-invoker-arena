event_inherited();
hovering = true;
refresh_actions_on_click = true;
titles = 
{
    title: __("Soul Portal"),
    subtitle: __("")
};

init_actions = function()
{
    actions = [];
    if (area_bought(global.areas.soul_temple) == 0)
    {
        actions = [new Gui_Item(UnknownEnum.Value_54, id, 
        {
            is_visible: __return_true,
            text: __("Souls are howling...")
        }), new Gui_Item(UnknownEnum.Value_54, id, 
        {
            is_visible: function()
            {
                return !is_unlocked_death_book();
            },
            
            text: __s("You need the Death Book to collect %s. It can be unlocked in %s in the %s.", global.resources.soul_stones.name_plural, global.areas.terror_graveyard.name, __("Energy Belt"))
        }), new Gui_Item(UnknownEnum.Value_40, id, 
        {
            is_visible: __return_true,
            result: global.costs.unlock_soul_portal,
            materials_options: 
            {
                insufficient_indicator: true
            },
            resources_options: 
            {
                insufficient_indicator: true
            }
        }), new Gui_Item(UnknownEnum.Value_51, id), new Gui_Item(UnknownEnum.Value_5, id, 
        {
            obj_index: object_index,
            button_text: __s("Use %s shield", __("Soul")),
            
            check: function()
            {
                return has_enough(global.costs.unlock_soul_portal);
            },
            
            func: function()
            {
                dec_result(global.costs.unlock_soul_portal);
                with (self.obj_index)
                {
                    step_into_portal();
                }
            }
        })];
    }
    else if (get_upgrade_count(global.areas.soul_temple) > 0)
    {
        actions = [new Gui_Item(UnknownEnum.Value_54, id, 
        {
            is_visible: function()
            {
                return true;
            },
            
            text: __s("Your %s protected you from the portal anomalies! You can now enter the %s portal.", global.resources.soul_stones.name_plural, __("Soul"))
        }), new Gui_Item(UnknownEnum.Value_5, id, 
        {
            obj_index: object_index,
            button_text: __s("Step into the %s portal", __("Soul")),
            
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
    global.areas.soul_temple.data.count = 1;
    gui_dialog_close();
    fx_portal(spr_resource_soul_particle);
    instance_destroy(object_index);
    delay("fx_teleport", sec(5), function()
    {
        change_area(global.areas.soul_temple);
        notify(__s("You have discovered a new galaxy: %s", __("Soul Realm")));
    });
};

enum UnknownEnum
{
    Value_5 = 5,
    Value_40 = 40,
    Value_51 = 51,
    Value_54 = 54
}
