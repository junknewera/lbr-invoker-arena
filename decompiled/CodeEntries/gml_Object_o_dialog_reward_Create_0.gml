event_inherited();
actions = undefined;
reward = undefined;
reward_opened_items = undefined;

init_after = function()
{
    actions = [new Gui_Item(UnknownEnum.Value_54, id, 
    {
        text: text
    })];
    if (!is_undefined(reward))
    {
        var _reward = get_value_ext(id, reward);
        array_push(actions, new Gui_Item(UnknownEnum.Value_41, id, 
        {
            result: reward,
            result_opened: reward_opened_items,
            materials_options: 
            {
                inline: true
            },
            resources_options: 
            {
                inline: true
            }
        }));
    }
    if (variable_instance_exists(id, "add_actions") && is_array(add_actions) && array_length(add_actions) > 0)
    {
        var __array = add_actions;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            array_push(actions, new Gui_Item(mitem.gui_item, id, mitem.props));
        }
    }
};

enum UnknownEnum
{
    Value_41 = 41,
    Value_54 = 54
}
