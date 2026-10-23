event_inherited();
refresh_actions_on_click = true;
titles = 
{
    title: __("Energy Shrine"),
    subtitle: __("")
};

init_actions = function()
{
    actions = [];
    if (!is_energy_shrine_prophecy_fulfilled())
    {
        image_alpha = 0;
        actions = [new Gui_Item(UnknownEnum.Value_54, id, 
        {
            text: __("Acquire all Leaf Stones to activate the Energy Shrine. The planet guardians hold all these stones but beware, they are enchanted with special leaf properties!")
        })];
    }
    else
    {
        image_alpha = 1;
        actions = [new Gui_Item(UnknownEnum.Value_54, id, 
        {
            text: function()
            {
                var unlocked_props_count = get_struct_length(o_game.data.stats.crafted_vars_transform_unlocked);
                var props_count = array_length(global.craft_leaf_upgrade_vars_array);
                var text = __("The prophecy has been fulfilled! You may now fuse Plasma Leaves and transform property selection is now available!");
                text += ("\n\n" + __s("Properties unlocked: %s/%s (%s)", unlocked_props_count, props_count, number_format_percent(unlocked_props_count / props_count)));
                return text;
            }
        }), new Gui_Item(UnknownEnum.Value_51, -1, 
        {
            height: 60
        }), new Gui_Item(UnknownEnum.Value_5, id, 
        {
            button_text: __("Unlock random property"),
            
            check: function()
            {
                return has_enough_resources(global.costs.unlock_transform_property);
            },
            
            func: function()
            {
                var available_props = _filter(global.craft_leaf_upgrade_vars, function(arg0)
                {
                    return is_undefined(variable_struct_get(o_game.data.stats.crafted_vars_transform_unlocked, arg0.key));
                });
                if (array_length(available_props) == 0)
                {
                    exit;
                }
                var random_prop = array_random_item(available_props);
                variable_struct_set(o_game.data.stats.crafted_vars_transform_unlocked, random_prop.key, true);
                dec_resources(global.costs.unlock_transform_property);
                notify(__s("Unlocked property %s", get_upgrade_name(random_prop.key)));
            },
            
            is_visible: function()
            {
                return get_struct_length(o_game.data.stats.crafted_vars_transform_unlocked) < array_length(global.craft_leaf_upgrade_vars_array);
            }
        }), new Gui_Item(UnknownEnum.Value_40, id, 
        {
            resources: global.costs.unlock_transform_property,
            
            is_visible: function()
            {
                return get_struct_length(o_game.data.stats.crafted_vars_transform_unlocked) < array_length(global.craft_leaf_upgrade_vars_array);
            }
        }), new Gui_Item(UnknownEnum.Value_54, id, 
        {
            text: __("All transform properties unlocked. Good job!"),
            
            is_visible: function()
            {
                return get_struct_length(o_game.data.stats.crafted_vars_transform_unlocked) >= array_length(global.craft_leaf_upgrade_vars_array);
            }
        })];
    }
};

init_actions();

enum UnknownEnum
{
    Value_5 = 5,
    Value_40 = 40,
    Value_51 = 51,
    Value_54 = 54
}
