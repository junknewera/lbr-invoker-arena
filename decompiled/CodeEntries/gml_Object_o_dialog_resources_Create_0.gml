event_inherited();
reward_opened_items = undefined;

init_after = function()
{
    actions = [new Gui_Item(UnknownEnum.Value_54, id, 
    {
        text: text
    })];
    var resources_array = sort_resources_struct_to_array(resources);
    _map(resources_array, function(arg0, arg1, arg2)
    {
        array_push(arg2, new Gui_Item(UnknownEnum.Value_40, id, 
        {
            resources: arg0
        }));
    }, actions);
    if (variable_instance_exists(id, "text2") && text2 != "")
    {
        array_push(actions, new Gui_Item(UnknownEnum.Value_54, id, 
        {
            text: text2
        }));
    }
    if (variable_instance_exists(id, "resources2") && is_struct(resources2))
    {
        var resources2_array = sort_resources_struct_to_array(resources2);
        _map(resources2_array, function(arg0, arg1, arg2)
        {
            array_push(arg2, new Gui_Item(UnknownEnum.Value_40, id, 
            {
                resources: arg0
            }));
        }, actions);
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
    Value_40 = 40,
    Value_54 = 54
}
